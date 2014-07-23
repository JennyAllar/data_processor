require 'rails_helper'

feature 'Welcome' do
  scenario 'A user can see a welcome message on home page' do
    visit '/'
    expect(page).to have_content('Welcome to the Data Processor')
    end
end