	def find_mid(list, item)

		low = 0
		high = (list.length) - 1
		
		while low <= high
			rough_mid = (low + high)/2
      mid = rough_mid.floor()
			guess = list[(mid)]
      if guess == item
        p "true guess"
      elsif guess > item
        p "too high"
        high = (mid) - 1
      else
        p "too low"
        low = (mid) + 1
      end
		end
    p guess
	end
	
	list = [1,3,5,7,9,11]
    item = 7

    find_mid(list, item)


_______________________________________________


	def find_smallest(list)
	
		smallest_value = 0
		g = (list.length)
		arr = []
		
		(0..(g-1)).each_with_index do |v, i|
			if list[i] > list[i+1]
				smallest_value == list[i+1]
			else
				smallest_value == list[i]
			end
			arr << smallest_value
			arr
		end
		p arr
	end
	

	
	list = [77,12,56,23,45,22,11]

	find_smallest(list)
  
  #[2,3,4].each_with_index { |e, i| puts "Element of array number #{i} => #{e}" }
#Element of array number 0 => 2
#Element of array number 1 => 3
#Element of array number 2 => 4
#=> [2, 3, 4]

	# def selection_sort(list)
		# arr = []
		
		# (0..g).each_with_index do |v, j|
			# smallest_value = find_smallest(list)
			# arr.append(list.pop(smallest_value))
			# p arr
		# end
		# arr
	# end