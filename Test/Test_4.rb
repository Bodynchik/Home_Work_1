def abbreviation(arr_words)
  str_abbr = ""

  arr_words.each do |words|
    words.chars
    str_abbr += words[0].upcase
  end

  str_abbr
end

arr_words = ["центральний", "обробник", "подій"]
str = ""

arr_words.each_with_index do |word, i|
  str += word
  str += " " if arr_words[i + 1] != nil
end

abbr = abbreviation(arr_words)

puts("Абревіатура словосполучення \"#{str}\": #{abbr}")