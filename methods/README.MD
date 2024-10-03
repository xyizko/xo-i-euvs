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

[Hyperfine](https://lib.rs/crates/hyperfine) is a command line bench marking tool written in rust.

## Steps

1. Ensure that [rust](https://www.rust-lang.org/tools/install) is installed - required by 'hyperfine'

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

2. Install [uv](https://docs.astral.sh/uv/getting-started/installation/) - python package manager written in rust.

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

3. Place the files in this directory in the target location where the `reports/` directory will be generated along with the actual reports.

4. Add the commands that you want to compare in the first two lines of [`com.txt`](./com.txt)

5. Execute [`run_tests.sh`](./run_tests.sh)
