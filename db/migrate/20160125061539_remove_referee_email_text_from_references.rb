class RemoveRefereeEmailTextFromReferences < ActiveRecord::Migration
  def change
    remove_column :references, :referee_email_text
  end
end
