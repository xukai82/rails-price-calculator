require 'test_helper'

class NupackControllerTest < ActionController::TestCase
  test "should get calculateTotalCost" do
  	# test 1
    get(:calculateTotalCost, {'basePrice' => 1299.99, 'numOfPeople' => 3, 'material' => 'food'})
    result = JSON.parse(@response.body)
    assert_equal 1591.58, result['totalCost']

	# test 2
    get(:calculateTotalCost, {'basePrice' => 5432.00, 'numOfPeople' => 1, 'material' => 'drugs'})
    result = JSON.parse(@response.body)
    assert_equal 6199.81, result['totalCost']

    # test 3
    get(:calculateTotalCost, {'basePrice' => 12456.95, 'numOfPeople' => 4, 'material' => 'books'})
    result = JSON.parse(@response.body)
    assert_equal 13707.63, result['totalCost']      
  end

end