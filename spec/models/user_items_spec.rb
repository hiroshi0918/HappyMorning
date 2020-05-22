require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do 
    @user = build(:user)
    @food = build(:food)
    @user_item = build(:user_item)
  end

  describe 'user_item validation' do
    # it 'is valid with quantity' do
    #   expect(@user_item.valid?).to eq(true)
    # end

    it 'is not valid without quantity' do
      @user_item.quantity = ''
      expect(@user_item.valid?).to eq(false)
    end

    it 'is not valid when quantity is 0' do
      @user_item.quantity = 0
      expect(@user_item.valid?).to eq(false)
    end

    it 'is not valid when quantity is negative number' do
      @user_item.quantity = -1
      expect(@user_item.valid?).to eq(false)
    end

  end
end