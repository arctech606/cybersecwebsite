class PublicationsFaculties < ActiveRecord::Migration
  def change
    create_table :publications_faculties do |t|
      t.references :faculty
      t.references :publication
    end
  end
end
