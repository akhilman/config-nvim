#!/bin/sh
if which npx 2> /dev/null && [ -f ./package.json ]; then
    npx typescript-language-server --stdio
elif which deno 2> /dev/null; then
    deno lsp
else
    echo No language server for $(pwd) > /dev/stderr
fi
