class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :trigger
      t.text :effect
      t.string :type, null: false
      t.hstore :cost
    end

    create_table :cards_abilities, id: false do |t|
      t.references :card, index: true
      t.references :ability, index: true
    end
  end
end
