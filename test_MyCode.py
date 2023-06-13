import pytest
from MyCode import add_numbers

def test_add_positive():
    assert add_numbers(1,2)==3

def test_add_zero():
    assert add_numbers(1,0)==1

def test_add_negative():
    assert add_numbers(5,-100)==-95

