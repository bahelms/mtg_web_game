class CreateSetsAndFormats < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.string :name, null: false
    end

    create_table :formats do |t|
      t.string :name, null: false
      t.string :illegal_cards, array: true
    end

    create_table :card_sets_formats, id: false do |t|
      t.references :card_set, index: true
      t.references :format, index: true
    end
  end
end
