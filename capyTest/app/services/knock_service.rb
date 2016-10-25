require 'capybara-webkit'
require 'capybara/dsl'
include Capybara::DSL
class KnockService
  def self.knock
    Capybara.configure do |config|
      config.current_driver = :webkit
      config.run_server = false
    end
    Capybara::Webkit.configure do |config|
      #config.allow_url("http://192.168.15.2")
      config.allow_unknown_urls
    end
    puts 'AAA'
     visit 'http://192.168.15.2/'
    #visit 'http://github.com'
    puts "BBB"
    puts page.body
    page.find("#noGAC").click
    sleep(1)
    click_link('status')
    sleep(1)
    page.all("#client_list tr").each do |td|
      a = td.text
      puts a[0..16] unless a[0..16] == "MAC Address IP Ad"
    end
  end
end
