class AddPasswordDigestToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :password_digest, :string
  end
end
