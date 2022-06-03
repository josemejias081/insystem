# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'indulge@gmail.com'
  layout 'mailer'
end
