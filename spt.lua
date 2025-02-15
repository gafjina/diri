local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("dkjson")

bot = getBot()
spam = getBot().auto_spam

local url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyC5o1bg9bACrpah5wLMFfxhePu5uHGfvSk"
local headers = {
    ["Content-Type"] = "application/json"
}
local body = json.encode({
    contents = {{
        parts = {{
            text = "Buat kalimat random-serandomnya dalam bahasa inggris apa saja yang tidak toxic dan pastikan maksimal adalah 50 karakter. Langsung jawab dan tanpa pakai penjelasan apapun seperti \"berikut ini blabla\", jadi langsung jawab saja. Beri aku 15 hasil berupa json dan tanpa harus memakai formatting ``` segala atau tanda newline segala."
        }}
    }}
})

local response_body = {}
local res, code, response_headers = http.request{
    url = url,
    method = "POST",
    headers = headers,
    source = ltn12.source.string(body),
    sink = ltn12.sink.table(response_body)
}

if code == 200 then
    local response_json = table.concat(response_body)
    local response_data = json.decode(response_json)
    local sentences = json.decode(response_data.candidates[1].content.parts[1].text)

    for i, sentence in ipairs(sentences) do
        spam:setText(i - 1, sentence.sentence)
    end
else
    print("HTTP request failed with code: " .. code)
end