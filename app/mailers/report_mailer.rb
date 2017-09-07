class ReportMailer < ApplicationMailer
default from: 'veltiosapp@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.receipt.subject
  #
  def receipt
    @greeting = "Hi"
    mail(to: 'mora200217@hotmail.com', subject: 'Bienvenido a Veltios!')
  end
end
