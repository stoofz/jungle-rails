require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it 'save user with all required fields filled correctly' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "password", password_confirmation: "password")
      @user.save
      expect(@user).to be_valid
    end

    it 'fail to save if passwords / password_confirmation  do not match' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "password", password_confirmation: "pass")
      @user.save 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'error message if no password filled' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "", password_confirmation: "")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'error message if email is not unique' do
      @user_a = User.new(name: 'Anthony', email: 'test@test.com', password: "password", password_confirmation: "password")
      @user_a.save
      @user_b = User.new(name: 'Daniel', email: 'TEST@TEST.COM', password: "password", password_confirmation: "password")
      @user_b.save
      expect(@user_b.errors.full_messages).to include("Email has already been taken")
    end

     it 'password minimum length is 6 characters' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "pass", password_confirmation: "pass")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

  end

  describe '.authenticate_with_credentials' do

    it 'successful login' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "password", password_confirmation: "password")
      @user.save
      @user_success = User.authenticate_with_credentials('test@test.com', "password")
      expect(@user_success).to_not eq(nil)
    end

    it 'successful login with leading and trailing spaces' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "password", password_confirmation: "password")
      @user.save
      @user_success = User.authenticate_with_credentials('   test@test.com   ', "password")
      expect(@user_success).to_not eq(nil)
    end

    it 'successful login with case insensitive' do
      @user = User.new(name: 'Anthony', email: 'test@test.com', password: "password", password_confirmation: "password")
      @user.save
      @user_success = User.authenticate_with_credentials('TeST@teSt.CoM', "password")
      expect(@user_success).to_not eq(nil)
    end


  end
end
