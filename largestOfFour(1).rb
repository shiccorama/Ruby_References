def largest(arr)
  newArr = []
  num = temp = 0
  len = arr.length

  arr.each_with_index do |outer,i|
    # p "#{i} + #{outer}"
    num = arr[i][0]
    arr[i].each_with_index do |inner,j|
      # p "#{j} + #{inner}"
      if(arr[i][j] >= num)
        num = arr[i][j]
      end
    end

    newArr << num
  end

  p newArr
end


largest([[17, 23, 25, 12], [25, 7, 34, 48], [4, -10, 18, 21], [-72, -3, -17, -10]]);


# another simple solution : 

def largest(arr)
	newArr = []

 arr.each_with_index do |outer, i|
 
	newArr << outer.max
 
 end 

	p newArr

end