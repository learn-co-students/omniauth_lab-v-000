require 'rails_helper'

RSpec.describe User, type: :model do
    it "has a name" do
    @user = User.new
    @user.name = "Bob Jones"
    expect(@user.name).to eq("Bob Jones")
  end

  it "has an email" do
    @user = User.new
    @user.email = "bobjones@gmail.com"
    expect(@user.email).to eq("bobjones@gmail.com")
  end

  end
