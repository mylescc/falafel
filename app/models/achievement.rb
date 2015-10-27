class Achievement < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: ['application/pdf', 'application/msword',
                                                                'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
end
