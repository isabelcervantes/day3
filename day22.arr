use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as l


fun add-till-zero(l :: List<Number>) -> Number:
  cases (List) l:
    | empty      => 0 
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
    end
where:
  add-till-zero([list: 7, 3, 0, 5]) is 
    [list: 7, 3, 0, 5].first + add-till-zero([list: 7, 3, 0, 5].rest)
  add-till-zero([list:    3, 0, 5]) is     
    [list: 3, 0, 5].first + add-till-zero([list: 3, 0, 5].rest)
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end

fun add-till-zero2(l :: List<Number>) -> Number block:
  var result = 0
  var seen-zero = false
  for each(num from l):
    if (seen-zero) or (num == 0):
      seen-zero := true
    else:
      result := result + num
    end 
  end 
  result 
where:
  add-till-zero2([list: 7, 3, 0, 5]) is 10
  add-till-zero2([list: 3, 0, 5])    is 3
  add-till-zero2([list: 0, 5])       is 0
  add-till-zero2([list: ])           is 0
end 
      
LEN-LIMIT = 3

fun strings-less-than(s-list :: List<String>) -> List<String> block:
  doc: "given a list of strings returns list only with strings whose length is less than constant LEN-LIMIT"
  var new-list = [list: ]
  for each(word from s-list):
    if string-length(word) < LEN-LIMIT:
      new-list := new-list + [list: word]
    else:
      new-list
    end 
  end 
  new-list
where:
  strings-less-than([list: "hi", "world", "fo", "do", "Matcha"]) is [list: "hi", "fo", "do"]
end 

fun string-less-than2(s-list :: List<String>) -> List<String>:
  cases(List) s-list:
    | empty => empty
    | link(f, r) =>
      if string-length(f) < LEN-LIMIT:
        [list: f] + string-less-than2(r)
      else:
        string-less-than2(r)
      end 
  end 
where:
  string-less-than2([list: "hi", "world", "fo", "do", "Matcha"]) is [list: "hi", "fo", "do"]
end 

fun find-error-suffix(s-list :: List<String>) -> List<String>:
  doc: "if error is in list returns suffix of list starting with that, if not return empty"
  cases(List) s-list:
    | empty => empty
    | link(f, r) =>
      if f == "error":
        s-list
      else:
        find-error-suffix(r)
      end
  end 
where: 
  find-error-suffix([list: "hi", "error", "dog", "cat"]) is [list: "error", "dog", "cat"]
  find-error-suffix([list: "hi", "cat", "dog", "hello"]) is [list: ]
end 
        
fun find-error-suffix2(s-list :: List<String>) -> List<String> block:
  var result = [list: ]
  var found = false
  for each(word from s-list):
    if (word == "error") or found block:
      found := true
      result := result + [list: word]
    else:
      result 
    end
  end 
where: 
  find-error-suffix([list: "hi", "error", "dog", "cat"]) is [list: "error", "dog", "cat"]
  find-error-suffix([list: "hi", "cat", "dog", "hello"]) is [list: ]
end 
        
    