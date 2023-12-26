给定一个整数数组，找出总和最大的连续数列，并返回总和。

示例：

输入： [-2,1,-3,4,-1,2,1,-5,4]
输出： 6
解释： 连续子数组 [4,-1,2,1] 的和最大，为 6。
进阶：

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。


动态规划：
定义Fi（0<=i<n）为以i为结尾的连续子数组，只要找出所有的连续子数组，计算他们的和取最大的即可


动态规划的方程如下：
	f(i) = max{f(i -1) + nums[i],nums[i]}

class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int Maxnum = nums[0];
        int pre = 0;
        for(const auto &num : nums){
            pre = max(num,pre +num);
            Maxnum = max(pre,Maxnum);
        }
        return Maxnum;
    }
};

分治方法在分治文档下！！！