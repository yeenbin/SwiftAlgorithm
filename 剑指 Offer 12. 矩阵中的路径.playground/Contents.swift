import UIKit
/*
 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。
 
 [["a","b","c","e"],
 ["s","f","c","s"],
 ["a","d","e","e"]]
 
 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。
 
 示例 1：
 
 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：
 
 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false
 提示：
 
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard board.count > 0,word.count > 0 else {
        return false
    }
    var myBoard = board
    let words = [Character](word)
        for i in 0..<board.count {
        for j in 0..<board[0].count {
            //           let cha =  board[i][j]
            if dfs(&myBoard, words, i, j, 0) {
                return true
            }
        }
    }
    
    return false
}

// index用来记录已经匹配到字符串的第几个索引
func dfs(_ board: inout [[Character]],_ words: [Character],_ i: Int,_ j: Int,_ index: Int) -> Bool {
    // 递归的终止条件
    
    // 能进这个条件说明字符串的最后一个字符也已经匹配上了
    if index >= words.count {return true}
    
    // 越界
    if i >= board.count || i < 0 || j >= board[0].count || j < 0{ return false }
   
    
    // 已经遍历过或者不匹配
    if board[i][j] == "1" || board[i][j] != words[index] {
        return false
    }
    
    let tmp = board[i][j]
    board[i][j] = "1"
    // 分别 上下左右搜索，只要找到其中一个匹配的就继续执行
    let res = dfs(&board, words, i - 1, j, index + 1) ||
              dfs(&board, words, i + 1, j, index + 1) ||
              dfs(&board, words, i, j - 1, index + 1) ||
              dfs(&board, words, i, j + 1, index + 1)
    board[i][j] = tmp
    return res
}

var charArr: [[Character]] = [["a","b","c","e"],
                              ["s","f","c","s"],
                              ["a","d","e","e"]]

exist(charArr, "abccd")
