require 'rails_helper'

RSpec.feature 'User adds a block' do
  scenario 'they see the page for the new block' do
    sign_in create(:user)
    name = 'Z'

    visit blocks_path
    click_on 'Add New Block'
    fill_in 'block_name', with: name
    click_on 'Create Block'

    expect(page).to have_selector('h1', text: "#{name} Block")
  end
end
