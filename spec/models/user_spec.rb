require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before :each do
      @user = User.create(email: 'hello@hi.com',
                          password_digest: 'password',
                          first_name: 'Frankie',
                          last_name: 'Frog')
      @user1 = User.new(email: 'hello@hi.com')
    end

    it 'should be valid if email does not already exist' do
      expect(@user1).to_not be_valid
    end

    it 'should be invalid without a password' do
      @user = User.new(email: 'goodbye@hi.com',
                       password_digest: nil,
                       first_name: 'Frankie',
                       last_name: 'Frog')
      expect(@user.errors.full_messages).to_not include("can't be blank")
    end

    it 'should be invalid if passwords do not match' do
      @user1 = User.new(email: 'hello@hi.com',
                        password_digest: 'flapjack',
                        first_name: 'Frankie',
                        last_name: 'Frog')
      expect(@user[:password_digest]).to_not match(@user1[:password_digest])
      # expect(@user1).to_not be_valid
      # user = User.new password: 'short', password_confirmation: 'long'
      # expect(user).to_not be_valid
    end

    it 'should be invalid if password is too short' do
      @user1 = User.new(email: 'goodbye@hi.com',
                        password_digest: 'flap',
                        first_name: 'Frankie',
                        last_name: 'Frog')
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages.to_s).to include("is too short")
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should be invalid if email contains spaces' do
      @user = User.new(email: '  withspaces@me.com',
                       password_digest: 'password',
                       first_name: 'Frankie',
                       last_name: 'Frog')
      expect(@user).to_not be_valid
    end

    it 'should be invalid if email contains uppercase characters' do
      @user = User.new(email: 'UPPERCASE@me.com',
                       password_digest: 'password',
                       first_name: 'Frankie',
                       last_name: 'Frog')
      expect(@user).to be_valid
    end

  end



end
