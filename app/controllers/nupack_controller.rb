
class NupackController < ApplicationController

	def calculateTotalCost
		basePrice = params['basePrice'].to_f
		numOfPeople = params['numOfPeople'].to_i
		material = params['material']

		materialMarkup = get_material_markup(material)

		totalCost = basePrice * 1.05 * (1 + 0.012*numOfPeople + materialMarkup)
		totalCost = totalCost.round(2)

  		render :json => {:totalCost => totalCost}
	end

	def get_material_markup(material = '')
		# Here I try to simplify the case a bit.
		# I would implement a helper function to get the type for the material in real world case. 
		case material
		when 'food'
			 0.13
		when 'drugs'
		  	0.075
		when 'electronics'
		  	0.02 
		else
			0
		end		
	end

end