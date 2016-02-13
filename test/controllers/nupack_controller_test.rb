require 'test_helper'

class NupackControllerTest < ActionController::TestCase
  test "should get calculate_total_cost" do
    # test 0
    get(:calculate_total_cost, {'base_price' => 111})
    result = JSON.parse(@response.body)
    assert_equal 1, result['error']

  	# test 1
    get(:calculate_total_cost, {'base_price' => 1299.99, 'num_of_people' => 3, 'material' => 'food'})
    result = JSON.parse(@response.body)
    assert_equal 1591.58, result['total_cost']

	# test 2
    get(:calculate_total_cost, {'base_price' => 5432.00, 'num_of_people' => 1, 'material' => 'drugs'})
    result = JSON.parse(@response.body)
    assert_equal 6199.81, result['total_cost']

    # test 3
    get(:calculate_total_cost, {'base_price' => 12456.95, 'num_of_people' => 4, 'material' => 'books'})
    result = JSON.parse(@response.body)
    assert_equal 13707.63, result['total_cost']      
  end


  # test "should get some" do
  #   get(:get_material_markup, {'material' => 'food'})
  #   result = JSON.parse(@response.body)
  #   assert_equal 8888, result
  # end

end