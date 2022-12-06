function checkDupes(str)
    local chars = {}
    for i = 1, #str do
        local c = string.sub(str, i, i)
        if chars[c] ~= nil then
            return chars[c]
        end
        chars[c] = i
    end
    return nil
end

local file = io.open("input.txt","rb")
if file == nil then
    error("Couldnt open file")
end
local input = file.read(file, "*a")
file.close(file)
local i = 14
for _ = 14, #input do
    local c = string.sub(input, i-13, i)
    if checkDupes(c) == nil then print(i); break
    else i = i + checkDupes(c) end
end