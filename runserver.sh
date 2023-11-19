docker run \
  -p 27015:27015/tcp -p 27015:27015/udp \
  -p 27020:27020/udp \
  -p 27005:27005/udp \
  -p 26900:26900/udp \
  --volume "./server.cfg:/root/Steam/steamapps/common/Source SDK Base 2013 Dedicated Server/tf2classic/cfg/server.cfg" \
  -d \
tf2c
