# frozen_string_literal: true

# Interaction with Search Page
class Search
  include RSpec::Matchers
  include Capybara::DSL

  def initialize
    @search_field = EL['search']
    @autocomplete_result = EL['autocomplete']
  end

  def fill_search_click(pdt)
    find(@search_field).set(pdt)
    find(@autocomplete_result, text: pdt).click
  end
end
