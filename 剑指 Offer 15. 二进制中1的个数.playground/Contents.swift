import UIKit
/*
 
 请实现一个函数，输入一个整数（以二进制串形式），输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。

 示例 1：

 输入：00000000000000000000000000001011
 输出：3
 解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
 示例 2：

 输入：00000000000000000000000010000000
 输出：1
 解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
 示例 3：

 输入：11111111111111111111111111111101
 输出：31
 解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。
  

 提示：

 输入必须是长度为 32 的 二进制串 。
  

 注意：本题与主站 191 题相同：https://leetcode-cn.com/problems/number-of-1-bits/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

// 位运算
func hammingWeight(_ n: Int) -> Int {
    var count = 0
    var n = n
    while n != 0 {
        // n&(n-1) 每次能消除n最右边的1 ,太秀了
        n = n&(n - 1)
        print(n)
        count += 1
    }
    return count
}


//系统函数
func hammingWeight2(_ n: Int) -> Int {
    return n.nonzeroBitCount
}


/*方法三
 根据&运算的定义
  - 若n&1 = 0,则n二进制最右边一位为0
  - 若n&1 = 1，则n二进制最右边一位为1
 循环判断
 1. 判断n最右边一位是否为1，
 2. 将n右移一位直到n为0为止
 */

func hammingWeight3(_ n: Int) -> Int {
    var count = 0
    var n = n
    while n != 0 {
        count += n&1
        n >>= 1
    }
    return count
}
print(hammingWeight3(9))
