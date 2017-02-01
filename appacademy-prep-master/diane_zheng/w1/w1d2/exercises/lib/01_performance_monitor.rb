def measure(repeat = 1, &proc)
  start = Time.now
  repeat.times {proc.call}
  (Time.now - start)/repeat
end
