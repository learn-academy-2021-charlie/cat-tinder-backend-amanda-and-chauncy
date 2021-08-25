class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :characters, :type, :animal
  end
end
