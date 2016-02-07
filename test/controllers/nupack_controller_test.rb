require 'test_helper'

class NupackControllerTest < ActionController::TestCase
  test "should get calculateTotalCost" do
  	# test 1
    get(:calculateTotalCost, {'basePrice' => 1299.99, 'numOfPeople' => 3, 'material' => 'food'})
    assert_equal 1591.58, response.body.to_f

	# test 2
    get(:calculateTotalCost, {'basePrice' => 5432.00, 'numOfPeople' => 1, 'material' => 'drugs'})
    assert_equal 6199.81, response.body.to_f

    # test 3
    get(:calculateTotalCost, {'basePrice' => 12456.95, 'numOfPeople' => 4, 'material' => 'books'})
    assert_equal 13707.63, response.body.to_f        
  end

end