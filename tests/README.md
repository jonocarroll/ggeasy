Tests and Coverage
================
06 January, 2021 22:36:25

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                      | Coverage (%) |
|:----------------------------|:------------:|
| ggeasy                      |    96.53     |
| [R/legend.R](../R/legend.R) |    90.54     |
| [R/axis.R](../R/axis.R)     |    100.00    |
| [R/labs.R](../R/labs.R)     |    100.00    |
| [R/labs2.R](../R/labs2.R)   |    100.00    |
| [R/text.R](../R/text.R)     |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                              |   n |  time | error | failed | skipped | warning | icon |
|:--------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|:-----|
| [test-labs.R](testthat/test-labs.R)               |  10 | 1.896 |     0 |      0 |       4 |       0 | 🔶    |
| [test-legend.R](testthat/test-legend.R)           |  87 | 1.029 |     0 |      0 |       0 |       0 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R) |  20 | 0.349 |     0 |      0 |       0 |       0 |      |
| [test-rotate.R](testthat/test-rotate.R)           |  23 | 0.289 |     0 |      0 |       0 |       0 |      |
| [test-text.R](testthat/test-text.R)               | 302 | 0.562 |     0 |      0 |       0 |       0 |      |

<details open>
<summary>
Show Detailed Test Results
</summary>

