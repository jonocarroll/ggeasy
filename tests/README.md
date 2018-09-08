Tests and Coverage
================
06 July, 2018 10:21:52

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                      | Coverage (%) |
| :-------------------------- | :----------: |
| ggeasy                      |    84.21     |
| [R/axis.R](../R/axis.R)     |    55.88     |
| [R/labs.R](../R/labs.R)     |    95.00     |
| [R/legend.R](../R/legend.R) |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                    | file                                              | n |  time | error | failed | skipped | warning |
| ------------------ | :------------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| test-labs.R        | [test-labs.R](testthat/test-labs.R)               | 4 | 0.065 |     0 |      0 |       0 |       0 |
| test-legend.R      | [test-legend.R](testthat/test-legend.R)           | 9 | 0.146 |     0 |      0 |       0 |       0 |
| test-remove-axis.R | [test-remove-axis.R](testthat/test-remove-axis.R) | 9 | 0.162 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context       | test                                                            | status | n |  time |
| :----------------------------------------------------- | :------------ | :-------------------------------------------------------------- | :----- | -: | ----: |
| [test-labs.R](testthat/test-labs.R#L25)                | attr labs     | easy\_labs uses column attrib                                   | PASS   | 1 | 0.016 |
| [test-labs.R](testthat/test-labs.R#L34)                | attr labs     | regular labs overides easy\_labs                                | PASS   | 1 | 0.014 |
| [test-labs.R](testthat/test-labs.R#L43)                | attr labs     | regular labs pass new labels through easy\_labs                 | PASS   | 1 | 0.015 |
| [test-labs.R](testthat/test-labs.R#L64)                | attr labs     | column name used when no column attrib present                  | PASS   | 1 | 0.020 |
| [test-legend.R](testthat/test-legend.R#L10)            | remove legend | easy\_remove\_legend works with no argument                     | PASS   | 1 | 0.022 |
| [test-legend.R](testthat/test-legend.R#L20)            | remove legend | easy\_remove\_legend works with single character argument       | PASS   | 1 | 0.021 |
| [test-legend.R](testthat/test-legend.R#L30)            | remove legend | easy\_remove\_legend works with single bare argument            | PASS   | 1 | 0.021 |
| [test-legend.R](testthat/test-legend.R#L40)            | remove legend | easy\_remove\_legend works with multiple character arguments    | PASS   | 1 | 0.038 |
| [test-legend.R](testthat/test-legend.R#L50)            | remove legend | easy\_remove\_legend works with multiple bare arguments         | PASS   | 1 | 0.022 |
| [test-legend.R](testthat/test-legend.R#L66)            | remove legend | easy\_remove\_legend teach = TRUE works with no other arguments | PASS   | 2 | 0.012 |
| [test-legend.R](testthat/test-legend.R#L84)            | remove legend | easy\_remove\_legend teach = TRUE works with specific aes       | PASS   | 2 | 0.010 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L15)  | remove axes   | easy\_remove\_axes works with no argument                       | PASS   | 1 | 0.028 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L30)  | remove axes   | easy\_remove\_axes works for x only                             | PASS   | 1 | 0.026 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L46)  | remove axes   | easy\_remove\_x\_axis works                                     | PASS   | 1 | 0.023 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L61)  | remove axes   | easy\_remove\_axes works for y only                             | PASS   | 1 | 0.022 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L76)  | remove axes   | easy\_remove\_y\_axis works                                     | PASS   | 1 | 0.018 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L86)  | remove axes   | easy\_remove\_axes works with one what element                  | PASS   | 1 | 0.017 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L99)  | remove axes   | easy\_remove\_axes works with two elements                      | PASS   | 1 | 0.017 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L114) | remove axes   | easy\_remove\_axes gives working teach message                  | PASS   | 2 | 0.011 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.0 (2018-04-23)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.5   |

</details>

<!--- Final Status : pass --->
