class AddBlockToCardSets < ActiveRecord::Migration
  def change
    add_column :card_sets, :block, :string
  end
end
