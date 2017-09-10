class ReportMailer < ApplicationMailer
default from: 'Veltios | Modern Lab App <veltiosapp@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.receipt.subject
  #
  def receipt(reserve_items)
    @reserve_items = reserve_items
    mail(to: 'mora200217@hotmail.com', subject: 'Reserva Exitosa')
  end


  def register_mail(current_user)
  @current_user = current_user
  # mail(to: @current_user.mail.to_s, subject: 'Bienvenido a Veltios!')
  mail(to: 'mora200217@hotmail.com', subject: 'Bienvenido a Veltios!')
  end
end

# private
#
# def send_mail(parametros, email, asunto)
#   @no
#   mail()
# end
