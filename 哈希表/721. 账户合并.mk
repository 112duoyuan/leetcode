给定一个列表 accounts，每个元素 accounts[i] 是一个字符串列表，其中第一个元素 accounts[i][0] 是 名称 (name)，其余元素是 emails 表示该账户的邮箱地址。

现在，我们想合并这些账户。如果两个账户都有一些共同的邮箱地址，则两个账户必定属于同一个人。
请注意，即使两个账户具有相同的名称，它们也可能属于不同的人，因为人们可能具有相同的名称。一个人最初可以拥有任意数量的账户，但其所有账户都具有相同的名称。

合并账户后，按以下格式返回账户：每个账户的第一个元素是名称，其余元素是 按字符 ASCII 顺序排列 的邮箱地址。账户本身可以以 任意顺序 返回。

示例 1：

输入：accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
输出：[["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],  ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]


哈希表 + 并查集（需要了解什么是并查集）



[["John", "johnsmith@mail.com", "john00@mail.com"], 
["John", "johnnybravo@mail.com"], 
["John", "johnsmith@mail.com", "john_newyork@mail.com"],
 ["Mary", "mary@mail.com"]]


johnsmith 	 0
john00 	  	 1
johnnybravo  2
john_newyork 3 
mary 		 4

johnsmith	 John
john00		 John
johnnybravo	 John
john_newyork John
mary		 Mary
从
0|1|2|3|4
0|0|2|0|4 的并查集


//获取编号和账户挂钩的map

索引对应邮箱
0 | johnsmith
0 | john00
2 | johnnybravo
0 | john_newyork
4 | mary
---------------------------------------
0 | johnsmith john00 john_newyork
2 | johnnybravo
4 | mary
------------------------------------
后续利用emailtoname获取name然后分类压入数组


