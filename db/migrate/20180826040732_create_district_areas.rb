class CreateDistrictAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :district_areas do |t|
      t.string :name
      t.integer :initialZipCode
      t.integer :lastZipCode
      t.decimal :surfaceArea
      t.decimal :population
      t.decimal :density

      t.timestamps
    end
  end
end
