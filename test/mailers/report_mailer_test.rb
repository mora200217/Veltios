require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  test "receipt" do
    mail = ReportMailer.receipt
    assert_equal "Receipt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "register_mail" do
    mail = ReportMailer.register_mail
    assert_equal "Receipt", mail.subject
    assert_equal ["mora200217@hotmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
