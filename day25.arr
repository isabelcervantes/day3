use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data BST:
  | empty-leaf
  | node(key :: Number, val :: String, left :: BST, right :: BST)
end
# Invariant: keys are unique, and all nodes in the left
# subtree have keys less than the key in the current node,
# all nodes in the right subtree have keys greater than
# the key in the current node

BST0 = empty-leaf
BST1 = node(1, "hello", BST0, BST0)
BST2 = node(5, "bye", BST1, BST0)
BST3 = node(6, "bye", BST2, node(10, "cs2000", BST0, BST0))

#|
fun bst-temp(bst :: BST) -> ???:
  cases (BST) bst:
    | empty-leaf => ...
    | node(k, v, left, right) => 
        ... k ...
        ... v ...
        ... bst-temp(left) ...
        ... bst-temp(right) ...
  end
end
|#

fun height(bst :: BST) -> Number:
  cases (BST) bst:
    | empty-leaf => 0
    | node(k, v, left, right) => 
        1 + num-max(height(left), height(right))
  end
where:
  height(BST0) is 0
  height(BST1) is 1
  height(BST2) is 2
  height(BST3) is 3
end

tree = node(5, "five", 
  node(2, "two", empty-leaf, empty-leaf),
  node(8, "eight", empty-leaf, empty-leaf))

fun retrieve(bst :: BST, n :: Number) -> Option<String>:
  doc: "returns value if n is a key in bst, none otherwise"
  cases (BST) bst:
    | empty-leaf => none
    | node(key, value, left, right) =>
      if n == key:
        some(value)
      else if n < key:
        retrieve(left, n)
      else:
        retrieve(right, n)
      end 
  end  
 where:
  retrieve(tree, 5) is some("five")
  retrieve(tree, 2) is some("two")
  retrieve(tree, 8) is some("eight")
  retrieve(tree, 7) is none
end

fun is-balanced(bst :: BST) -> Boolean:
  cases (BST) bst:
    |empty-leaf => true
    |node(key, value, left, right) =>
      if num-abs(height(left) - height(right)) <= 1:
        is-balanced(left) and is-balanced(right)
      else:
        false
      end 
  end 
where:
  is-balanced(BST0) is true
  is-balanced(BST1) is true
  is-balanced(BST2) is true
  is-balanced(BST3) is true
end 

data Arith:
  | num(n :: Number)
  | plus(left :: Arith, right :: Arith)
  | minus(left :: Arith, right :: Arith)
  | times(left :: Arith, right :: Arith)
  | divide(left :: Arith, right :: Arith)
end 

A1 = plus(num(1), num(2))
A2 = (times(num(1), divide(num(3), num(4))))
A3 = (times(minus(num(7), num(3)), (sum(num(2), divide(num(5), num(2))))))