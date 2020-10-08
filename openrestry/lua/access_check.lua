local json = require "cjson.safe"
local json_decode = json.decode

ngx.req.read_body()
local data = ngx.req.get_body_data()

local json_data = json_decode(data)

--- 后续使用
ngx.ctx.json_data = json_data

if not json_data then
    ngx.exit(ngx.HTTP_BAD_REQUEST)
end

if ngx.var.path == "register" or ngx.var.path == "signin" then
    return
end


local user_id = json_data["user_id"]
local tokens = ngx.shared.tokens
local token, _ = tokens:get(user_id)
if token == nil or token ~= json_data["token"] then
    ngx.exit(ngx.HTTP_UNAUTHORIZED)
end
