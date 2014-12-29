class AddSetCodeToCardSets < ActiveRecord::Migration
  def change
    add_column :card_sets, :code, :string
  end
end
