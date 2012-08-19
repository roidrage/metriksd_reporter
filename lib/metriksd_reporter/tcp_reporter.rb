require 'metriksd_reporter/reporter'

module MetriksdReporter
  class TcpReporter < Reporter
    def setup_socket
      @socket ||= TCPSocket.new(@host, @port)
    end

    def flush_packet
      if @packet && @packet.length > 0
        @socket.write(@packet)
        @packet = ''
      end
    end
  end
end
