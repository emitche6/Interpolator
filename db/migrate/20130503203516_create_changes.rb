class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.string :regex_old
      t.string :regex_new
      t.integer :interpolation_id

      t.timestamps
    end
  end
end
