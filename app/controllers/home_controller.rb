class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 5, page: 100 }) 
    @orders = ShopifyAPI::Order.find(:all, :params => {:limit => 250, :status => "any" })
    @order_count = ShopifyAPI::Order.count
    

@page = 1 
while @order_count > 0 do 
  @orders = ShopifyAPI::Order.find(:all, :params => {:limit => 250, :status => "any",:page=> @page })
  # perform work on products

  @order_count = @order_count - 250
  @page = @page + 1
end

    @webhooks = ShopifyAPI::Webhook.find(:all)



    # @uri = URI.parse("https://#{@shop_session.url}/admin/orders.json")
  end
end
