Lsim=10000
drawpng = false

say("= fixed_increment, simulate $Lsim times")

tic()
(timeline, states) = fixed_increment()

for i=2:Lsim
  (a, b) = fixed_increment()
  states += b
end

busy = states/Lsim
free = 1 - busy
time_used = toc()

using Gadfly
fig = plot(layer(x=timeline, y=busy, Geom.line),
      layer(x=timeline, y=free, Geom.line),
      Guide.XLabel("Time (min)"),
      Guide.YLabel("Probability"),
      Guide.Title("Fixed-Increment Time Advance ($Lsim sims in $time_used s)"),
      Theme(background_color=color(colorant"white")))
draw(SVG("fixed_increment.svg", 8inch, 6inch), fig)
drawpng? draw(PNG("fig/fixed_increment.png", 8inch, 6inch), fig) : nothing

say("= next_event, simulate $Lsim times")

tic()
(timeline, states) = next_event()

for i=2:Lsim
  (a, b) = next_event()
  states += b
end

busy = states/Lsim
free = 1 - busy
time_used = toc()

fig = plot(layer(x=timeline, y=busy, Geom.line),
      layer(x=timeline, y=free, Geom.line),
      Guide.XLabel("Time (min)"),
      Guide.YLabel("Probability"),
      Guide.Title("Next-Event Time Advance ($Lsim sims in $time_used s)"),
      Theme(background_color=color(colorant"white")))
draw(SVG("next_event.svg", 8inch, 6inch), fig)
drawpng? draw(PNG("fig/next_event.png", 8inch, 6inch), fig) : nothing

say("= drawing theoretical result")

tic()
lambda = 0.05
mu = 0.1
delta_t = 0.01
t_end = 50.0
total_steps = Int(floor(t_end/delta_t))
time = [i*delta_t for i=0:total_steps]
arg = lambda/(lambda+mu)
busy = [arg - arg*exp(-(lambda+mu)*time[i]) for i=1:length(time)]
free = 1 - busy
time_used = toc()

fig = plot(layer(x=timeline, y=busy, Geom.line),
      layer(x=timeline, y=free, Geom.line),
      Guide.XLabel("Time (min)"),
      Guide.YLabel("Probability"),
      Guide.Title("Theoretical Result ($time_used s)"),
      Theme(background_color=color(colorant"white")))
draw(SVG("theoretical.svg", 8inch, 6inch), fig)
drawpng? draw(PNG("fig/theoretical.png", 8inch, 6inch), fig) : nothing
