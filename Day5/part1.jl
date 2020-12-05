import Printf
function extractPosition(boardingPass)
    possibleRows = [0:1:127;]
    possibleColumns = [0:1:8;]
    for character in boardingPass[1:7]
        middleRow = Int(floor(length(possibleRows)/2))
        #Split to lower part if 'F' and upper half if 'B'
        possibleRows = character == 'F' ? possibleRows[1:middleRow] : possibleRows[middleRow+1:length(possibleRows)]
    end
    for character in boardingPass[8:10]
        middleCol = Int(floor(length(possibleColumns)/2))
        #Split to lower part if 'L' and upper half if 'R'
        possibleColumns = character == 'L' ? possibleColumns[1:middleCol] : possibleColumns[middleCol+1:length(possibleColumns)]
    end
    return possibleRows[1],possibleColumns[1]
end
data = readlines(open("input.txt","r"))
highestID = 0
for line in data
    row,col = extractPosition(line)
    id = row * 8 + col
    if id >  highestID
        global highestID = id
    end
end
print(highestID)
