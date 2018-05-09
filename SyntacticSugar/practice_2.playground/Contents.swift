//: Playground - noun: a place where people can play
// Env: Xcode 9.3

import UIKit

//var errorCode:String = nil //错误
var errorCode:String? = "404"  // String的可选型,必须显式的声明类型,使用时最好用变量声明
var color:UIColor? = nil  // color要么是颜色，要么是nil
print(errorCode ?? "404")  // Optional("404")

//Unwrap ！解包
if errorCode != nil{
    "The errorCode is " + errorCode! // "The errorCode is 404"
    // 必须使用！ 表示errorCode一定有值, 如果errorCode为nil，使用强制解包会crash
}else{
    "No error"
}

var errorMessage:String? = "Not Found"
if let errorCode = errorCode ,
   let errorMessage = errorMessage, errorCode == "404"{
    "The errorCode is " + errorCode + "\nThe errorMessage is " + errorMessage   // 可使用 同名的变量强制解包，仅在花括号内有效
    // "The errorCode is 404"
    // "The errorMessage is Not Found"
}

// Optional Chaining
if let errorMessage = errorMessage {
    errorMessage.uppercased()    // "NOT FOUND"
}
// 等价于
errorMessage?.uppercased()   // 尝试解包，成功后调用.uppercaseString,否则终止
var uppercaseErrorMessage = errorMessage?.uppercased() // uppercaseErrorMessage是String?

let message: String
if let errorMessage = errorMessage{
    message = errorMessage
}else{
    message = "No error"
}
//等价于 使用三目运算符
let message2 = errorMessage != nil ? errorMessage:"No error"
//等价于 直接写两个问号
let message3 = errorMessage ?? "No error"



var error1: (errorCode:Int , errorMessage:String?)? = ( 404, "Not Found")
error1 = nil    // error1是可选型
//error1?.errorCode = 0   // 错误，error1的分量errorCode不是可选型
error1?.errorMessage = nil


var ageInput:String = "zk"
var age = Int (ageInput)    // nil  age类型是Int？
var greetings = "Hello"
greetings.range(of: "He")   // 0..<2
greetings.range(of: "he")   //  nil



var emoji:String! = nil
emoji = "😂"
"Send a emoji " + emoji    // "Send a emoji 😂"
// 对于隐式可选型,实际使用时不需要加！ 但一旦值检测到为nil 就是进程崩坏
// 可用于在类创建的时候,确保对象存在，然后构造函数对其初始化




var numbers:[Int] = [0,1,2,3,4,5]    // 所有数据类型必须一致
var numberss:Array<Int> = []   // 使用 泛型
var numbersss = [Int]()
var numberssss = Array<Int>()   // 调用构造函数

var allZeros = [Int](repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

numbersss.isEmpty   // true
numbers.first   // 0
numbers.min()    // 获得最小值 0
numbers.max()    // 获得最大值，可选型，找不到则返回 nil
numbers[2...4]    // [2,3,4]  返回子数组
numbers.contains(6)    // false
numbers.index(of: 3)     // 3

for _ in 0..<numbers.count{}
for _ in numbers{}
for (i,number) in numbers.enumerated(){
    print("\(i): \(number)")    // 遍历元素及对应的索引
}

var nums = [0,1,2,3,4,5]
numbers == nums // true  数组可以比较，比较的是值


var swifts = ["Swift1.0" , "Swift2.0" , "Swift3.0"]
swifts.append("Swift3.1")   // 增加到末尾
swifts += ["Swift3.2"]  // 先将两个数组相加，再赋值
swifts.insert("Swift2.1", at: 2)

swifts.removeLast() // 移除最后一个元素
swifts.removeFirst()
//swifts.removeAll()
//swifts.removeAtIndex(4) //数组越界

swifts[1] = "Swift2.1.1"
swifts[2..<swifts.count] = ["Swift3"]   // ["Swift2.0", "Swift2.1.1", "Swift3"]



var board: [Array<Int>] = [
    [1024,16,2,0],
    [256,4,2,0],
    [64,2,0,0],
    [2,0,0,0]
]
board.count    // 4
board[1].count  // 4
// 用法与C和C++不同的是 每一行的长度可以是不同的
board[0].append(0)
board.append([0,0,0,0])
board += [[0,0,0,0]]



var dict:[String:String] = ["swift":"雨燕;快速" , "python":"大蟒" , "java":"爪洼岛（印尼）" , "groovy":"绝妙的,时髦的"]
var emptyDict2:Dictionary<String,Int> = [:]
var emptyDict3 = [String:Int]()
var emptyDict4 = Dictionary<String,Int>()

dict["swift"]   // "雨燕;快速"  返回结果是可选型，需解包

Array(dict.keys)    // 将LazyMapCollection强转为Array
Array(dict.values)

for (key,value) in dict{
    print("\(key):\(value)")
}

// 字典也能像Array一样进行一样，但由于其无序性，顺序可以不同
let dict1 = [1:"1" , 3:"3" , 2:"2"]
let dict2 = [1:"1" , 2:"2" , 3:"3"]
dict1 == dict2  //  true



dict["groovy"] = "go"
dict.updateValue("Go", forKey: "groovy")    // 此方法会返回修改前的值

dict["OC"] = "objective-C"  // 不存在key则添加新的key-value

dict["groovy"] = nil  // 删除对应的key和value
dict.removeValue(forKey: "OC")
//dict.removeAll()



var skillsOfA:Set<String> = ["OC","swift","java"]  // 无序数据集{"OC", "swift","java"}
var emptySet1:Set<Int> = [] // 显示声明
var emptySet2 = Set<Int>()  // 调用构造函数

var vowels = Set(["A","E","I","O","U","U"]) // {"O", "I", "A", "U", "E"}  所有数据都是唯一的
vowels.count  // 5

skillsOfA.first  // "OC"  由于是无序的,随机取出一个元素,Optional类型
skillsOfA.contains("OC")    // true
// 也能用 == 比较

// 集合并没有提供修改其中元素的接口
skillsOfA.insert("HTML")   // {"swift", "java", "OC", "HTML"}
skillsOfA.remove("CSS")    // nil
//skillsOfA.removeAll()


