use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as l

data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end
nl-empty
nl-link(3, nl-empty)
nl-link(7, nl-link(3, nl-empty))
nl-link(2, nl-link(7, nl-link(3, nl-empty)))

fun num-7s(nl :: NumList) -> Number:
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        num-7s(rest) + 1
      else:
        num-7s(rest)
      end
  end
where:
  num-7s(nl-empty) is 0
  num-7s(nl-link(0, nl-empty)) is 0
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-link(0, nl-link(7, nl-empty))) is 1
  num-7s(nl-link(0, nl-link(7, nl-link(7, nl-empty)))) is 2
end



# Use the design recipe to write a function contains-n that takes a NumList and a Number, and returns whether that number is in the NumList. Use the template to start when you get to the code step.
# Use the design recipe to write a function total-sum that takes a NumList, and returns the sum of all the numbers in it. The sum of the empty list is 0. Use the template to start when you get to the code step.
# Use the design recipe to write a function remove-3 that takes a NumList, and returns a new NumList with any 3's removed. The remaining elements should all be in the list in the same order they were in the input. Use the template to start when you get to the code step.
# Write a data definition called NumListList that represents a list of NumLists, and use the design recipe to write a function total-sum-of-lists that takes a NumListList and produces a NumList containing the sums of the sub-lists.
# Write a data definition and corresponding template for StrList, which captures lists of strings.

fun contains-n(nl :: NumList, n :: Number) -> Boolean:
  cases (NumList) nl:
    | nl-empty => false
    | nl-link(first, rest) =>
      if first == n:
        true
      else:
        contains-n(rest, n)
      end 
  end 
where:
  contains-n(nl-empty, 4) is false
  contains-n(nl-link(2, nl-link(3, nl-link(4, nl-link(5, nl-empty)))), 4) is true
end 

fun total-sum(nl :: NumList) -> Number block:
  cases(NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      first + total-sum(rest)
  end 
where:
  total-sum(nl-empty) is 0
  total-sum(nl-link(4, nl-link(3, nl-link(3, nl-empty)))) is 10
end 
      
fun remove-3(nl :: NumList) -> NumList:
  cases (NumList) nl:
    | nl-empty => nl-empty
    | nl-link(first, rest) =>
      if first == 3:
        remove-3(rest)
      else:
        nl-link(first, remove-3(rest))
      end 
  end 
where:
  remove-3(nl-link(4, nl-link(3, nl-link(9, nl-link(3, nl-empty))))) is nl-link(4, nl-link(9, nl-empty))
end 

data NumListList:
  | nll-empty
  | nll-link(first :: NumList, rest :: NumListList)
end 

fun total-sum-of-lists(nll :: NumListList) -> NumList:
  cases(NumListList) nll:
    | nll-empty => nl-empty
    | nll-link(first, rest) =>
      nl-link(total-sum(first), total-sum-of-lists(rest))
  end 
where:
  total-sum-of-lists(nll-empty) is nl-empty
  total-sum-of-lists(nll-link(nl-link(1, nl-link(2, nl-empty)),
      nll-link(nl-link(7, nl-empty),nll-link(nl-empty, nll-empty)))) is nl-link(3, nl-link(7, nl-link(0, nl-empty)))
end 


data StrList:
  | sl-empty
  | sl-link(first :: String, rest :: StrList)
end 

data StrListList:
  | sll-empty
  | sll-link(first :: StrList, rest :: StrListList)
end 