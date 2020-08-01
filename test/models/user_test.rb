require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  # email password password_confirmation name があれば問題無し
  test "No user validate" do
    assert @user.valid?
  end

  # nameがないとエラー
  test "nameless user validate" do
    @user.name = nil
    assert @user.invalid?
  end

  # emailがないとエラー
  test "emailless user validate" do
    @user.email = nil
    assert @user.invalid?
  end

  # 同じemailがあればエラー
  test "the same email user validate" do
    the_same_email_user = users(:two)
    the_same_email_user.email = "one@example.com"
    assert the_same_email_user.invalid?
  end

  # encrypted_passwordがなければエラー
  test "encrypted_passwordless user validate" do
    @user.encrypted_password = nil
    assert @user.invalid?
  end

  # nameがなければエラー
  test "nameless user" do
    @user.name = nil
    assert @user.invalid?
  end

end
