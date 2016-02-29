class CreateUserExperienceReferences < ActiveRecord::Migration
  def change
    create_table :user_experience_references do |t|
      t.integer :user_experience_id
      t.integer :reference_id
      t.integer :expertise
      t.integer :in_last_five_years
      t.timestamps
    end

    add_index :user_experience_references, :user_experience_id
    add_index :user_experience_references, :reference_id
  end
end
