import UIKit

/*
 剑指 Offer 05. 替换空格
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."
 限制：

 0 <= s 的长度 <= 10000
 
 */

func replaceSpace(_ s: String) ->String {
    var newStrArr: [String] = []
    for str in s {
        newStrArr.append(str == " " ? "%20": String(str))
    }
    return newStrArr.joined()
}


func replaceSpace2(_ s: String) ->String {
    return (s as NSString).replacingOccurrences(of: " ", with: "%20")
}




let res = replaceSpace2("We are happy.")
print(res)
