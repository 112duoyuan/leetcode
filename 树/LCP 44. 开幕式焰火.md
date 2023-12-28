开幕式开始了，空中绽放了一颗二叉树形的巨型焰火。 给定一棵二叉树 root 代表焰火，节点值表示巨型焰火这一位置的颜色种类。请帮小扣计算巨型焰火有多少种不同的颜色。

输入：root = [1,3,2,1,null,2]

输出：3

解释：焰火中有 3 个不同的颜色，值分别为 1、2、3
深度搜索

```C++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:

    void dfs(unordered_set<int>&uset,TreeNode *root){
        if(!uset.count(root->val)){
            uset.insert(root->val);
        }
        if(root->left){
            dfs(uset,root->left);
        }
        if(root->right){
            dfs(uset,root->right);
        }
    }
    int numColor(TreeNode* root) {
        if(!root){
            return {};
        }
        unordered_set<int>uset;
        dfs(uset,root);
        return uset.size();

    }
};
```