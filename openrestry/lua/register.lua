local json_encode = require("cjson.safe").encode

local users_table = ngx.shared.users
local json_data = ngx.ctx.json_data

local user_id = json_data["user_id"]
local password = json_data["password"]

if user_id == nil or password == nil then
    ngx.exit(ngx.HTTP_BAD_REQUEST)
end

local user_info, _ = users_table:get(user_id)

if user_info ~= nil then
    ngx.say(json_encode({code=400, msg="用户名已经注册."}))
    return
end

local salt = "abcd"

local succ, err, forcible = users_table:set(user_id, ngx.md5(user_id .. password .. salt), 3600)

if succ then
    ngx.say(json_encode({code=200, msg="注册成功."}))
    return
else
    ngx.say(json_encode({code=500, msg="注册失败. " .. err}))
    return
end
