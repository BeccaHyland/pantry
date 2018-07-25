class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock = {}
    @shopping_list = {}
    @cookbook = []
  end

  def stock_check(pantry_item)
    return 0 unless @stock.has_key?(pantry_item)
    @stock[pantry_item]
  end

  def restock(pantry_item, integer_amount)
    if @stock[pantry_item] == nil
      @stock[pantry_item] = integer_amount
    else
      @stock[pantry_item] += integer_amount
    end
  end

  def add_to_shopping_list(recipe)
    #too long, refactor if time
    recipe.ingredients.map do |ingredient, amount|
      if @shopping_list[ingredient] == nil
        @shopping_list[ingredient] = amount
      else
        @shopping_list[ingredient] += amount
      end
    end
    return @shopping_list
  end

  def print_shopping_list
    to_print = []
    @shopping_list.each do |key, value|
      to_print << "* " + key.to_s + ": " + value.to_s
      end
      joined = to_print.join("\n")
      puts joined
      return joined
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

  def what_can_i_make
    #what is in the @stock
    #compare it to different recipes
    possible_meals = []
      do


      end
      possible_meals << recipe
    end
    return possible_meals
  end

end
