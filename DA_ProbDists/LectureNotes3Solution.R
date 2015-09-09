##Lecture Notes 3 Solutions:


##Binomial - Slide 10
n=100
p=.03

## What is the expected number of defective parts
n*p

##What is the probability that the machine creates exactly 4 defective
dbinom(4,size=n, p=p)
choose(n,4)*p^4*(1-p)^(n-4)

##What is the probability that the machine creates 4 or more defective
1-pbinom(3, size=n, p=p)
1-(dbinom(3, n, p)+dbinom(2,n,p)+dbinom(1,n,p)+dbinom(0,n,p))

##What is the standard deviation of defective parts
sqrt(n*p*(1-p))



##Geometric - Slide 14
#p here is defined as the probability of a miss (because this event only happens 1 time)
##What is the expected number of baskets he will make until the first miss
1/.07 - 1 
#1/.07 is the number of total trials until first miss, 
#so the number of makes until the first miss is 1/.07 - 1


##What is the probability his first miss will occur on the third shot
?dgeom
#Essentially we want two makes, then the third shot to be a miss
.93*.93*.07
dgeom(2,.07)

##What is the probability the first miss occurs before the 5th shot
#That is 3 makes then a miss or fewer
.93^3*.07+.93^2*.07+.93^1*.07+.93^0*.07
pgeom(3,.07)

##What is the standard deviation in the number of baskets he will make
sqrt((1-.93)/(.93^2))

#Poisson Distribution - Slide 22
##What is the expected number of accidents
2

##What is the probability that the number of accidents is exactly 1?
(2^1*exp(-2))/factorial(1)
dpois(1,2)

##What is the probability that the number of accidents is greater than 3
1-ppois(3,2)

##What is the standard deviation of the number of accidents
sqrt(2)


##Exponential Distribution - Slide 28
##What is the probability the strike lasts less than one day
pexp(1,1/10)

##Notice that like the geometric distribution, the exponential distribution 
##Is Defined differently in R than in our notes.  The 'rate' parameter is 1/mean
##Also notice that we can use the exact number in continuous distributions, 
##Because the probability of exactly 6 is 0 for continuous distributions.

##What is the probability that a strike lasts less than 6 days?
pexp(6, 1/10)

##What is the probability it lasts between 6 and 7 days?
pexp(7, 1/10) - pexp(6,1/10)

##What is the probability that a strike lasts less than 7 days given it has lasted 6 days
##That is P(X<7|X>6)
(pexp(7, 1/10) - pexp(6,1/10))/(1-pexp(6/1/10))

##Notice this is the same as the probability for the first part - this is called the memoryless property
##The geometric distribution and the exponential distributions share this property


##Beta Distribution - Slide 33
##Just so you can see what this distribution looks like
hist(rbeta(100000, 5,2))
abline(v=.9, col='red', lwd=2)
abline(v=.6, col='blue', lwd=2)
##What is the expected score on the exam
5/7

##If 90% is considered an A, what percent of students received an A
1-pbeta(.9,shape1=5, shape2=2)

##If 60% is considered failing what percentage failed? passed?
pbeta(.6, shape1 = 5, shape2 = 2) #fail
1-pbeta(.6, shape1 = 5, shape2 = 2) #pass


##Gamma Distribution - Slide 38
##This is the same as an exponential with a mean of 3000
##Note this is again a bit different than what is in the lecture notes 
##(in the same way as the exp distribution)
##You can show this by plugging in the parameters for both - 
##they are identical distributions
3000

##What percentage of claims are less than 1000
pgamma(1000, 1, 1/3000)

##What percentage of claims are greater than 3500
1-pgamma(3500, 1, 1/3000)

##If the distribution has alpha =2, what are the answers to the two parts listed above?
pgamma(1000, 2, 1/3000)
1-pgamma(3500, 2, 1/3000)


##Continuous Uniform - Slide 43
##What is the chance the strike is over in the first week?
punif(7, 0,30)
7/30

##What is the chance the strike lasts longer than the first day and a half
1-punif(1.5, 0, 30)
1-1.5/30

##What is the amount of time the strike is expected to last?
30/2

##What is the standard deviation of the number of days the strike is supposed to last?
sqrt((30^2)/12)


##Normal Distributions - Slides 50-52
##Probability of a claim greater than 10000
1-pnorm(10000, 5000, sqrt(16000))

##Probability of a claim less than 2500
pnorm(2500, 5000, sqrt(16000))

##Probability of a claim between 7500 and 9000
pnorm(9000,5000, sqrt(16000)) - pnorm(7500 ,5000, sqrt(16000))

##Find the probability of a bag having at least the advertised amount
1-pgamma(8.5, 900, 100)


##What is the sampling distribution of the sample mean of 49 bags?
#The sampling distribution is normal with a mean of 9 and a standard deviation of sqrt(900*((1/100)^2)/49)

##Is the CLT needed here?
#Yes, our original distribution is not normally distributed

##What is the probability that our sample average exceeds 8.5 ounces?
1-pnorm(8.5, 9, sqrt(900*((1/100)^2)/49))

