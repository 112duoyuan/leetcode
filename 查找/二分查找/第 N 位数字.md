给你一个整数 n ，请你在无限的整数序列 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...] 中找出并返回第 n 位上的数字。

题意，就比如11，其实是1234567891011.....字符串第11个，就是0

思路：为得到无限整数序列的第n位数，需要知道第n位数是哪个整数的第几位。

假设：
    第n位数所在的的整数是d位数，则有所有位数不超过d-1的整数的位数之和小于n，且所有位数不超过d的整数的位数之和大于等于n；
    所有位数不超过x的整数的位数之和关于x单调递增；
    对于某个x，如果所有位数不超过 x 的整数的位数之和小于 n，则d > x;否则d<=x,以此调整二分查找的上下界;

    关于x位的整数的位数之和规律如下；

    x = 1； num = 0~9       sum = 1 * 9 = 9；
    x = 2； num = 10~99     sum = 2 * 90 = 180；
    x = 3； num = 100~999   sum = 3 * 900 = 2700；
    ....

    一般情况则x 位数的范围是 10^(x - 1) ~ 10^(x) - 1;   共有10^(x) - 1 - 10^(x - 1) + 1 个数 ；即为 9 * 10^(x - 1)个数；
    n最大值为2^31 -1 约等于2 * 10 ^9,则x = 9 作为上界，x = 1为下界

    得到d的值，即为是多少位数后；可以根据上述规律计算得到所有位数不超过d -1的整数的位数之和,
    然后可以得到第n个d位数在所有d位数中的下标； 
    从0开始标记；
    prevDigits意为所有不超过d-1位数的整数位数之和，第n个d位数在所有的d位数序列的下标是index = n-prevDigits-1；index 最小为0；

    得到index后，在无限整数序列中第n个位数字是第 index /d 个d位数的第index %d 位，编号从0开始

    最小的d位数是10^（d - 1）   ,所以第n位数所在的整数是 10^(d -1 ) + （index / d）,该整数的右边的第d - （index % d）-1位[计数从0开始]即为无限整数序列中的第n位数字；
```C++
class Solution {
public:
    int findNthDigit(int n) {
        int low = 1, high = 9;
        while (low < high) {
            int mid = (high - low) / 2 + low;
            if (totalDigits(mid) < n) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }
        int d = low;
        int prevDigits = totalDigits(d - 1);
        int index = n - prevDigits - 1;
        int start = (int) pow(10, d - 1);
        int num = start + index / d;
        int digitIndex = index % d;
        int digit = (num / (int) (pow(10, d - digitIndex - 1))) % 10;
        return digit;
    }

    int totalDigits(int length) {
        int digits = 0;
        int curLength = 1, curCount = 9;
        while (curLength <= length) {
            digits += curLength * curCount;
            curLength++;
            curCount *= 10;
        }
        return digits;
    }
};

```

