class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :user_id
      t.integer :interpolation_id
      t.datetime :time_created

      t.timestamps
    end
  end
end
