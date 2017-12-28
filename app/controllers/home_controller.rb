class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 5, page: 100 }) 
    @orders = ShopifyAPI::Order.find(:all, :params => {:limit => 250, :status => "any" })
    @order_count = ShopifyAPI::Order.count
    
    @webhooks = ShopifyAPI::Webhook.find(:all)



    @uri = URI.parse("https://#{@shop_session.url}/admin/orders.json")
  end
end
