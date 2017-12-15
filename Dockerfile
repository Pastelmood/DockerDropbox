FROM ubuntu:14.04
MAINTAINER Nano Shinonome (NanoShinonome@outlook.com)

# ปิด Interactive Shell
ENV DEBIAN_FRONTEND noninteractive

# อัพเดต Source List
RUN apt-get update

# ติดตั้ง โปรแกรม wget
RUN apt-get install -y wget

# กลับไปที่ root Directory
RUN cd ~

# ดาวน์โหลดตัวติดตั้ง Dropbox แล้วตั้งชื่อว่า SetupDropbox.gz
RUN wget -O SetupDropbox.gz "https://www.dropbox.com/download?plat=lnx.x86_64"

# แตกไฟล์ SetupDropbox.gz และลบไฟล์ทิ้ง
RUN tar xzf SetupDropbox.gz
RUN rm SetupDropbox.gz

# ย้ายเข้าไปใน homefolder ของ root
RUN mv .dropbox-dist /root/

RUN mkdir /root/.dropbox
RUN mkdir /root/Dropbox
RUN chmod 777 /root/.dropbox
RUN chmod 777 /root/Dropbox
RUN chmod 777 /tmp

#RUN ~/.dropbox-dist/dropboxd
#CMD [ "~/.dropbox-dist/dropboxd" ]

WORKDIR /root/Dropbox
VOLUME [ "/root/.dropbox", "/root/Dropbox", "/tmp" ]
ENTRYPOINT [ "/root/.dropbox-dist/dropboxd" ]
