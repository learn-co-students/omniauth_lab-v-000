require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before(:each) do
    User.destroy_all
  end

  let(:user) {User.create(:name => "Blake Johnson", :uid => 1234567
    )}

  describe 'get create' do



  end
end
