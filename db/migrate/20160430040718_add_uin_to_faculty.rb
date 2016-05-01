class AddUinToFaculty < ActiveRecord::Migration
  def change
    add_column :faculties, :uin, :integer
  end
end
