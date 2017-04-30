module ApplicationHelper
  def category_options
    options_for_select([
      ["Book", 0],
      ["Movie", 1],
      ["TV Show", 2],
      ["Video", 3],
      ["Game", 4],
      ["Article", 5],
      ["Song", 6],
      ["Documentary", 7]
    ], get_preselected_option("category"))
  end
  
  def status_options
    options_for_select([
      ["To Read", 0],
      ["To Watch", 1],
      ["To Play", 2],
      ["Read", 3],
      ["Watched", 4],
      ["Played", 5]
    ], get_preselected_option("status"))
  end
  
  def priority_options
    options_for_select([
      ["Low", 0],
      ["Medium", 1],
      ["High", 2]
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
    if @item
      Item.send(attribute.pluralize)[@item.send(attribute)] 
    elsif params[:filter]
      params[:filter][attribute]
    end
  end
end