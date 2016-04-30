class AddUinToResume < ActiveRecord::Migration
  def change
     add_column :resumes, :uin, :integer
  end
end
