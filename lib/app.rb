class Queue

  attr_reader :booth, :clients

  def initialize(booth, clients)
    @booth = booth
    @clients = clients 
  end

end
