class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, null: false
      t.boolean :permanent, null: false
    end

    create_table :subtypes do |t|
      t.string :name, null: false
    end

    create_table :supertypes do |t|
      t.string :name, null: false
    end
  end
end
