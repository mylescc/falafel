class AddTimestampsToReferences < ActiveRecord::Migration
  def change
    add_column :references, :created_at, :datetime
    add_column :references, :updated_at, :datetime
  end
end
