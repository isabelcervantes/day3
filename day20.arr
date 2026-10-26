use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
 
data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)


fun summary(b :: BookRecord) -> String:
  doc: "returns a summary string of a book"
  b.author + " wrote the book " + b.title + " that is " + num-to-string(b.pages) + " pages long."
end 

fun is-long-book(b :: BookRecord) -> Boolean:
  doc: "takes in a book and returns true if longer than 350 pages and false if not"
  if b.pages > 350:
    true
  else:
    false
  end 
end 

data PodcastRec:
  | podcast(title :: String, host :: String, length :: Number)
end 

podcast1 = podcast("Hello There", "Sally", 50)
podcast2 = podcast("Oh No", "Greg", 160)

fun podcast-summary(p :: PodcastRec) -> String:
  doc: "takes in a PodcastRec and gives a string giving a summary"
  p.host + " hosts the " + p.title + " podcast, that is " + num-to-string(p.length) + " minutes long."
end 


include csv
recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end
recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))