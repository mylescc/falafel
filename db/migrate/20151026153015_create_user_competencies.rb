class CreateUserCompetencies < ActiveRecord::Migration
  def change
    create_table :user_competencies do |t|
      t.integer :user_id
      t.integer :competency
      t.integer :rank
      t.timestamps
    end
  end
end
