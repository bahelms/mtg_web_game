class ChangeAbilities < ActiveRecord::Migration
  def change
    drop_table :abilities
    drop_table :abilities_cards

    create_table :abilities do |t|
      t.string :type, null: false
      t.string :trigger
      t.hstore :cost
      t.string :effects, array: true, default: []
      t.references :card, index: true
    end
  end
end
