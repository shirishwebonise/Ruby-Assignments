
class Order
	def initialize(order_id, product_id, buyer_name, credit_card_number, cvv)
		@id = order_id
		@productId = product_id
		@buyerName = buyer_name
		@creditCardNumber = credit_card_number
		@cvv = cvv
	end

	attr_reader :id, :productId, :buyerName, :creditCardNumber, :cvv
end
