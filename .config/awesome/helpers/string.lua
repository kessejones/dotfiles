local M = {}

M.pad_left = function(str, len, char)
    str = tostring(str)
    char = char or " "
    return string.rep(char, len - #str) .. str
end

M.pad_right = function(str, len, char)
    str = tostring(str)
    char = char or " "
    return str .. string.rep(char, len - #str)
end

return M
