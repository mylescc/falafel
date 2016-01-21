class Reference < ActiveRecord::Base
  validates :referee_first_name, :referee_last_name, :referee_email, :referee_email_text, presence: true
  validates :referee_email, email: true

  before_save :create_guid

  def save_and_send_request
    result = save
    ReferenceMailer.verification_request_email(self).deliver_now if result
    result
  end

  def send_reminder_email
    ReferenceMailer.verification_reminder_email(self).deliver_now
  end

private

  def create_guid
    loop do
      self.guid = SecureRandom.hex(4)
      break unless Reference.exists?(guid: guid)
    end
  end

end
