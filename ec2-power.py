import boto3
import schedule
import time

ec2_client = boto3.client('ec2', region_name='eu-north-1')

instance_ids = []


def ec2_stop():
    ec2_client.stop_instances(InstanceIds=instance_ids)


def ec2_start():
    ec2_client.start_instances(InstanceIds=instance_ids)


schedule.every().day.at("22:00").do(ec2_stop)
schedule.every().day.at("08:00").do(ec2_start)

while True:
    schedule.run_pending()
    time.sleep(1)
