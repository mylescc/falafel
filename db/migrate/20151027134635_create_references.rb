class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :referee_first_name
      t.string :referee_last_name
      t.string :referee_email
      t.text :referee_email_text
      t.integer :user_id
    end

    add_index :references, :user_id
  end
end
