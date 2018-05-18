//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// var 変数名: 型 = 式
// let 変数名: 型 = 式

var str1: String = "本が1冊有ります"
str1 = "本が2冊あります"

let str2: String = "本を買いました"
//str2 = "本を売りました"  // error (Cannot assign to value: 'str2' is a 'let' constant)

// 数の書換え
var book = 5             // 本の数
var men = 10             // 人の数
var piano = 5            // ピアノの数

// \(変数)を利用
var str3 = "there are \(book) books and \(men) men and \(piano) pianos."

// タプル(複数の値を１つにまとめる事が出来る)
// var 変数名 : (変数名1: 型名1, 変数名2: 型名2, ......, 変数名n: 型名n)     // 型を指定したタプルを持つ変数を宣言する
// var(let) 変数名 = (値1, 値2, 値3, ......, 値n)

var val1 : (book: Int, name: String)
val1.book = 5
val1.name = "Swift"
print(val1)

var val2 = (5, 10, 20, 30, 99, ("book", 44))
print(val2.0, val2.4, val2.5.0)

// Optional
// Swiftでは変数作成時にnilを指定する事は許可されていない為、
// nilを代入可能にするにはOptional型を利用する必要がある
// if文中でnilではない事を判定することでアンラップ出来る
// nilではない事を判定するにはラップされている変数をletで宣言した変数に代入し、if文で真かどうか判定する

var val3_1: String // nilを代入することが出来ない
var val3: String? // ラップしたのでnilを代入する事が出来る
val3 = "book"
//print(val3)
if let val4 = val3 {    //アンラップした後の変数名とアンラップ前の変数名は同じにする事が勧められている
    print(val4)
} else {
    print("not unwrapped")
}

var val5: String?
if let unwrappedVal5 = val5 {
    print(unwrappedVal5)
} else {
    print("not unwrapped")
}

// 強制アンラップ
var val6: Int! = 7
10 + val6


// 関数
// 同じ処理を一つにまとめてくれる機能
// 戻り値の型を指定しない時は省略することが出来る

// 戻り値付きの関数
func myFunc(val7: Int) -> Int {
    var resultVal7:Int = 10
    resultVal7 += 20
    return resultVal7
}

// guardを使う
// if文でnilチェックする場合はnilチェック後にOptional変数をアンラップしないといけないが、
// guardを使用するとnilチェックとアンラップを同時に行うことが出来る
// guard文を抜けた後でも使うことが出来る

func useGuard(val8: String?) {
    val8 == "Books"
    // val8がnilならreturnする(アンラップ出来ていなければnilが返される)
    guard let unwrappedVal8 = val8 else {
        return
    }
    print(unwrappedVal8)
}

// クラスのインスタンス化
// var インスタンス名 = クラス名()

// UISwitchクラスのインスタンス化
var radio = UISwitch()
// プロパティの設定
// インスタンス名.プロパティ名 = 値
radio.isOn = true

// メソッドによるプロパティの設定
// インスタンス名.メソッド名(設定値)
// メソッド名は set + プロパティ名
radio.setOn(false, animated: true)


// 独自クラスの作成
//class クラス名{プロパティ、メソッドを記述する}
class Dog {
    var  name = "" //プロパティ
    // 吠えると言うメソッドをクラス内に定義する
    func bark() {
        print("wan wan")
    }
}

var dog = Dog() //instance化
dog.name = "cute" // 犬の名前を付ける
dog.bark()        // 吠える


// 配列の利用
// 複数の値を保持することが出来る
// var 変数名: [型] = [値]    // ミュータブル（可変）な配列
// let 変数名: [型] = [値]    // イミュータブル（不変）な配列

// ミュータブルな配列
var array1: [String] = [String]()   // 要素を指定せずに配列のインスタンスのみを宣言する場合は[型名]()で宣言を行う
array1.append("apple")              // 要素の追加にはappend関数の引数に入れる
array1.append("banana")             // 要素の追加

// イミュータブルな配列
//let array2: [String] = [String]()
//array2.append("cat")               // 不変の為追加出来ない
let array3:[String] = ["apple", "banana"]

// 配列名[添字]で参照できるようになる
let array4 = ["apple", "banana", "egg"]
let first = array4[0]
let second = array4[1]
let third = array4[2]



// 辞書（キー（key)と値（value)をセットで格納する）
// ミュータブルな配列の辞書
// var 変数名: [型] = [キー:値]

// イミュータブルな配列の辞書
// let 変数名: [型] = [キー:値]

var dict1:[String:String] = [String:String]()    // インスタンスのみを宣言する
dict1["apple"] = "1"
dict1["banana"] = "3"

let dict2:[String:String] = ["apple":"1", "banana":"3"]




// まとめ
// 動物(animal)クラスを作る
// 動物の種類プロパティ、数
// 動物が鳴くメソッド

class Animal {
    let animalTypeAndValue: [String:Int] = ["Dog":45, "Cat":12, "Pig":9, "Cow":5]
    func cry() {
        var cryBoice = ["wanwan", "nya nya", "boo boo", "mow mow"]
        print("Dogは\(cryBoice[0])と鳴く")
        print("Catは\(cryBoice[1])と鳴く")
        print("Pigは\(cryBoice[2])と鳴く")
        print("Cowは\(cryBoice[3])と鳴く")
//        guard let unwrappedAnimalCry = animalCry else {        // メソッドの戻り値がオプショナルを返さない仕様なのが原因でエラーになるらしい
//            return
//        }
    }
}

var HouseAnimal = Animal()

var strFirst: Int? = HouseAnimal.animalTypeAndValue["Dog"]
var strSecond: Int? = HouseAnimal.animalTypeAndValue["Cat"]
var strThird: Int? = HouseAnimal.animalTypeAndValue["Pig"]
var strFourth: Int? = HouseAnimal.animalTypeAndValue["Cow"]

if let firstAnimal = strFirst {
    print("Dogは\(firstAnimal)匹います。")
}
if let secondAnimal = strSecond {
    print("Catは\(secondAnimal)匹います。")
}
if let thirdAnimal = strThird {
    print("Pigは\(thirdAnimal)匹います。")
}
if let fourthAnimal = strFourth {
    print("Cowは\(fourthAnimal)匹います。")
}











