require "spec_helper"
require "BillcapBakery/product"

describe BillcapBakery::Product do

	describe 'Product test' do

		before(:all) do
			@abc = BillcapBakery::Product.new('Vegemite Scroll', 'VS5',[[3,6.99],[5,8.99]])
		end

		it 'returns product name correctly' do
			expect(@abc.get_product_name).to eq 'Vegemite Scroll'
		end


		it 'returns product code correctly' do
			expect(@abc.get_product_code).to eq 'VS5'
		end

		it 'returns best variant' do
			expect(@abc.get_best_variants(10)).to eq [5,8.99]
		end
		
	end
  
end
