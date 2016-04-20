class AddTypesTable < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :typname
    end
  end
end
