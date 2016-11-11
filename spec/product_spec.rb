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

		it 'returns best variant for item number greater than variants' do
			expect(@abc.get_best_variants(10)).to eq [5,8.99]
		end

		it 'returns best variant for item number less than all variants' do
			expect(@abc.get_best_variants(1)).to eq [3,6.99]
		end

		it 'returns best variant when item number equal to any of variants' do
			expect(@abc.get_best_variants(3)).to eq [3,6.99]
		end

		it 'returns total variants list for a total number of productnumber correctly' do
			expect(@abc.get_items(10)).to eq [[5,8.99],[5,8.99]]
		end

		it 'returns total variants list for a total number of productnumber correctly' do
			expect(@abc.get_items(6)).to eq [[3, 6.99],[3, 6.99]]
		end

		it 'returns total variant count' do
			expect(@abc.available_variants).to eq [5,3]
		end

		it 'returns total list of combination equaling the product_no provided' do
			expect(@abc.exact_match(11)).to eq [5,3,3]
		end

		it 'returns total list of combination equaling the product_no provided' do
			expect(@abc.exact_match(12)).to eq []
		end

		it 'returns correct variants list from array ' do
			expect(@abc.get_variants_from_array([5,3,3])).to eq [[5,8.99],[3,6.99],[3,6.99]]
		end

		it 'returns empty variant if list from empty array array' do
			expect(@abc.get_variants_from_array([])).to eq []
		end


	end
  
end
