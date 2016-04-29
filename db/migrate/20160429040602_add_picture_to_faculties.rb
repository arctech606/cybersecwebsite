class AddPictureToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :picture, :string
  end
end
