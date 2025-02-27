local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

function CollectorHelper:CreateRecipeOptions()
    local recipeOptions = {
      type = "group",
      childGroups = "tree",
      name = "",
      args = {
        -- Left Empty --
      },
    }
    return recipeOptions
  end
