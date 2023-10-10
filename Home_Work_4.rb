def check_peace_raisins(cake_peace)
  cut = true
  cake_peace.each do |pk|
    count_raisins = pk.count("o")
    if count_raisins > 1 or count_raisins == 0
      cut = false
      break
    end
  end
  cut
end

def cut_half_cake(cake_peace)
  half_peaces = []
  cut_vertical = false
  cut_horizontal = false

  cake_peace.each do |peace|
    str1 = peace[0...(peace.length / 2)]
    str2 = peace[(peace.length / 2)...(peace.length)]

    if str1.count("o") > 1 or str1.count("o") == 0 or (str1.count("o") == 1 and str2.count("o") == 1)
      first_half_str1 = str1[0...(str1.length / 2)]
      second_half_str1 = str1[(str1.length / 2)...(str1.length)]
      first_half_str2 = str2[0...(str2.length / 2)]
      second_half_str2 = str2[(str2.length / 2)...(str2.length)]

      if (first_half_str1.count("o") == 1 and first_half_str2.count("o") == 1) and (second_half_str1.count("o") == 1 and second_half_str2.count("o") == 1)
        half_peaces.push(first_half_str1)
        half_peaces.push(second_half_str1)
        half_peaces.push(first_half_str2)
        half_peaces.push(second_half_str2)
        cut_horizontal = true
      else
        half_peaces.push(first_half_str1 + first_half_str2)
        half_peaces.push(second_half_str1 + second_half_str2)
        cut_vertical = true
      end
    elsif str1.count("o") == 1
      half_peaces.push(str1)
      half_peaces.push(str2)
      cut_horizontal = true
    end
  end

  cut = check_peace_raisins(half_peaces)

  if cut and cut_vertical
    half_peaces.map! do |row|
      row.insert(row.length / 2, "\n")
    end
    half_peaces
  elsif cut and cut_horizontal
    half_peaces
  elsif half_peaces[0].length == 2 # якщо пиріг розрізали вже на куски, які мають ширину 2 і він все ще не розбитий вірно, то ми виходимо із рекурсивної функції
    half_peaces
  else
    cut_half_cake(half_peaces)
  end
end

def cut_cake(cake)
  raisins = cake.join.count("o")

  if raisins <= 1 or raisins >= 10
    return "Родзинок повинно бути більше 1 але менше 10!"
  end

  vertical_peaces = []
  horizontal_peaces = []
  half_peaces = []
  width_cake = cake[0].length
  height_cake = cake.length
  width_peace = height_cake / raisins
  height_peace = width_cake / raisins

  i = 0
  j = 0
  k = 0

  # ділимо пиріг горизонтально
  cake.each do |peace|
    if i == width_peace
      i = 0
    end
    if peace.include?("o")
      if i == 0
        horizontal_peaces.push(peace)
      else
        horizontal_peaces[-1] += "\n" + peace
      end
    else
      if i == 0
        horizontal_peaces.push(peace)
      else
        horizontal_peaces[-1] += "\n" + peace
      end
    end
    i += 1
  end

  # перевірка на кількість родзинок у кожному шматочку
  cut_horizontal = check_peace_raisins(horizontal_peaces)
  puts "Розріз пирога по горизонталі: #{cut_horizontal}"

  # створюємо двовимірний масив для ділення по вертикалі
  cake_2d = cake.map { |row| row.chars }

  num_rows = cake_2d.length
  num_cols = cake_2d[0].length

  # ділимо пиріг по вертикалі
  (0...num_cols).each do |col|
    if j == height_peace * height_cake
      j = 0
    end
    (0...num_rows).each do |row|
      if j == 0
        vertical_peaces.push(cake_2d[row][col])
      elsif (j + 1) % num_rows == 0
        vertical_peaces[-1] += cake_2d[row][col] + "\n"
      else
        vertical_peaces[-1] += cake_2d[row][col]
      end
      j += 1
    end
  end

  # перевірка на кількість родзинок у кожному шматочку
  cut_vertical = check_peace_raisins(vertical_peaces)
  puts "Розріз пирога по вертикалі: #{cut_vertical}"

  if height_cake % 2 == 0 and width_cake % 2 == 0
    cake.each do |peace|
      if k == 0 or k == height_cake / 2
        half_peaces.push(peace)
      else
        half_peaces[-1] += peace
      end
      k += 1
    end

    # викликаємо рекурсивну функцію для поділу на рівні частини
    half_peaces = cut_half_cake(half_peaces)
    # перевірка на кількість родзинок у кожному шматочку
    cut_half = check_peace_raisins(half_peaces)
    puts "Розріз пирога діленням навпіл: #{cut_half}"

  else
    cut_half = false
  end

  if cut_vertical and cut_horizontal and cut_half
    if vertical_peaces[0].length / height_peace < horizontal_peaces[0].length and half_peaces[0].length / 2 < horizontal_peaces[0].length
      return horizontal_peaces
    elsif half_peaces[0].length / 2 > horizontal_peaces[0].length and half_peaces[0].length / 2 > vertical_peaces[0].length / height_peace
      return half_peaces
    else
      return vertical_peaces
    end
  elsif cut_vertical and !cut_horizontal and !cut_half
    return vertical_peaces
  elsif cut_vertical and cut_horizontal and !cut_half
    return horizontal_peaces
  elsif !cut_vertical and cut_horizontal and !cut_half
    return horizontal_peaces
  elsif !cut_vertical and !cut_horizontal and cut_half
    return half_peaces
  elsif !cut_vertical and !cut_horizontal and !cut_half
    "Неможливо розрізати пиріг!"
  end

end

cake = [
  "o.....o.",
  "o.....o.",
  "...o.o..",
  "...o.o..",
]

# отримуємо масив розрізаного пирога
result = cut_cake(cake)
puts
# виводимо кожен шматочок окремо
if result.is_a?(Array) and !result.empty?
  result.each_with_index do |res, index|
    puts "#{index + 1} шматок:\n#{res}"
  end
else
  puts result
end