## New package

## Test environments
* local Pop!_OS 19.04, R 3.5.1:                      OK
* devtools::check_rhub() 
    Windows Server 2008 R2 SP1, R-devel, 32/64 bit:  1 NOTE*
    Ubuntu Linux 16.04 LTS, R-release, GCC:          1 NOTE*
    Fedora Linux, R-devel, clang, gfortran:          1 ERROR**, 1 NOTE*
* travis-ci Ubuntu 16.04 LTS, R 3.6.2:               OK
* appveyor x86_64-w64-mingw32/x64 (64-bit), R 3.6.2: OK
* win-builder
    R-devel (R Under development (unstable) (2020-01-07 r77633)): OK*
    R-release (R 3.6.2):                             4 ERRORs***
    R-oldrelease (R 3.5.3):                          OK*

(*) NOTE on rhub/win-builder is a false-positive

   > Possibly mis-spelled words in DESCRIPTION:
   >   ggplot (2:24, 12:18)

(**) ERROR on rhub Fedora due to upstream issues

   > Packages suggested but not available: 'vdiffr', 'covr'
   
   These files are used for tests. Issue appears to be dependency-related.
   
   > ERROR: dependencies ‘usethis’, ‘covr’, ‘httr’, ‘roxygen2’, ‘rversions’ are not available for package ‘devtools’
   > ERROR: dependencies ‘devtools’, ‘usethis’, ‘xml2’ are not available for package ‘vdiffr’

(***) ERRORs on R-release win-builder are due to missing package, upstream issue

   > Error in loadNamespace(name) : there is no package called 'farver'

   'farver' is a dependeny of 'scales' which is a dependency of 'ggplot2' and 
   is available on CRAN https://cran.r-project.org/package=farver

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

None.
