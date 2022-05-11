require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid" do
      @user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it "should check if email is missing" do
      user = User.new(email: '')
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "should check if name is missing" do
      user = User.new(name: nil)
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it "should check if passwords match" do
      user = User.new(
        name: 'Ryan',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation: 'notsame'
      )
      user.password = 'testy'
      user.valid?
      expect(user.errors.full_messages).to be_present
    end

    it 'email must be unique' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      user.save
      
      user_two = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      user_two.save
    
      expect(user_two.errors.full_messages).to include('Email has already been taken')
    end

    it 'password length less than 5 characters is invalid' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'pass',
        password_confirmation:'pass'
      )
      expect(user).to be_invalid
    end

    it 'password length must be at-least 5 characters' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      expect(user).to be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@testy.com', 'password')
      expect(user).not_to be(nil)
    end

    it 'should not pass with invalid credentials' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@testy.com', 'pass')
      expect(user).to be(nil)
    end

    it 'should pass even with spaces present in email' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      user.save

      user = User.authenticate_with_credentials(' test@testy.com ', 'password')
      expect(user).not_to be(nil)
    end

    it 'should pass even with caps present in email' do
      user = User.new(
        name: 'name',
        email: 'test@testy.com',
        password: 'password',
        password_confirmation:'password'
      )
      user.save

      user = User.authenticate_with_credentials('TEST@testy.com', 'password')
      expect(user).not_to be(nil)
      end
    end
end
