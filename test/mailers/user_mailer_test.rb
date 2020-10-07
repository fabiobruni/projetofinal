require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_adoption" do
    mail = UserMailer.new_adoption
    assert_equal "New adoption", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_translation" do
    mail = UserMailer.new_translation
    assert_equal "New translation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
