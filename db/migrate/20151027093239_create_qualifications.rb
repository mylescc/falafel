class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.integer :user_id
      t.integer :level
      t.string :organisation
      t.integer :grade
      t.timestamps
    end
  end
end
