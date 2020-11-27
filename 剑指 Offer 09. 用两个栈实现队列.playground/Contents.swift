import UIKit

/*
 剑指 Offer 09. 用两个栈实现队列
 
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 示例 2：

 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]
 提示：

 1 <= values <= 10000
 最多会对 appendTail、deleteHead 进行 10000 次调用

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class CQueue {

    private var stackOne: [Int] = []
    private var stackTwo: [Int] = []
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        // 直接添加到栈1
        stackOne.append(value)
    }
    
    func deleteHead() -> Int {
        // 在栈2为空的情况下将栈1的元素搬到栈2，否者直接删除栈2的元素，为空就返回-1
        if stackTwo.isEmpty {
            while let head = stackOne.popLast() {
                stackTwo.append(head)
            }
        }
        return stackTwo.popLast() ?? -1
    }
}
