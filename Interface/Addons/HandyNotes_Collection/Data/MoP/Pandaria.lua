---
--- @file
--- Map point definitions.
---

local _, this = ...

local map = this.maps['pandaria']

local points = {
  [90106940] = {
    summary = this.maps['timeless_isle'],
  },
}

this.points[map] = points
