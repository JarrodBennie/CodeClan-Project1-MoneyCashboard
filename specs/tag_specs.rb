require "minitest/autorun"
require "minitest/rg"
require_relative "../models/tag"

class TestTag < MiniTest::Test
  def setup
    params = { "name" => "Groceries" }
    @tag1 = Tag.new( params )
  end

  def test_name
    expectation = "Groceries"
    result = @tag1.name
    assert_equal( expectation, result ) 
  end
end