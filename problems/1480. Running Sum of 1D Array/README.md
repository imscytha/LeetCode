<div align="center">
	<h1 href="https://leetcode.com/problems/running-sum-of-1d-array/">1480. Running Sum of 1D Array</h1>
	<img src="../../assets/difficulty/easy.svg" height="30px">
</div>

Given an array `nums`. We define a running sum of an array as `runningSum[i] = sum(nums[0]…nums[i])`.

Return the running sum of `nums`.

#### Example 1:

> **Input**: nums = [1,2,3,4]
>
> **Output**: [1,3,6,10]
>
> **Explanation**: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

#### Example 2:

> **Input**: nums = [1,1,1,1,1]
>
> **Output**: [1,2,3,4,5]
>
> **Explanation**: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].

#### Example 3:

> **Input**: nums = [3,1,2,10,1]
>
> **Output**: [3,4,6,16,17]

### Constraints

- $1 \le nums.length \le 1000$
- $-10^6 \le nums[i] \le 10^6$

## Solution

### Java

```java
class Solution {
    public int[] runningSum(int[] nums) {
        for (int i = 1; i < nums.length; i++) {
            nums[i] += nums[i - 1];
        }
        return nums;
    }
}
```

##### Complexity Analysis

- Time Complexity: $O(n)$
- Space Complexity: $O(1)$
