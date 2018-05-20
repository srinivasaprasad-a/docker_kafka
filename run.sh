echo "start kafka container..."
sudo docker rm -f kafka-host &> /dev/null
sudo docker run -itd \
		-p 9092:9092 \
		--add-host zookeeper-host:172.17.0.2 \
                --name kafka-host \
                --hostname kafka-host \
		docker_kafka:latest &> /dev/null
echo "done."
