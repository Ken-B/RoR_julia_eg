using JSON
using ZMQ

const ctx = Context()
sock = Socket(ctx, REP)
ZMQ.bind(sock, "tcp://*:7788")

function triple(x)
	sleep(10)
	2x
end

while true
	println("Server running.")
	msg = JSON.parse(bytestring(ZMQ.recv(sock)))
	result = triple(float(msg["value"]))
	ZMQ.send(sock, JSON.json({"result"=>result}))
end
