
Tag.create!([
  {name: "iq"},
  {name: "christopher-hitchens"},
  {name: "russel-brand"},
  {name: "comedy"},
  {name: "poetry"},
  {name: "philip-larkin"},
  {name: "gaming"},
  {name: "spelunky"},
  {name: "documentary"},
  {name: "game-development"},
  {name: "stephen-fry"},
  {name: "jonathan-blow"},
  {name: "noam-chomsky"}
])

ItemTag.create!([
  {item_id: 1, tag_id: 1},
  {item_id: 1, tag_id: 2},
  {item_id: 2, tag_id: 1},
  {item_id: 2, tag_id: 2},
  {item_id: 3, tag_id: 1},
  {item_id: 3, tag_id: 3},
  {item_id: 4, tag_id: 4},
  {item_id: 5, tag_id: 5},
  {item_id: 5, tag_id: 6},
  {item_id: 6, tag_id: 7},
  {item_id: 6, tag_id: 8},
  {item_id: 6, tag_id: 9},
  {item_id: 6, tag_id: 10},
  {item_id: 7, tag_id: 1},
  {item_id: 7, tag_id: 2},
  {item_id: 8, tag_id: 10},
  {item_id: 9, tag_id: 1},
  {item_id: 9, tag_id: 11},
  {item_id: 9, tag_id: 4},
  {item_id: 10, tag_id: 7},
  {item_id: 10, tag_id: 10},
  {item_id: 10, tag_id: 12},
  {item_id: 10, tag_id: 9},
  {item_id: 11, tag_id: 1},
  {item_id: 11, tag_id: 13}
])