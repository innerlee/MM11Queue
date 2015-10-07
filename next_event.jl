#
function next_event(
          lambda::Float64=0.05,
          mu::Float64=0.1,
          delta_t::Float64=0.01,
          t_end::Float64=50.0
          )
  lambda_inv = 1/lambda
  mu_inv = 1/mu
  total_steps = Int(floor(t_end/delta_t)) # not includs step 0
  N = falses(total_steps + 1) # state in each step, true for busy
  busy = false # init free

  #say("= next event: total steps: $total_steps")

  step = 1
  while step < total_steps
    interval = Int(floor((exponential(lambda_inv)/delta_t)))
    step_to = step + interval

    if step_to > total_steps
      break
    end

    step = step_to

    busytime = Int(floor((exponential(mu_inv)/delta_t)))
    step_to = min(step + busytime, total_steps)

    for i = step:step_to
      N[i] = true
    end

    step += 1
  end

  time = [i*delta_t for i=0:total_steps]
  (time, [[0]; N[1:total_steps]])
end
