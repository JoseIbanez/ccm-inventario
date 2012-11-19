#!/usr/bin/env python                                          
import pika                                                    
import sys

queue=sys.argv[1]
msg  =sys.argv[2]         
                                                               
connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='mq'))                                     
channel = connection.channel()                                 
                                                               
#channel.queue_declare(queue='hello')                           
                                                               
channel.basic_publish(exchange='',                             
                      routing_key=queue,                     
                      body=msg)                     

print " [x] Sent to %r '%r!'" % (queue,msg)                              

connection.close()
