sudo ./rttys -h
Usage of rttys:
  -cert string
        certFile Path
  -key string
        keyFile Path
  -port int
        http service port (default 5912)


client
rtty -I '112233445566' -h '192.168.3.216' -p 5912 -a -v -s -d 'My Device Description'