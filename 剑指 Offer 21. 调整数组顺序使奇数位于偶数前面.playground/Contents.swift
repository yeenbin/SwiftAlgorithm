import UIKit

/*
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面

 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

  

 示例：

 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。
  

 提示：

 1 <= nums.length <= 50000
 1 <= nums[i] <= 10000
 */


// 思路，创建2个数组，遍历一遍奇数添加到第一个数组，偶数添加到第二个数组，最后两个数组拼接
func exchange(_ nums: [Int]) -> [Int] {
    var odd = [Int]()
    var even = [Int]()
    for num in nums {
        if num % 2 == 1 {
            odd.append(num)
        }else {
            even.append(num)
        }
    }
    
    return odd + even
}


// 利用系统方法一行代码解决
func exchange2(_ nums: [Int]) -> [Int] {
    return nums.filter{$0 % 2 != 0} + nums.filter{ $0 % 2 == 0}
}

exchange([1,2,3,4,3,5,6,5,6,7,7])
