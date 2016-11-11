require "BillcapBakery"
require "pry" 

module BillcapBakery
  class Cart
  	include BillcapBakery

  	def initialize
  		@cart_item = []

  	end

  	def additems(item)
  		item_count, item_code = item.split(" ")

  		BillcapBakery.products.each do |product|
  			if item_code == product.get_product_code
  				@cart_item << [item_count.to_i, item_code, product.numbering_duplicate_items(item_count.to_i)]
  			end

  		end
  		@cart_item
  	end

  	def printitems
  		final_print = ''
  		@cart_item.each do |item|
  			item_count, item_code, chosen_list = item
  			item_print = ''
  			total = 0
  			chosen_list.each do |list|
  				total += list[0] * list[2]
  				item_print << "\t" + list[0].to_s + ' x ' + list[1].to_s + ' $'+ list[2].to_s + "\n"
  			end

  			final_print << item_count.to_s + ' ' + item_code.to_s + ' $'+ total.round(2).to_s + "\n" + item_print + "\n"

  		end

  	final_print
  	end

  	def run(value)
  		line = value.split("\n")
  		line.each do |code|
  			additems(code)
  		end
  		printitems
  	end



  end
end
