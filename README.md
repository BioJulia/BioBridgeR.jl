# BioBridgeR.jl

**Latest release:**

[![Latest Release](https://img.shields.io/github/release/BioJulia/BioBridgeR.jl.svg)](https://github.com/BioJulia/BioBridgeR.jl/releases/latest)
[![BioBridgeR](http://pkg.julialang.org/badges/BioBridgeR_0.6.svg)](http://pkg.julialang.org/?pkg=BioBridgeR)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/BioJulia/BioBridgeR.jl/blob/master/LICENSE)
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://biojulia.github.io/BioBridgeR.jl/stable)
![BioJulia maintainer: Ward9250](https://img.shields.io/badge/BioJulia%20Maintainer-Ward9250-orange.svg)

**Development status:**

[![Build Status](https://travis-ci.org/BioJulia/BioBridgeR.jl.svg?branch=master)](https://travis-ci.org/BioJulia/BioBridgeR.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/4q40ihlvo2b3a53p/branch/master?svg=true)](https://ci.appveyor.com/project/Ward9250/biobridger-jl/branch/master)
[![codecov](https://codecov.io/gh/BioJulia/BioBridgeR.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/BioJulia/BioBridgeR.jl)

## Description

BioBridgeR.jl provides submodules providing compatibility with biology and
bioinformatics R packages by extending [RCall.jl](https://github.com/JuliaInterop/RCall.jl).

Each submodule is dedicated to one R package.
Each submodule allows you to send BioJulia datatypes from a julia session to an
R session, automatically converting them to an object of the relevant class from
that R package.
Conversely, objects of a class defined in the given R package can be transferred
from the R session to a julia session, whilst automatically converting them
to the relevant BioJulia data type.

## Installation

Install BioBridgeR from the Julia REPL:

```julia
julia> Pkg.add("BioBridgeR")
```

If you are interested in the cutting edge of the development, please check out
the master branch to try new features before release.

## Contributing and Questions

We appreciate contributions from users including reporting bugs, fixing issues,
improving performance and adding new features.
Please go to the [contributing section of the documentation](biojulia.github.io/BioBridgeR.jl/stable/contributing)
for more information.

If you have a question about
contributing or using this package, you are encouraged to use the
[Bio category of the Julia discourse
site](https://discourse.julialang.org/c/domain/bio).
