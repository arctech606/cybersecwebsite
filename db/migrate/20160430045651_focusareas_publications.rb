class FocusareasPublications < ActiveRecord::Migration
  def change
    create_table :focusareas_publications,id:false do |t|
      t.references :publication,index:true
      t.references :focusarea,index:true
    end
  end
end
