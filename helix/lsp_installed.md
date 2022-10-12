# LSP SERVERS INSTALL INSTRUCTIONS

## TypeScript

```console
npm install -g typescript typescript-language-server
```

## Css - Html - JavaScript

```console
npm i -g vscode-langservers-extracted
```

## Deno

links to install deno : https://deno.land/#installation

Deno requires custom configuration

```toml
[[language]]
name = "javascript"
shebangs = ["deno", "node"]
roots = ["deno.json", "package.json", "tsconfig.json"]
config = { enable = true, lint = true, unstable = true }
language-server = { command = "deno", args = ["lsp"], language-id = "javascript" }

[[language]]
name = "jsx"
shebangs = ["deno", "node"]
roots = ["deno.json", "package.json", "tsconfig.json"]
config = { enable = true, lint = true, unstable = true }
language-server = { command = "deno", args = ["lsp"], language-id = "javascriptreact" }

[[language]]
name = "typescript"
shebangs = ["deno", "node"]
roots = ["deno.json", "package.json", "tsconfig.json"]
config = { enable = true, lint = true, unstable = true }
language-server = { command = "deno", args = ["lsp"], language-id = "typescript" }

[[language]]
name = "tsx"
shebangs = ["deno", "node"]
roots = ["deno.json", "package.json", "tsconfig.json"]
config = { enable = true, lint = true, unstable = true }
language-server = { command = "deno", args = ["lsp"], language-id = "typescriptreact" }
```

## Docker

```console
npm install -g dockerfile-language-server-nodejs
```

## Elm

```console
npm install -g elm elm-test elm-format @elm-tooling/elm-language-server
```

## Go

From this url : https://github.com/golang/tools/tree/master/gopls

## Haskell

From this url : https://github.com/haskell/haskell-language-server

## Markdown

From this url : https://valentjn.github.io/ltex/ltex-ls/installation.html

```toml
[[language]]
name = "markdown"
language-server = { command = "ltex-ls" }
file-types = ["md"]
scope = "source.markdown"
roots = []
```

## Python

Pylsp

```console
pipx install 'python-lsp-server[all]'
```

Pyright

```console
pip install pyright
```

```toml
[[language]]
name = "python"
roots = ["pyrightconfig.json", "pyproject.toml", "setup.py", "Poetry.lock", "."]
language-server = { command = "pyright-langserver", args = ["--stdio"] }
config = {}
```

## Rust

From this url : https://github.com/rust-analyzer/rust-analyzer

## Svelte

```console
npm install -g svelte-language-server
```

## Toml

```console
cargo install taplo-cli --locked --features lsp
```

## Zig

From this url : https://github.com/zigtools/zls
