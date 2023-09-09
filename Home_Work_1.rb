game = {
  Paper: "Stone", Scissors: "Paper", Stone: "Scissors"
}

if ARGV.length == 2 and game[ARGV[0].to_sym] == ARGV[1]
  puts("You won!")
elsif ARGV.length == 2 and ARGV[0] == game[ARGV[1].to_sym]
  puts("You lose!")
elsif ARGV.length == 2 and ARGV[0] == ARGV[1]
  puts("Draw!")
else
  puts("Wrong data!")
end