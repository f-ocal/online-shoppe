class EmailService

  def send_signup_email(email)
    EmailServiceClient.new.send_welcome_email(email)
  end

end