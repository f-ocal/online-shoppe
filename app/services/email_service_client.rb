class EmailServiceClient

  class << self

    attr_accessor :base_url

    def configuration
      yield self
    end
  end

  def initialize
    @base_url = self.class.base_url
  end

  def send_welcome_email(email)
    HTTParty.post("#{@base_url}/emails", {body: {email: email}})
  end
end