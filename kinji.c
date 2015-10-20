// CodeIQ 'Approximate the decimal by common fraction' test code

//連分数展開により、有限小数を分数（分子、分母とも６桁以内）で近似するプログラム
//CodeIQの問題「小数を分数p/qに近似しよう」（https://codeiq.jp/q/2352)の回答、CodeIQ, C++上級取得問題

#define _CRT_SECURE_NO_WARNINGS
#include "stdio.h"
#include "math.h"
int main(int argc, char* argv[])
{
    // Please approximate the decimal by common fraction.
    // Digit of numerator and denominator must be less than or equal to 6.
    // 小数を分数で近似しましょう。ただし分子と分母とはいずれも自然数であり、6桁以下とします
    // Fix this numerator and denominator to minimize approximation error.
    // 以下の分子と分母を、なるべく近似誤差が小さくなるように、値を求め直してください。

    //変数の宣言
    int j = 0;    
    double a = 0.0;

    //分子、分母,最初の整数部分,小数部分を格納する変数の宣言
    int bunsi = 0;
    int bunbo = 1;
    double seisu2 = 0.0;
    double syosu = 0.0;
    double gyaku = 0.0;

    //配列の宣言、（２行２列の配列３つ）
    //mat 行列、２行２列目（ mat[3] )に逆数の整数部分を格納、１行２列、２行１列は１（正則連分数）
    double mat[4] = {0.0, 1.0, 1.0, 0.0};
    // ans 行列、解を随時更新（１行２列目（ans[1]）が分母、２行２列目（ans[3]）が分子
    double ans[4]= {0.0, 0.0, 0.0, 0.0};
    // temp行列、連分数展開の行列計算、右辺の左側（すでに計算した部分）
    // temp行列、初期値は単位行列　Ｅ　で
    double temp[4] = {1.0, 0.0, 0.0, 1.0};

    //値（小数）の入力
    scanf("%lf", &a);

    //まず gyaku は最初 a に設定
    gyaku = a;
    

    //分母が６桁（７桁より小さい）になるまで連分数展開
    while (bunbo < 1000000){

        //余った値（小数部分）の逆数を取り、それをさらに整数部分と小数部分に分ける
        syosu = modf(gyaku, &seisu2);
        //整数部分は mat[3]に格納（行列計算、右辺の右側＝新しく掛ける方）
        mat[3] = seisu2;
        // さらに小数部分の逆数を取る（次の行列計算へ）
        gyaku = 1.0 / syosu;

        //ans[] に行列の積（２行２列）を入力
        ans[0] = (temp[0] * mat[0]) + (temp[1] * mat[2]);
        ans[1] = (temp[0] * mat[1]) + (temp[1] * mat[3]);
        ans[2] = (temp[2] * mat[0]) + (temp[3] * mat[2]);
        ans[3] = (temp[2] * mat[1]) + (temp[3] * mat[3]);

        // temp 行列更新
        for (j = 0; j < 4; j++){
            temp[j] = ans[j];
        }

        // 分子、分母とも６桁以内ならば値を更新する（それからまた行列計算）
        if (ans[1] < 1000000 && ans[3] < 1000000) {
            bunbo = (int)ans[1];
            bunsi = (int)ans[3];
        }
        else {
            break;
        }
    }
    //分子、分母を出力
    printf("%d %d\n", bunsi, bunbo);
    
    return 0;
}