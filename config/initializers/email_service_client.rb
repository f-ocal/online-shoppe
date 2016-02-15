EmailServiceClient.configuration do |c|
  c.base_url = ENV['EMAIL_SERVICE_BASE_URL'] || raise('EMAIL_SERVICE_BASE_URL is not configured')
end