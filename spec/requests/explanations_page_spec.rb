require 'rails_helper'

describe 'GET /explanations' do
  it 'renders the explanations page' do
    user = User.create!(name:'test-user', uid: 12345)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get '/explanations'
    expect(response.status).to eq(200)
  end
end
