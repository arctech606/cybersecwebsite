class FacultiesPublications < ActiveRecord::Migration
  def change
    create_table :faculties_publications do |t|
      t.references :faculty
      t.references :publication
    end
  end
end
