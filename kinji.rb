    #連分数展開により、有限小数を分数（分子、分母とも６桁以内）で近似するプログラム
    #CodeIQの問題「小数を分数p/qに近似しよう」（https://codeiq.jp/q/2352)の回答、C++上級取得問題の ruby バージョン
    
    #変数の宣言
    j = 0   
    a = 0.0

    #分子、分母,最初の整数部分,小数部分を格納する変数の宣言
    bunsi = 0
    bunbo = 1
    seisu2 = 0
    syosu = 0.0
    gyaku = 0.0

    #配列の宣言、（２行２列の配列３つ）
    #mat 行列、２行２列目（ mat[3] )に逆数の整数部分を格納、１行２列、２行１列は１（正則連分数）
    mat = [0, 1, 1, 0]
    # ans 行列、解を随時更新（１行２列目（ans[1]）が分母、２行２列目（ans[3]）が分子
    ans = [0, 0, 0, 0]
    # temp行列、連分数展開の行列計算、右辺の左側（すでに計算した部分）
    # temp行列、初期値は単位行列　Ｅ　で
    temp = [1, 0, 0, 1]

    #値（小数）の入力
    a = gets.to_f

    #まず gyaku は最初 a に設定
    gyaku = a
    

    #分母が６桁（７桁より小さい）になるまで連分数分解
    while (bunbo < 1000000) do

        #余った値（小数部分）の逆数を取り、それをさらに整数部分と小数部分に分ける
        seisu2 = gyaku.floor
        syosu = gyaku - seisu2.to_f
        #整数部分は mat[3]に格納（行列計算、右辺の右側＝新しく掛ける方）
        mat[3] = seisu2
        # さらに小数部分の逆数を取る（次の行列計算へ）
        gyaku = 1.0 / syosu

        #ans[] に行列の積（２行２列）を入力
        ans[0] = (temp[0] * mat[0]) + (temp[1] * mat[2])
        ans[1] = (temp[0] * mat[1]) + (temp[1] * mat[3])
        ans[2] = (temp[2] * mat[0]) + (temp[3] * mat[2])
        ans[3] = (temp[2] * mat[1]) + (temp[3] * mat[3])

        # temp 行列更新
        for j in 0..3 do
            temp[j] = ans[j]
        end

        # 分子、分母とも６桁以内ならば値を更新する（それからまた行列計算）
        if ans[1] < 1000000 && ans[3] < 1000000
            bunbo = ans[1]
            bunsi = ans[3]
        else
            break
        end
    end

    #分子、分母を出力
    print bunsi.to_s + " " + bunbo.to_s
    print "\n"