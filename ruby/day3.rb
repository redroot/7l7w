class Roman
  
  def self.method_missing name, *args
    roman = name.to_s
    
    # replace all confusing 4/9 instances
    roman.gsub!("IV","IIII")
    roman.gsub!("IX","VIIII")
    roman.gsub!("XL","XXXX")
    roman.gsub!("XC","LXXXX")
    
    (roman.count("I")+
     roman.count("V") * 5 +
     roman.count("X") * 10 +
     roman.count("L") * 50 +
     roman.count("C") * 100)
  end
  
end

puts Roman.XX
puts Roman.CCCXLIX