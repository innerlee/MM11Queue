#
function fixed_increment(
          lambda::Float64=0.05,
          mu::Float64=0.1,
          delta_t::Float64=0.01,
          t_end::Float64=50.0
          )
  total_steps = Int(floor(t_end/delta_t)) # not includs step 0
  N = falses(total_steps + 1) # state in each step, true for busy
  iscomeing = bernoulli(lambda*delta_t, total_steps) # new customer come?
  isleaving = bernoulli(mu*delta_t, total_steps) # decide leave or not

  for i = 1:total_steps
    # step i has time i*delta_t.
    if !N[i] && iscomeing[i] # not busy & new customer comes
      N[i] = true # now busy

    elseif !N[i] && !iscomeing[i] # not busy and no new customer
      continue # ignore

    end

    if !isleaving[i]
      # still busy, so next slot must also busy
      # we assume minimum service time is delta_t
      N[i+1] = true
    end

  end

  time = [i*delta_t for i=0:total_steps]
  (time, [[0]; N[1:total_steps]])
end
