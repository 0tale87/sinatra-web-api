require 'sinatra'
require 'json'
require "date"

nowtime=DateTime.now

# GET /show
# (HTTPのGETメソッドで /show というパスにリクエストを送る）
get '/show' do
  # Rubyのハッシュを作成、diaryという名前を付ける
  if 0  <= nowtime.hour and nowtime.hour < 6 then
    talk = {talk:"おやすみなさい"}

  elsif 6 <= nowtime.hour and nowtime.hour < 10 then
    talk = {talk:"おはようございます"}

  elsif 10 <= nowtime.hour and nowtime.hour <19 then
    talk = {talk:"こんにちは"}

  else
    talk = {talk:"こんばんは"}

  end
  # diaryをJSONテキストに変換して返す
  # （Rubyでは、最終行はメソッドの返り値(return)）
  talk.to_json

#  param1 = params['param1']
#  param2 = params['param2']

#  '1番目: ' + param1 + ', 2番目: ' + param2   # レスポンスを返す
end

# POST /edit
# (HTTPのPOSTメソッドで /edit というパスにリクエストを送る）
# 要・リクエストボディ（パラメータを渡す必要がある）

post '/edit' do
  # リクエストボディを読み込む
  body = request.body.read.force_encoding("utf-8")

  if body == ''
    # HTTPのステータスコード「400」（Bad Request）を返す
    # （400は「クライアント側のリクエストが間違っている」という意味）
    status 400
  else
    # 送られてきたbodyを、そのままJSONテキストとして返す
    body.to_json
  end
end
