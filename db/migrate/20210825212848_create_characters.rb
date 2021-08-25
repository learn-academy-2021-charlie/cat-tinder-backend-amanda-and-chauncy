class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :type
      t.text :enjoys
      t.string :personality

      t.timestamps
    end
  end
end
