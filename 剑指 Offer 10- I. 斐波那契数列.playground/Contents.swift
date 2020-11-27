import UIKit

/*
 
 剑指 Offer 10- I. 斐波那契数列
 
 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：1
 示例 2：

 输入：n = 5
 输出：5
  

 提示：

 0 <= n <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 解题思路就是利用空间换时间，改递归为迭代，每次计算后将值存储到数组中
func fib(_ n: Int) -> Int {
    if n == 0 { return 0 }
    var nums = [Int](repeating: 0, count: n + 1)
    nums[1] = 1
    if n >= 2 {
        for i in 2...n {
            // 计算一次就存储到数组里面，用空间来换时间
            nums[i] = (nums[i - 1] + nums[i - 2]) % 1000000007
        }
    }
    return nums[n]
}


print(fib((99)))

