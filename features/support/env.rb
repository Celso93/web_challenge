require 'rspec'
require 'yaml'
require 'pry'
require 'capybara/cucumber'
require 'ffaker'
require 'report_builder'
require 'selenium-webdriver'

if ENV['chrome']
  Capybara.default_driver = :selenium_chrome
  Capybara.register_driver :selenium_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args:
    [])
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   options: options)
  end
elsif ENV['chrome_headless']
  Capybara.default_driver = :selenium_chrome
  Capybara.register_driver :selenium_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args:
      %w[headless disable-gpu incognito no-sandbox])
    Capybara::Selenium::Driver.new(app, browser: :chrome,
                                        options: options)
  end
elsif ENV['firefox']
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
else
  Capybara.default_driver = :selenium_chrome
end

Capybara.default_max_wait_time = 10
Capybara.default_selector = :xpath