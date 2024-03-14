class StringCalculator
  def self.add(numbers)
    delimiters = [',', "\n"]
    if numbers.start_with?('//')
      custom_delimiter, numbers = numbers.split("\n", 2)
      delimiters << custom_delimiter[2..-1]
    end
    negative_numbers = numbers.split(Regexp.union(delimiters)).map(&:to_i).select(&:negative?)
    if negative_numbers.any?
      raise "Negative numbers not allowed: #{negative_numbers.join(', ')}"
    end
    numbers.split(Regexp.union(delimiters)).map(&:to_i).sum
  end
end