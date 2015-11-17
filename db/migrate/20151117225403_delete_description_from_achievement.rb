class DeleteDescriptionFromAchievement < ActiveRecord::Migration
  def change
    remove_column :achievements, :description
  end
end
