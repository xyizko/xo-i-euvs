<h2 align="center"><i>Testing Methodology</i></h2>

---

1. [Procedures](#procedures)
2. [Testing](#testing)
   1. [Environment](#environment)
   2. [Setup](#setup)
   3. [Steps](#steps)

---

# Procedures

Imortant files in this directory

| File                           | Purpose                                                                                                                                          |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| [run_tests.sh](./run_tests.sh) | Required for executing the test                                                                                                                  |
| [plots.py](./plots.py)         | Python script for generating plots via the cli. This is a [`uv script`](https://docs.astral.sh/uv/guides/scripts/#declaring-script-dependencies) |
| [`com.txt`](./com.txt)         | `run_tests.sh` will read the first two lines from this file, whicih are the commands to be compared.                                             |

# Testing

## Environment

```js
OS: Ubuntu 20.04.6 LTS x86_64
Kernel: 6.5.0-1025-azure
Shell: bash 5.0.17
Terminal: vscode
CPU: AMD @ 3.242GHz
Memory: 4692MiB / 7929MiB
```

## Setup

Install 
1. [`rust`](https://www.rust-lang.org/tools/install)
2. [`uv`](https://docs.astral.sh/uv/getting-started/installation/)
3. [`hyperfine`](https://lib.rs/install/hyperfine)

```ml
# Install Rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install UV 
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Hyperfine
cargo install hyperfine 
```


## Steps

1. Download the three files into a directory 

> [!TIP]
> Recommended to initialize a [`uv project`](https://docs.astral.sh/uv/concepts/projects/#applications) and then copy the three files from this dorectory 

2. Run 
```sh 
bash  run_tests.sh
```

3. Change the required commands to compare in [`com.txt`](./com.txt)