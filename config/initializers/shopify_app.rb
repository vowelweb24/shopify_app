ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "9b4b7ccea017542fdf132d2c83385901"
  config.secret = "d69376e9acff4e25c80e21268e48cdde"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
