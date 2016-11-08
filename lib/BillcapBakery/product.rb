require "BillcapBakery/variants"
require "pry" 

module BillcapBakery
  class Product

  		def initialize(name, code, packs)
  			@product_name, @product_code = name , code
  			@variants = []
  			packs.each do |pack|
  				no, price = pack
  				@variants << Variants.new(no,price)
  			end 
  		end

  		def get_product_name
  			@product_name
  		end

  		def get_product_code
  			@product_code
  		end

  		def get_variants_list
  			@variants
  		end

  		def get_best_variants(no_of_products)
  			best_variant = get_variants_list.first

  			get_variants_list.each do |variant|
  					if variant.get_no_of_items > best_variant.get_no_of_items
  						best_variant = variant
  					end
  			end

  		best_variant.get_variants	
  		end
  end

end
