# BioBridgeR.APE
# ==============
#
# A module providing types and methods allowing compatiblity between BioJulia
# types and the classes of the APE package in R. This allows transfer of data
# between R (APE) and Julia (BioJulia) with the RCall.jl package.
#
# This file is a part of the BioJulia ecosystem.
# License is MIT: https://github.com/BioJulia/BioBridgeR.jl/blob/master/LICENSE.md

__precompile__()

module APE

export
    # Types
    DNAbin,
    # Constants
    DNAbin_A,
    DNAbin_C,
    DNAbin_G,
    DNAbin_T,
    DNAbin_M,
    DNAbin_R,
    DNAbin_W,
    DNAbin_S,
    DNAbin_Y,
    DNAbin_K,
    DNAbin_V,
    DNAbin_H,
    DNAbin_D,
    DNAbin_B,
    DNAbin_N,
    DNAbin_Gap

using BioSymbols: DNA, iscertain, isgap
import BioSymbols: BioSymbols, NucleicAcid
using BioSequences: BioSequence, DNASequence, DNAAlphabet
using Twiddle: swapbits
using RCall: RawSxp, RClass, protect, unprotect, isObject, isS4, rcall_p, allocArray, setclass!, unsafe_array
import RCall: rcopy, rcopytype, sexp

include("dnabin.jl")

end # Module BioBridgeR.jl APE
