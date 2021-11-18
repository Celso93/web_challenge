#language: pt
Funcionalidade: Pagina do Produto
  Os clientes utilizam o site para encontrar os seus futuros veículos, 
  entrando em contato com os vendedores para realizar as negociações ou consultar preços.

  Contexto:
    Dado que acesso o ambiente 'webmotors'
    Quando realizo a busca por 'Toyota Corolla Cross' e seleciono o produto no resultado

  @teste
  Cenario: Comparando o preço da página de resultado com a página do produto
    Entao espero encontrar preço iguais entre as paginas

  Cenario: Enviando uma mensagem ao vendedor - sem sucesso
    E preencho os campos em 'Enviar mensagem'
    E clico em 'enviar_mensagem'
    Entao espero encontrar o texto 'Mensagem enviada!'

  Cenario: Solicitando as parcela deste veículo - sem sucesso
    E preencho os campos em 'Ver parcelas'
    E clico em 'ver_parcelas'
    Entao espero encontrar o texto 'Continue para ver as parcelas.'
