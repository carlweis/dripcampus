class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :campaign, index: true, foreign_key: true
      t.string :subject
      t.text :body
      t.integer :wait, default: 5
      t.string :interval, default: 'minutes'

      t.timestamps null: false
    end

    add_index :messages, :subject, unique: true
  end
end
