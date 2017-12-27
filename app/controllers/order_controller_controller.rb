require 'rubygems'
require 'httparty'

class OrderControllerController < ShopifyApp::ApplicationController
	include httparty
	base_uri "https://#{@shop_session.url}/admin/"

	def get_orders
		
		self.class.get('orders.json')


	end
end
Order_con = OrderControllerController.new

Order_con.get_orders.each do |post|
	puts post

end
