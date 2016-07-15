class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.references :campaign, index: true, foreign_key: true
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :source
      t.integer :sends
      t.integer :opens
      t.integer :replies
      t.integer :clicks
      t.boolean :opt_out

      t.timestamps null: false
    end
  end
end
