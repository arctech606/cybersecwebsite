class CreateCdtopics < ActiveRecord::Migration
  def change
    create_table :cdtopics do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
