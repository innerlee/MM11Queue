# debug
function say(sth)
  println(sth)
end

# generate n random numbers from Bernoulli dist. X with Pr(X=true)=p
function bernoulli(p::Real)
  rand()<p
end

# generate n random numbers from exponential dist. with parameter lambda
function exponential(lambda::Real)
  -lambda*log(rand())
end
