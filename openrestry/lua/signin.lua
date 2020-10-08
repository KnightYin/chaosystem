local json_encode = require "cjson.safe.encode"

local users_table = ngx.shared.users
local tokens = ngx.shared.tokens
local json_data = ngx.ctx.json_data

local user_id = json_data["user_id"]
local password = json_data["password"]

if user_id == nil or password == nil then
    ngx.exit(ngx.HTTP_BAD_REQUEST)
end

local user_info, _ = users_table:get(user_id)

if user_info == nil then
    ngx.say(json_encode({code=400, msg="用户名未注册."}))
    return
end

local salt = "abcd"
local password = ngx.md5(password .. salt)

if password == user_info["password"] then
    local token = ngx.md5(password .. ngx.time())
    tokens:set(user_id, token)
    ngx.say(json_encode({code=200, msg="登录成功.", token=token}))
else
    ngx.say(json_encode({code=400, msg="密码错误."}))
end
