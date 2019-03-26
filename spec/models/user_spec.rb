require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    before do
      @user = User.new(
        :name => "Connor",
        :last_name => "Clarkes",
        :email => "connorclarkes@gmail.com",
        :password => "test",
        :password_confirmation => "test"
        )

      @user2 = User.new(
        :name => "Ronnoc",
        :last_name => "Sekralc",
        :email => "connorClarkes@gmail.com",
        :password => "test",
        :password_confirmation => "test"
        )

      end

  it "Validates presence" do
    expect(@user.valid?).to eql(true)
  end

  it "Validates name" do
    @user.name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end

  it "Validates last name" do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it "Validates email" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "Validates uniqueness of email" do
    @user.email = "connorclarkes@gmail.com"
    @user2.email = "connorClarkes@gmail.com"
    @user.save
    @user2.save
    expect(@user2.errors.full_messages).to include ("Email same")
  end

  it "Validates passwords" do
    @user.password = nil
    @user.password_confirmation = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation can't be blank")
  end

  it "Validates password length" do
    @user.password = "t"
    @user.password_confirmation = "t"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
  end
  
  it "Validates passwords are confirmed" do
    @user.password = "test"
    @user.password_confirmation = "Test"
    @user.save
    expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
  end

  end

  before do
    @user = User.new(
      :name => "Connor",
      :last_name => "Clarkes",
      :email => "connorclarkes@gmail.com",
      :password => "test",
      :password_confirmation => "test"
      )
    end

  describe ".authenticate_with_credentials" do

    before do
      @user = User.new(
        :name => "Connor",
        :last_name => "Clarkes",
        :email => "connorclarkes@gmail.com",
        :password => "test",
        :password_confirmation => "test"
        )
      end

      it "should verify there's no white space" do
      @user.email = " connor@gmail.com "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Something")
    end

  end
end
