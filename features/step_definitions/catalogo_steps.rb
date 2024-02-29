# Automação realizada com o framework capybara

Quando('acesso a página principal da Starbugs') do
    #visit 'https://starbugs.vercel.app/'    #acessar uma página
    #sleep 10               #esperar por 10 segundos
    @home.open
end

Então('eu devo ver uma lista de cafés disponíveis') do
    #find('.coffee-item')   #ver apenas um item #buscar por css
    #products = all('.coffee-item')     #Ver vários itens
    #puts products.size                  #printa no console o valor da variável
    #expect retorna true ou false dependendo se encontrou o elemento ou não
    #expect(products.size).to be == 8

    #Usando Page Objects
    expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página principal da Starbugs') do
    @home.open
end

Dado('que desejo comprar o seguinte produto:') do |table|
    # Manipulação de array de hash
    #puts table.hashes #exibe o valor da table em hash
    #puts table.hashes[0][:product] #exibe o valor da coluna "product" na primeira linha
    #@product_name = table.hashes[0][:product] #salvando o valor da coluna "product" posição 0 na variável "product_name"
    #@product_price = table.hashes[0][:price]
    #@delivery_price = table.hashes[0][:delivery]

    #Manipulação de hash de dado único
    #puts table.rows_hash.class
    #@product_name = table.rows_hash[:product]
    #@product_price = table.rows_hash[:price]
    #@delivery_price = table.rows_hash[:delivery]

    @product = table.rows_hash
end

Quando('inicio a compra desse item') do
    # guarda o elemento na variável product
    #product = find('.coffee-item', text: @product[:name])
    # procura dentro do elemento guardado o seletor css e quando acha, clica nele
    #product.find('.buy-coffee').click

    #Usando Page Objects
    @home.buy(@product[:name])
end

Então('devo ver a página de checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product)
end

Então('o valor total da compra deve ser de {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

Então('devo ver um popup informando que o produto está indisponível') do
    @popup.have_text('Produto indisponível')
end