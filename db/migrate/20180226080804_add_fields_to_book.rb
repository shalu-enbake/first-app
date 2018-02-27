class AddFieldsToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :name, :string
    add_column :books, :attachment, :string
  end
end
