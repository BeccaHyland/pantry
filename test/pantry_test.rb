require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
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

  def test_it_can_recommend_recipes
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    @pantry.add_to_cookbook(r1)
    @pantry.add_to_cookbook(r2)
    @pantry.add_to_cookbook(r3)

    assert_equal [r1, r2, r3], @pantry.cookbook

    @pantry.restock("Cheese", 10)
    @pantry.restock("Flour", 20)
    @pantry.restock("Brine", 40)
    @pantry.restock("Cucumbers", 120)
    @pantry.restock("Raw nuts", 20)
    @pantry.restock("Salt", 20)

    assert_equal ["Pickles", "Peanuts"], @pantry.what_can_i_make

    expected = {"Pickles" => 4, "Peanuts" => 2}
    assert_equal expected, @pantry.how_many_can_i_make
  end

end
