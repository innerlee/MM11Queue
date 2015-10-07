# MM11Queue
The M/M/1/1 queuing system written in Julia.

MM11Queue implements two simulation routines.

### Fixed Increment Time Advance
<img src=fig/fixed_increment.png width=400 />

### Next-Event Time Advance
<img src=fig/next_event.png width=400 />

### Theoretical Result
<img src=fig/theoretical.png width=400 />

## How To Use

* in the command line, at the directory of the code, type the following command to run julia
```cmd
julia
```

* setup drawing package. in the julia environment, type
```julia
Pkg.add("Gadfly")
Pkg.add("Cairo")
```

* run codes. in julia, type
```julia
include("main.jl")
```
you will see figures with .svg extention generated.
