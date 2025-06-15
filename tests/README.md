Tests and Coverage
================
15 June, 2025 10:26:29

- [Coverage](#coverage)
- [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                            | Coverage (%) |
|:----------------------------------|:------------:|
| ggeasy                            |    82.39     |
| [R/labs2.R](../R/labs2.R)         |     0.00     |
| [R/utils.R](../R/utils.R)         |     0.00     |
| [R/legend.R](../R/legend.R)       |    89.87     |
| [R/gridlines.R](../R/gridlines.R) |    91.67     |
| [R/axis.R](../R/axis.R)           |    100.00    |
| [R/labs.R](../R/labs.R)           |    100.00    |
| [R/text.R](../R/text.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file | n | time | error | failed | skipped | warning | icon |
|:---|---:|---:|---:|---:|---:|---:|:---|
| [test-gridlines.R](testthat/test-gridlines.R) | 9 | 0.022 | 0 | 0 | 0 | 0 |  |
| [test-labs.R](testthat/test-labs.R) | 4 | 0.010 | 0 | 0 | 4 | 0 | 🔶 |
| [test-legend.R](testthat/test-legend.R) | 71 | 0.118 | 0 | 0 | 0 | 0 |  |
| [test-remove-axis.R](testthat/test-remove-axis.R) | 20 | 0.031 | 0 | 0 | 0 | 0 |  |
| [test-rotate.R](testthat/test-rotate.R) | 23 | 0.051 | 0 | 0 | 0 | 0 |  |
| [test-text.R](testthat/test-text.R) | 34 | 0.250 | 0 | 0 | 0 | 0 |  |

<details open>

<summary>

Show Detailed Test Results
</summary>

| file | context | test | status | n | time | icon |
|:---|:---|:---|:---|---:|---:|:---|
| [test-gridlines.R](testthat/test-gridlines.R#L13) | remove grid lines | easy_remove_gridlines works | PASS | 3 | 0.012 |  |
| [test-gridlines.R](testthat/test-gridlines.R#L31) | remove grid lines | easy_remove_x_gridlines works | PASS | 3 | 0.005 |  |
| [test-gridlines.R](testthat/test-gridlines.R#L49) | remove grid lines | easy_remove_y_gridlines works | PASS | 3 | 0.005 |  |
| [test-labs.R](testthat/test-labs.R#L32) | attr labs | easy_labs uses column attrib | SKIPPED | 1 | 0.002 | 🔶 |
| [test-labs.R](testthat/test-labs.R#L58) | attr labs | regular labs overides easy_labs | SKIPPED | 1 | 0.005 | 🔶 |
| [test-labs.R](testthat/test-labs.R#L68) | attr labs | regular labs pass new labels through easy_labs | SKIPPED | 1 | 0.002 | 🔶 |
| [test-labs.R](testthat/test-labs.R#L86) | attr labs | column name used when no column attrib present | SKIPPED | 1 | 0.001 | 🔶 |
| [test-legend.R](testthat/test-legend.R#L11) | remove legend | easy_remove_legend works with no argument | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L17) | remove legend | easy_remove_legend works with single character argument | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L23) | remove legend | easy_remove_legend works with single bare argument | PASS | 1 | 0.001 |  |
| [test-legend.R](testthat/test-legend.R#L29) | remove legend | easy_remove_legend works with multiple character arguments | PASS | 1 | 0.001 |  |
| [test-legend.R](testthat/test-legend.R#L35) | remove legend | easy_remove_legend works with multiple bare arguments | PASS | 1 | 0.001 |  |
| [test-legend.R](testthat/test-legend.R#L44) | remove legend | easy_remove_legend teach = TRUE works with no other arguments | PASS | 2 | 0.003 |  |
| [test-legend.R](testthat/test-legend.R#L54) | remove legend | easy_remove_legend teach = TRUE works with specific aes | PASS | 2 | 0.003 |  |
| [test-legend.R](testthat/test-legend.R#L64) | remove legend | easy_remove_legend teach = TRUE works with multiple aes | PASS | 2 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L71) | move legend | easy_change_legend errors with no argument | PASS | 1 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L77) | move legend | easy_change_legend works with combinations | PASS | 4 | 0.006 |  |
| [test-legend.R](testthat/test-legend.R#L92) | move legend | easy_move_legend works with no argument | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L98) | move legend | easy_move_legend works with specified argument | PASS | 3 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L108) | move legend | easy_move_legend errors with bad argument | PASS | 1 | 0.004 |  |
| [test-legend.R](testthat/test-legend.R#L114) | move legend | easy_move_legend aliases work | PASS | 3 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L126_L130) | move legend | easy_move_legend teach = TRUE works with combinations | PASS | 4 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L147_L151) | move legend | easy_legend_at teach = TRUE works with combinations | PASS | 4 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L168_L172) | move legend | easy_change_legend teach = TRUE works with position | PASS | 3 | 0.004 |  |
| [test-legend.R](testthat/test-legend.R#L186) | legend direction | easy_rotate_legend works with no argument | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L192) | legend direction | easy_rotate_legend works with combinations | PASS | 4 | 0.006 |  |
| [test-legend.R](testthat/test-legend.R#L207_L211) | legend direction | easy_rotate_legend teach = TRUE works with combinations | PASS | 4 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L230) | legend justification | easy_adjust_legend works with no argument | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L236) | legend justification | easy_adjust_legend works with combinations | PASS | 3 | 0.010 |  |
| [test-legend.R](testthat/test-legend.R#L246) | legend justification | easy_adjust_legend errors with bad argument | PASS | 1 | 0.004 |  |
| [test-legend.R](testthat/test-legend.R#L252_L256) | legend justification | easy_adjust_legend teach = TRUE works with justification | PASS | 3 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L268_L272) | legend justification | easy_change_legend teach = TRUE works with justification | PASS | 3 | 0.004 |  |
| [test-legend.R](testthat/test-legend.R#L284_L288) | legend justification | easy_rotate_legend teach = TRUE works with combinations | PASS | 4 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L305) | legend title | easy_add_legend_title errors with no argument | PASS | 1 | 0.004 |  |
| [test-legend.R](testthat/test-legend.R#L311) | legend title | easy_add_legend_title relabels a single legend title | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L320_L323) | legend title | easy_add_legend_title relabels all legend titles | PASS | 1 | 0.002 |  |
| [test-legend.R](testthat/test-legend.R#L329_L333) | legend title | easy_add_legend_title teach = TRUE works with specific aes | PASS | 4 | 0.004 |  |
| [test-legend.R](testthat/test-legend.R#L350_L354) | legend title | easy_add_legend_title teach = TRUE works with unspecific aes | PASS | 4 | 0.005 |  |
| [test-legend.R](testthat/test-legend.R#L378) | legend title | easy_remove_legend_title works | PASS | 1 | 0.002 |  |
| [test-remove-axis.R](testthat/test-remove-axis.R#L16) | remove axes | no argument | PASS | 3 | 0.006 |  |
| [test-remove-axis.R](testthat/test-remove-axis.R#L49) | remove axes | explicit axis | PASS | 10 | 0.012 |  |
| [test-remove-axis.R](testthat/test-remove-axis.R#L97) | remove axes | multiple components | PASS | 4 | 0.006 |  |
| [test-remove-axis.R](testthat/test-remove-axis.R#L120) | remove axes | teach argument produces working code | PASS | 3 | 0.007 |  |
| [test-rotate.R](testthat/test-rotate.R#L11) | rotate labels | rotation of both labels | PASS | 17 | 0.040 |  |
| [test-rotate.R](testthat/test-rotate.R#L104) | rotate labels | rotation of x labels | PASS | 3 | 0.006 |  |
| [test-rotate.R](testthat/test-rotate.R#L122) | rotate labels | rotation of y labels | PASS | 3 | 0.005 |  |
| [test-text.R](testthat/test-text.R#L30_L33) | adjust text sizes | set text sizes | PASS | 23 | 0.068 |  |
| [test-text.R](testthat/test-text.R#L289_L292) | adjust text colors | set text colors | PASS | 8 | 0.034 |  |
| [test-text.R](testthat/test-text.R#L391) | text alignment | easy_center_title works | PASS | 1 | 0.003 |  |
| [test-text.R](testthat/test-text.R#L399) | bolding title | bold round-trips | PASS | 2 | 0.145 |  |

| Failed | Warning | Skipped |
|:-------|:--------|:--------|
| 🛑     | ⚠️      | 🔶      |

</details>

<details>

<summary>

Session Info
</summary>

| Field    | Value                        |
|:---------|:-----------------------------|
| Version  | R version 4.4.1 (2024-06-14) |
| Platform | aarch64-apple-darwin20       |
| Running  | macOS 15.5                   |
| Language | en_US                        |
| Timezone | Australia/Adelaide           |

| Package  | Version |
|:---------|:--------|
| testthat | 3.2.3   |
| covr     | 3.6.4   |
| covrpage | 0.2     |

</details>

<!--- Final Status : skipped/warning --->
