class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :name
      t.text :abstract
      t.string :keywords

      t.timestamps null: false
    end
  end
end
