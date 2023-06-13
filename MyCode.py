
import math

c=int(input())
d=int(input())
def add_numbers(c,d):
    return c+d

def power_numbers(c,d):
    return math.pow(c,d)
sum=add_numbers(c,d)
pow=power_numbers(c,d)
print("x+y Result =",sum)
print("X^Y Result =",pow)