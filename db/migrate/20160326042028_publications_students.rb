
class PublicationsStudents < ActiveRecord::Migration
  def change
  create_table :publications_students do |t|
      t.references :publication
      t.references :student
    end
  end
end
