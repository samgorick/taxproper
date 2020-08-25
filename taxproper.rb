def countOfAtoms(str)
  # split string into elements
  reg = /(?=[A-Z])/
  arr = str.split(reg)

  count = {}
  # create a hash of each element + number of atoms
  arr.each do |el|
    new_reg = /[0-9]/
    key = el
    elem_count = 1
    for i in 0...el.length do
      if el[i].match(new_reg)
        elem_count = el[i...el.length]
        key = el[0..i-1]
        break
      end
    end
    # if element is already in hash, add atoms, otherwise create new key value pair
    count[key] = (count[key] ? count[key] + elem_count.to_i : elem_count.to_i)
  end

  # Finally, sort alphabetically by key, flatten to one array, remove redundant numbers and join to string
  count.sort_by { |key, val| key }
  		 .flatten
  		 .select { |i| i != 1 }
  		 .join
end

p countOfAtoms("H2O") # "H2O"
p countOfAtoms("H2O2CH4") # "CH6O2"