class CreateSetsAndFormats < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.string :name, null: false
    end

    create_table :formats do |t|
      t.string :name, null: false
      t.string :illegal_cards, array: true
    end

    create_table :sets_formats do |t|
      t.references :set, index: true
      t.references :format, index: true
    end
  end
end
