use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import math as M

cafe-data = table: day :: String, drinks-sold :: Number
  row: "Mon", 45
  row: "Tue", 30
  row: "Wed", 55
  row: "Thu", 40
  row: "Fri", 60
end 

#my list
drinks = get-column(cafe-data, "drinks-sold")
M.sum(drinks)


#average number of drinks sold per day

#problem 1
days = get-column(cafe-data, "day")
first-day = M.min(days)

#problem 2
num-drinks = [list: 45, 30, 55, 40, 60]

max-day = M.arg-max(num-drinks)

max-row = get-row(cafe-data, max-day)

get-column(max-row, "day")

#problem 3
quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

a1 = get-column(get-row(quiz-scores, 0), "quiz1")
a2 = get-column(get-row(quiz-scores, 0), "quiz2")
a3 = get-column(get-row(quiz-scores, 0), "quiz3")
a-avg = (a1 + a2 + a3) / 3

b1 = get-column(get-row(quiz-scores, 1), "quiz1")
b2 = get-column(get-row(quiz-scores, 1), "quiz2")
b3 = get-column(get-row(quiz-scores, 1), "quiz3")
b-avg = (b1 + b2 + b3) / 3

c1 = get-column(get-row(quiz-scores, 2), "quiz1")
c2 = get-column(get-row(quiz-scores, 2), "quiz2")
c3 = get-column(get-row(quiz-scores, 2), "quiz3")
c-avg = (c1 + c2 + c3) / 3

d1 = get-column(get-row(quiz-scores, 3), "quiz1")
d2 = get-column(get-row(quiz-scores, 3), "quiz2")
d3 = get-column(get-row(quiz-scores, 3), "quiz3")
d-avg = (d1 + d2 + d3) / 3

all-averages = [list: a-avg, b-avg, c-avg, d-avg]
M.max(all-averages)

#Problem 5
earnings = load table:
  name :: String,
  department-name :: String,
  title :: String,
  regular :: Number,
  retro :: String,
  other :: Number,
  overtime :: Number,
  injured :: String,
  detail :: Number,
  quinn-education :: Number
  source: csv-table-url("https://data.boston.gov/dataset/employee-earnings-report", default-options)
end 