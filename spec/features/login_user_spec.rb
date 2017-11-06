require 'rails_helper'

RSpec.describe 'LoginUser', type: :feature do
  let(:address) { create(:address) }
  let(:organization) { create(:organization, address: address) }
  let!(:user) { create(:user, organization: organization) }

  it 'should login a user and redirect to the overview page if logged in' do
    user.activate!
    login_user(user)
    visit donators_path
    expect(current_path).to eq(donators_path)
  end

  it 'should try to view the overview page and fail because not logged in' do
    visit donators_path
    expect(current_path).to eq(root_path)
  end
end
