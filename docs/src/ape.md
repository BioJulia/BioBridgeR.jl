```@meta
DocTestSetup = quote
    using BioSymbols, RCall, BioBridgeR.APE
end
```

# Submodule: APE

The APE submodule provides compatibility with the R package called
[APE](http://ape-package.ird.fr/).

APE is an R package for phylogenetic and evolutionary analyses.

Currently compatibility with the following R classes is provided:

## DNAbin

APE provides a `DNAbin` class which represents DNA sequences using a byte per
nucleotide, with a specific binary encoding.
We currently provide support for the matrix form of `DNAbin`.

The `BioBridgeR.APE` provides a bitstype of `DNAbin` which inherits from the
abstract type `NucleicAcid` from [BioSymbols.jl](https://github.com/BioJulia/BioSymbols.jl).
`BioBridgeR.APE.DNAbin` variables then can be created and used to represent
nucleic acid data, just as you can with the `DNA` and `RNA` defined in BioSymbols.jl.
They work with the methods defined in BioSymbols.jl:

```@repl ex1
using BioSequences, RCall, BioBridgeR.APE
ispurine(DNAbin_A)
complement(DNAbin_G)
```  

`DNAbin` symbols can also be created from text and converted to text just as `DNA`
and `RNA` symbols can be.

```@repl ex1
DNAbin('t')
Char(DNAbin_Gap)
```

`DNAbin` symbols can also be created from text and converted to text just as `DNA`
and `RNA` symbols can be.

```@repl ex1
DNAbin(DNA_N)
DNA(DNA_R)
```

DNA sequences in R, represented as a `DNAbin` object can be transferred into
a julia as an `Array{DNAbin,2}`, or (by default) as a
`BioSequence{DNAAlphabet{4}}` type as defined in
[BioSequences.jl](https://github.com/BioJulia/BioSequences.jl):

```@repl ex1
R"""
library(ape)
data(woodmouse)
"""

@rget woodmouse::Array{DNAbin,2}

@rget woodmouse
```

Conversely, `Array{DNAbin, 2}` and `BioSequence{DNAAlphabet{4}}` variables
can be transferred over from the julia session to the R session as a `DNAbin`
object. Note that currently you have to explicitly specify that it must be
converted to a `RawSxp` (the structure R uses to store binary data as `DNAbin`
does, indeed `DNAbin` variables are arrays of bytes with specific behaviour).

```@repl ex1
sequences = DNASequence[dna"AAAAA", dna"TTTTT", dna"CCCCC", dna"GGGGG"]

@rput sequences::RawSxp

R"sequences"
```
