//: Playground - noun: a place where people can play
//Env: Xcode 9.3

import UIKit

for index in 1...10 {
    if index % 3 == 0 {    // index是常量
        print(index)
    }
}
//等价于
for case let index in 1...10 where index % 3 == 0{
    print(index)
}


//掷骰子游戏: a和b 掷骰子🎲，谁连续赢3次谁就赢
var aWin = 0
var bWin = 0
var game = 0
while aWin < 3 && bWin < 3 {
    game += 1  // Swift 3.0 将++移除，改为 += 1
    
    let a = arc4random_uniform(6)+1 // 随机0-5 + 1
    let b = arc4random_uniform(6)+1 // 随机0-5 + 1
    print("a is \(a) , b is \(b).",terminator:"")
    
    if a>b{
        print("A win!")
        bWin = 0
        aWin += 1
    }else if a<b{
        print("B win!")
        aWin = 0
        bWin += 1
    }else{
        print("Draw!")
        aWin = 0
        bWin = 0
    }
}
let winner = aWin == 3 ? "A" : "B"
print("After \(game) games,\(winner) win!")



//repeat-while 掷骰子游戏: a和b 掷骰子🎲，谁大谁赢
var aaWin = false
var bbWin = false
repeat {
    let a = arc4random_uniform(6)+1 // 随机0-5 + 1
    let b = arc4random_uniform(6)+1 // 随机0-5 + 1
    print("a is \(a) , b is \(b). ",terminator:"")
    
    if a>b{
        aaWin = true
    }else if a<b{
        bbWin = true
    }else{
        print("Draw",terminator:"")
    }
    print("")
}while !aaWin && !bbWin
let Winner = aaWin ? "A" : "B"
print("\(Winner) win!")


let rating = "A"
switch rating{
    case "a","A":   // 不限于字符串，也可用整型，布尔值，元组等
        print("Great")
    case "b","B":   //对于整型 还可判断区间
        print("Just so-so")
    case "c","C":
        print("Bad")
    default:    // 必须穷举所有值
        break // 或用一个空的括号（）跳出
}


// x^4 - y^2 = 15*x*y
// 取得300以内的一个正整数解
findAnswer:for m in 1...300{
    for n in 1...300{
        if m*m*m*m - n*n == 15*m*n{
            print(m,n)
            break findAnswer
        }
    }
}


let point = (3,-4)
switch point{
case let (x,y) where x == y:
    print("It's on the line x=y!")
case let (x,y) where x == -y:
    print("It's on the line x=-y")
case let (x,y):
    print("The point is ( \(x),\(y) )")
}
//等价于
if case let (x,y) = point, x == y {
    print("It's on the line x=y!")
}else if case let (x,y) = point, x == -y {
    print("It's on the line x=-y!")
}else{
    print("The point is ( \(point.0),\(point.1) )")
}


func buy( money:Int , price: Int , capacity:Int , volume:Int ){
    if money >= price{
        if capacity >= volume {
            print("I can buy it!")
            print("\(money-price)¥ left.")
            print("\(capacity-volume) cubic meters left")
        }else{
            print("Not enough capacity")
        }
    }else{
        print("Not enough money")
    }
}
/* 使用guard关键字 */
func buy2( money:Int , price: Int , capacity:Int , volume:Int ){
    guard money >= price else{
        print("Not enough money")
        return
    }
    guard capacity >= volume else{
        print("Not enough capacity")
        return
    }
    
    print("I can buy it!")
    print("\(money-price)¥ left.")
    print("\(capacity-volume) cubic meters left")
}


var str = String("Hello, swift")    // 结构体方式初始化
str.isEmpty    // false
str.count    // 12
var emptyStr = ""
emptyStr.isEmpty   // true

for c in str {
    print(c)    // H e l l o , _ s w i f t  _为空格
}

let character:Character = "!"  // 注意，单个字符也是使用双引号
str.append(character)   // "Hello, swift!"  添加一个字符
str     // str须为变量，自身也已改变 "Hello, swift!"

let chineseCharacter:Character = "中" // 中
let emoji:Character = "😂"  // 😂
let coolGuy:Character = "\u{1F60E}" // 😎
let cafe = "café"  // café
let cafe2 = "cafe\u{0301}"  // café
cafe == cafe2   // true

let startIndex = str.startIndex  // Index类型： 0
str[startIndex] // "H"  不能直接使用数字
str.index(before: str.endIndex)
str[str.index(startIndex, offsetBy: 4)]   // "o" 往后数4个位置
let endIndex = str.endIndex // 13 获得最后一个索引后的位置
str[str.index(endIndex, offsetBy: -1)] // 获得最后一个索引位置的值："!"
str[str.index(before: endIndex)] // 获得最后一个索引位置的值："!"

let range = startIndex..<str.index(endIndex, offsetBy: -2)
str[range] // "Hello, swif"
str.replaceSubrange(range, with: "Hi") // "Hit!"
str.append(contentsOf: "!!") //  "Hit!!!"
str.insert("?", at: str.endIndex)  // "Hit!!!?"
str.remove(at: str.index(before: str.endIndex)) // str = "Hit!!!"
str.removeSubrange(str.index(str.endIndex, offsetBy: -3)..<str.endIndex) // "Hit"

str.uppercased()  // 所有字母大写:"HIT"
str.lowercased()  // 所有字母小写:"hit"
str.capitalized // 字符串中首字母大写:"Hit"
str.contains("it") // true
str.hasPrefix("HI")  // false
str.hasSuffix("it")  // true

let s = "One third is \(1.0/3)"   // 0.3333333333...
let s2 = NSString(format: "One third is %.2f", 1.0/3.0) // 0.33 NSString类型，等同于 [NSString stringWithFormat:]
s2.substring(from: 4)    // "third is 0.33"
s2.substring(to: 3)    // "One"
s2.substring(with: NSMakeRange(4, 5))    // "third"
let s3: String = NSString(format: "One third is %.2f", 1.0/3.0) as String   // String类型， 使用 as 作强制类型转换

let s4 = "😂😂😂"
let s5:NSString = "😂😂😂"
s4.count // 3 String类型基于Unicode
s5.length   // 6    NSString类型基于ASCII码

let s6 = " ——Hello World—— " as NSString    // " ——Hello World—— "
s6.trimmingCharacters(in: CharacterSet(charactersIn: " ——")) // "Hello World"

        
