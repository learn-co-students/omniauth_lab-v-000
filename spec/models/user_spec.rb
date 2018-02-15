require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(name: "Daenerys", uid: 123456)
  end

  it 'can be created' do
    expect(@user).to be_valid
  end
end
