
class NupackController < ApplicationController

	def calculate_total_cost
		if params.has_key?(:base_price) && params.has_key?(:num_of_people) && params.has_key?(:material)
			base_price = params['base_price'].to_f
			num_of_people = params['num_of_people'].to_i
			material = params['material']


			material_markup = get_material_markup(material)

			total_cost = base_price * 1.05 * (1 + 0.012 * num_of_people + material_markup)
			total_cost = total_cost.round(2)

	  		render :json => {:total_cost => total_cost}
		else
			render :json => {:error => 1}
		end	  		
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