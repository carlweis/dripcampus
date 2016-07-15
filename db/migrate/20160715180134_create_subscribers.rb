class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.references :campaign, index: true, foreign_key: true
      t.string :email
      t.string :first_name, null: true
      t.string :last_name,  null: true
      t.string :source,     default: 'website'
      t.integer :sends,     default: 0
      t.integer :opens,     default: 0
      t.integer :replies,   default: 0
      t.integer :clicks,    default: 0
      t.boolean :opt_out,   default: false

      t.timestamps null: false
    end

    add_index :subscribers, :email, unique: true
    add_index :subscribers, :first_name, unique: false
    add_index :subscribers, :last_name, unique: false
    add_index :subscribers, :source, unique: false
  end
end
