require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Topics" do
  let!(:topic) { create :topic }
  let!(:ec_topic) { create :topic, scope: "Early Childhood Specialist" }

  get "/topics" do
    example_request "List available topics" do
      expect(status).to eq 200
    end

    context "filtering" do
      with_options scope: :page do
        parameter :number, "Page number to retrieve, defaults to 1"
        parameter :size, "Records to include on each page, defaults to 100"
      end
      with_options scope: :filter do
        parameter :scope, <<~DOC
          Topic scope to return. "Grantee Specialist", "Early Childhood Specialist",
          "Health Specialist", or "Systems Specialist"
        DOC
      end
      let(:filter_scope) { "Grantee Specialist" }

      example_request "List topics for a given scope" do
        expect(status).to eq 200
      end
    end
  end

  get "/topics/:id" do
    let(:id) { topic.id }

    example_request "Get details for a Topic" do
      expect(status).to eq 200
    end
  end
end
