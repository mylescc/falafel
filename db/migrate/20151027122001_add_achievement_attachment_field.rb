class AddAchievementAttachmentField < ActiveRecord::Migration
  def change
    add_attachment :achievements, :attachment
  end
end
