#
function next_event(
          lambda::Float64=0.05,
          mu::Float64=0.1,
          delta_t::Float64=0.01,
          t_end::Float64=50.0,
          compute_time::Bool=false
          )
  lambda_inv = 1/lambda
  mu_inv = 1/mu
  total_steps = Int(floor(t_end/delta_t)) # not includs step 0
  N = falses(total_steps) # state in each step, true for busy

  step = 1
  while step < total_steps
    interval = Int(round((exponential(lambda_inv)/delta_t)))
    step_to = step + interval

    if step_to > total_steps
      break
    end

    step = step_to

    busytime = Int(round((exponential(mu_inv)/delta_t)))
    step_to = min(step + busytime, total_steps)

    for i = step:step_to
      N[i] = true
    end

    step = step_to + 1
  end

  if compute_time
    time = [i*delta_t for i=0:total_steps]
    return (time, [[0]; N[1:total_steps]])
  else
    return [[0]; N[1:total_steps]]
  end

end
