import numpy as np
from sage.rings.arith import binomial
#Demonstration of how the Law of Cosines generates Legendre Polynomials

#The end of the game basics
t, x, b = var('t,x,b')
bt = t^2 - 2*t*x

f = (1+b)^(-1/2)

#Loop to get all the binomial coefficients.  Since t has a power of 2, then
#b^1 gives t^2 and t, b^2 gives t^4 and t^3 and t^2, b^3 gives t^6 and t^5 and t^4 and t^3, 
#so to get all the terms for a power of t, you have to go to the same power of b, that power will give some terms
# for the next powers of t as well.
#The power of b by the way is passed in as n+1 to the binomial coefficient function since it counts the 
#zero power
#So, just go to the desired power of t in an expansion of b, then expand by substituing in b(t), then, expand, 
#and collect like powers of t up to the power of b, discard higher powers for the current degree of the 
#Legendre polynomial

#Here's the function to return an array of binomial coefficients up to power n
def binomial_list(n):
    #the returned array
    #how do I change this to hold rationals?
    coefficients = np.array(range(n), dtype=float)
    
    for i in range(n):
        coefficients[i] = binomial(-1/2, i)
    return coefficients
    
#Now try building the same expression using a function
def LgPoly(terms):
    lgreturn = 0
    power = 0
    for i in terms:
        lgreturn += i*(bt^power)
        power += 1
    return lgreturn


#binomial(-1/2, 1)
