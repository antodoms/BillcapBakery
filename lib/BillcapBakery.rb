require "BillcapBakery/version"
require "BillcapBakery/product"
require "BillcapBakery/cart"

module BillcapBakery
  # Your code goes here...


		def self.products
			product_list =[]	
			product_list << BillcapBakery::Product.new('Vegemite Scroll', 'VS5',[[3,6.99],[5,8.99]])
			product_list << BillcapBakery::Product.new('Blueberry Muffin', 'MB11',[[2,9.95],[5,16.95],[8,24.95]])
			product_list << BillcapBakery::Product.new('Croissant', 'CF',[[3,5.95],[5,9.95],[9,16.99]])
			product_list
		end

		def self.run


		end
end
