def reverse_polish_notation(str)
  arr_sym = []
  arr_ful = []
  arr = str.split(" ")

  priority_sym = { "+": 1, "-": 1, "*": 2, "/": 2, "^": 3}

  arr.each do |el|
    if el == "+" or el == "-" or el == "*" or el == "/" or el == "^"# если элемент символ
      if el == "^" and arr_sym.last == "^" # если встречается степень в степени
        arr_sym.push(el)
        next
      end
      while !arr_sym.empty? and (priority_sym[el.to_sym] <= priority_sym[arr_sym.last.to_sym])
        arr_ful.push(arr_sym.pop)
      end
      arr_sym.push(el)
    else # если элемент цифра
      arr_ful.push(el)
    end
  end
  while !arr_sym.empty? # если не все символы вкинули в основной массив
    arr_ful.push(arr_sym.pop)
  end

  arr_ful.join(" ")
end

str = "2 * 5 / 3 / 7 - 4 * 8 ^ 4 ^ 6 - 9"
puts("input --> #{str}")
puts("output --> #{reverse_polish_notation(str)}")