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
  			worst_variant = get_variants_list.first

  			get_variants_list.each do |variant|
  					if variant.get_no_of_items > best_variant.get_no_of_items && variant.get_no_of_items <= no_of_products
  						best_variant = variant
  					end

  					if variant.get_no_of_items < worst_variant.get_no_of_items && variant.get_no_of_items > no_of_products
  						worst_variant = variant
  					end 
  			end

  		best_variant.get_no_of_items <= no_of_products ? best_variant.get_variants : worst_variant.get_variants
  		end

  		def get_items(no_of_products)
  			items = []

        if get_variants_from_array(exact_match(no_of_products)) != []
          items = get_variants_from_array(exact_match(no_of_products))
        else
    			while no_of_products > 0 do
    				best = get_best_variants(no_of_products)
    				no_of_products -= best[0]
    				items << best
    			end
        end
        items
  		end

      def get_variants_from_array(coins)
        result=[]
        coins.each do |coin|
          @variants.each do |variant|
            if coin == variant.get_no_of_items
              result << variant.get_variants
              break
            end
          end
        end
        result
      end


      def numbering_duplicate_items(no_of_products)

        items = get_items(no_of_products)
        newitem = []
        hash_items={}

        items.each do |item|
          no_of_products,price = item

          if hash_items[item] == nil
            hash_items[item] = [1,no_of_products,price]
          else
            count, no_of_products, price = hash_items[item]
            hash_items[item] = [count+1, no_of_products, price]
          end
        end

        hash_items.each do |key,value|
          count, no_of_products, price = value
          newitem << [count, no_of_products, price]
        end

        newitem

      end

      def available_variants
        list = []
        @variants.each do |variant|
          list << variant.get_no_of_items
        end
        list.sort! { |a,b| b <=> a }
      end

      def exact_match(no_of_products)
        available_coins  = available_variants
        i=0
        j=0
        coins            = []          # holds list of coins to return

        remaining_amount = no_of_products

        begin
          available_coins.each do |coin| # counts down finds biggest coins first
            if ((remaining_amount/coin).to_int > 0)
            then (remaining_amount/coin).to_int.times { coins << coin }
              remaining_amount = no_of_products - coins.inject(:+)
            end                         # coins.inject(:+) sums array items
          end
          
          if remaining_amount !=0 && i < (available_variants.count - 1)
            i=i+1
            coins = []
            coins << available_variants[i]
            remaining_amount = no_of_products - available_variants[i]
          end

          j=j+1                  # stackoverflow.com/a/1538801/1148249
        end while remaining_amount > 0 && j<=i

        total=0
        coins.each do |coin|
          total+= coin
        end

        coins = [] if total != no_of_products
        coins.sort! { |a,b| b <=> a }
      end
  end

end
