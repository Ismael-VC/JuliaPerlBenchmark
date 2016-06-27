#!/usr/bin/env julia

let    # global scope is slow because of type inference, let introduces a new local scope

fasta_in = open(ARGS[1], "r")
length_array = []

for line in eachline(fasta_in)
    if !ismatch(r"^\>", line)
        push!(length_array, length(chomp(line)))
    end
end

close(fasta_in)
println(median(length_array))

end    # let
