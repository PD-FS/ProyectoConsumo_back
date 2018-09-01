class CreateUpzs < ActiveRecord::Migration[5.1]
  def change
    create_table :upzs do |t|
      t.string :name
      t.references :district_area, foreign_key: true

      t.timestamps
    end
  end
end
