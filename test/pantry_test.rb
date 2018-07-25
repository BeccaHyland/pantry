require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    # @recipe = Recipe.new("Cheese Pizza")
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_nothing_in_stock
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check("Cheese")
  end

  def test_it_can_restock_pantry
    @pantry.restock("Cheese", 10)
    assert_equal 10, @pantry.stock_check("Cheese")

    @pantry.restock("Cheese", 20)
    assert_equal 30, @pantry.stock_check("Cheese")
  end

  #def test it has a shopping list

  def test_can_add_to_its_a_shopping_list
    recipe1 = Recipe.new("Cheese Pizza")
    recipe1.add_ingredient("Cheese", 20)
    recipe1.add_ingredient("Flour", 20)
    @pantry.add_to_shopping_list(recipe1)

    expected = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected, @pantry.shopping_list

    recipe2 = Recipe.new("Spaghetti")
    recipe2.add_ingredient("Spaghetti Noodles", 10)
    recipe2.add_ingredient("Marinara Sauce", 10)
    recipe2.add_ingredient("Cheese", 5)
    @pantry.add_to_shopping_list(recipe2)

    expected =
    {"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10}
    assert_equal expected, @pantry.shopping_list
  end

  def test_it_can_print_shopping_list
    recipe1 = Recipe.new("Cheese Pizza")
    recipe1.add_ingredient("Cheese", 20)
    recipe1.add_ingredient("Flour", 20)
    @pantry.add_to_shopping_list(recipe1)

    recipe2 = Recipe.new("Spaghetti")
    recipe2.add_ingredient("Spaghetti Noodles", 10)
    recipe2.add_ingredient("Marinara Sauce", 10)
    recipe2.add_ingredient("Cheese", 5)
    @pantry.add_to_shopping_list(recipe2)

    expected = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"
    assert_equal expected, @pantry.print_shopping_list
  end

  def test_it_can_

end
