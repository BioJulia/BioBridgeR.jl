using Documenter, BioSequences

makedocs()
deploydocs(
    deps = Deps.pip("mkdocs", "pygments", "mkdocs-material"),
    repo = "github.com/BioJulia/BioBridgeR.jl.git",
    julia = "0.6",
    osname = "linux",
)
