class AddAssetfileToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :assetfile, :string
  end
end
