class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :phone
      t.integer :score
      t.string :grade
      t.string :assigned_to
      t.text :notes

      t.timestamps null: false
    end

     add_index :prospects, :email, unique: true
  end
end
