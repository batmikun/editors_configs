# LSP SERVERS INSTALL INSTRUCTIONS

## Clangd + llbd debugger

[clangd + llbd]https://github.com/llvm/llvm-project/releases/tag/llvmorg-15.0.2
-> LLVM-15.0.2-win64.exe

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

## Go

```console
go install golang.org/x/tools/gopls@latest
```

## Haskell

From this url : https://github.com/haskell/haskell-language-server

## Markdown

https://github.com/artempyanykh/marksman/releases

## Python

### Pylsp

```console
pipx install 'python-lsp-server[all]'
```

### Pyright

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

## Toml

```console
cargo install taplo-cli --locked --features lsp
```

## Sumneko [Lua]

From this url : https://github.com/sumneko/lua-language-server/releases

# TOOLS

## cmake
https://cmake.org/download/

## make
```console
choco install make
```

## ripgrep
```console
cargo install ripgrep
```

## lazygit
```console
go install github.com/jesseduffield/lazygit@latest
```
