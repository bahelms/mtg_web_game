class CreateKeywordAbilities < ActiveRecord::Migration
  def change
    create_table :keyword_abilities do |t|
      t.string :keyword, null: false, unique: true
      t.string :effects, array: true, default: []
      t.hstore :cost
    end

    create_table :cards_keyword_abilities, id: false do |t|
      t.references :card, index: true
      t.references :keyword_ability, index: true
    end
  end
end
