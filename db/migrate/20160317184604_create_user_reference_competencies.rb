class CreateUserReferenceCompetencies < ActiveRecord::Migration
  def change
    create_table :user_reference_competencies do |t|
      t.integer :reference_id
      t.integer :competency
      t.timestamps
    end
  end
end
