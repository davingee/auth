module CustomMatcher  
  def be_one_more_than(number)  
    simple_matcher("one more than #{number}") do |actual| 
      actual == number + 1 
    end
  end  

end  
