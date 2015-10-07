# debug
function say(sth)
  println(sth)
end

# generate n random numbers from Bernoulli dist. X with Pr(X=true)=p
function bernoulli(p::Real, n::Int=1)
  n==1 ? rand()<p :
  [rand()<p for i=1:n]
end

# generate n random numbers from exponential dist. with parameter lambda
function exponential(lambda::Real, n::Int=1)
  n==1 ? -lambda*log(rand()) :
  [-lambda*log(rand()) for i=1:n]
end
