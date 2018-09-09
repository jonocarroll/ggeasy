Tests and Coverage
================
09 September, 2018 15:42:05

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| ggeasy                              |    80.16     |
| [R/ticks-text.r](../R/ticks-text.r) |     0.00     |
| [R/axis.R](../R/axis.R)             |    100.00    |
| [R/labs.R](../R/labs.R)             |    100.00    |
| [R/labs2.R](../R/labs2.R)           |    100.00    |
| [R/legend.R](../R/legend.R)         |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                    | file                                              |  n |  time | error | failed | skipped | warning |
| ------------------ | :------------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| test-labs.R        | [test-labs.R](testthat/test-labs.R)               | 10 | 1.059 |     0 |      0 |       0 |       0 |
| test-legend.R      | [test-legend.R](testthat/test-legend.R)           | 11 | 0.062 |     0 |      0 |       0 |       0 |
| test-remove-axis.R | [test-remove-axis.R](testthat/test-remove-axis.R) | 20 | 0.205 |     0 |      0 |       0 |       0 |
| test-rotate.R      | [test-rotate.R](testthat/test-rotate.R)           | 23 | 0.156 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context       | test                                                            | status |  n |  time |
| :----------------------------------------------------- | :------------ | :-------------------------------------------------------------- | :----- | -: | ----: |
| [test-labs.R](testthat/test-labs.R#L23)                | attr labs     | easy\_labs uses column attrib                                   | PASS   |  4 | 0.361 |
| [test-labs.R](testthat/test-labs.R#L40)                | attr labs     | regular labs overides easy\_labs                                | PASS   |  2 | 0.228 |
| [test-labs.R](testthat/test-labs.R#L50)                | attr labs     | regular labs pass new labels through easy\_labs                 | PASS   |  2 | 0.240 |
| [test-labs.R](testthat/test-labs.R#L68)                | attr labs     | column name used when no column attrib present                  | PASS   |  2 | 0.230 |
| [test-legend.R](testthat/test-legend.R#L8)             | remove legend | easy\_remove\_legend works with no argument                     | PASS   |  1 | 0.010 |
| [test-legend.R](testthat/test-legend.R#L14)            | remove legend | easy\_remove\_legend works with single character argument       | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L20)            | remove legend | easy\_remove\_legend works with single bare argument            | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L26)            | remove legend | easy\_remove\_legend works with multiple character arguments    | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L32)            | remove legend | easy\_remove\_legend works with multiple bare arguments         | PASS   |  1 | 0.009 |
| [test-legend.R](testthat/test-legend.R#L39)            | remove legend | easy\_remove\_legend teach = TRUE works with no other arguments | PASS   |  2 | 0.006 |
| [test-legend.R](testthat/test-legend.R#L47)            | remove legend | easy\_remove\_legend teach = TRUE works with specific aes       | PASS   |  2 | 0.005 |
| [test-legend.R](testthat/test-legend.R#L55)            | remove legend | easy\_remove\_legend teach = TRUE works with multiple aes       | PASS   |  2 | 0.005 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L13)  | remove axes   | no argument                                                     | PASS   |  3 | 0.041 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L44)  | remove axes   | explicit axis                                                   | PASS   | 10 | 0.104 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L88)  | remove axes   | multiple components                                             | PASS   |  4 | 0.047 |
| [test-remove-axis.R](testthat/test-remove-axis.R#L107) | remove axes   | teach argument produces working code                            | PASS   |  3 | 0.013 |
| [test-rotate.R](testthat/test-rotate.R#L8)             | rotate labels | rotation of both labels                                         | PASS   | 17 | 0.089 |
| [test-rotate.R](testthat/test-rotate.R#L62)            | rotate labels | rotation of x labels                                            | PASS   |  3 | 0.030 |
| [test-rotate.R](testthat/test-rotate.R#L77)            | rotate labels | rotation of y labels                                            | PASS   |  3 | 0.037 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |
| :------- | :---------------------------- |
| Version  | R version 3.4.4 (2018-03-15)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Pop\!\_OS 18.04 LTS           |
| Language | en\_AU                        |
| Timezone | America/Los\_Angeles          |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.55  |

</details>

<!--- Final Status : pass --->
