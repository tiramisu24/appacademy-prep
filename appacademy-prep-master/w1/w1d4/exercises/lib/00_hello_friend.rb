class Friend
  def greeting(who = nil)
    if who == nil
      return "Hello!"
    end
    "Hello, #{who}!"
  end
end
