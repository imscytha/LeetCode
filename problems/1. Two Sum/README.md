<div align="center">
	<h1 href="https://leetcode.com/problems/two-sum/">1. Two Sum</h1>
	<img src="../../assets/difficulty/easy.svg" height="30px">
</div>

Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.

You may assume that each input would have **_exactly one solution_**, and you may not use the same element twice.

You can return the answer in any order.

#### Example 1:

> **Input**: nums = [2, 7, 11, 15], target = 9
>
> **Output**: [0,1]
>
> **Explanation**: Because nums[0] + nums[1] == 9, so we return [0,1].

#### Example 2.

> **Input**: nums = [3,2,4], target = 6
>
> **Output**: [1,2]

#### Example 3.

> **Input**: nums = [3,3], target = 6
>
> **Output**: [0,1]

### Constraints

- $2 \le nums.length \le 10^4$
- $-10^9 \le nums[i] \le 10^9$
- $-10^9 \le target \le 10^9$
- **Only one valid answer exists**

## Solution

### Java

```java
class Solution{
	public int[] twoSum(int[] nums, int target) {
		Map<Integer,Integer> map = new HashMap<>();
		for (int i=0; i < nums.length; i++) {
			if (map.containsKey(target-nums[i])) {
				return new int[] {map.get(target-nums[i]),i};
			}
			map.put(nums[i],i);
		}
		return new int[] {};
	}
}
```

##### Complexity Analysis

- Time Complexity: $O(n)$
- Space Complexity: $O(n)$
