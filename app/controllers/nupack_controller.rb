
class NupackController < ApplicationController

	def calculateTotalCost
		basePrice = params['basePrice'].to_f
		numOfPeople = params['numOfPeople'].to_i
		material = params['material']

		# Here I try to simplify the case a bit.
		# I would implement a helper function to get the type for the material in real world case. 
		puts case material
		when 'food'
			materialMarkup = 0.13
		when 'drugs'
		  	materialMarkup = 0.075
		when 'electronics'
		  	materialMarkup = 0.02 
		else
			materialMarkup = 0
		end		

		totalCost = basePrice * 1.05 * (1 + 0.012*numOfPeople + materialMarkup)
		totalCost = totalCost.round(2)

  		render :text => totalCost
	end

end