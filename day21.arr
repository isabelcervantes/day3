use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Payment:
  | cash
  | card(card-number :: String, expiry :: String)
  | venmo
  | checks(account-number:: String, routing :: String)
end 

p1 = cash
p2 = venmo
p3 = card("23421341234234", "11/29")
p4 = checks("342342243", "424423432")

fun display-payment(p :: Payment) -> String:
  cases (Payment) p:
    | cash => "Paid in cash"
    | credit(cn, exp) => "Paid by credit card expiring on " + exp
    | checks(acc, rout) => "Paid by check from account " + acc
  end
end


data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: Number)
end 

b1 = bike
b2 = car("Toyota", 2023)
b3 = truck("Jeep", 2003, 8)

fun vehicle-age(v :: Vehicle) -> Number:
  cases(Vehicle) v:
    | bike => 0
    | car(mk, yr) => (2026 - yr)
    | truck(mk, yr, cp) => (2026 - yr)
  end 
end 

data Grade:
  | letter(l-grade :: String)
  | percent(p-grade :: Number)
  | pass-fail(pf :: Boolean)
end

c1 = letter("B")
c2 = percent(85)
c3 = pass-fail(true)

fun grade-to-goal(g :: Grade) -> Number:
  cases(Grade) g:
    | letter(l) =>
      if l == "A": 4.0
      else if l == "B": 3.0
      else if l == "C": 2.0
      else if l == "D": 1.0
      else: 0.0
      end 
    | percent(p) =>
      if p >= 90: 4.0
      else if p >= 80: 3.0
      else if p >= 70: 2.0
      else if p >= 60: 1.0
      else: 0.0
      end 
    | pass-fail(pf) =>
      if pf == true: 4.0
      else: false
      end 
  end 
end 

fun payment-method(p :: Payment) -> String:
  cases(Payment) p:
    | cash => "Cash Payment"
    | card(cn, e) => "Card Payment ending in " + string-substring(cn, (string-length(cn) - 4), string-length(cn))
    | checks(an, rt) => "Check #" + rt
  end 
end
      
        
        
        
        

