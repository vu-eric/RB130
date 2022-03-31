ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def decipher (str)
  hash = {}

  ("a".."z").each_with_index do |letter, index|
    hash[letter] = index
  end
 
  str.chars.reduce("") do |result, char|
    next(result += char) unless hash[char.downcase]
    new_char = hash.key((hash[char.downcase] + 13) % 26)
    new_char = char == char.upcase ? new_char.upcase : new_char 
    result += new_char 
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts decipher(encrypted_name)
end

