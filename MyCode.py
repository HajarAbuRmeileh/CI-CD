# calculator.py

def add_numbers(a, b):
    return a + b

def sub_numbers(a, b):
    return a - b

def get_user_input():
    a = float(input("first number:"))
    b = float(input("second number:"))
    return a, b

if __name__ == "__main__":
    num1, num2 = get_user_input()
    add_result = add_numbers(num1, num2)
    sub_result = sub_numbers(num1, num2)
    print("The sum of {} and {} equal: {}".format(num1, num2, add_result))
    print("The sub of {} and {} equal: {}".format(num1, num2, sub_result))