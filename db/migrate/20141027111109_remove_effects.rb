class RemoveEffects < ActiveRecord::Migration
  def change
    drop_table :effects
  end
end
