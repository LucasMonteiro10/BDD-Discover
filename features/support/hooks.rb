
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/components.rb'
require_relative './pages/order.rb'

Before do
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @popup = Popup.new
    @order = OrderPage.new
end

After do |scenario|

    if (scenario.failed?) #caso o teste tenha falhado, inicia o procedimento para anexer um screenshot no log
        screenshot = page.save_screenshot("logs/screenshot/#{scenario.__id__}.png") #tira screenshot após a execução de cada teste
        attach(screenshot, "image/png", "Screenshot") #anexa o screenshot ao log 
    end

end