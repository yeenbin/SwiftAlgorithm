import UIKit

/*
 
 输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。

 示例 1:

 输入: n = 1
 输出: [1,2,3,4,5,6,7,8,9]
  

 说明：

 用返回一个整数列表来代替打印
 n 为正整数


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

func printNumbers(_ n: Int) -> [Int] {
    guard n > 0 else {
        return []
    }
//    var max = 1
//    for _ in 1...n {
//        max *= 10
//    }
    let max: Int = Int(pow(10.0, Double(n)))
    var nums = [Int](repeating:0, count: max - 1)
    for i in  0 ..< max - 1 {
        nums[i] = i + 1
    }
    return nums
}



// 系统方法，一行代码,不过效率不高
func printNumbers2(_ n: Int) -> [Int] {
    return Array.init(1..<Int(pow(10.0, Double(n))))
}

print(printNumbers(9))
