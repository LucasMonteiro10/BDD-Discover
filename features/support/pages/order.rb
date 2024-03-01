require 'rspec'

class OrderPage
    include Capybara::DSL
    include RSpec::Matchers

    def assert_order
        expect(find('h1').text).to eql 'Uhull! Pedido confirmado'
        expect(find('p[color=subtitle]').text).to eql 'Agora é só aguardar que logo o café chegará até você'
    end

    def assert_delivery_time(target)
        delivery_time = find('p', text: 'Previsão de entrega')
        # delivery_time guarda o elemento p especificado acima, incluindo seus elementos filhos
        expect(delivery_time.find('strong').text).to eql target
    end
end