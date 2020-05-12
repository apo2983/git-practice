class RemoveProfileImageIdFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :profile_image_id, :integer
  end

  def down
  	 add_column :users, :profile_image_id, :integer
  end
end
