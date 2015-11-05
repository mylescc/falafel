class AddPhotoColumnToPersonalDetails < ActiveRecord::Migration
  def change
    add_attachment :personal_details, :photo
  end
end
