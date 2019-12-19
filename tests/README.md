Tests and Coverage
================
05 December, 2019 18:52:24

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                      | Coverage (%) |
| :-------------------------- | :----------: |
| ggeasy                      |     100      |
| [R/axis.R](../R/axis.R)     |     100      |
| [R/labs.R](../R/labs.R)     |     100      |
| [R/labs2.R](../R/labs2.R)   |     100      |
| [R/legend.R](../R/legend.R) |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                              |  n |  time | error | failed | skipped | warning | icon |
| :------------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-labs.R](testthat/test-labs.R)               | 10 | 1.625 |     0 |      0 |       4 |       0 | 🔶    |
| [test-legend.R](testthat/test-legend.R)           | 11 | 0.092 |     0 |      0 |       0 |       0 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R) | 20 | 0.261 |     0 |      0 |       0 |       0 |      |
| [test-rotate.R](testthat/test-rotate.R)           | 23 | 0.194 |     0 |      0 |       0 |       0 |      |

<details open>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context       | test                                                            | status  |  n |  time | icon |
| :----------------------------------------------------- | :------------ | :-------------------------------------------------------------- | :------ | -: | ----: | :--- |
| [test-labs.R](testthat/test-labs.R#L22)                | attr labs     | easy\_labs uses column attrib                                   | SKIPPED |  4 | 0.786 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L39_L40)            | attr labs     | regular labs overides easy\_labs                                | SKIPPED |  2 | 0.303 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L50_L51)            | attr labs     | regular labs pass new labels through easy\_labs                 | SKIPPED |  2 | 0.257 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L69_L70)            | attr labs     | column name used when no column attrib present                  | SKIPPED |  2 | 0.279 | 🔶    |
| [test-legend.R](testthat/test-legend.R#L8)             | remove legend | easy\_remove\_legend works with no argument                     | PASS    |  1 | 0.015 |      |
| [test-legend.R](testthat/test-legend.R#L14)            | remove legend | easy\_remove\_legend works with single character argument       | PASS    |  1 | 0.026 |      |
| [test-legend.R](testthat/test-legend.R#L20)            | remove legend | easy\_remove\_legend works with single bare argument            | PASS    |  1 | 0.013 |      |
| [test-legend.R](testthat/test-legend.R#L26)            | remove legend | easy\_remove\_legend works with multiple character arguments    | PASS    |  1 | 0.013 |      |
| [test-legend.R](testthat/test-legend.R#L32)            | remove legend | easy\_remove\_legend works with multiple bare arguments         | PASS    |  1 | 0.012 |      |
| [test-legend.R](testthat/test-legend.R#L39)            | remove legend | easy\_remove\_legend teach = TRUE works with no other arguments | PASS    |  2 | 0.005 |      |
| [test-legend.R](testthat/test-legend.R#L47)            | remove legend | easy\_remove\_legend teach = TRUE works with specific aes       | PASS    |  2 | 0.004 |      |
| [test-legend.R](testthat/test-legend.R#L55)            | remove legend | easy\_remove\_legend teach = TRUE works with multiple aes       | PASS    |  2 | 0.004 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L13)  | remove axes   | no argument                                                     | PASS    |  3 | 0.050 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L44)  | remove axes   | explicit axis                                                   | PASS    | 10 | 0.137 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L88)  | remove axes   | multiple components                                             | PASS    |  4 | 0.064 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L107) | remove axes   | teach argument produces working code                            | PASS    |  3 | 0.010 |      |
| [test-rotate.R](testthat/test-rotate.R#L8)             | rotate labels | rotation of both labels                                         | PASS    | 17 | 0.106 |      |
| [test-rotate.R](testthat/test-rotate.R#L62)            | rotate labels | rotation of x labels                                            | PASS    |  3 | 0.050 |      |
| [test-rotate.R](testthat/test-rotate.R#L77)            | rotate labels | rotation of y labels                                            | PASS    |  3 | 0.038 |      |

| Failed | Warning | Skipped |
| :----- | :------ | :------ |
| 🛑      | ⚠️      | 🔶       |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.1 (2019-07-05)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.2.1   |
| covr     | 3.3.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : skipped/warning --->
