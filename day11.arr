use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter-data.csv", default-options)
end

filter-with(voter-data, lam(r :: Row) -> Boolean:
  get-column(r, "Party") == "Republican" end)

#changing voters with unspecified affilitation as Independent

fun clean-party-col(p :: String) -> String:
  doc: "changes blank values to Independent"
  if p == "":
    "Independent"
  else:
    p
  end 
where:
  clean-party-col("") is "Independent"
  clean-party-col("Democrat") is "Democrat"
end 

voters-with-indep = transform-column(voter-data, "Party", clean-party-col)

fun remove-char(s :: String, c :: String) -> String:
  doc: "removes every occurrence of c from s"
  string-replace(s, c, "")
where:
  remove-char("555-123-4567", "-") is "5551234567"
  remove-char("5551234567", "-") is "5551234567"
end


 fun normalize-phone(phone :: String) -> String:
  doc: "strips dashes, dots, spaces, and parentheses so a number is NNNNNNNNNN"
  no-dash = string-replace(phone, "-", "")
  no-dot = string-replace(no-dash, ".", "")
  no-space = string-replace(no-dot, " ", "")
  no-lparen = string-replace(no-space, "(", "")
  string-replace(no-lparen, ")", "")
  where:
  normalize-phone("555-123-4567") is "5551234567"
  normalize-phone("(555) 123-4567") is "5551234567"
  normalize-phone("555.123.4567") is "5551234567"
  normalize-phone("555 123 4567") is "5551234567"
  normalize-phone("5551234567") is "5551234567"
end 