class AddUinToStudent < ActiveRecord::Migration
  def change
    add_column :students, :uin, :integer
  end
end
