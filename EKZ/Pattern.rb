class AmericanSocket
  def plug_in
    puts "Підключений до американської розетки"
  end
end

class EuropeanSocket
  def plug_in_european_socket
    puts "Підключений до європейської розетки"
  end
end

class Adapter < EuropeanSocket
  def initialize(american_socket)
    @american_socket = american_socket
  end

  def plug_in_european_socket
    puts "Адаптер: американська розетка використовується як європейська"
  end
end

european_socket = EuropeanSocket.new
european_socket.plug_in_european_socket

american_socket = AmericanSocket.new
american_socket.plug_in

adapter = Adapter.new(american_socket)
adapter.plug_in_european_socket