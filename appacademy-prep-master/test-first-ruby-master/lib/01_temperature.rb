def ftoc(ftemp)
    partial = (ftemp-32).to_f
    ctemp = partial*5.0/9.0

end

def ctof(ctemp)
    ftemp = ctemp*9.0/5.0 + 32.0
end
