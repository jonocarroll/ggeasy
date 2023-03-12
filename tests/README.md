Tests and Coverage
================
11 March, 2023 13:22:52

- <a href="#coverage" id="toc-coverage">Coverage</a>
- <a href="#unit-tests" id="toc-unit-tests">Unit Tests</a>

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                            | Coverage (%) |
|:----------------------------------|:------------:|
| ggeasy                            |    89.57     |
| [R/utils.R](../R/utils.R)         |     0.00     |
| [R/legend.R](../R/legend.R)       |    90.54     |
| [R/gridlines.R](../R/gridlines.R) |    91.67     |
| [R/axis.R](../R/axis.R)           |    100.00    |
| [R/labs.R](../R/labs.R)           |    100.00    |
| [R/labs2.R](../R/labs2.R)         |    100.00    |
| [R/text.R](../R/text.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                              |   n |  time | error | failed | skipped | warning |
|:--------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-gridlines.R](testthat/test-gridlines.R)     |   9 | 0.115 |     0 |      0 |       0 |       0 |
| [test-labs.R](testthat/test-labs.R)               |  10 | 0.643 |     0 |      0 |       0 |       0 |
| [test-legend.R](testthat/test-legend.R)           |  87 | 0.707 |     0 |      0 |       0 |       0 |
| [test-remove-axis.R](testthat/test-remove-axis.R) |  20 | 0.132 |     0 |      0 |       0 |       0 |
| [test-rotate.R](testthat/test-rotate.R)           |  23 | 0.139 |     0 |      0 |       0 |       0 |
| [test-text.R](testthat/test-text.R)               | 302 | 0.353 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                                   | context              | test                                                          | status |   n |  time |
|:-------------------------------------------------------|:---------------------|:--------------------------------------------------------------|:-------|----:|------:|
| [test-gridlines.R](testthat/test-gridlines.R#L13)      | remove grid lines    | easy_remove_gridlines works                                   | PASS   |   3 | 0.047 |
| [test-gridlines.R](testthat/test-gridlines.R#L31)      | remove grid lines    | easy_remove_x\_gridlines works                                | PASS   |   3 | 0.033 |
| [test-gridlines.R](testthat/test-gridlines.R#L49)      | remove grid lines    | easy_remove_y\_gridlines works                                | PASS   |   3 | 0.035 |
| [test-labs.R](testthat/test-labs.R#L29)                | attr labs            | easy_labs uses column attrib                                  | PASS   |   4 | 0.183 |
| [test-labs.R](testthat/test-labs.R#L46_L47)            | attr labs            | regular labs overides easy_labs                               | PASS   |   2 | 0.128 |
| [test-labs.R](testthat/test-labs.R#L57_L58)            | attr labs            | regular labs pass new labels through easy_labs                | PASS   |   2 | 0.138 |
| [test-labs.R](testthat/test-labs.R#L76_L77)            | attr labs            | column name used when no column attrib present                | PASS   |   2 | 0.194 |
| [test-legend.R](testthat/test-legend.R#L10)            | remove legend        | easy_remove_legend works with no argument                     | PASS   |   1 | 0.017 |
| [test-legend.R](testthat/test-legend.R#L16)            | remove legend        | easy_remove_legend works with single character argument       | PASS   |   1 | 0.017 |
| [test-legend.R](testthat/test-legend.R#L22)            | remove legend        | easy_remove_legend works with single bare argument            | PASS   |   1 | 0.017 |
| [test-legend.R](testthat/test-legend.R#L28)            | remove legend        | easy_remove_legend works with multiple character arguments    | PASS   |   1 | 0.016 |
| [test-legend.R](testthat/test-legend.R#L34)            | remove legend        | easy_remove_legend works with multiple bare arguments         | PASS   |   1 | 0.015 |
| [test-legend.R](testthat/test-legend.R#L41)            | remove legend        | easy_remove_legend teach = TRUE works with no other arguments | PASS   |   2 | 0.006 |
| [test-legend.R](testthat/test-legend.R#L49)            | remove legend        | easy_remove_legend teach = TRUE works with specific aes       | PASS   |   2 | 0.006 |
| [test-legend.R](testthat/test-legend.R#L57)            | remove legend        | easy_remove_legend teach = TRUE works with multiple aes       | PASS   |   2 | 0.006 |
| [test-legend.R](testthat/test-legend.R#L64)            | move legend          | easy_change_legend errors with no argument                    | PASS   |   1 | 0.008 |
| [test-legend.R](testthat/test-legend.R#L70)            | move legend          | easy_change_legend works with combinations                    | PASS   |   4 | 0.045 |
| [test-legend.R](testthat/test-legend.R#L85)            | move legend          | easy_move_legend works with no argument                       | PASS   |   1 | 0.011 |
| [test-legend.R](testthat/test-legend.R#L91)            | move legend          | easy_move_legend works with specified argument                | PASS   |   3 | 0.032 |
| [test-legend.R](testthat/test-legend.R#L101)           | move legend          | easy_move_legend errors with bad argument                     | PASS   |   1 | 0.007 |
| [test-legend.R](testthat/test-legend.R#L107)           | move legend          | easy_move_legend aliases work                                 | PASS   |   3 | 0.034 |
| [test-legend.R](testthat/test-legend.R#L119)           | move legend          | easy_move_legend teach = TRUE works with combinations         | PASS   |   4 | 0.023 |
| [test-legend.R](testthat/test-legend.R#L128)           | move legend          | easy_legend_at teach = TRUE works with combinations           | PASS   |   4 | 0.031 |
| [test-legend.R](testthat/test-legend.R#L137)           | move legend          | easy_change_legend teach = TRUE works with position           | PASS   |   3 | 0.019 |
| [test-legend.R](testthat/test-legend.R#L147)           | legend direction     | easy_rotate_legend works with no argument                     | PASS   |   1 | 0.012 |
| [test-legend.R](testthat/test-legend.R#L153)           | legend direction     | easy_rotate_legend works with combinations                    | PASS   |   4 | 0.043 |
| [test-legend.R](testthat/test-legend.R#L168)           | legend direction     | easy_rotate_legend teach = TRUE works with combinations       | PASS   |   4 | 0.017 |
| [test-legend.R](testthat/test-legend.R#L179)           | legend justification | easy_adjust_legend works with no argument                     | PASS   |   1 | 0.011 |
| [test-legend.R](testthat/test-legend.R#L185)           | legend justification | easy_adjust_legend works with combinations                    | PASS   |   3 | 0.033 |
| [test-legend.R](testthat/test-legend.R#L195)           | legend justification | easy_adjust_legend errors with bad argument                   | PASS   |   1 | 0.008 |
| [test-legend.R](testthat/test-legend.R#L201)           | legend justification | easy_adjust_legend teach = TRUE works with justification      | PASS   |   3 | 0.016 |
| [test-legend.R](testthat/test-legend.R#L209)           | legend justification | easy_change_legend teach = TRUE works with justification      | PASS   |   3 | 0.015 |
| [test-legend.R](testthat/test-legend.R#L217)           | legend justification | easy_rotate_legend teach = TRUE works with combinations       | PASS   |   4 | 0.018 |
| [test-legend.R](testthat/test-legend.R#L226)           | legend title         | easy_add_legend_title errors with no argument                 | PASS   |   1 | 0.007 |
| [test-legend.R](testthat/test-legend.R#L232)           | legend title         | easy_add_legend_title relabels a single legend title          | PASS   |   1 | 0.011 |
| [test-legend.R](testthat/test-legend.R#L239)           | legend title         | easy_add_legend_title relabels all legend titles              | PASS   |   9 | 0.041 |
| [test-legend.R](testthat/test-legend.R#L247)           | legend title         | easy_add_legend_title teach = TRUE works with specific aes    | PASS   |   4 | 0.017 |
| [test-legend.R](testthat/test-legend.R#L256)           | legend title         | easy_add_legend_title teach = TRUE works with unspecific aes  | PASS   |  12 | 0.137 |
| [test-legend.R](testthat/test-legend.R#L270)           | legend title         | easy_remove_legend_title works                                | PASS   |   1 | 0.011 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L15)  | remove axes          | no argument                                                   | PASS   |   3 | 0.023 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L46)  | remove axes          | explicit axis                                                 | PASS   |  10 | 0.069 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L90)  | remove axes          | multiple components                                           | PASS   |   4 | 0.030 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L109) | remove axes          | teach argument produces working code                          | PASS   |   3 | 0.010 |
| [test-rotate.R](testthat/test-rotate.R#L10)            | rotate labels        | rotation of both labels                                       | PASS   |  17 | 0.092 |
| [test-rotate.R](testthat/test-rotate.R#L64)            | rotate labels        | rotation of x labels                                          | PASS   |   3 | 0.025 |
| [test-rotate.R](testthat/test-rotate.R#L79)            | rotate labels        | rotation of y labels                                          | PASS   |   3 | 0.022 |
| [test-text.R](testthat/test-text.R#L25)                | adjust text sizes    | set text sizes                                                | PASS   | 203 | 0.225 |
| [test-text.R](testthat/test-text.R#L146)               | adjust text colors   | set text colors                                               | PASS   |  98 | 0.120 |
| [test-text.R](testthat/test-text.R#L220)               | text alignment       | easy_center_title works                                       | PASS   |   1 | 0.008 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                        |
|:---------|:-----------------------------|
| Version  | R version 4.1.2 (2021-11-01) |
| Platform | x86_64-pc-linux-gnu (64-bit) |
| Running  | Pop!\_OS 22.04 LTS           |
| Language | en_AU                        |
| Timezone | Australia/Adelaide           |

| Package  | Version |
|:---------|:--------|
| testthat | 3.1.5   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>
<!--- Final Status : pass --->
