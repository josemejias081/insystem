# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:Jose)
    @user = users(:one)
    sign_in(:Jose)
  end

  # 1
  test 'Jose has the expected name' do
    assert_equal 'Jose', users(:Jose).name
  end

  # 2
  test 'Jose has the expected email' do
    assert_equal 'josemejias@gmail.com', users(:Jose).email
  end

  # 3
  test 'Jose has the expected password' do
    assert_equal 'foobar', users(:Jose).encrypted_password
  end

  # 4
  test 'can get index' do
    sign_in(:Jose)
    get '/'
    assert_response :success
  end

  # 5
  test 'can get index sing up' do
    sign_out(:Jose)
    get '/'
    assert_response :success
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = 'User'
    assert @user.valid?
  end

  test 'password should be present' do
    @user.encrypted_password = 'Foobar'
    assert @user.valid?
  end
end
