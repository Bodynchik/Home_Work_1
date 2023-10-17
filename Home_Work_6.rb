def checking_correct_ip(ip_address)
  check = true

  arr_str = ip_address.split(".")

  if arr_str.length != 4
    check = false
  end

  arr_str.each do |piece|
    arr_num = piece.chars

    if piece.to_i < 0 or piece.to_i > 255
      check = false
    end

    arr_num.each_with_index do |n, i|
      if arr_num[i + 1] != nil and arr_num[i + 1].to_i > 0 and n.to_i == 0
        check = false
      end
    end
  end

  check
end

ip_address = "128.43.78.15"
check = checking_correct_ip(ip_address)
puts("IPv4 == #{ip_address} == введена коректно? ---> #{check}")