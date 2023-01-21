FROM steamcmd/steamcmd:ubuntu-22
RUN apt-get update
RUN apt-get install -y wget zstd libncurses5:i386 libcurl4
RUN wget https://tf2classic.org/tf2c/tf2classic-2.0.4.tar.zst 2> /dev/null
RUN tar --use-compress-program=unzstd -xvf tf2classic-2.0.4.tar.zst
RUN rm tf2classic-2.0.4.tar.zst
COPY server.cfg /root/tf2classic/cfg/server.cfg
RUN steamcmd +login anonymous +app_update 244310 validate +quit
RUN mv tf2classic Steam/steamapps/common/Source\ SDK\ Base\ 2013\ Dedicated\ Server/
WORKDIR "/root/Steam/steamapps/common/Source SDK Base 2013 Dedicated Server/bin"
RUN ln -s datacache_srv.so datacache.so && \
    ln -s dedicated_srv.so dedicated.so && \
    ln -s engine_srv.so engine.so && \
    ln -s materialsystem_srv.so materialsystem.so && \
    ln -s replay_srv.so replay.so && \
    ln -s scenefilecache_srv.so scenefilecache.so && \
    ln -s shaderapiempty_srv.so shaderapiempty.so && \
    ln -s studiorender_srv.so studiorender.so && \
    ln -s vphysics_srv.so vphysics.so && \
    ln -s soundemittersystem_srv.so soundemittersystem.so
ENTRYPOINT ["/root/Steam/steamapps/common/Source SDK Base 2013 Dedicated Server/srcds_run", "-console", "-game", "tf2classic", "+map", "pl_upward", "+maxplayers", "24"]
