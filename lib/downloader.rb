require 'capybara'
require 'capybara/dsl'

Capybara.default_driver = :selenium
Capybara.run_server     = false
Capybara.default_wait_time = 10

class Downloader

  include Capybara::DSL

  def initialize page = 'https://www.santafe.gov.ar/intranet/'
    visit page
  end

  def login!
    raise 'missing credentials' unless ENV['S_USERNAME']
    within('#form_autentica') do
      fill_in 'usuario',  with: ENV['S_USERNAME']
      fill_in 'password', with: ENV['S_PASSWORD']
    end
    click_button 'Aceptar'
  end

end

$d = Downloader.new

require 'pry'
binding.pry
