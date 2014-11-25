class ChangeEffectOnAbilities < ActiveRecord::Migration
  def up
    remove_column :abilities, :effect
    add_column :abilities, :effects, :string, array: true, default: []
  end

  def down
    remove_column :abilities, :effects
    add_column :abilities, :effect, :string
  end
end
