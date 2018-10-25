File.open("iv.txt", "r") do |f|
  f.each_line do |line|
    iv = line
  end
end
