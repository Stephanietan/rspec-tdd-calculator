class Calculator
  # your class goes here
  attr_accessor :my_calculator
  attr_reader :results
  attr_reader :result_arr
  attr_reader :redo_arr

  def initialize(my_calculator)
    @result_arr =[]
    @redo_arr = []
    @my_calculator=my_calculator
    @results=my_calculator
  end

  def reset(other)
    @results=other
    @result_arr.push(@results)
  end

  def add(val)
    if (val.is_a? Numeric)
      @results+=val
      @result_arr.push(@results)
      self
    else
      return false
    end
  end

  def subtract(val)
    if (val.is_a? Numeric)
      @results-=val
      @result_arr.push(@results)
      self
    else
      return false
    end
  end

  def multiply(val)
    if (val.is_a? Numeric)
      @results*=val
      @result_arr.push(@results)
      self
    else
      return false
    end
  end

  def divide(val)
    if (val.is_a? Numeric)
      @results = @results/val
      @result_arr.push(@results)
      self
    else
      return false
    end
  end

  def operations(ops,val)
    if (ops == "add")
      self.add(val)
    elsif (ops == "subtract")
      self.subtract(val)
    elsif (ops == "multiply")
      self.multiply(val)
    else
      self.divide(val)
    end
  end

  def undo
    if result_arr!=[]
      @redo_arr.push(result_arr.pop)
      @results = result_arr[result_arr.length-1]
    end
  end

  def redo
    if redo_arr!=[]
      @result_arr.push(redo_arr.pop)
      @results = result_arr[result_arr.length-1]
    end
  end
end
