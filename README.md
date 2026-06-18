# Snowflakes

A collection of Nix flake templates for bootstrapping new projects with reproducible development environments.

## Templates

| Template | Description |
|---|---|
| `rust` | Rust development shell with pinned toolchain, rust-analyzer, and common cargo tooling |
| `c` | C development shell with clang, bear, and common tooling |

## Usage

### Initialize a new project

```bash
# Rust project (default)
nix flake init -t github:aviraldb/Snowflakes#rust

# C project
nix flake init -t github:aviraldb/Snowflakes#c
```

Then enter the development shell:

```bash
nix develop
# or, with direnv:
direnv allow
```

### Preview a template without initializing

```bash
nix flake show github:aviraldb/Snowflakes#<lang-name>
```

---

## What You Get

### Rust template

- **Pinned Rust toolchain** via `rust-overlay` — everyone on the team uses the exact same compiler version, defined in `rust-toolchain.toml`
- **Development tools** — `cargo`, `rustc`, `rustfmt`, `clippy`, `rust-analyzer`, `cargo-watch`, `cargo-nextest` available out of the box
- **Environment variables** — `RUST_BACKTRACE` and `RUST_LOG` set sensibly for development
- **direnv integration** — `.envrc` included so the shell activates automatically on `cd`

### C template

- **Clang toolchain** with `clangd` for LSP support
- **`bear`** for generating `compile_commands.json` automatically
- **`valgrind`** and `gdb` for debugging
- **direnv integration**

---

## Prerequisites

You need Nix with flakes enabled. If you haven't set this up yet:

### Install Nix

The recommended way is via the [Determinate Systems installer](https://github.com/DeterminateSystems/nix-installer), which enables flakes by default:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Or the official installer, then enable flakes manually by adding this to `~/.config/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

### Install direnv (optional but recommended)

```bash
# On macOS
brew install direnv

# On Ubuntu/Debian
apt install direnv
```

Then add the hook to your shell (e.g. `~/.bashrc` or `~/.zshrc`):

```bash
eval "$(direnv hook bash)"      # bash
eval "$(direnv hook zsh)"       # zsh
direnv hook fish | source       # fish
```

---

## How It Works

The root `flake.nix` in this repo does nothing except advertise the available templates. When you run `nix flake init`, Nix copies the template directory into your current folder — giving you a fully self-contained project with its own `flake.nix` and inputs.

Each template manages its own dependencies independently. The first time you run `nix develop` in your new project, Nix resolves and locks all inputs into a `flake.lock` file. Commit this file — it's what guarantees every contributor gets an identical environment.

```
your-project/
├── flake.nix       # Defines your devShell and packages
├── flake.lock      # Pinned input versions — always commit this
├── .envrc          # `use flake` — direnv hook
└── ...
```

---

## Collaborative Development

The main value of these templates in a team setting:

**Reproducibility** — `nix develop` gives every contributor the same tools at the same versions, regardless of what they have installed globally. No more "works on my machine."

**Zero setup** — a new contributor clones the repo, runs `direnv allow`, and is immediately in a working environment. No README steps to follow, no version managers to configure.

**Pinned inputs** — `flake.lock` is committed, so tool versions only change deliberately via `nix flake update`, not silently between machines.

---

## Updating a Template's Dependencies

Inside a project initialized from a template, update all inputs to their latest versions:

```bash
nix flake update
```

Or update a single input:

```bash
nix flake update nixpkgs
```

After updating, test that everything still works, then commit the new `flake.lock`.

---

## Contributing

To add a new template, create a new directory at the repo root with at minimum:

```
my-template/
├── flake.nix
├── .envrc
└── .gitignore
```

Then register it in the root `flake.nix` under `outputs.templates`:

```nix
templates.my-template = {
  path = ./my-template;
  description = "A short description shown in nix flake show";
};
```

---

## License

MIT
