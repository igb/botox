nohup java -cp /Users/igb/Documents/autotune-demos/dist/autotune-demo.jar -Dorg.hccp.jvm.autotune.functions.Fof008=$1 -Dorg.hccp.jvm.autotune.functions.Fof007=$2 -Dorg.hccp.jvm.autotune.functions.Fof006=$3 -Dorg.hccp.jvm.autotune.functions.Fof005=$4 -Dorg.hccp.jvm.autotune.functions.Fof004=$5 -Dorg.hccp.jvm.autotune.functions.Fof003=$6 -Dorg.hccp.jvm.autotune.functions.Fof002=$7 -Dorg.hccp.jvm.autotune.functions.Fof001=$8 org.hccp.jvm.autotune.Demo 9000 9090  > /tmp/fof.log &
JAVAPID=$!
HEALTHCHECK="";
while [ "$HEALTHCHECK" != "OK" ]
do
    HEALTHCHECK=`curl -s http://127.0.0.1:9090`
done
RESPONSE=`curl -s http://127.0.0.1:9000 | grep autotune`
kill -9 $JAVAPID
IFS=': ' read -r -a array <<< "$RESPONSE"
echo "${array[1]}"

