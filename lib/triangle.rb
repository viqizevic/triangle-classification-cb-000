class Triangle
  # write code here

  def initialize(first, second, third)
    @first = first
    @second = second
    @third = third
    raise TriangleError if !positive_sides? || !hold_triangle_inequality?
  end

  def positive_sides?
    [@first, @second, @third].min > 0
  end

  def hold_triangle_inequality?
    exceed_first = (@second + @third > @first)
    exceed_second = (@first + @third > @second)
    exceed_third = (@first + @second > @third)
    exceed_first && exceed_second && exceed_third
  end

  def kind
    same_12 = (@first == @second)
    same_23 = (@second == @third)
    return :equilateral if same_12 && same_23
    same_13 = (@first == @third)
    return :isosceles if same_12 || same_23 || same_13
    :scalene
  end

  class TriangleError < StandardError
    # triangle error code
  end

end
