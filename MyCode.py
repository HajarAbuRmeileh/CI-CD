import math
c=int(input("First number X:"))
d=int(input("Second number Y:"))
def add_numbers(c,d):
    return c+d

def power_numbers(c,d):
    return math.pow(c,d)
sum=add_numbers(c,d)
pow=power_numbers(c,d)
print("x+y Result =",sum)
print("X^Y Result =",pow)