require "spec_helper"
require "BillcapBakery/variants"

describe BillcapBakery::Variants do

	describe 'variants test' do

		before(:all) do
			@abc = BillcapBakery::Variants.new(5,6.99)
		end

		it 'returns no of items correctly' do
			expect(@abc.get_no_of_items).to eq 5
		end


		it 'returns bundle price correctly' do
			expect(@abc.get_bundle_price).to eq 6.99
		end
	
	end
  
end
