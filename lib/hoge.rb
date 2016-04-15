class Hoge
  attr_reader :message
  attr_reader :saids

  def initialize(message)
    @message = message
    @saids = []
  end

  class Say
    def initialize(buffer)
      @buffer = buffer
    end

    def method_missing(message)
      @buffer.add_message(message.to_s)
      message.to_s
    end
  end

  def add_message(message)
    @saids << message
  end

  def say
    Say.new(self)
  end
end
