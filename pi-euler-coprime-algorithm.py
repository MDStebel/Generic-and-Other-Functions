import random
import math


def gcd(a: int, b: int) -> int:
    if b == 0:
        return a
    else:
        return gcd(b, a % b)


# Create an array of random integers
size = 100000000
randoms = [int]
for i in range(size):
    rnd_number = random.randint(1, size)
    randoms.append(rnd_number)


# Compute pi as the probability that any two integers are relatively prime (coprime)
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
    if b2 > a2:
        [a2, b2] = [b2, a2]
    if gcd(a2, b2) == 1:
        coprimes += 1
    total_count += 1
    index += 2
    pi_so_far = math.sqrt(6.0 * total_count / coprimes)


print(pi_so_far)
