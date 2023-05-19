	def solution(message, k)
		newMessage = ''
		newArr = []
		tempArr = []
		arr= message.split("")
		len = arr.length
				
			if k >= len
				return message
			else
				j = len -k
					if arr[-j] == " "
						newArr = arr[0...(-j)]
						newMessage = newArr.join("")
					else
						tempArr = arr[0..(-j)]
						x = (tempArr.length)
						while x>0
							if tempArr[x] == " "
								newArr = tempArr[0...x]
								newMessage = newArr.join("")
								break
							else
								x = x - 1
							end
						end
					newMessage
					end
			end
	end
	
	
	p solution("the quick brown fox jumps over the lazy black dog", 39)
	
	
	
