use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#Project - lottery number data set
include csv 

project-set = load-table:
  draw-date :: String,
  winning-numbers :: String,
  multiplier :: String,
  double-play-winning-numbers :: String
  source: csv-table-url("https://data.ny.gov/api/v3/views/d6yy-54nr/export.csv?accessType=DOWNLOAD", default-options)
end 

#problem 1

bike-table = load-table:
  duration :: String,
  start-station-name :: String,
  start-station-latitude :: String,
  start-station-longitude :: String,
  end-station-name :: String,
  end-station-latitude :: String,
  end-station-longitude :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/bluebikes-data.csv", default-options)
end 

duration = transform-column(bike-table, "duration", string-to-number-default(0))

start-station-latitude = transform-column(duration, "start-station-latitude", string-to-number-default(0))

start-station-longitude = transform-column(start-station-latitude, "start-station-longitude", string-to-number-default(0))

end-station-latitude = transform-column(start-station-longitude, "end-station-latitude", string-to-number-default(0))

new-bike-table = transform-column(end-station-latitude, "end-station-longitude", string-to-number-default(0))


#Problem 2
fun trips-only-DP(r :: Row) -> Boolean:
  get-column(r, "start-station-name") == "Danehy Park"
end 

trip1 = filter-with(bike-table, trips-only-DP)

fun trips-only-DPPSS(r :: Row) -> Boolean:
  get-column(r, "end-station-name") == "Porter Square Station"
end 

porter-square-trips = filter-with(trip1, trips-only-DPPSS)

#Problem 3
fun duration-category(r :: Row) -> String:
  doc: "gets time of trip and returns if it is short, medium, or long"
  time = get-column(r, "duration")
  if time < 300:
    "short" 
  else if time <= 500:
    "medium"
  else:
    "long"
  end 
end 

categorized-durations = build-column(new-bike-table, "category", duration-category)

#Problem 4
fun seconds-to-minutes(seconds :: Number) -> Number:
  doc: "transforms seconds to minutes"
  seconds / 60
where:
seconds-to-minutes(60) is 1
seconds-to-minutes(120) is 2
end 

table-with-minutes = transform-column(new-bike-table, "duration", seconds-to-minutes)


#Problem 5
#we could see where new blue bikes need to be added by looking at the most common stops with long trips
#short - college students depend on bikes to get between campus buildings quickly especially if they have a tight class schedule
#short - late commuters will want bikes right next to the train station

#medium: daily commuters will care about safe and direct routes with reliable availability of bikes and they need predictable and constant travel times
#medium - people running errands will care about affordability as well as bike stations at places like grocery stores and banks 

#long: tourists will care about scenic routes that are easy to navigate
#long: fitness focused people will care about proximity to bike trails 

#to reduce bike traffic we should build bike stations near major train stations, hospitals, and businesses. we should also add them to neighborhoods who aren't as close to the T. 

#to make the city friendly we should have bike stations near major tourist attractions, as well as at areas will a large population of hotels. 