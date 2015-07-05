class AddFavouritecountColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favouritecount, :integer
  end
end
