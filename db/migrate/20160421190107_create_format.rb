class CreateFormat < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :name, null: false
      t.integer :cardlmt, null: false

      t.timestamps null: false
    end
  end
end
