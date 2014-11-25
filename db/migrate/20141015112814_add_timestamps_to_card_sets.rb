class AddTimestampsToCardSets < ActiveRecord::Migration
  def change
    change_table :card_sets do |t|
      t.timestamps
    end
  end
end
