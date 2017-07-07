@testset "APE" begin

    @testset "Conversions" begin

        @testset "From UInt8 to DNAbin" begin
            @test DNAbin(0x88) === DNAbin_A
            @test DNAbin(0x18) === DNAbin_T
            @test DNAbin(0x28) === DNAbin_C
            @test DNAbin(0x48) === DNAbin_G
            @test DNAbin(0xC0) === DNAbin_R
            @test DNAbin(0x30) === DNAbin_Y
            @test DNAbin(0x60) === DNAbin_S
            @test DNAbin(0x90) === DNAbin_W
            @test DNAbin(0x50) === DNAbin_K
            @test DNAbin(0xA0) === DNAbin_M
            @test DNAbin(0x70) === DNAbin_B
            @test DNAbin(0xD0) === DNAbin_D
            @test DNAbin(0xB0) === DNAbin_H
            @test DNAbin(0xE0) === DNAbin_V
            @test DNAbin(0xF0) === DNAbin_N
            @test DNAbin(0x04) === DNAbin_Gap
        end

        @testset "From DNA to DNAbin" begin
            @test DNAbin(DNA_A) === DNAbin_A
            @test DNAbin(DNA_T) === DNAbin_T
            @test DNAbin(DNA_C) === DNAbin_C
            @test DNAbin(DNA_G) === DNAbin_G
            @test DNAbin(DNA_R) === DNAbin_R
            @test DNAbin(DNA_Y) === DNAbin_Y
            @test DNAbin(DNA_S) === DNAbin_S
            @test DNAbin(DNA_W) === DNAbin_W
            @test DNAbin(DNA_K) === DNAbin_K
            @test DNAbin(DNA_M) === DNAbin_M
            @test DNAbin(DNA_B) === DNAbin_B
            @test DNAbin(DNA_D) === DNAbin_D
            @test DNAbin(DNA_H) === DNAbin_H
            @test DNAbin(DNA_V) === DNAbin_V
            @test DNAbin(DNA_N) === DNAbin_N
            @test DNAbin(DNA_Gap) === DNAbin_Gap
        end

        @testset "From DNAbin to DNA" begin
            @test DNA(DNAbin_A) === DNA_A
            @test DNA(DNAbin_T) === DNA_T
            @test DNA(DNAbin_C) === DNA_C
            @test DNA(DNAbin_G) === DNA_G
            @test DNA(DNAbin_R) === DNA_R
            @test DNA(DNAbin_Y) === DNA_Y
            @test DNA(DNAbin_S) === DNA_S
            @test DNA(DNAbin_W) === DNA_W
            @test DNA(DNAbin_K) === DNA_K
            @test DNA(DNAbin_M) === DNA_M
            @test DNA(DNAbin_B) === DNA_B
            @test DNA(DNAbin_D) === DNA_D
            @test DNA(DNAbin_H) === DNA_H
            @test DNA(DNAbin_V) === DNA_V
            @test DNA(DNAbin_N) === DNA_N
            @test DNA(DNAbin_Gap) === DNA_Gap
        end

        @testset "Char" begin
            @testset "DNAbin conversions from Char" begin
                @test convert(DNAbin, 'A') === DNAbin_A
                @test convert(DNAbin, 'C') === DNAbin_C
                @test convert(DNAbin, 'G') === DNAbin_G
                @test convert(DNAbin, 'T') === DNAbin_T
                @test convert(DNAbin, 'N') === DNAbin_N
                @test_throws InexactError convert(DNAbin, 'Z')
                @test_throws InexactError convert(DNAbin, '核')
            end

            @testset "DNAbin conversions to Char" begin
                @test convert(Char, DNAbin_A) == 'A'
                @test convert(Char, DNAbin_C) == 'C'
                @test convert(Char, DNAbin_G) == 'G'
                @test convert(Char, DNAbin_T) == 'T'
                @test convert(Char, DNAbin_N) == 'N'
            end
        end

    end

    @testset "iscompatible" begin
        @test  iscompatible(DNAbin_A, DNAbin_A)
        @test  iscompatible(DNAbin_A, DNAbin_R)
        @test !iscompatible(DNAbin_C, DNAbin_A)
        @test !iscompatible(DNAbin_C, DNAbin_R)

        for x ∈ alphabet(DNAbin)
            @test iscompatible(x, DNAbin_N) == (x != DNAbin_Gap)
            @test iscompatible(DNAbin_N, x) == (x != DNAbin_Gap)
        end
    end

    @testset "isambiguous" begin
        for nt ∈ alphabet(DNAbin)
            @test isambiguous(nt) == (nt ∉ (DNAbin_A, DNAbin_C, DNAbin_G, DNAbin_T, DNAbin_Gap))
        end
    end

    @testset "isGC" begin
        for nt ∈ alphabet(DNAbin)
            @test isGC(nt) == (nt ∈ (DNAbin_G, DNAbin_C, DNAbin_S))
        end
    end

    @testset "ispurine" begin
        for nt ∈ alphabet(DNAbin)
            @test ispurine(nt) == (nt == DNAbin_A || nt == DNAbin_G || nt == DNAbin_R)
        end
    end

    @testset "ispyrimidine" begin
        for nt ∈ alphabet(DNAbin)
            @test ispyrimidine(nt) == (nt == DNAbin_T || nt == DNAbin_C || nt == DNAbin_Y)
        end
    end

    @testset "iscertain" begin
        for nt ∈ alphabet(DNAbin)
            @test iscertain(nt) == (nt ∈ (DNAbin_A, DNAbin_G, DNAbin_T, DNAbin_C,))
        end
    end

    @testset "isgap" begin
        for nt ∈ alphabet(DNAbin)
            @test isgap(nt) == (nt === gap(DNAbin))
        end
    end

    @testset "complement" begin
        @test complement(DNAbin_A) === DNAbin_T
        @test complement(DNAbin_C) === DNAbin_G
        @test complement(DNAbin_G) === DNAbin_C
        @test complement(DNAbin_T) === DNAbin_A
        @test complement(DNAbin_Gap) === DNAbin_Gap
        @test complement(DNAbin_N) === DNAbin_N
    end

    @testset "show" begin
        buf = IOBuffer()
        for nt ∈ [DNAbin_A, DNAbin_C, DNAbin_G, DNAbin_T, DNAbin_N, DNAbin_Gap]
            show(buf, nt)
            write(buf, ' ')
        end
        @test String(take!(buf)) == "DNAbin_A DNAbin_C DNAbin_G DNAbin_T DNAbin_N DNAbin_Gap "
    end

    @testset "Data transfer" begin
        rseq = R"""
        library(ape)
        a <- as.DNAbin(
            matrix(
                c('a', 't', 'c', 'g', 'a', 't', 'c', 'g', '-', 't', 'c', 'm'),
                nrow = 3
            )
        )
        """
        dba = [DNAbin_A  DNAbin_G  DNAbin_C    DNAbin_T
               DNAbin_T  DNAbin_A  DNAbin_G    DNAbin_C
               DNAbin_C  DNAbin_T  DNAbin_Gap  DNAbin_M]
        bjdba = [DNA_A  DNA_G  DNA_C    DNA_T
                 DNA_T  DNA_A  DNA_G    DNA_C
                 DNA_C  DNA_T  DNA_Gap  DNA_M]
        vs = DNASequence[dna"AGCT", dna"TAGC", dna"CT-M"]
        @test rcopy(Array{DNAbin, 2}, rseq) == dba
        @test rcopy(Vector{DNASequence}, rseq) == vs
        @test rcopy(Array{DNA, 2}, rseq) == bjdba
        @test all(i == j for (i, j) ∈ zip(rseq, RObject(RCall.sexp(RCall.RawSxp, dba))))
        @test all(i == j for (i, j) ∈ zip(rseq, RObject(RCall.sexp(RCall.RawSxp, vs))))
    end

end
