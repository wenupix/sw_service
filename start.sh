#!/bin/bash
echo "==> Check: environment..."
export
echo "==> Check: python version..."
python --version
if [ $? -ne 0 ]; then
    echo ":ERROR: python not installed. Exit."
    exit 10
fi
echo "==> Run: service.py"
nohup python /app/service.py > /app/service.log 2>&1 &
if [ $? -ne 0 ]; then
    echo ":ERROR: Service not running. Please, check service.log for more information. Exit."
    exit 11
fi
echo ":INFO: Check service.log for service status."
echo ":INFO:  Inside container: tail -f service.log"
echo ":INFO:  Outside container: docker log -f $( echo $HOSTNAME )"

echo "==> Waiting for service..."
sleep 10
echo "==> Testing service..."
curl http://localhost:5000
sleep 5
curl http://localhost:5000

echo "==> Container ready"
### only debug: keep container "alive"
while [ true ]; do
    tail -f /app/service.log
    sleep 10
done