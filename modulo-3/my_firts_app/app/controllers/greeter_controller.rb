class GreeterController < ApplicationController
  def hello
  	random_names = ["vanessa", "lorena", "lourdes"]
  	@name = random_names.sample
  	@time= Time.now
  	@times_displayed ||=0
  	@times_displayed +=1
  end

  def goodbye
  end

  def remember
  end
end
