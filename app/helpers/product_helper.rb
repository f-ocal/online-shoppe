module ProductHelper
  def truncate_if_long(input, max_chars)
    result = input[0..max_chars-1]

    result += '...' if input.length > max_chars

    result
  end
end
