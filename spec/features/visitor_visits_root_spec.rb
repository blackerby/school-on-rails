require 'rails_helper'

RSpec.feature 'Visitor visits root path' do
  scenario 'they see the heading All Blocks' do
    visit root_path

    expect(page).to have_selector('h1', text: 'All Blocks')
  end

  scenario 'they see all the Blocks in the database' do
    block = create(:block)

    visit root_path
    expect(page).to have_text block.name
  end
end
