#!/bin/bash -xe

#export USER=fahclient
#export NAME=fahclient
##CONFIG=/etc/$NAME/config.xml
#export DEFAULT=/etc/default/$NAME
#export HOME=/var/lib/$NAME
#export EXEC=/usr/bin/FAHClient
##LOG=$HOME/log.txt
#export PID=/var/run/$NAME.pid
##EXTRA_OPTS=
##QUIET=true
#export ENABLE=true

GPU=${GPU:-dan}
SMP=${SMP:-true}
PASSKEY=${PASSKEY:-0}
TEAM=${TEAM:-0}
ALLOW=${ALLOW:-0/0}
WEB_ALLOW=${WEB_ALLOW:-0/0}
USER=${USER:-Anonymous}
PASSWORD=${PASSWORD:-password}

cat > /etc/fahclient/config.xml << EOF

<config>
  <!-- Folding Slot Configuration -->
  <gpu v='$GPU'/>

  <!-- HTTP Server -->
  <allow v='$ALLOW'/>

  <!-- Remote Command Server -->
  <password v='$PASSWORD'/>

  <!-- Web Server -->
  <web-allow v='$WEB_ALLOW'/>

EOF


if [[ $USER == Anonymous ]]
then

cat >> /etc/fahclient/config.xml << EOF

  <user value="anonymous"/> <!-- Enter your user name here -->
  <team value="0"/>         <!-- Your team number -->
  <passkey value=""/>       <!-- 32 hexadecimal characters if provided -->

  <power value="light"/>
  <fold-anon value="false"/>
EOF

#  /usr/bin/FAHClient "--user=${USER}" "--gpu=${GPU}" "--smp=${SMP}" "--allow=${ALLOW}" "--web-allow=${WEB_ALLOW}" "--fold-anon=true" "--power=full"
else 

cat >> /etc/fahclient/config.xml << EOF

  <!-- User Information -->
  <passkey v='$PASSKEY'/>
  <team v='$TEAM'/>
  <user v='$USER'/>

EOF

#  /usr/bin/FAHClient "--user=${USER}" "--team=${TEAM}" "--passkey=${PASSKEY}" "--gpu=${GPU}" "--smp=${SMP}" \
#    "--log-to-screen=true" "--log=/var/lib/fahclient/logs/fah_log.txt" "--log-rotate-dir=/var/lib/fahclient/logs" \
#    "--allow=${ALLOW}" "--web-allow=${WEB_ALLOW}" "--power=full"

fi

echo '</config>' >> /etc/fahclient/config.xml

cat /etc/fahclient/config.xml

/usr/bin/FAHClient --config=/etc/fahclient/config.xml


