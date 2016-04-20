class AddTypeIdToCardsTable < ActiveRecord::Migration
  def change
    add_column :cards, :type_id, :integer
  end
end
