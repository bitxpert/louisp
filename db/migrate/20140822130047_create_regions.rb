class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :territory
      t.string :gdp_usd_billion
      t.string :population
      t.string :gdp_person_usd
      t.string :ee_score	
      t.string :first_language
      t.string :second_language
      t.timestamps
    end
  end
end
