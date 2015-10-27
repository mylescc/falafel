class ReferenceMailer < ActionMailer::Base
  default from: 'noreply@fused4.com'

  def verification_request_email(reference)
    @reference = reference
    mail(to: reference.referee_email, subject: 'Reference Request')
  end

  def verification_reminder_email(reference)
    @reference = reference
    mail(to: reference.referee_email, subject: 'Reference Reminder')
  end
end
