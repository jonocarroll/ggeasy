Tests and Coverage
================
13 September, 2018 07:18:38

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| ggeasy                              |    83.53     |
| [R/ticks-text.r](../R/ticks-text.r) |     0.00     |
| [R/labs2.R](../R/labs2.R)           |    95.71     |
| [R/axis.R](../R/axis.R)             |    100.00    |
| [R/labs.R](../R/labs.R)             |    100.00    |
| [R/legend.R](../R/legend.R)         |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                    | file                                              |  n |  time | error | failed | skipped | warning |
| ------------------ | :------------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| test-labs.R        | [test-labs.R](testthat/test-labs.R)               | 10 | 1.471 |     0 |      0 |       0 |       0 |
| test-legend.R      | [test-legend.R](testthat/test-legend.R)           | 11 | 0.075 |     0 |      0 |       0 |       0 |
| test-remove-axis.R | [test-remove-axis.R](testthat/test-remove-axis.R) | 20 | 0.210 |     0 |      0 |       0 |       0 |
| test-rotate.R      | [test-rotate.R](testthat/test-rotate.R)           | 23 | 0.172 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context       | test                                                            | status |  n |  time |
| :----------------------------------------------------- | :------------ | :-------------------------------------------------------------- | :----- | -: | ----: |
| [test-labs.R](testthat/test-labs.R#L23)                | attr labs     | easy\_labs uses column attrib                                   | PASS   |  4 | 0.511 |
| [test-labs.R](testthat/test-labs.R#L40)                | attr labs     | regular labs overides easy\_labs                                | PASS   |  2 | 0.413 |
| [test-labs.R](testthat/test-labs.R#L50)                | attr labs     | regular labs pass new labels through easy\_labs                 | PASS   |  2 | 0.245 |
| [test-labs.R](testthat/test-labs.R#L68)                | attr labs     | column name used when no column attrib present                  | PASS   |  2 | 0.302 |
| [test-legend.R](testthat/test-legend.R#L8)             | remove legend | easy\_remove\_legend works with no argument                     | PASS   |  1 | 0.013 |
| [test-legend.R](testthat/test-legend.R#L14)            | remove legend | easy\_remove\_legend works with single character argument       | PASS   |  1 | 0.018 |
| [test-legend.R](testthat/test-legend.R#L20)            | remove legend | easy\_remove\_legend works with single bare argument            | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L26)            | remove legend | easy\_remove\_legend works with multiple character arguments    | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L32)            | remove legend | easy\_remove\_legend works with multiple bare arguments         | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L39)            | remove legend | easy\_remove\_legend teach = TRUE works with no other arguments | PASS   |  2 | 0.006 |
| [test-legend.R](testthat/test-legend.R#L47)            | remove legend | easy\_remove\_legend teach = TRUE works with specific aes       | PASS   |  2 | 0.005 |
| [test-legend.R](testthat/test-legend.R#L55)            | remove legend | easy\_remove\_legend teach = TRUE works with multiple aes       | PASS   |  2 | 0.006 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L13)  | remove axes   | no argument                                                     | PASS   |  3 | 0.034 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L44)  | remove axes   | explicit axis                                                   | PASS   | 10 | 0.119 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L88)  | remove axes   | multiple components                                             | PASS   |  4 | 0.044 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L107) | remove axes   | teach argument produces working code                            | PASS   |  3 | 0.013 |
| [test-rotate.R](testthat/test-rotate.R#L8)             | rotate labels | rotation of both labels                                         | PASS   | 17 | 0.097 |
| [test-rotate.R](testthat/test-rotate.R#L62)            | rotate labels | rotation of x labels                                            | PASS   |  3 | 0.034 |
| [test-rotate.R](testthat/test-rotate.R#L77)            | rotate labels | rotation of y labels                                            | PASS   |  3 | 0.041 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS High Sierra 10.13.5           |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.55  |

</details>

<!--- Final Status : pass --->
