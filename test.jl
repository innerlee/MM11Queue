Lsim=10000

say("= fixed_increment, simulate $Lsim times")
tic()
(timeline, states) = fixed_increment()

for i=2:Lsim
  (a, b) = fixed_increment()
  states += b
end

busy = states/Lsim
free = 1 - busy

toc()

using Gadfly
plot(layer(x=timeline, y=busy, Geom.line),
      layer(x=timeline, y=free, Geom.line),
      Guide.XLabel("Time (min)"),
      Guide.YLabel("Probability"),
      Guide.Title("Fixed Increment Time Advance"))
