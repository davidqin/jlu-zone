class ActiveSupport::TestCase

  def assert_difference(*args, &block)
    pairs = assert_difference_get_pairs(*args)
    if pairs
      assert_difference_by_pairs(pairs, &block)
    else
      super
    end
  end

  private

  def assert_difference_get_pairs_old(*args)
    args_count = args.size
    unless args_count.even?
      return
    end
    if args_count == 2
      return
    end

    pairs = []
    pairs_count = args.size/2
    pairs_count.times do |index|
      count_expression = args[2*index]
      count_difference = args[2*index+1]
      unless count_expression.is_a?(String)
        return
      end

      unless count_difference.is_a?(Integer)
        return
      end
      pairs << [count_expression, count_difference]
    end

    return pairs
  end

  def assert_difference_get_pairs(*args)
    pairs = []
    args.each do |arg|
      return unless arg.is_a?(Hash)
      count_expression = arg.keys.first
      count_difference = arg.values.first

      unless count_expression.is_a?(String)
        return
      end

      unless count_difference.is_a?(Integer)
        return
      end
      pairs << [count_expression, count_difference]
    end
    return pairs
  end
 

  def assert_difference_by_pairs(pairs, &block)
    binding = block.send(:binding)

    before_count_array = pairs.map do |pair|
      count_expression = pair.first
      before_count = eval(count_expression, binding)
      before_count
    end

    yield

    pairs.each_with_index do |pair, i|
      before_count = before_count_array[i]
      count_expression = pair.first
      count_difference = pair.second
      after_expected_count = before_count + count_difference
      after_actual_count = eval(count_expression, binding)
      error = "#{count_expression.inspect} didn't change by #{count_difference}"
      assert_equal(after_expected_count, after_actual_count, error)
    end
  end
end