use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

workouts = table: date :: String, activity :: String, duration :: Number, had-protein :: Boolean
  row: "Sep 21", "run", 30, true
  row: "Sep 22", "gym", 45, false
  row: "Sep 23", "bike", 25, true
    end


recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end 

crimes = load-table:
  date :: String,
  area :: String,
  borough :: String,
  name :: String,
  code :: String,
  crime :: String,
  sub-crime :: String,
  measure :: String,
  financial-year :: String,
  count :: Number,
  refresh-date :: String
  source: csv-table-url("https://data.london.gov.uk/download/e5n6w/qbc/M1045_MonthlyCrimeDashboard_KnifeCrimeData.csv", default-options)
end

fun get-row(t:: Table) -> Row:
  crimes.row-n(5)
end 