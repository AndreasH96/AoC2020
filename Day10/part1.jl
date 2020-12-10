using Printf
using Test
testData = parse.(Int,readlines("testinput.txt"))
realData = parse.(Int,readlines("input.txt"))
function solve(data)
    deltas = map((x,y) -> y-x,sort(data)[1:end],sort(data)[2:end])
    return (count(x->x==1,deltas) + 1) * (count(x->x==3,deltas) + 1)
end
@testset "Test data" begin
    @test solve(testData) == 220
end

@printf("Answer: %d",solve(realData))
