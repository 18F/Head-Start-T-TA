class SmartsheetFacade
  attr_reader :client

  @@sheet_id_config = Rails.application.config_for(:smartsheet).freeze

  def initialize
    @client = Smartsheet::Client.new(
      token: Rails.application.credentials.smartsheet_token,
      logger: Rails.logger
    )
  end

  def request_sheet
    @request_sheet ||= Sheet.new(client.sheets.get(sheet_id: @@sheet_id_config[:request_sheet]))
  end

  def assignment_sheet
    @assignment_sheet ||= Sheet.new(client.sheets.get(sheet_id: @@sheet_id_config[:assignment_sheet]))
  end

  def plan_sheet
    @plan_sheet ||= PlanSheet.new(client.sheets.get(sheet_id: @@sheet_id_config[:plan_sheet]))
  end

  def report_sheet
    @report_sheet ||= Sheet.new(client.sheets.get(sheet_id: @@sheet_id_config[:report_sheet]))
  end

  class Sheet
    include Enumerable

    attr_reader :sheet, :header_map
    def initialize(sheet)
      @sheet = sheet
      @header_map = sheet[:columns].map { |c| [c[:title].underscore.gsub(/[?()]/, "").gsub(/\s+/, "_"), c[:index]] }.to_h.with_indifferent_access
    end

    def each(&block)
      rows.each(&block)
    end

    def select_request_id(request_id)
      select { |r| r.request_id == request_id }
    end

    private

    def rows
      @rows ||= sheet[:rows].lazy.map { |r| SheetRow.new(r, header_map) }
    end
  end

  class PlanSheet < Sheet
    def each_upcoming_activity(&block)
      rows.select { |row| !Time.parse(row.start_date).past? }.each(&block)
    end
  end

  class SheetRow
    attr_reader :row, :header_map
    def initialize(row, header_map)
      @row = row
      @header_map = header_map
    end

    def method_missing(method_name, *args, &block)
      if header_map.has_key? method_name
        cell = row[:cells][header_map[method_name]]
        cell[:display_value] || cell[:value]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      header_map.has_key?(method_name) || super
    end
  end
end
