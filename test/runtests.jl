# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/FEMBase.jl/blob/master/LICENSE

using Base.Test
using TimerOutputs
const to = TimerOutput()

test_files = String[]
push!(test_files, "test_assembly.jl")
push!(test_files, "test_elements.jl")
push!(test_files, "test_fields.jl")
push!(test_files, "test_integrate.jl")
push!(test_files, "test_problems.jl")
push!(test_files, "test_sparse.jl")
push!(test_files, "test_solvers.jl")
push!(test_files, "test_analysis.jl")
push!(test_files, "test_test.jl")
push!(test_files, "test_types.jl")

@testset "FEMBase.jl" begin
    for fn in test_files
        timeit(to, fn) do
            include(fn)
        end
    end
end
println()
println("Test statistics:")
println(to)
