class AddPublicationTypeToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :publication_type, :string
  end
end
