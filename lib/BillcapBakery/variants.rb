module BillcapBakery
  class Variants

  	def initialize(count,price)
  		@no_of_items, @bundle_price = count, price
  	end

  	def get_no_of_items
  		@no_of_items
  	end

  	def get_bundle_price
  		@bundle_price
  	end

  	def get_variants
  		[@no_of_items,@bundle_price]
  	end

  end
end
