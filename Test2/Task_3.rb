def word_count(str)
  words_counts = Hash.new(0)
  str.split(/\W+/).each do |word| # регулярний вираз, котрий виокремлює слова, працює тільки з латиницею
    words_counts[word] += 1
  end
  words_counts
end

str = "Lorem ipsum dolor sit amet, diam homero in nam, brute convenire consectetuer ex usu, ea dolore concludaturque eum. Lorem ipsum dolor sit amet, diam homero in nam, ea dolore concludaturque eum, ea dolore concludaturque eum."
result = word_count(str)
puts result