#標準入力により取得した値までの素数の数を求める問題
# CodeIQ「素数の数を求めてください」（https://codeiq.jp/q/1621）の回答
#「エラトステネスのふるい」を用いて回答

#標準入力１０個分の入力と答えを格納する変数の宣言
ans = Array.new(10, 0)
s = Array.new(10)

#標準入力の取得（１０個）
for i in 0..9 do
    s[i] = gets
end

# 10個分の答えを見つける
for i in 0..9 do
    
    # 標準入力の値を max に代入
    max = s[i].to_i

    #　max の分のリスト（配列）を生成（初期値は　１）
    # 配列の値は max までの整数に対応（１：素数、０：素数でない）
    list = Array.new(max - 1, 1)
    # max の平方根（までの最大の整数値）を計算（探索範囲はそこまで）
    sq = Math.sqrt(max).floor
    
    #リスト, 2 から max の平方根まで探索
    for j in 2..sq do
        
        #リストのある値（max までの整数に対応）が１(＝素数)ならば
        if list[j - 1] == 1
            pow = j * j

            #ある値を２乗した値（pow)から max まで、ある値（素数）の倍数となっている箇所を０に
            while pow < max
                list[pow - 1] = 0
                pow = pow + j
            end
        end
    end

    # 探索終了後、リストの中の１（＝素数）の値をカウント
    for j in 1..(max - 2) do
        if list[j] == 1
            ans[i] += 1
        end
    end

end

#解答を出力
for i in 0..9 do
    puts ans[i].to_s
end