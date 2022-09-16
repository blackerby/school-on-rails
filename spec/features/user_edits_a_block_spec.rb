require 'rails_helper'

RSpec.feature 'User edits a block' do
  scenario 'they see the change on the block page' do
    sign_in create(:user)
    block = create(:block)
    name = 'Z'

    visit block_path(block)
    click_on 'Edit'
    fill_in 'block_name', with: name
    click_on 'Update Block'

    expect(page).to have_selector('h1', text: "#{name} Block")
  end
end
