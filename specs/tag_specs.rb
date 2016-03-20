require "minitest/autorun"
require "minitest/rg"
require_relative "../models/tag"

class TestTag < MiniTest::Test
  def setup
    params = { "name" => "Groceries", "monthly_budget" => 250.00 }
    @tag = Tag.new( params )
  end

  def test_name
    assert_equal( "Groceries", @tag.name ) 
  end

  def test_monthly_budget
    assert_equal( 250.00, @tag.monthly_budget )
  end

  def test_budget_format
    assert_equal( "250.00", @tag.budget_format )
  end
end