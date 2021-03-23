from functools import cache

@cache
def fib(order: int):
    """

    :rtype: int
    """
    if order <= 1:
        return order
    else:
        return fib(order - 1) + fib(order - 2)


terms = 200
print(fib(terms))
