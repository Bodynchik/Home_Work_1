def roman_into_arabic(str)
  roman_numbers = {
    "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000
  }

  arr = str.chars
  miss = true
  res = 0

  arr.each_with_index do |char, i|
    if arr[i + 1] != nil and roman_numbers[char] < roman_numbers[arr[i + 1]]
      res += roman_numbers[arr[i + 1]] - roman_numbers[char]
      miss = false
      next
    elsif !miss
      miss = true
      next
    else
      res += roman_numbers[char]
      miss = true
    end
  end

  res
end

def arabic_into_roman(number)
  arabic_numbers = {
    1000 => "M", 900 => "CM",  500 => "D", 400 => "CD" , 100 => "C", 90 => "XC" , 50 => "L", 40 => "XL" , 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"
  }

  res = ""

  arabic_numbers.each_key do |num|
    while num <= number
      number -= num
      res += arabic_numbers[num]
    end
  end

  res
end

begin
  puts("Введіть число:")
  number = gets.chomp.to_i
end while number < 1 or number > 4000

roman_result = arabic_into_roman(number)
arabic_result = roman_into_arabic(roman_result)

puts("Арабське число #{number} ===> #{roman_result}")
puts("Римське число #{roman_result} ===> #{arabic_result}")