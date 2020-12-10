using Printf
using Test
testData = parse.(Int,readlines("testinput.txt"))
realData = parse.(Int,readlines("input.txt"))
function solve(dataSet)
    data = deepcopy(dataSet)
    data = push!(data, maximum(dataSet)+3)
    data = push!(data,0)
    sort!(data)
    countDict = Dict(data[end] => 1)
    for index in reverse(range(1,stop=length(data)-1))
        currentVal = data[index]
        sum = sumPrevious(countDict,data,index)
        push!(countDict,currentVal => sum)

    end
    return countDict[0]
end
function sumPrevious(countDict, data,index)
    children =filter((x) -> x - data[index] <= 3,data[index+1:end])
    return sum(map((x) -> countDict[x],children))
end

@testset "Test Data" begin
    @test solve(testData) == 19208
end

@printf("Answer: %d",solve(realData))
