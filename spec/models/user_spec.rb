require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Chuck", last_name: "Norris", phone: "5555555555", ssn: 1234, company: "ABC company")
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without a phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have integers' do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have 10 characters' do
      @user.phone = '12345678901'
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr to only have integers' do
      @user.ssn = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr to only have 4 characters' do
      @user.ssn = '12345'
      expect(@user).to_not be_valid
    end

    it 'requires the ssn attr' do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it 'requires a company' do
      @user.company = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq("NORRIS, CHUCK")
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee1 = FactoryGirl.create(:user)
      employee2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee1.id)
      Hand.create!(user_id: admin.id, hand_id: employee2.id)

      expect(admin.hands.count).to eq(2)
    end
  end
end
