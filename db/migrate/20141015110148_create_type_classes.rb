class CreateTypeClasses < ActiveRecord::Migration
  def change
    create_table :type_classes do |t|
      t.string :name, null: false, unique: true
    end
  end
end
