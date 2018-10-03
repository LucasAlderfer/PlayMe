require 'rails_helper'

describe 'GET /' do
  it 'renders the welcome page' do
    get '/'
    expect(response.status).to eq(200)
  end
end
