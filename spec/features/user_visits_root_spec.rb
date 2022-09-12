require 'rails_helper'

RSpec.feature 'User visits root path' do
  scenario 'they see a table listing teachers' do
    visit root_path

    expect(page).to have_text 'All Teachers'
    expect(page).to have_table
  end
end
