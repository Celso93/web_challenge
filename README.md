# Webmotors Projeto Web

# Instalando as dependências

A instalação a seguir será referente ao sistema operacional Ubuntu 20.04

1. Instalar o versionador de linguagens (ASDF): http://asdf-vm.com/guide/getting-started.html#_3-install-asdf

2. Instalar o plugin referente a linguagem (Ruby): https://github.com/asdf-vm/asdf-ruby

3. Seguir os seguintes passos após instalar o plugin:

```bash
# Verificando as versões
asdf list all ruby

# Instalando a versão específica
asdf install ruby 2.7.2

# Setando o ruby global
asdf global use ruby 2.7.2
 
# Verificando a versão e a instalação do ruby
ruby -v

# Instalando o gerenciador de bibliotecas
gem install bundler
```
4. Após a instalação do ruby e seu gerenciador de dependências, clonar o repositório e rodar o seguinte comando de dentro do diretório:

```bash
bundle install
``` 

## Instalando o Chromedriver
Baixar a versão atual de acordo com a versão do navegador chrome: https://chromedriver.chromium.org/downloads

Extrair o arquivo e move-lo para

```bash
sudo mv chromedriver /usr/bin
```

O outros driver dos outro navegadores também são adicionado neste caminho (Ex: geckodriver)

## Rodando a automação
Dentro do diretório aplicar os seguintes comandos:
bundle install

```bash
bundle install
```
Para rodar o projeto basta seguir os comandos abaixo:

```bash
#

# 
Navegador aberto: cucumber chrome=true screenshot=true
Rodando em headless: cucumber chrome_headless=true screenshot=true
```

Relatório gerado em data/report (report.html)