require_relative 'collection'

class List < Collection
	def initialize
		super()
		@list = Array.new
	end
end
