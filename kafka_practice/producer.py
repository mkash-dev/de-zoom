from kafka import KafkaProducer
from kafka.admin import KafkaAdminClient
from kafka.admin import NewTopic
import time

admin_client = KafkaAdminClient(bootstrap_servers='localhost:9092')

topic_name = 'day_two_of_trial'

new_topic = NewTopic(name=topic_name, num_partitions=1, replication_factor=1)
topic_config = {
    'cleanup.policy':'delete',
    'retention.ms':'86400000'
}

new_topic.config = topic_config

if topic_name not in admin_client.list_topics():
     admin_client.create_topic(new_topics=[new_topic], validate_only=False)


producer = KafkaProducer(bootstrap_Servers='localhost:9092')
future=producer.send('day_two_of_trial', b'hello kafka!' )

try:
    record_metadata = future.get(timeout=10)
    print('Message sebt successfully')
    
except  Exception as e:
    print('Faied to dsend the message:' f"e")