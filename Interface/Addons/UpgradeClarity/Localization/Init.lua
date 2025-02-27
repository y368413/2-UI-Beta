local _, namespace = ...

-- Local references
local setmetatable, tostring =
      setmetatable, tostring

local API_GetLocale = GetLocale

local client_locale = API_GetLocale()
if client_locale == "enGB" then client_locale = "enUS" end

namespace.localizations = setmetatable({}, {
    __call = function(self, locale)
        self[locale] = {}
        return self[locale]
    end,
    __index = function(self, key)
        return self[client_locale] and self[client_locale][key] or self.enUS[key] or tostring(key)
    end,
})
