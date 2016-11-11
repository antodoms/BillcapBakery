require "spec_helper"
require "BillcapBakery/cart"

describe BillcapBakery::Cart do

	describe 'Product test' do

		before(:all) do
			@abc = BillcapBakery::Cart.new
		end

		it 'returns selected items correctly' do
			expect(@abc.additems('11 VS5')).to eq [[11,'VS5',[[1, 5, 8.99],[2, 3, 6.99]]]]
			expect(@abc.additems('14 MB11')).to eq [[11, "VS5", [[1, 5, 8.99], [2, 3, 6.99]]], [14, "MB11", [[1, 8, 24.95], [3, 2, 9.95]]]]
			expect(@abc.additems('13 CF')).to eq [[11, "VS5", [[1, 5, 8.99], [2, 3, 6.99]]], [14, "MB11", [[1, 8, 24.95], [3, 2, 9.95]]], [13, "CF", [[2, 5, 9.95], [1, 3, 5.95]]]]
		end

		it 'prints correctly' do
			expect(@abc.printitems).to eq "11 VS5 $22.97\n\t1 x 5 $8.99\n\t2 x 3 $6.99\n\n14 MB11 $54.8\n\t1 x 8 $24.95\n\t3 x 2 $9.95\n\n13 CF $25.85\n\t2 x 5 $9.95\n\t1 x 3 $5.95\n\n"
		end 

		it 'returns correctly as per the example shown in Coding challenge' do
			@abc = BillcapBakery::Cart.new
			expect(@abc.bulk("10 VS5\n14 MB11\n13 CF")).to eq "10 VS5 $17.98\n\t2 x 5 $8.99\n\n14 MB11 $54.8\n\t1 x 8 $24.95\n\t3 x 2 $9.95\n\n13 CF $25.85\n\t2 x 5 $9.95\n\t1 x 3 $5.95\n\n"
			@abc = BillcapBakery::Cart.new
			expect(@abc.bulk("4 VS5\n")).to eq "4 VS5 $13.98\n\t2 x 3 $6.99\n\n"
		end

	end
end
