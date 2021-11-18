Dado('que acesso o ambiente {string}') do |url|
  visit(DATA[url])
end

Quando('realizo a busca por {string} e seleciono o produto no resultado') do |pdt|
  @search.fill_search_click(pdt)
  @product.acess_product(pdt)
end

Entao('espero encontrar preço iguais entre as paginas') do
  @product.compare_price_category_product
end

Quando('preencho os campos em {string}') do |form|
  @product.fill_form(form)
end

Quando('clico em {string}') do |elm|
  @common.check_modal
  @common.click(elm)
end

Entao('espero encontrar o texto {string}') do |msg|
  raise 'Texto nao exibido' unless page.has_text?(msg)
end