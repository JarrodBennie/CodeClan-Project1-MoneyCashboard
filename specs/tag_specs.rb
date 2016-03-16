require "minitest/autorun"
require "minitest/rg"
require_relative "../models/tag"

class TestTag < MiniTest::Test
  def setup
    params = { "name" => "Groceries" }
    @tag = Tag.new( params )
  end

  def test_name
    assert_equal( "Groceries", @tag.name ) 
  end
end