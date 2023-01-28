package twosum;

import java.util.Arrays;

public class Main {
  public static void main(String[] args) {
    int[] nums1 = {2, 7, 11, 15};
    int target = 9;
    Solution demo = new Solution();
    String res1 = Arrays.toString(demo.twoSum(nums1, target));
    System.out.printf("\n\tExample 1:\n");
    System.out.printf("\t\tInput: nums = %s, target = %s\n", Arrays.toString(nums1), target);
    System.out.printf("\t\tOutput: %s\n", res1);
    int[] nums2 = {3,2,4};
    target = 6;
    String res2 = Arrays.toString(demo.twoSum(nums2, target));
    System.out.printf("\n\tExample 2:\n");
    System.out.printf("\t\tInput: nums = %s, target = %s\n", Arrays.toString(nums2), target);
    System.out.printf("\t\tOutput: %s\n", res2);
    int[] nums3 = {3,3};
    String res3 = Arrays.toString(demo.twoSum(nums3, target));
    System.out.printf("\n\tExample 3:\n");
    System.out.printf("\t\tInput: nums = %s, target = %s\n", Arrays.toString(nums3), target);
    System.out.printf("\t\tOutput: %s\n", res3);
  }
}
