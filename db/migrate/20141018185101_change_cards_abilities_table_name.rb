class ChangeCardsAbilitiesTableName < ActiveRecord::Migration
  def change
    rename_table :cards_abilities, :abilities_cards
  end
end
