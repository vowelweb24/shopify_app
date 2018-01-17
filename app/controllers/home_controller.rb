class HomeController < ShopifyApp::AuthenticatedController
  def index
  
    @orders = ShopifyAPI::Order.find(:all, :params => {:status => "any" })
    @order_count = ShopifyAPI::Order.count
    
    



    # @uri = URI.parse("https://#{@shop_session.url}/admin/orders.json")
  end
end
