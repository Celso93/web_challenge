Before do
  @product = Product.new
  @search  = Search.new
  @common  = Common.new

  # Capybara.current_session.driver.browser.manage.delete_all_cookies
  window = Capybara.current_session.current_window
  window.maximize
end
  
After do |scn|
  binding.pry if scn.failed? && ENV['debug']

  if ENV['screenshot']
   image = page.save_screenshot('data/screenshot/screenshot.png')
   screenshot = Base64.encode64(File.open(image).read)
   attach(screenshot, 'image/png')
  end

  Capybara.current_session.driver.quit
  @session.driver.quit unless @session.nil?
end
  
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'data/report/report.json'
    config.report_path = 'data/report'
    config.report_types = [:retry, :html]
    config.report_title = 'Relatório dos Teste web'
    config.additional_info = { Date: Time.now.strftime('%d/%m/%Y,%H %H:%M').to_s,
                               url: 'https://www.webmotors.com.br/' }
  end
  
  ReportBuilder.build_report
end