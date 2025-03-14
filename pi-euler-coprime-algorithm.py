# By Michael Stebel using Euler's method and the Riemann Zeta Function
import random
import math
from functools import cache

@cache

# Recursive greatest common divisor function
def gcd(a: int, b: int) -> int:
    if b == 0:
        return a
    else:
        return gcd(b, a % b)

# Create an array of integers and fill it with n random integers
# Lots of iterations are needed to converge to pi!
n = 100000000
randoms = [int]
for i in range(n):
    rnd_number = random.randint(1, n)
    randoms.append(rnd_number)

# The probability that two random numbers are co-prime converges to 6/pi^2 as n -> infinity
total_count: int = 0
coprimes: int = 1
index: int = 1
pi_so_far: float = 0.0
count = int(len(randoms) / 2)
a2: int = 0
b2: int = 0

for i in range(count):
    a2 = randoms[index]
    b2 = randoms[index + 1]
    # Swap if b2 is larger than a2
    if b2 > a2:
        [a2, b2] = [b2, a2]
    if gcd(a2, b2) == 1:
        coprimes += 1
    total_count += 1
    index += 2
    pi_so_far = math.sqrt(6.0 * total_count / coprimes)
    print(pi_so_far)
