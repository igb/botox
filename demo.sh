nohup java -cp ~/Documents/autotune-demo/dist/autotune-demo.jar -Dorg.hccp.jvm.autotune.functions.Fof008=$1 -Dorg.hccp.jvm.autotune.functions.Fof007=$2 -Dorg.hccp.jvm.autotune.functions.Fof006=$3 -Dorg.hccp.jvm.autotune.functions.Fof005=$4 -Dorg.hccp.jvm.autotune.functions.Fof004=$5 -Dorg.hccp.jvm.autotune.functions.Fof003=$6 -Dorg.hccp.jvm.autotune.functions.Fof002=$7 -Dorg.hccp.jvm.autotune.functions.Fof001=$8 org.hccp.jvm.autotune.Demo 9000 9090  > /tmp/fof.log &
JAVAPID=$!
sleep 5
HEALTHCHECK="";
while [ "$HEALTHCHECK" != "OK" ]
do
    HEALTHCHECK=`curl -s http://127.0.0.1:9090`
    kill -0 $JAVAPID
    if [ $? -eq 1 ]
    then
	return 1
    fi
done
RESPONSE=`curl -s http://127.0.0.1:9000 | grep autotune | grep autotune | awk '{split($0,a,":");  print a[2]}'`
kill -9 $JAVAPID
sleep 3
echo $RESPONSE

