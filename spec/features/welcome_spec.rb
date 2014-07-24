require 'rails_helper'

feature 'Book' do
  scenario 'A user can see a welcome message on home page' do
    visit '/'
    expect(page).to have_content('Welcome to the Data Processor')
    end
  
  scenario 'Can see the books they have entered into the database' do
    visit '/'
    click_on 'Click Here'
    expect(page).to have_content('Film Art: An Introduction')
    expect(page).to have_content('Business; Business Communication; Leadership Communication')
    expect(page).to have_content('152.33')
    end
end