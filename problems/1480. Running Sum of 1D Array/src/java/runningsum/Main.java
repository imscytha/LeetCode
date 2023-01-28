package runningsum;

import java.util.Arrays;

class Main {
    public static void main(String[] args) {
    Solution demo = new Solution();
    int[] nums1 = {1, 2, 3, 4};
    String res1 = Arrays.toString(demo.runningSum(nums1));
    System.out.printf("\n\tExample 1:\n");
    System.out.printf("\t\tInput: nums = %s\n", Arrays.toString(nums1));
    System.out.printf("\t\tOutput: %s\n", res1);
    int[] nums2 = {1, 1, 1, 1, 1};
    String res2 = Arrays.toString(demo.runningSum(nums2));
    System.out.printf("\n\tExample 2:\n");
    System.out.printf("\t\tInput: nums = %s\n", Arrays.toString(nums2));
    System.out.printf("\t\tOutput: %s\n", res2);
    int[] nums3 = {3, 1, 2, 10, 1};
    String res3 = Arrays.toString(demo.runningSum(nums3));
    System.out.printf("\n\tExample 1:\n");
    System.out.printf("\t\tInput: nums = %s\n", Arrays.toString(nums3));
    System.out.printf("\t\tOutput: %s\n", res3);
    }
}