class CreateInterpolations < ActiveRecord::Migration
  def change
    create_table :interpolations do |t|
      t.string :name
      t.integer :user_id
      t.boolean :private

      t.timestamps
    end
  end
end
