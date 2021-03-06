
docker kill hermodpython
docker rm hermodpython
MYIP=`ip -4 route get 8.8.8.8 | awk {'print $7'} | tr -d '\n'`
DUCKLING_URL="http://$MYIP:8000"
docker run --name hermodpython --privileged  -e DUCKLING_URL=$DUCKLING_URL -e PULSE_SERVER=$MYIP -e PULSE_COOKIE=/tmp/cookie -v $(pwd)/../pulseaudio/asound-pulse.conf:/etc/asound.conf -v $(pwd)/../pulseaudio/client.conf:/etc/pulse/client.conf -v $(cd ~ && pwd)/.config/pulse/cookie:/tmp/cookie -v $(pwd)/../hermod-python/rasa:/app/rasa -v /dev/snd:/dev/snd -v $(pwd)/../hermod-python/src:/app/src  -p 1883:1883  -p 5055:5055 -p 5002:5002 -p 5005:5005 --entrypoint train.sh -it syntithenai/hermod-python 
 
         
            
