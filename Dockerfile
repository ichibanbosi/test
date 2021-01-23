FROM python:2.7.18


#ENV PORT 8080
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN apt-get -y update


RUN apt-get install -y gdal-bin
RUN apt-get install -y gdal-bin
RUN apt-get install -y proj-bin
RUN apt-get install -y libgdal-dev
RUN apt-get install -y libproj-dev
RUN apt-get install -y build-essential
RUN apt-get install -y python3-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y gcc zlib1g-dev
RUN apt-get install -y libgeos-dev python-lxml libgdal-dev python-shapely
RUN apt-get install -y build-essential python-dev libjpeg-dev
RUN apt-get install -y zlib1g-dev libfreetype6-dev


#COPY requirements.txt /tmp
#WORKDIR /tmp
RUN python -m pip install -r requirements.txt --no-cache-dir
#RUN pip install --no-cache-dir -r requirements.txt
RUN pip install MapProxy
RUN mapproxy-util create -t base-config /usr/src/app/mymapproxy

#COPY domap.sh /
ADD domap.sh /usr/src/app/domap.sh
RUN chmod 0755 domap.sh
#WORKDIR /
#RUN ./domap.sh
RUN p = $PORT
CMD [ "./domap.sh" ]
#CMD [ "python", "./domap.sh" ]
