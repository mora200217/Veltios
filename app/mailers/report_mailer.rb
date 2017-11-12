class ReportMailer < ApplicationMailer
default from: 'Veltios | Modern Lab App <veltiosapp@gmail.com>'

  def receipt(reserve_items, current_user)
    @reserve_items = reserve_items
    @current_user = current_user
    mail(to: @current_user.email.to_s , subject: 'Reserva Exitosa')
  end


  def register_mail(current_user)
  @current_user = current_user
  # mail(to: @current_user.mail.to_s, subject: 'Bienvenido a Veltios!')
  mail(to: @current_user.email.to_s, subject: 'Bienvenido a Veltios!')
  end
end
