# multinma

<details>

* Version: 0.7.2
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2024-09-16 12:20:02 UTC
* Number of recursive dependencies: 152

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## In both

*   checking whether package ‘multinma’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/multinma/new/multinma.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"../inst/include" -I"/opt/R/4.4.0/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/opt/R/4.4.0/lib/R/site-library/BH/include' -I'/opt/R/4.4.0/lib/R/site-library/Rcpp/include' -I'/opt/R/4.4.0/lib/R/site-library/RcppEigen/include' -I'/opt/R/4.4.0/lib/R/site-library/RcppParallel/include' -I'/opt/R/4.4.0/lib/R/site-library/rstan/include' -I'/opt/R/4.4.0/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/opt/R/4.4.0/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from /opt/R/4.4.0/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
/opt/R/4.4.0/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.4.0/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.4.0/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.4.0/lib/R/etc/Makeconf:202: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/new/multinma.Rcheck/multinma’


```
### CRAN

```
* installing *source* package ‘multinma’ ...
** package ‘multinma’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0’
using C++17


g++ -std=gnu++17 -I"/opt/R/4.4.0/lib/R/include" -DNDEBUG -I"../inst/include" -I"/opt/R/4.4.0/lib/R/site-library/StanHeaders/include/src" -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -DUSE_STANC3 -D_HAS_AUTO_PTR_ETC=0 -I'/opt/R/4.4.0/lib/R/site-library/BH/include' -I'/opt/R/4.4.0/lib/R/site-library/Rcpp/include' -I'/opt/R/4.4.0/lib/R/site-library/RcppEigen/include' -I'/opt/R/4.4.0/lib/R/site-library/RcppParallel/include' -I'/opt/R/4.4.0/lib/R/site-library/rstan/include' -I'/opt/R/4.4.0/lib/R/site-library/StanHeaders/include' -I/usr/local/include    -I'/opt/R/4.4.0/lib/R/site-library/RcppParallel/include' -D_REENTRANT -DSTAN_THREADS   -fpic  -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from /opt/R/4.4.0/lib/R/site-library/RcppEigen/include/Eigen/Core:205,
...
/opt/R/4.4.0/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:22:56:   required from ‘double stan::mcmc::dense_e_metric<Model, BaseRNG>::T(stan::mcmc::dense_e_point&) [with Model = model_survival_param_namespace::model_survival_param; BaseRNG = boost::random::additive_combine_engine<boost::random::linear_congruential_engine<unsigned int, 40014, 0, 2147483563>, boost::random::linear_congruential_engine<unsigned int, 40692, 0, 2147483399> >]’
/opt/R/4.4.0/lib/R/site-library/StanHeaders/include/src/stan/mcmc/hmc/hamiltonians/dense_e_metric.hpp:21:10:   required from here
/opt/R/4.4.0/lib/R/site-library/RcppEigen/include/Eigen/src/Core/DenseCoeffsBase.h:654:74: warning: ignoring attributes on template argument ‘Eigen::internal::packet_traits<double>::type’ {aka ‘__m128d’} [-Wignored-attributes]
  654 |   return internal::first_aligned<int(unpacket_traits<DefaultPacketType>::alignment),Derived>(m);
      |                                                                          ^~~~~~~~~
g++: fatal error: Killed signal terminated program cc1plus
compilation terminated.
make: *** [/opt/R/4.4.0/lib/R/etc/Makeconf:202: stanExports_survival_param.o] Error 1
ERROR: compilation failed for package ‘multinma’
* removing ‘/tmp/workdir/multinma/old/multinma.Rcheck/multinma’


```
# params

<details>

* Version: 0.7.3
* GitHub: https://github.com/sahilseth/params
* Source code: https://github.com/cran/params
* Date/Publication: 2021-03-01 20:00:06 UTC
* Number of recursive dependencies: 53

Run `revdepcheck::cloud_details(, "params")` for more info

</details>

## Newly broken

*   checking whether package ‘params’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/params/new/params.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘params’ ...
** package ‘params’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
Error: package or namespace load failed for ‘params’:
 .onLoad failed in loadNamespace() for 'params', details:
  call: glue_data(.x = NULL, ..., .sep = .sep, .envir = .envir, .open = .open, 
  error: is.environment(.envir) is not TRUE
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/tmp/workdir/params/new/params.Rcheck/params’


```
### CRAN

```
* installing *source* package ‘params’ ...
** package ‘params’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (params)


```
# TriDimRegression

<details>

* Version: 1.0.2
* GitHub: https://github.com/alexander-pastukhov/tridim-regression
* Source code: https://github.com/cran/TriDimRegression
* Date/Publication: 2023-09-13 14:10:03 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "TriDimRegression")` for more info

</details>

## In both

*   checking whether package ‘TriDimRegression’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/TriDimRegression/new/TriDimRegression.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘TriDimRegression’ ...
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/new/TriDimRegression.Rcheck/TriDimRegression’


```
### CRAN

```
* installing *source* package ‘TriDimRegression’ ...
** package ‘TriDimRegression’ successfully unpacked and MD5 sums checked
** using staged installation
Error in loadNamespace(x) : there is no package called ‘rstantools’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: configuration failed for package ‘TriDimRegression’
* removing ‘/tmp/workdir/TriDimRegression/old/TriDimRegression.Rcheck/TriDimRegression’


```
