class FixUserExperienceReferencesInLastFiveYearsDataType < ActiveRecord::Migration
  def change
    change_column :user_experience_references, :in_last_five_years,
      'boolean USING CAST(in_last_five_years AS boolean)'
  end
end
