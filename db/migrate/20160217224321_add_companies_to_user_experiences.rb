class AddCompaniesToUserExperiences < ActiveRecord::Migration
  def change
    add_column :user_experiences, :company, :integer
  end
end
