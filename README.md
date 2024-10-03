<h1 align="center"><code>xo-i-euvs</code></h1>
<h2 align="center"><i>Comparing Execution with uv vs pip</i></h2>

---

1. [What ?](#what-)
   1. [Findings](#findings)
2. [Methodology](#methodology)
3. [Installation Times](#installation-times)
   1. [Result](#result)
   2. [Whisker Plot](#whisker-plot)
   3. [`slither` executioin times](#slither-executioin-times)

---

# What ?

Execution times comparison of [`slither`](https://github.com/crytic/slither) with `uv` vs pip using [`hyperfine`](https://lib.rs/crates/hyperfine)

## Findings

| Procedure    | Result                                                           |
| ------------ | ---------------------------------------------------------------- |
| Installation | Installation times via `uv` was ~60 times faster than with `pip` |

# Methodology

The following parameters were used when executing hyperfine

```ml
hyperfine \
    -N \
    --warmup 20 \
    "$COMM1" \
    "$COMM2" \
    --export-json "$DIR"/run.json \
    --export-markdown "$DIR"/run.md \
    --ignore-failure
```

# Installation Times

> Installation times are significantly faster

## Result

```js
Summary
uv pip install slither-analyzer ran
   88.75 ± 27.40 times faster than pip install slither-analyzer
```

| Command                           |     Mean [ms] | Min [ms] | Max [ms] |      Relative |
| :-------------------------------- | ------------: | -------: | -------: | ------------: |
| `uv pip install slither-analyzer` |    11.1 ± 2.5 |      8.4 |     21.2 |          1.00 |
| `pip install slither-analyzer`    | 988.2 ± 212.0 |    836.9 |   1489.7 | 88.75 ± 27.40 |

## Whisker Plot

![](./gfx/r1.png)

## `slither` executioin times
