class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 5, page: 1 }) 
    @orders = ShopifyAPI::Order.find(:all, :params => {:limit => 250, :status => "any" })
     
    @webhooks = ShopifyAPI::Webhook.find(:all)



    @uri = URI.parse("https://#{@shop_session.url}/admin/orders.json")
  end
end
