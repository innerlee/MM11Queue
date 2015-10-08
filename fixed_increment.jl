#
function fixed_increment(
          lambda::Float64=0.05,
          mu::Float64=0.1,
          delta_t::Float64=0.01,
          t_end::Float64=50.0
          )
  lambda_delta = lambda*delta_t
  mu_delta = mu*delta_t
  total_steps = Int(floor(t_end/delta_t)) # not including step 0
  N = falses(total_steps) # state in each step, true for busy

  is_next_free = true
  for i = 1:total_steps

    if is_next_free && !bernoulli(lambda_delta)
      continue # free & no new customer
    end

    N[i] = true # busy
    is_next_free = bernoulli(mu_delta) # decide to leave

  end

  time = [i*delta_t for i=0:total_steps]
  (time, [[0]; N[1:total_steps]])
end