| file                                                   | context              | test                                                            | status  |   n |  time | icon |
|:-------------------------------------------------------|:---------------------|:----------------------------------------------------------------|:--------|----:|------:|:-----|
| [test-labs.R](testthat/test-labs.R#L29)                | attr labs            | easy\_labs uses column attrib                                   | SKIPPED |   4 | 0.780 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L46_L47)            | attr labs            | regular labs overides easy\_labs                                | SKIPPED |   2 | 0.552 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L57_L58)            | attr labs            | regular labs pass new labels through easy\_labs                 | SKIPPED |   2 | 0.306 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L76_L77)            | attr labs            | column name used when no column attrib present                  | SKIPPED |   2 | 0.258 | 🔶    |
| [test-legend.R](testthat/test-legend.R#L10)            | remove legend        | easy\_remove\_legend works with no argument                     | PASS    |   1 | 0.020 |      |
| [test-legend.R](testthat/test-legend.R#L16)            | remove legend        | easy\_remove\_legend works with single character argument       | PASS    |   1 | 0.019 |      |
| [test-legend.R](testthat/test-legend.R#L22)            | remove legend        | easy\_remove\_legend works with single bare argument            | PASS    |   1 | 0.019 |      |
| [test-legend.R](testthat/test-legend.R#L28)            | remove legend        | easy\_remove\_legend works with multiple character arguments    | PASS    |   1 | 0.033 |      |
| [test-legend.R](testthat/test-legend.R#L34)            | remove legend        | easy\_remove\_legend works with multiple bare arguments         | PASS    |   1 | 0.024 |      |
| [test-legend.R](testthat/test-legend.R#L41)            | remove legend        | easy\_remove\_legend teach = TRUE works with no other arguments | PASS    |   2 | 0.008 |      |
| [test-legend.R](testthat/test-legend.R#L49)            | remove legend        | easy\_remove\_legend teach = TRUE works with specific aes       | PASS    |   2 | 0.007 |      |
| [test-legend.R](testthat/test-legend.R#L57)            | remove legend        | easy\_remove\_legend teach = TRUE works with multiple aes       | PASS    |   2 | 0.007 |      |
| [test-legend.R](testthat/test-legend.R#L64)            | move legend          | easy\_change\_legend errors with no argument                    | PASS    |   1 | 0.013 |      |
| [test-legend.R](testthat/test-legend.R#L70)            | move legend          | easy\_change\_legend works with combinations                    | PASS    |   4 | 0.133 |      |
| [test-legend.R](testthat/test-legend.R#L85)            | move legend          | easy\_move\_legend works with no argument                       | PASS    |   1 | 0.024 |      |
| [test-legend.R](testthat/test-legend.R#L91)            | move legend          | easy\_move\_legend works with specified argument                | PASS    |   3 | 0.071 |      |
| [test-legend.R](testthat/test-legend.R#L101)           | move legend          | easy\_move\_legend errors with bad argument                     | PASS    |   1 | 0.011 |      |
| [test-legend.R](testthat/test-legend.R#L107)           | move legend          | easy\_move\_legend aliases work                                 | PASS    |   3 | 0.075 |      |
| [test-legend.R](testthat/test-legend.R#L119)           | move legend          | easy\_move\_legend teach = TRUE works with combinations         | PASS    |   4 | 0.041 |      |
| [test-legend.R](testthat/test-legend.R#L128)           | move legend          | easy\_legend\_at teach = TRUE works with combinations           | PASS    |   4 | 0.031 |      |
| [test-legend.R](testthat/test-legend.R#L137)           | move legend          | easy\_change\_legend teach = TRUE works with position           | PASS    |   3 | 0.036 |      |
| [test-legend.R](testthat/test-legend.R#L147)           | legend direction     | easy\_rotate\_legend works with no argument                     | PASS    |   1 | 0.020 |      |
| [test-legend.R](testthat/test-legend.R#L153)           | legend direction     | easy\_rotate\_legend works with combinations                    | PASS    |   4 | 0.076 |      |
| [test-legend.R](testthat/test-legend.R#L168)           | legend direction     | easy\_rotate\_legend teach = TRUE works with combinations       | PASS    |   4 | 0.030 |      |
| [test-legend.R](testthat/test-legend.R#L179)           | legend justification | easy\_adjust\_legend works with no argument                     | PASS    |   1 | 0.019 |      |
| [test-legend.R](testthat/test-legend.R#L185)           | legend justification | easy\_adjust\_legend works with combinations                    | PASS    |   3 | 0.056 |      |
| [test-legend.R](testthat/test-legend.R#L195)           | legend justification | easy\_adjust\_legend errors with bad argument                   | PASS    |   1 | 0.009 |      |
| [test-legend.R](testthat/test-legend.R#L201)           | legend justification | easy\_adjust\_legend teach = TRUE works with justification      | PASS    |   3 | 0.038 |      |
| [test-legend.R](testthat/test-legend.R#L209)           | legend justification | easy\_change\_legend teach = TRUE works with justification      | PASS    |   3 | 0.028 |      |
| [test-legend.R](testthat/test-legend.R#L217)           | legend justification | easy\_rotate\_legend teach = TRUE works with combinations       | PASS    |   4 | 0.031 |      |
| [test-legend.R](testthat/test-legend.R#L226)           | legend title         | easy\_add\_legend\_title errors with no argument                | PASS    |   1 | 0.008 |      |
| [test-legend.R](testthat/test-legend.R#L232)           | legend title         | easy\_add\_legend\_title relabels a single legend title         | PASS    |   1 | 0.019 |      |
| [test-legend.R](testthat/test-legend.R#L239)           | legend title         | easy\_add\_legend\_title relabels all legend titles             | PASS    |   9 | 0.031 |      |
| [test-legend.R](testthat/test-legend.R#L247)           | legend title         | easy\_add\_legend\_title teach = TRUE works with specific aes   | PASS    |   4 | 0.030 |      |
| [test-legend.R](testthat/test-legend.R#L256)           | legend title         | easy\_add\_legend\_title teach = TRUE works with unspecific aes | PASS    |  12 | 0.041 |      |
| [test-legend.R](testthat/test-legend.R#L270)           | legend title         | easy\_remove\_legend\_title works                               | PASS    |   1 | 0.021 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L15)  | remove axes          | no argument                                                     | PASS    |   3 | 0.080 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L46)  | remove axes          | explicit axis                                                   | PASS    |  10 | 0.172 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L90)  | remove axes          | multiple components                                             | PASS    |   4 | 0.081 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L109) | remove axes          | teach argument produces working code                            | PASS    |   3 | 0.016 |      |
| [test-rotate.R](testthat/test-rotate.R#L10)            | rotate labels        | rotation of both labels                                         | PASS    |  17 | 0.171 |      |
| [test-rotate.R](testthat/test-rotate.R#L64)            | rotate labels        | rotation of x labels                                            | PASS    |   3 | 0.064 |      |
| [test-rotate.R](testthat/test-rotate.R#L79)            | rotate labels        | rotation of y labels                                            | PASS    |   3 | 0.054 |      |
| [test-text.R](testthat/test-text.R#L25)                | adjust text sizes    | set text sizes                                                  | PASS    | 203 | 0.364 |      |
| [test-text.R](testthat/test-text.R#L146)               | adjust text colors   | set text colors                                                 | PASS    |  98 | 0.175 |      |
| [test-text.R](testthat/test-text.R#L220)               | text alignment       | easy\_center\_title works                                       | PASS    |   1 | 0.023 |      |

| Failed | Warning | Skipped |
|:-------|:--------|:--------|
| 🛑      | ⚠️      | 🔶       |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                         |
|:---------|:------------------------------|
| Version  | R version 4.0.3 (2020-10-10)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Pop!\_OS 20.10                |
| Language | en\_AU                        |
| Timezone | Australia/Adelaide            |

| Package  | Version |
|:---------|:--------|
| testthat | 3.0.1   |
| covr     | 3.5.1   |
| covrpage | 0.1     |

</details>
<!--- Final Status : skipped/warning --->
