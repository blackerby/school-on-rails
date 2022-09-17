require 'application_system_test_case'

class BlocksTest < ApplicationSystemTestCase
  test 'viewing the index' do
    visit blocks_path
    assert_selector 'h1', text: 'All Blocks'
    assert_text blocks(:a).name
    assert_text blocks(:b).name
  end

  test 'should create Block' do
    sign_in users(:admin)
    visit blocks_path

    click_on 'Add New Block'

    fill_in 'Name', with: 'C'

    click_on 'Create Block'

    assert_selector 'h1', text: 'C Block'
  end

  test 'should edit Block' do
    sign_in users(:admin)
    visit block_path(blocks(:a))

    click_on 'Edit'

    fill_in 'Name', with: 'C'

    click_on 'Update Block'

    assert_selector 'h1', text: 'C Block'
  end

  test 'should delete Block' do
    sign_in users(:admin)
    visit block_path(blocks(:a))

    click_on 'Delete'
    accept_confirm

    assert_selector 'h1', text: 'All Blocks'
  end

  test 'should search by name' do
    visit blocks_path

    fill_in 'Search', with: 'A'

    assert_selector 'li', text: /^A$/
    assert_no_selector 'li', text: /^B$/
    take_failed_screenshot
  end

  test 'copy to clipboard' do
    skip 'no idea wtf this passes/causes the process to hang'
    url = block_url(blocks(:a))

    options = Selenium::WebDriver::Options.chrome
    options.add_preference('profile.content_settings.exceptions.clipboard', {
                             '*': { 'setting': 1 }
                           })

    driver = Selenium::WebDriver.for :chrome, capabilities: options
    driver.navigate.to url

    clip_text = driver.execute_async_script('navigator.clipboard.readText().then(arguments[0])')
    assert clip_text, 'fleming@indiansprings.org'
    driver.quit
  end
end
