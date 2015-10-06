Lsim=10000

(timeline, states) = fixed_increment()

for i=2:Lsim
  (a, b) = fixed_increment()
  states += b
end

busy = states/Lsim
free = 1 - busy

using Gadfly
plot(x=timeline, y=states, Geom.point, Geom.line)
