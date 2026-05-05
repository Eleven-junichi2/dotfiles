local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node

return {
  s('boilerplate', {
    t {
      '#include <iostream>',
      '',
      'int main()',
      '{',
      '    return 0;',
      '}',
    },
  }),
}
