module ApplicationHelper
  def category_options
    options_for_select([
      ["Book", "Book"],
      ["Movie", "Movie"],
      ["TV Show", "TV Show"],
      ["Video", "Video"],
      ["Game", "Game"],
      ["Article", "Article"]
    ], get_preselected_option("category"))
  end
  
  def status_options
    options_for_select([
      ["To Read", "To Read"],
      ["To Watch", "To Watch"],
      ["To Play", "To Play"],
      ["Read", "Read"],
      ["Watched", "Watched"],
      ["Played", "Played"]
    ], get_preselected_option("status"))
  end
  
  def priority_options
    options_for_select([
      ["Low", "Low"],
      ["Medium", "Medium"],
      ["High", "High"]
    ], get_preselected_option("priority"))
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
    ], get_preselected_option("rating"))
  end
  
  def get_preselected_option(attribute)
    Item.send(attribute.pluralize)[@item.send(attribute)] if @item
    params[:filter][attribute] if params[:filter]
  end
end