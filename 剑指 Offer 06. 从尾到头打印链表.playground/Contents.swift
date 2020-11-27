import UIKit



/*
 剑指 Offer 06. 从尾到头打印链表
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
 示例 1：

 输入：head = [1,3,2]
 输出：[2,3,1]
 
 限制：

 0 <= 链表长度 <= 10000
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let head = ListNode(1)
let two = ListNode(3)
let three = ListNode(2)
head.next = two
two.next = three
three.next = nil


func reversePrint(_ head: ListNode?) -> [Int] {
    
    // 1. 先反转链表
    var newNode: ListNode? = nil;
    var oldNode = head
    while oldNode != nil {
        // 先保存下一个节点
        let nextNode = oldNode?.next
        // 将节点添加到新链表上
        oldNode?.next = newNode
        // 将新链表的头结点指向旧的链表
        newNode = oldNode
        // 修改oldnote为下一个节点
        oldNode = nextNode
    }
    
    // 遍历反转后的链表
    var res = [Int]()
    while newNode != nil {
        res.append(newNode!.val)
        newNode = newNode!.next
    }
    return res
}

//reversePrint(head)



// 解法二，利用数组的反转方法，先遍历链表逐一添加到数组
func reversePrintTwo(_ head: ListNode?) -> [Int] {
    var result = [Int]()
    var node = head
    while node != nil {
        result.append(node!.val)
        node = node!.next
    }
    return result.reversed()
}

reversePrintTwo(head)


// 解法三：递归解法，递归从传入的参数一直到尾部开始执行，所以是逆序的
func reversePrintThree(_ head: ListNode?) -> [Int] {
    guard let head = head else {
        return [Int]()
    }
    
    var list = reversePrintThree(head.next)
    print(head.val)
    list.append(head.val)
    return list
}

reversePrintThree(head)
