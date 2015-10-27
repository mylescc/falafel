class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.string :link
      t.integer :user_id
      t.timestamps
    end

    add_index :achievements, :user_id
  end
end
