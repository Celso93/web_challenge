# frozen_string_literal: false

# Interaction with Product Page
class Common
  include RSpec::Matchers
  include Capybara::DSL

  def initialize
    @modal_close = EL['modal_close']
    @modal       = EL['modal']
  end

  def click(elm)
    element = EL[elm]
    find(element).click
  end

  def check_modal
    find(@modal_close).click if page.has_selector?(@modal)
  end
end
