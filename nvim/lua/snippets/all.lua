local ls = require 'luasnip'

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  s('todo', {
    t 'TODO: ',
    i(1, 'write something'),
  }),
}
