#!/usr/bin/env python
import pika
import subprocess

queue= 'wget'
script='./wget.sh'


connection = pika.BlockingConnection(pika.ConnectionParameters(
                                     host='mq'))
channel = connection.channel()

#channel.queue_declare(queue='hello')

print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)
    subprocess.call([script, body])
    ch.basic_ack(delivery_tag = method.delivery_tag)
    
    
channel.basic_qos(prefetch_count=1)

channel.basic_consume(callback,
                      queue=queue)

channel.start_consuming()
