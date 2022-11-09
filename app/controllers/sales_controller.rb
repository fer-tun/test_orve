class SalesController < ApplicationController
	def index
		@sales = Sale.all

	
		 #@sales.each() do |data|
		 #	subtotal = data.total
		 #	ingresos += subtotal
		 #	abort
		 #end
	end
end
