# frozen_string_literal: false

# Interaction with Product Page
class Product
  include RSpec::Matchers
  include Capybara::DSL

  def initialize
    @contact_full_name_field        = EL['contact_full_name_field']
    @contact_full_email_field       = EL['contact_full_email_field']
    @contact_full_phone_field       = EL['contact_full_phone_field']
    @contact_full_message_field     = EL['contact_full_message_field']
    @result_first_product           = EL['result_first_product']
    @result_first_product_price     = EL['result_first_product_price']
    @product_first_product_price    = EL['product_first_product_price']
    @instalment_full_name_field     = EL['instalment_full_name_field']
    @instalment_full_email_field    = EL['instalment_full_email_field']
    @instalment_full_phone_field    = EL['instalment_full_phone_field']
    @instalment_full_birthday_field = EL['instalment_full_birthday_field']
    @instalment_full_cpf_field      = EL['instalment_full_cpf_field']
    @instalment_full_uf_field       = EL['instalment_full_uf_field']
  end

  def fill_form(form)
    case form
    when 'Enviar mensagem' then fill_contact_form
    when 'Ver parcelas'    then fill_installment_form
    end
  end

  def fill_contact_form
    find(@contact_full_name_field).set('Teste Teste')
    find(@contact_full_email_field).set('emailTeste@mailinator.com')
    find(@contact_full_phone_field).set('1199999999')
    find(@contact_full_message_field).set('Teste Exemplo')
  end

  def fill_installment_form
    find(@instalment_full_name_field).set('Teste Teste')
    find(@instalment_full_email_field).set('emailTeste@mailinator.com')
    find(@instalment_full_phone_field).set('1199999999')
    find(@instalment_full_birthday_field).set('01011990')
    find(@instalment_full_cpf_field).set(FFaker::IdentificationBR.cpf)
    find(@instalment_full_uf_field).select('São Paulo')
  end

  def acess_product(pdt)
    first(@result_first_product, text: pdt.upcase).click
    @result_price_page = first(@result_first_product_price).text
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  end

  def compare_price_category_product
    @product_price_page = find(@product_first_product_price).text
    raise "Price are not equal, result page: #{@result_price_page}, product page: #{@product_price_page}" unless @product_price_page.eql?(@result_price_page)
  end
end
