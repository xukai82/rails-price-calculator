
class NupackController < ApplicationController

	def calculateTotalCost
		base_price = params['basePrice'].to_f
		num_of_people = params['numOfPeople'].to_i
		material = params['material']

		material_markup = get_material_markup(material)

		totalCost = base_price * 1.05 * (1 + 0.012 * num_of_people + material_markup)
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