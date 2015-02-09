require 'ffi-rzmq'
require 'json'

class Number < ActiveRecord::Base
  def calculate
    
    context = ZMQ::Context.new
    sock = context.socket(ZMQ::REQ)
    sock.connect("tcp://localhost:7788")
    
    mgs_send = {:value => value}.to_json
    sock.send_string mgs_send

    msg_recv = ''
    sock.recv_string(msg_recv)

    result = JSON.parse(msg_recv)["result"]
    update_column :result, result
    update_column :calculated, true
    
    sock.close
    context.terminate
  end
  handle_asynchronously :calculate
  
end