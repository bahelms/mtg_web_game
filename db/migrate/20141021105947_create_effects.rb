class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.string :name, null: false
      t.string :target
      t.string :result
      t.references :ability, index: true
    end
  end
end
