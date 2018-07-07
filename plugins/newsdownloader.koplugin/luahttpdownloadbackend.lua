local logger = require("logger")
--local http_request = require "http.request"
local hc = require('httpclient').new()


-- Currently unused. TODO @mwoz123 ADD LUA-HTTP AS LIBRARY
local LuaHttpDownloadBackend = {}
 
function LuaHttpDownloadBackend:getResponseAsString(url)
   local res = hc:get(url)
  -- local _, stream = assert(http_request.new_from_uri(url):go())
   --local body = assert(stream:get_body_as_string())
   if res.err then
       logger.dbg("AAAAAAAAAAAAAAAAAAA :", res)
   end
   return res.body
end

function LuaHttpDownloadBackend:download(link, path)
   --local x = http_request.new_from_uri(link):go();
   local res = hc:get(link)
    if rep.err then
        logger.dbg("BBBBBBBBBBB", res)
    end
   local _, stream = assert(res.body)
   stream:save_body_to_file(path)
   stream:shutdown()
end

return LuaHttpDownloadBackend
