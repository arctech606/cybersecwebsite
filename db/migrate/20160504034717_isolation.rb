class Isolation < ActiveRecord::Migration
  def change
    create_table :projects_students,id:false do |t|
      t.references :project,index:true
      t.references :student,index:true
    end
    create_table :faculties_projects,id:false do |t|
      t.references :publication,index:true
      t.references :faculty,index:true
    end
    create_table :faculties_research_interests,id:false do |t|
      t.references :faculty,index:true
      t.references :research_interest,index:true
    end
    create_table :research_interests_students,id:false do |t|
      t.references :student,index:true
      t.references :research_interest,index:true
    end
  end
end
