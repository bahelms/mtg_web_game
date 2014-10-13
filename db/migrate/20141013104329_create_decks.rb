class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.references :user, index: true
    end

    create_table :cards_decks, id: false do |t|
      t.references :card, index: true
      t.references :deck, index: true
    end
  end
end
