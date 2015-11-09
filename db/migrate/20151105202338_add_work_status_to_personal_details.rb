class AddWorkStatusToPersonalDetails < ActiveRecord::Migration
  def change
    add_column :personal_details, :uk_citizen, :boolean
    add_column :personal_details, :eu_citizen, :boolean
  end
end
