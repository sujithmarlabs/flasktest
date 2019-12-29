FROM ubuntu:18.04
RUN apt-get update && apt-get install -y python-pip python-dev vim nginx git wget curl
RUN mkdir /app
ADD flaskpro /app/
ADD ssl /etc/nginx/ssl
ADD default /etc/nginx/sites-available/default
ADD script.sh /root/script.sh
EXPOSE 80 443 5000
RUN chmod +x /root/script.sh
COPY flaskpro/requirements.txt /
RUN pip install -r /requirements.txt
CMD /root/script.sh
