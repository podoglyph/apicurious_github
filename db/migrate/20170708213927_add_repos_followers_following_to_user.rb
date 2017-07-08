class AddReposFollowersFollowingToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :num_public_repos, :integer
    add_column :users, :num_followers, :integer
    add_column :users, :num_following, :integer
  end
end
