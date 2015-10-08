#
function fixed_increment(
          lambda::Float64=0.05,
          mu::Float64=0.1,
          delta_t::Float64=0.01,
          t_end::Float64=50.0,
          compute_time::Bool=false
          )
  lambda_delta = lambda*delta_t
  mu_delta = mu*delta_t
  total_steps = Int(floor(t_end/delta_t)) # not including step 0
  N = falses(total_steps) # state in each step, true for busy

  is_next_busy = false
  for i = 1:total_steps

    if is_next_busy || bernoulli(lambda_delta)
      N[i] = true # current is busy
      is_next_busy = !bernoulli(mu_delta) # next is busy if not leave now
    end

  end

  if compute_time
    time = [i*delta_t for i=0:total_steps]
    return (time, [[0]; N[1:total_steps]])
  else
    return [[0]; N[1:total_steps]]
  end
end
