class EmailCampaignCategory < ActiveRecord::Base
  attr_accessible :name
  
  has_many :email_campaigns
  validates :name, presence: true
  validates :name, uniqueness: true
end
