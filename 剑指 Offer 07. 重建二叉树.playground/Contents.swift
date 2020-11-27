import UIKit

/*
 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
 
 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
  

 限制：

 0 <= 节点个数 <= 5000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    // 确保输入的数组不为空
    guard !preorder.isEmpty else {
        return nil
    }
    //先记录长度
    let preLen = preorder.count
    let inLen = inorder.count
    // 做下数据长度的判断
    if preLen != inLen {
        fatalError("Incorrect input data")
    }
    
    // 用来记录前序遍历的根节点在中序遍历中的索引
    var map = [Int: Int]()
    for (i,num) in inorder.enumerated() {
        map[num] = i
    }
    return tree(preorder, 0, preLen - 1 , map, 0, inLen - 1)
}

// 构建递归函数
func tree(_ preOrder: [Int],_ preLeft: Int,_ preRight: Int,_ map:[Int: Int], _ inLeft: Int, _ inRight: Int) -> TreeNode? {
    
    //preRoot为根节点的下标
    //inLeft和inRight区分在中序中的左/右子树
    // 递归终止条件
    if preLeft > preRight || inLeft > inRight { // 不构成区间的时候
        return nil
    }
    let val = preOrder[preLeft]
    // 创建根节点
    let root = TreeNode(val)
    // 根节点在中序中的下标，根节点的左边为左子树，右边为右子树
    let i = map[val]
    
    root.left = tree(preOrder, preLeft + 1, i! - inLeft + preLeft, map, inLeft, i! - 1)
    root.right = tree(preOrder, i! - inLeft + preLeft + 1, preRight, map, i! + 1,inRight)
    return root
}

/*
 要点：
 前序遍历 |根节点preLeft|左子树{preLeft + 1, x}|右子树{x + 1, preRight}|
 中序遍历 |左子树{inLeft, i - 1}|根节点i|右子树{i + 1,inRight}|
 i = map[根节点]
 利用左子树的长度是一样 =》 x - (preLeft + 1) = i - 1 - inLeft  求出x = i - inLeft + preLeft
 
 */

buildTree([3,9,20,15,7], [9,3,15,20,7])

