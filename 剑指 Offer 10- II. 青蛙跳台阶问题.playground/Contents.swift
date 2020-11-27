import UIKit

/*
 剑指 Offer 10- II. 青蛙跳台阶问题
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 示例 2：

 输入：n = 7
 输出：21
 示例 3：

 输入：n = 0
 输出：1
 提示：

 0 <= n <= 100
 注意：本题与主站 70 题相同：https://leetcode-cn.com/problems/climbing-stairs/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 找出跳法的规律后，就是斐波那契数列,只是从1开始的
func numWays(_ n: Int) -> Int {
    if n == 0 { return 1}
    var nums = [Int](repeating: 0, count: n + 1)
    nums[0] = 1
    nums[1] = 1
    if n >= 2 {
        for i in 2...n {
            // 计算一次就存储到数组里面，用空间来换时间
            nums[i] = (nums[i - 1] + nums[i - 2]) % 1000000007
        }
    }
    return nums[n]
}




// 70 题相同：https://leetcode-cn.com/problems/climbing-stairs/ 的解法
func climbStairs(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var p = 0, q = 0, r = 1
        for _ in 0..<n {
           p = q
           q = r
           r = p + q
        }
    return r
        
}


