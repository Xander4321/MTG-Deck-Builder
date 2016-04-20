class CreateSubtype < ActiveRecord::Migration
  def change
    create_table :subtypes do |t|
      t.string :sbtypname
    end

    add_column :cards, :subtype_id, :integer
  end
end
