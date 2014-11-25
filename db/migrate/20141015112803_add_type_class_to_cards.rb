class AddTypeClassToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :type_class, index: true
  end
end

