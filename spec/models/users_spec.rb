require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'user validation' do
    it 'is valid with name and email' do
      expect(@user.valid?).to eq(true)
    end

    it 'is not valid without first_name' do
      @user.first_name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'is not valid without last_name' do
      @user.last_name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'is not valid without first_address' do
      @user.first_address = ''
      expect(@user.valid?).to eq(false)
    end

    it 'is not valid without second_address' do
      @user.second_address = ''
      expect(@user.valid?).to eq(false)
    end

    it 'is not valid without password' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    it 'is not valid without email' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end