class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :hello

      t.timestamps null: false
    end
  end
end
