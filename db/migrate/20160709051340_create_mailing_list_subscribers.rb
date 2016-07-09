class CreateMailingListSubscribers < ActiveRecord::Migration
  def change
    create_table :mailing_list_subscribers do |t|
      t.references :mailing_list, index: true, foreign_key: true
      t.string :email
      t.string :first_name, null: true
      t.string :last_name, null: true
      t.string :company, null: true

      t.timestamps null: false
    end
  end
end
