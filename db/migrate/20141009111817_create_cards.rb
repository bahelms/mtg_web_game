class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.hstore :mana_cost
      t.string :color, null: false
      t.string :rarity, null: false
      t.integer :power
      t.integer :toughness
      t.references :set, index: true, null: false
      t.references :type, index: true, null: false
      t.references :subtype, index: true
      t.references :supertype, index: true
      t.timestamps
    end
  end
end
