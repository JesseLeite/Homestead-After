" ------------------------------------------------------------------------------
" # Text Objects
" ------------------------------------------------------------------------------

call textobj#user#plugin('docblocks', {
\   'docblock': {
\     'pattern': ['/\*\*', '\*/'],
\     'select-a': 'ad',
\     'select-i': 'id',
\   },
\ })