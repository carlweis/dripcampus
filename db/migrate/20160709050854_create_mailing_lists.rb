class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
    	t.references :user, index: true, foreign_key: true
      t.string :listid
      t.string :name
      t.text :description, null: true

      t.timestamps null: false
    end
  end
end
