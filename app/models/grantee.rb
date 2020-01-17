class Grantee < ApplicationRecord
  validates_presence_of :name

  has_many :grants
  has_many :activity_reports, through: :grants

  auto_strip_attributes :name
end
