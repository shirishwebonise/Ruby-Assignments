
class Order
	def initialize(order_id, product_id, buyer_name, credit_card_number, cvv)
		@id = order_id
		@product_id = product_id
		@buyer_name = buyer_name
		@credit_card_number = credit_card_number
		@cvv = cvv
	end

	attr_reader :id, :product_id, :buyer_name, :credit_card_number, :cvv
end
