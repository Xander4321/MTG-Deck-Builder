class CreateSupertypeTable < ActiveRecord::Migration
  def change
    create_table :supertypes do |t|
      t.string :sptypname
    end

    add_column :cards, :supertype_id, :integer
  end
end
