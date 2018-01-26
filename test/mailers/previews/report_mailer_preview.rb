# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/report_mailer/receipt
  def receipt
      ReportMailer.receipt()
  end

  def register_mail
ReportMailer.register_mail(User.first)
  end

end
