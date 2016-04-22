class CreateDeckcard < ActiveRecord::Migration
  def change
    create_table :deckcards do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :card, index: true
      t.string :num_of, null: false

      t.timestamps null: false
    end
  end
end
