namespace :facebook do
  desc "get_campaign_data_from_facebook"
  task get_campaign_data: :environment do
    logger = Logger.new(STDOUT)
    graph_api_token = Rails.application.credentials.graph_api_token
    url = Rails.application.credentials.facebook_graph_api_url
    account_id = Rails.application.credentials.facebook_ad_account
    campaign_params = {
      fields: "name",
      access_token: graph_api_token
    }
    logger.info("Getting campaigns from facebook at #{Time.now}")
    response = HTTParty.get(url + "/act_" + account_id + "/campaigns", query: campaign_params)
    campaigns_info = response["data"]
    campaign_data_params = {
      date_preset: "maximum",
      access_token: graph_api_token,
      fields: "impressions, clicks,inline_link_clicks, cpc, cpm, cost_per_inline_link_click, spend"
    }
    logger.info("Getting each campaign data from facebook")
    campaigns_info.each do |campaign_data|
      campaign = Campaign.where("campaign_id = ? && name = ?", campaign_data["id"].to_i, campaign_data["name"]).first
      campaign = Campaign.new(campaign_id: campaign_data["id"], name: campaign_data["name"]) if !campaign.present?
      campaign_data_response = HTTParty.get(url + campaign_data["id"] + "/insights", query: campaign_data_params)
      if campaign_data_response["data"].present?
        data = campaign_data_response["data"].first
        campaign.impressions = data["impressions"] if data["impressions"]
        campaign.clicks = data["clicks"] if data["clicks"]
        campaign.link_clicks = data["inline_link_clicks"] if data["inline_link_clicks"]
        campaign.spends = data["spend"] if data["spend"]
      end

      if campaign.save!
        logger.info("Campaign #{campaign.id} - #{campaign.name} saved")
      else
        logger.info("Campaign #{campaign.id} - #{campaign.name} could not be saved - #{campaign.error}")
      end
    end
  end
end
