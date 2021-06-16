class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :spends
      t.string :impressions
      t.string :clicks
      t.string :link_clicks
      t.bigint :campaign_id
      t.string :name
      t.timestamps
    end
  end
end
