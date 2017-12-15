FROM ubuntu:14.04
MAINTAINER Nano Shinonome (NanoShinonome@outlook.com)

# ปิด Interactive Shell
ENV DEBIAN_FRONTEND noninteractive




# อัพเดต Source List
RUN apt-get update

# ติดตั้ง โปรแกรม wget
RUN apt-get install -y wget

RUN useradd -m -s /bin/bash -p '*' dropbox

USER dropbox

# กลับไปที่ root Directory
RUN cd /home/dropbox

# ดาวน์โหลดตัวติดตั้ง Dropbox แล้วตั้งชื่อว่า SetupDropbox.gz
#RUN wget -O SetupDropbox.gz "https://www.dropbox.com/download?plat=lnx.x86_64"

RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# แตกไฟล์ SetupDropbox.gz และลบไฟล์ทิ้ง
#RUN tar xzf SetupDropbox.gz
#RUN rm SetupDropbox.gz

# ย้ายเข้าไปใน homefolder ของ root
# RUN mv .dropbox-dist /home/dropbox

RUN mkdir /home/dropbox/.dropbox
RUN mkdir /home/dropbox/Dropbox

WORKDIR /home/dropbox/Dropbox
VOLUME [ "/home/dropbox/.dropbox", "/home/dropbox/Dropbox", "/tmp" ]
ENTRYPOINT [ "/home/dropbox/.dropbox-dist/dropboxd" ]
