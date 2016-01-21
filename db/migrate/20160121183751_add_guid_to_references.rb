class AddGuidToReferences < ActiveRecord::Migration
  def change
    add_column :references, :guid, :string
  end
end
