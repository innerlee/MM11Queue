include("common.jl")
include("fixed_increment.jl")
include("next_event.jl")

# parameter for simulation
type mm11param
  isfixed::Bool # ture: fixed_increment, false: next_event, default false
  lambda::Float64 # default 0.05 customers/min
  mu::Float64 # default 0.1 customers/min
  delta_t::Float64 # default 0.01
  t_end::Float64 # end time default 50
end

# default parameter
mm11param()=mm11param(false, 0.05, 0.1, 0.01, 50)

function mm11queue()

end
