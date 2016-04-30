class AddPictureToResearchInterests < ActiveRecord::Migration
  def change
    add_column :research_interests, :picture, :string
  end
end
