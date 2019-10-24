class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.text :description
      t.references :cocktail, foreing_key: true
      t.references :ingredient, foreing_key: true

      t.timestamps
    end
  end
end
