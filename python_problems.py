#9. Palindrome Number

class Solution:
    def isPalindrome(self, x: int) -> bool:
        y = str(x)
        z = list(y)
        if z == z[::-1]:
            return True
        else:
            return False
    
#1. Two Sum

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]: 
    
        i=0
        j=1
        z=1


        while True:
            if nums[i] + nums[j] == target:
                return i, j
                break
            else:
                j+=1

            if j == len(nums):
                i+=1
                z+=1
                j=z
        
        
#13. Roman to Integer

class Solution:
    def romanToInt(self, s: str) -> int:
        s2 = s.lower()

        znak2 = list(s2)

        print(znak2)  #albo od tyłu liczyć listę? # słownik i chuj mnie to

        i=0
        j=0

        for n in znak2:
            if n == 'i':
                j+=1
            elif n == 'v':
                if znak2[i-1] == 'i':
                    j+=3
                else:
                    j+=5
            elif n == 'x':
                if znak2[i-1] == 'i':
                    j+=8
                else:
                    j+=10
            elif n == 'l':
                if znak2[i-1] == 'x':
                    j+=30
                else:
                    j+=50
            elif n == 'c':
                if znak2[i-1] == 'x':
                    j+=80
                else:
                    j+=100
            elif n == 'd':
                if znak2[i-1] == 'c':
                    j+=300
                else:
                    j+=500
            elif n == 'm':
                if znak2[i-1] == 'c':
                    j+=800
                else:
                    j+=1000
            else:
                j+=0
            
            i+=1
        
        if znak2[0] == 'c' and znak2[-1] == 'x':
            j+=20
        if znak2[0] == 'm' and znak2[-1] == 'c':
            j+=200
        if znak2[0] == 'x' and znak2[-1] == 'i':
            j+=2
        if znak2[0] == 'v' and znak2[-1] == 'i':
            j+=2
        if znak2[0] == 'd' and znak2[-1] == 'c':
            j+=200
        if znak2[0] == 'l' and znak2[-1] == 'x':
            j+=20

        return j   


#28. Find the Index of the First Occurrence in a String

class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if needle not in haystack:
            return -1
        else:
            x = haystack.find(needle)
            return x
        
#35. Search Insert Position

class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        i=0

        for n in nums:
            if nums[i] == target:
                return i
                break
            else:
                i+=1
                
        if i == len(nums):
            nums.append(target)
            nums.sort()
        
        i=0
        
        for n in nums:
            if nums[i] == target:
                return i
                break
            else:
                i+=1

#58. Length of Last Word

class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        i=0

        rev = s[::-1]

        rev2 = rev.lstrip()

        for n in rev2:
            if n != " ":
                i+=1
            else:
                break

        return i
    
#136. Single Number
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        for n in nums:
            if nums.count(n) == 1:
                return n
                break

#66. Plus One

class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        x = ''.join(str(x) for x in digits)
        y = int(x)

        y += 1

        y = str(y)

        y = [int(_) for _ in y]

        return y
    
#169. Majority Element

class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        unikaty = set(nums)

        slownik = {n:0 for n in unikaty}

        for n in nums:
            if n in slownik:
                slownik[n] += 1

        maks = 0

        for key in slownik:
            if slownik[key] > maks:
                maks = slownik[key]
                najcz = key

        return najcz


#3110. Score of a String

class Solution:
    def scoreOfString(self, s: str) -> int:
        suma = 0
        i = 1
        for _ in range(len(s)-1):
            suma += abs(ord(s[i-1]) - ord(s[i]))
            i += 1
        return suma 
    
#1929. Concatenation of Array

class Solution:
    def getConcatenation(self, nums: List[int]) -> List[int]:
        x = nums + nums
        return x
    
#2942. Find Words Containing Character

class Solution:
    def findWordsContaining(self, words: List[str], x: str) -> List[int]:
        
        lista = [i for i, w in enumerate(words) if x in w]
        
        return lista
    
#2894. Divisible and Non-divisible Sums Difference

class Solution:
    def differenceOfSums(self, n: int, m: int) -> int:
        podzielne = 0
        
        niepodzielne = 0

        for i in range(1, n+1):
            if i % m == 0:
                podzielne += i
            else:
                niepodzielne += i
            
        return niepodzielne - podzielne
    
#2011. Final Value of Variable After Performing Operations

class Solution:
    def finalValueAfterOperations(self, operations: List[str]) -> int:
        
        suma = 0
        
        for _ in operations:
            if _ == "--X" or _ == "X--":
                suma += -1
            if _ == "++X" or _ == "X++":
                suma += 1
        
        return suma
    

#3668. Restore Finishing Order

class Solution:
    def recoverOrder(self, order: List[int], friends: List[int]) -> List[int]:
        
        odp = []

        for _ in order:
            if _ in friends:
                odp.append(_)


        return odp
    

# 69. Sqrt(x)

import math
class Solution:
    def mySqrt(self, x: int) -> int:
        if x == 0:
            return x
        for i in range(1, x+1):
            if i**2 == x:
              return i
            else:
                return math.floor(x**(1/2))
            

# 268. Missing Number

class Solution:
    def missingNumber(self, nums: List[int]) -> int:
          for i in range(len(nums)+1):
             if i not in nums:
               return i