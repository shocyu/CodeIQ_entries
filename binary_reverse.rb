# CodeIQ問題「２進数で左右反転しても同じ？」（https://codeiq.jp/q/1678）の解答（ruby 中級認定問題）

#標準入力を格納する変数の宣言
min = 0
max = 0

#条件にあった数を数える変数
count = 0

#標準入力により値を取得（min と max)
s = gets.chomp.split(",")
min = s[0].to_i
max = s[1].to_i

# min から max まで（両端は含まない）
(min + 1).upto(max - 1) do |i|

  # ２進数に変換して、逆順に（reverse）した結果が同じ場合、count 加算
  if i.to_s(2) == i.to_s(2).reverse
    count += 1
  end
end

# 最後に count の結果を出力
puts count.to_s