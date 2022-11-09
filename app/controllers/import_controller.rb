class ImportController < ApplicationController
	def read_file
		require 'roo'

		info =  Roo::Spreadsheet.open(params['file'].tempfile)
		@body = false
		@amount_incomes = 0

	    info.each() do |row|
	      
	    	if @body
	        
		        unless client = Client.where(name: row[0]).first
		        	client = Client.new
		        	client.name = row[0]
		        	client.save
		        end

		        unless product = Product.where(description: row[1]).first
		        	product = Product.new
		        	product.description = row[1]
		        	product.price = row[2]
		        	product.save
		        end
		        
		        unless seller = Seller.where(name: row[5]).first
		        	seller = Seller.new
		        	seller.name = row[5]
		        	seller.address = row[4]
		        	seller.save
		        end

		        totalsale = row[2] * row[3]
		        @amount_incomes += totalsale
		        sale = Sale.new
		        sale.client_id = client.id
		        sale.seller_id = seller.id
		        sale.product_id = product.id
		        sale.price_product = row[2]
		        sale.number_product = row[3]
		        sale.total = totalsale
		        sale.save
	    	end
	      	@body = true
	    end
	    render "import/index"
	end

	

end

#clients [id,name]
#products [id,price,description]
#sale [id,client_id,product_id,seller_id,price_product,number_product,total]
#seller [id,name,address]


# @sales = Sale:all 
