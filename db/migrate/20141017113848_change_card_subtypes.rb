class ChangeCardSubtypes < ActiveRecord::Migration
  def change
    remove_reference :cards, :subtype, index: true

    create_table :cards_subtypes, id: false do |t|
      t.references :card, index: true
      t.references :subtype, index: true
    end
  end
end
