Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopify,
           ShopifyApp.configuration.api_key,
           ShopifyApp.configuration.secret,
           :redirect_uri => ShopifyApp.configuration.redirect_uri,
           :callback_url => ShopifyApp.configuration.redirect_uri, 
           scope: ShopifyApp.configuration.scope,
           setup: lambda { |env|
             strategy = env['omniauth.strategy']

             shopify_auth_params = strategy.session['shopify.omniauth_params']&.with_indifferent_access

             shop = if shopify_auth_params.present?
               "https://#{shopify_auth_params[:shop]}"
             else
               ''
             end

             strategy.options[:client_options][:site] = shop
           }

end
