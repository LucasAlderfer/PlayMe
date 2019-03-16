require 'rails_helper'

describe 'visiting /' do
  context 'as a visitor' do
    xit 'can select to continue without logging into steam' do
      visit '/'

      click_on 'Continue Without Logging In'

      expect(current_path).to eq('/dashboard')
    end
  end
end
