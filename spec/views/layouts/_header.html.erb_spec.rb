require 'rails_helper'

RSpec.describe 'layouts/_header.html.erb' do
  it 'lists Blocks first in the navbar' do
    render partial: 'layouts/header'

    expect(rendered).to have_selector('ul.navbar-nav li:nth-child(1)', text: 'Blocks')
  end
end
