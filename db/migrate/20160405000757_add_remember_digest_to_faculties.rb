class AddRememberDigestToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :remember_digest, :string
  end
end
