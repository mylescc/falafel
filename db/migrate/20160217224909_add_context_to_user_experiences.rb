class AddContextToUserExperiences < ActiveRecord::Migration
  def change
    add_column :user_experiences, :context, :integer
  end
end
