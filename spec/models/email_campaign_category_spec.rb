require 'spec_helper'

describe EmailCampaignCategory do

  it "must have a name" do
    category = EmailCampaignCategory.new
    expect(category.valid?).to eq false
  end

  it "must have a unique name" do
    original = FactoryGirl.create(:email_campaign_category, name: "One")
    copy = EmailCampaignCategory.new
    copy.name = "One"
    expect(copy.valid?).to eq false
  end

  describe "#list" do
    before do
      FactoryGirl.create(:email_campaign_category, name: 'Marketing')
      FactoryGirl.create(:email_campaign_category, name: 'Newsletter')
      FactoryGirl.create(:email_campaign_category, name: 'Transactional')
      FactoryGirl.create(:email_campaign_category, name: 'transactional')
    end

    it 'returns list of categories without Transactional' do
      expect(EmailCampaignCategory.list).to eq([
        EmailCampaignCategory.find_by_name("Marketing"), 
        EmailCampaignCategory.find_by_name("Newsletter")
        ])
    end
  end
end
