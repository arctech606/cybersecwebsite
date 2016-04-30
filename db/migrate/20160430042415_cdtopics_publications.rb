class CdtopicsPublications < ActiveRecord::Migration
  def change
    create_table :cdtopics_publications,id:false do |t|
      t.references :publication,index:true
      t.references :cdtopic,index:true
    end
  end
end
