class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, null: false, unique: true
      t.boolean :permanent, null: false
    end

    create_table :subtypes do |t|
      t.string :name, null: false, unique: true
    end

    create_table :supertypes do |t|
      t.string :name, null: false, unique: true
    end
  end
end
