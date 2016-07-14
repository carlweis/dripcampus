class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.text :tags
      t.boolean :active, default: true

      t.timestamps null: false
    end

    add_index :campaigns, :name, unique: true    
  end
end
