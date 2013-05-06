class AddDownloadsCount < ActiveRecord::Migration
  def up
    add_column :interpolations, :downloads_count, :integer, :default => 0
    add_column :interpolations, :ratings_count, :integer, :default => 0
    add_column :interpolations, :comments_count, :integer, :default => 0
  end

  def down
    remove_column :interpolations, :downloads_count
    remove_column :interpolations, :ratings_count
    remove_column :interpolations, :comments_count
  end
end
