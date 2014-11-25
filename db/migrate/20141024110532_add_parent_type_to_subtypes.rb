class AddParentTypeToSubtypes < ActiveRecord::Migration
  def change
    add_column :subtypes, :parent_type, :string
  end
end
