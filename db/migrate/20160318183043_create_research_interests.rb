class CreateResearchInterests < ActiveRecord::Migration
  def change
    create_table :research_interests do |t|
      t.string :name
      t.references :faculty
      t.references :student
      t.timestamps null: false
    end
  end
end
