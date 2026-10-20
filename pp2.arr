use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
# Commute Playlist

# Your music app plays a queue of tracks while you commute. A queue is a `List<Number>` with one entry per track, in the order the tracks will play; each entry is the length of the track in seconds. You may assume every entry is a whole number greater than 0, and that the length of the commute (in Parts 3 and 4) is 0 or more.
# Start your file with `import lists as L` so you can use `L.filter` and `L.length`.
# Later parts should call the functions from earlier parts rather than repeating that logic.
# Part 1: Skipped tracks

# The app automatically skips any track shorter than 60 seconds, since those are usually intros and ads. A skipped track takes no time.
# Design and implement `is-skipped`, which takes the length of a track in seconds and returns `true` if the app skips it and `false` otherwise.
# Example behavior:
# `30` → `true`
# `59` → `true`
# `60` → `false`
# `240` → `false`

fun is-skipped(n :: Number) -> Boolean:
  if n < 60:
    true 
  else:
    false 
  end 
where: 
  is-skipped(111) is false
  is-skipped(33) is true
end 
# Part 2: Playable tracks

# Design and implement `playable`, which takes a queue and returns the tracks that are not skipped, in the same order. Use `L.filter`.
# Example behavior:
# `[list: 30, 200, 59, 60]` → `[list: 200, 60]`
# `[list: 45]` → `[list: ]`
# `[list: ]` → `[list: ]`

fun playable(num-list :: List<Number>) -> List<Number> block:
  var new-list = [list: ]
  for each(n from num-list):
    if is-skipped(n) == false:
      new-list := new-list + [list: n]
    else:
      new-list
    end
  end
  new-list
where:
  playable([list: 222, 44, 234]) is [list: 222, 234]
  playable([list: 30, 200, 59]) is [list: 200]
end
  
# Part 3: Tracks finished

# The playable tracks play one after another, starting when the commute starts. A track finishes if it ends before the commute is over, or at the exact moment the commute ends. Once one track doesn't finish, no track after it finishes either.
# Design and implement `tracks-finished`, which takes a queue and the length of the commute in seconds, and returns how many tracks finish during the commute. Use `for each`.
# If the body of your loop has more than one expression, mark it the same way you mark a function: write `for each(... from ...) block:` instead of `for each(... from ...):`. The same goes for an `if` with more than one expression in a branch: write `if ... block:`.
# Example behavior:
# `[list: ]`, `600` → `0`
# `[list: 300, 200]`, `600` → `2`
# `[list: 300, 400, 100]`, `600` → `1`
# `[list: 30, 300, 45, 300]`, `600` → `2`
# `[list: 600]`, `600` → `1`

fun tracks-finished(queue :: List<Number>, commute :: Number) -> Number block:
  var result = 0
  var timing = 0
  for each(song from playable(queue)) block:
    timing := timing + song
    if (timing) <= commute:
     result := result + 1
    else:
      result
    end
  end 
  result
where: 
  tracks-finished([list: 200, 300, 100], 550) is 2
  tracks-finished([list: 18, 100, 20], 50) is 0
  tracks-finished([list: 30, 300, 45, 300], 600) is 2
end 
# Part 4: Commute report

# The app keeps each day's queue in a table with a `title` column and a `seconds` column:
# ```pyret
monday = table: title :: String, seconds :: Number
row: "Intro", 15
row: "Morning Light", 210
row: "Sponsor Message", 30
row: "Long Road", 420
row: "Station Break", 45
row: "Northbound", 180
row: "Last Stop", 240
end
# ```
# Design and implement `commute-report`, which takes a table like this and the length of the commute in minutes, and returns a one-line `String` saying how many tracks finished out of how many playable tracks there were, and how many tracks were skipped. You can turn a Number into a String with `num-to-string`.
# Example behavior:
# the table above, `12` → `"Finished 2 of 4 playable tracks, skipped 3"`
# a table whose tracks are `30`, `200`, and `100` seconds long, `5` → `"Finished 2 of 2 playable tracks, skipped 1"`

fun commute-report(t :: Table, commute :: Number) -> String block:
  var col-num = 0
  new-list = get-column(t, "seconds")
  tunes = tracks-finished(new-list, (commute * 60))
  for each(n from new-list):
    col-num := col-num + 1
  end 
  "Finished " + num-to-string(tunes) + " of " + num-to-string(playable(new-list).length()) + " playable tracks, skipped " + num-to-string(new-list.length() - playable(new-list).length())
end 


# Part 5 (if you have time)

# Design and implement `queue-image`, which takes a queue and returns an `Image`: one rectangle per track, side by side, first track on the left. Each rectangle's width is the length of the track in seconds divided by 10. Skipped tracks should be gray, and all other tracks should be one other color.
# `empty-image` is an image with nothing in it, which is a useful starting value when you build an image up in a loop.
# For this function you still need a type annotation and a docstring, but you do not need tests. Try it in the interactions window to check that it looks right.

