FROM python:3
RUN useradd -ms /bin/bash ec2power
USER ec2power
ENV TZ=Europe/Kiev
WORKDIR /home/ec2power

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir .aws
COPY .aws /home/ec2power/.aws/
COPY ec2-power.py ./
USER root
RUN chown ec2power:ec2power ec2-power.py
USER ec2power

CMD [ "python", "ec2-power.py" ]