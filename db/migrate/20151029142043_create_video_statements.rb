class CreateVideoStatements < ActiveRecord::Migration
  def change
    create_table :video_statements do |t|
      t.string :url
      t.string :uuid
      t.string :thumb_url
      t.string :small_thumb_url
      t.integer :user_id
      t.timestamps
    end

    add_index :video_statements, :user_id
  end
end
