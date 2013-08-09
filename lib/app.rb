class Queue

  attr_reader :booth, :clients
  attr_accessor :line

  def initialize(booth, clients)
    @booth = booth
    @clients = clients 
    @line = Array.new(clients) {[:k, :v]}
  end

  def more_than_20
    create_queues
  end

  protected

  def time_in_the_queue
    #apenas calcular qnto tempo ele fica na fila
    count_time = 0
    behind = [0, 0, 0] 
    @line.to_enum.with_index do |client, c|
      attendance = 0
      for j in 0..c-1
        attendance += @line[j][1]
      end
      total_time = (attendance - client[0])
      #count_time += 1 if total_time > 20
      #behind = [client[0], client[1], total_time]
    end
    #count_time
  end

  def create_queues
    #montar a fila de acordo com o tempo do caixa
    time_in_the_queue
  end

  def throw_to_booth
    # jogar o cliente no caixa q não tiver atendendo no momento
  end

end
