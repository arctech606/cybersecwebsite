class CreateFaculties < ActiveRecord::Migration
   
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :dept
      t.text :desc
      t.text :office
      t.string :phone_no
      t.string :email
      
      t.timestamps null: false
    end
  end
end
