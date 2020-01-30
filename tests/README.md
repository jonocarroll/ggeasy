Tests and Coverage
================
29 January, 2020 21:38:09

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
| [R/text.R](../R/text.R)     |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                              |  n |  time | error | failed | skipped | warning | icon |
| :------------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-labs.R](testthat/test-labs.R)               | 10 | 1.949 |     0 |      0 |       4 |       0 | 🔶    |
| [test-legend.R](testthat/test-legend.R)           | 86 | 0.797 |     0 |      0 |       0 |       0 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R) | 20 | 0.289 |     0 |      0 |       0 |       0 |      |
| [test-rotate.R](testthat/test-rotate.R)           | 23 | 0.229 |     0 |      0 |       0 |       0 |      |
| [test-text.R](testthat/test-text.R)               | 61 | 0.798 |     0 |      0 |       0 |       0 |      |

<details open>

<summary> Show Detailed Test Results
</summary>

| file                                                   | context              | test                                                            | status  |  n |  time | icon |
| :----------------------------------------------------- | :------------------- | :-------------------------------------------------------------- | :------ | -: | ----: | :--- |
| [test-labs.R](testthat/test-labs.R#L22)                | attr labs            | easy\_labs uses column attrib                                   | SKIPPED |  4 | 0.668 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L39_L40)            | attr labs            | regular labs overides easy\_labs                                | SKIPPED |  2 | 0.611 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L50_L51)            | attr labs            | regular labs pass new labels through easy\_labs                 | SKIPPED |  2 | 0.332 | 🔶    |
| [test-labs.R](testthat/test-labs.R#L69_L70)            | attr labs            | column name used when no column attrib present                  | SKIPPED |  2 | 0.338 | 🔶    |
| [test-legend.R](testthat/test-legend.R#L8)             | remove legend        | easy\_remove\_legend works with no argument                     | PASS    |  1 | 0.020 |      |
| [test-legend.R](testthat/test-legend.R#L14)            | remove legend        | easy\_remove\_legend works with single character argument       | PASS    |  1 | 0.020 |      |
| [test-legend.R](testthat/test-legend.R#L20)            | remove legend        | easy\_remove\_legend works with single bare argument            | PASS    |  1 | 0.014 |      |
| [test-legend.R](testthat/test-legend.R#L26)            | remove legend        | easy\_remove\_legend works with multiple character arguments    | PASS    |  1 | 0.016 |      |
| [test-legend.R](testthat/test-legend.R#L32)            | remove legend        | easy\_remove\_legend works with multiple bare arguments         | PASS    |  1 | 0.015 |      |
| [test-legend.R](testthat/test-legend.R#L39)            | remove legend        | easy\_remove\_legend teach = TRUE works with no other arguments | PASS    |  2 | 0.005 |      |
| [test-legend.R](testthat/test-legend.R#L47)            | remove legend        | easy\_remove\_legend teach = TRUE works with specific aes       | PASS    |  2 | 0.006 |      |
| [test-legend.R](testthat/test-legend.R#L55)            | remove legend        | easy\_remove\_legend teach = TRUE works with multiple aes       | PASS    |  2 | 0.005 |      |
| [test-legend.R](testthat/test-legend.R#L62)            | move legend          | easy\_change\_legend errors with no argument                    | PASS    |  1 | 0.001 |      |
| [test-legend.R](testthat/test-legend.R#L68)            | move legend          | easy\_change\_legend works with combinations                    | PASS    |  4 | 0.074 |      |
| [test-legend.R](testthat/test-legend.R#L83)            | move legend          | easy\_move\_legend works with no argument                       | PASS    |  1 | 0.020 |      |
| [test-legend.R](testthat/test-legend.R#L89)            | move legend          | easy\_move\_legend works with specified argument                | PASS    |  3 | 0.061 |      |
| [test-legend.R](testthat/test-legend.R#L99)            | move legend          | easy\_move\_legend errors with bad argument                     | PASS    |  1 | 0.001 |      |
| [test-legend.R](testthat/test-legend.R#L105)           | move legend          | easy\_move\_legend aliases work                                 | PASS    |  3 | 0.059 |      |
| [test-legend.R](testthat/test-legend.R#L117)           | move legend          | easy\_move\_legend teach = TRUE works with combinations         | PASS    |  4 | 0.028 |      |
| [test-legend.R](testthat/test-legend.R#L126)           | move legend          | easy\_legend\_at teach = TRUE works with combinations           | PASS    |  4 | 0.029 |      |
| [test-legend.R](testthat/test-legend.R#L135)           | move legend          | easy\_change\_legend teach = TRUE works with position           | PASS    |  3 | 0.027 |      |
| [test-legend.R](testthat/test-legend.R#L145)           | legend direction     | easy\_rotate\_legend works with no argument                     | PASS    |  1 | 0.016 |      |
| [test-legend.R](testthat/test-legend.R#L151)           | legend direction     | easy\_rotate\_legend works with combinations                    | PASS    |  4 | 0.084 |      |
| [test-legend.R](testthat/test-legend.R#L166)           | legend direction     | easy\_rotate\_legend teach = TRUE works with combinations       | PASS    |  4 | 0.029 |      |
| [test-legend.R](testthat/test-legend.R#L177)           | legend justification | easy\_adjust\_legend works with no argument                     | PASS    |  1 | 0.020 |      |
| [test-legend.R](testthat/test-legend.R#L183)           | legend justification | easy\_adjust\_legend works with combinations                    | PASS    |  3 | 0.062 |      |
| [test-legend.R](testthat/test-legend.R#L193)           | legend justification | easy\_adjust\_legend errors with bad argument                   | PASS    |  1 | 0.002 |      |
| [test-legend.R](testthat/test-legend.R#L199)           | legend justification | easy\_adjust\_legend teach = TRUE works with justification      | PASS    |  3 | 0.026 |      |
| [test-legend.R](testthat/test-legend.R#L207)           | legend justification | easy\_change\_legend teach = TRUE works with justification      | PASS    |  3 | 0.023 |      |
| [test-legend.R](testthat/test-legend.R#L215)           | legend justification | easy\_rotate\_legend teach = TRUE works with combinations       | PASS    |  4 | 0.026 |      |
| [test-legend.R](testthat/test-legend.R#L224)           | legend title         | easy\_add\_legend\_title errors with no argument                | PASS    |  1 | 0.001 |      |
| [test-legend.R](testthat/test-legend.R#L230)           | legend title         | easy\_add\_legend\_title relabels a single legend title         | PASS    |  1 | 0.025 |      |
| [test-legend.R](testthat/test-legend.R#L237)           | legend title         | easy\_add\_legend\_title relabels all legend titles             | PASS    |  9 | 0.026 |      |
| [test-legend.R](testthat/test-legend.R#L245)           | legend title         | easy\_add\_legend\_title teach = TRUE works with specific aes   | PASS    |  4 | 0.024 |      |
| [test-legend.R](testthat/test-legend.R#L254)           | legend title         | easy\_add\_legend\_title teach = TRUE works with unspecific aes | PASS    | 12 | 0.032 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L13)  | remove axes          | no argument                                                     | PASS    |  3 | 0.050 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L44)  | remove axes          | explicit axis                                                   | PASS    | 10 | 0.158 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L88)  | remove axes          | multiple components                                             | PASS    |  4 | 0.067 |      |
| [test-remove-axis.R](testthat/test-remove-axis.R#L107) | remove axes          | teach argument produces working code                            | PASS    |  3 | 0.014 |      |
| [test-rotate.R](testthat/test-rotate.R#L8)             | rotate labels        | rotation of both labels                                         | PASS    | 17 | 0.126 |      |
| [test-rotate.R](testthat/test-rotate.R#L62)            | rotate labels        | rotation of x labels                                            | PASS    |  3 | 0.052 |      |
| [test-rotate.R](testthat/test-rotate.R#L77)            | rotate labels        | rotation of y labels                                            | PASS    |  3 | 0.051 |      |
| [test-text.R](testthat/test-text.R#L14)                | adjust text sizes    | set text sizes                                                  | PASS    | 43 | 0.494 |      |
| [test-text.R](testthat/test-text.R#L135)               | adjust text colors   | set text colors                                                 | PASS    | 18 | 0.304 |      |

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
