module ApplicationHelper
  def category_options
    options_for_select([
      ["Book", 0],
      ["Movie", 1],
      ["TV Show", 2],
      ["Video", 3],
      ["Game", 4]
    ])
  end
  
  def status_options
    options_for_select([
      ["To Read", 0],
      ["To Watch", 1],
      ["To Play", 2],
      ["Read", 3],
      ["Watched", 4],
      ["Played", 5]
    ])
  end
  
  def priority_options
    options_for_select([
      ["Low", 0],
      ["Medium", 1],
      ["High", 2]
    ])
  end
  
  def rating_options
    options_for_select([
      [0, 0],
      [1, 1],
      [2, 2],
      [3, 3],
      [4, 4],
      [5, 5],
      [6, 6],
      [7, 7],
      [8, 8],
      [9, 9],
      [10, 10]
    ])
  end
end