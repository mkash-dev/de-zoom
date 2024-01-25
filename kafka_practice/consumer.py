from kafka import KafkaConsumer

consumer=KafkaConsumer(bootstrap_servers='localhost:9092')

try:
    for message in consumer:
        print(message.value)
except KeyboardInterrupt:
    pass
finally:
    consumer.close()