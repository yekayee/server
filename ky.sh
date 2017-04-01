#!/bin/bash

clear
echo -e "# [1] Install Apache2	    -	  [9] Install Subdomain            #"
echo -e "# [2] Install PHP5	    -     [10] Install FTP             	   #"
echo -e "# [3] Install PHP7 	    -     [11] Install SSL  	   	   #"
echo -e "# [4] Install MariaDB	    -     [12] Install NTP   	   	   #"
echo -e "# [5] Configure MariaDB     -	  [13] Install Samba       	   #"
echo -e "# [6] Install Phpmyadmin    -	  [14] Install Mail Server 	   #"
echo -e "# [7] Install CMS	    -     [15] Update	     	   	   #"
echo -e "# [8] Install DNS [Bind9]   -	  [16] Upgrade			   #"

echo -n "Pilih gan:"

read ky;
#apache
if [ $ky == "1" ]; then
	clear
	echo "Mulai Install Apache2"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	 apt-get install apache2 -y
	clear
	echo "Selesai"
	sleep 2
	clear
	./ky.sh
fi
#php5
if [ $ky == "2" ]; then
	clear
	echo "Mulai Install PHP5"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	 apt-get install php5 php5-mysql php5-gd php5-json php5-mcrypt php5-xmlrpc php5-cli php5-intl php5-curl php-pear php5-imagick -y
	clear
	echo "Selesai"
	sleep 2
	clear
	echo "Membuat pengecekkan versi PHP"
	sleep 2	
	clear
	echo -n "Nama folder yang anda buat:"
	read test5
	nano /var/www/html/$test5.php
	sleep 2
	clear
	./ky.sh
fi
#php7
if [ $ky == "3" ]; then
	clear
	echo "Mulai Install PHP7"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	apt-get install php7.0 php7.0-cli php-pear php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0 mcrypt php7.0-mysql php7.0-xmlrpc  -y
	clear
	echo "Selesai"
	clear
        echo "Membuat pengecekkan versi PHP"
        sleep 2 
        clear
        echo -n "Nama folder yang anda buat:"
        read test7
        nano /var/www/html/$test7.php
        sleep 2
        clear
	./ky.sh
fi
#mariadb
if [ $ky == "4" ]; then
	clear
	echo "Mulai Install Maria DB"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	 apt-get install mariadb-server -y
	clear
	echo "Selesai"
	clear
	./ky.sh
fi
#config maria db
if [ $ky == "5" ]; then
	clear
	echo "Mulai Config"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	mysql_secure_installation
	clear
	echo "Selesai"
	clear
	./ky.sh
fi
#phpmyadmin
if [ $ky == "6" ]; then
	clear
	echo "Mulai Install Phpmyadmin"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	 apt-get install phpmyadmin -y
	clear
	echo "Selesai"
	sleep 1
	clear
	./ky.sh
fi
#DNS
if [ $ky == "8" ]; then
	clear
	echo "Mulai install Bind9"
	sleep 5
	clear
	echo "Proses"
	sleep 1
	clear
	 apt-get install bind9 -y
	sleep 2
	clear
	echo "Configure bind9"
	sleep 1
	nano /etc/bind/named.conf.local
	sleep 1
	echo -n "Copy db.local ke :db."
	read db1
	cp /etc/bind/db.local /etc/bind/db.$db1
	sleep 1
	echo -n "Copy db.127 ke :db."
	read db2
	cp /etc/bind/db.127 /etc/bind/db.$db2
	sleep1
	clear
	echo "Configure file $db1"
	sleep 1
	clear
	nano /etc/bind/db.$db1
	sleep 2
	clear
	echo "Configure file $db2"
	nano /etc/bind/db.$db2
	sleep 2
	clear
	echo "Restart bind9"
	/etc/init.d/bind9 restart
	sleep 5
	clear
	echo "Cek NSLOOKUP"
	echo -n "Domain name :"
	read dn1
	echo "nslookup $dn1"
	nslookup $dn1
	sleep 5
	clear
	echo "Mengedit file Resolv"
	nano /etc/resolv.conf
	sleep 2
	clear
	echo "Melihat file Resolv"
	cat /etc/resolv.conf
	sleep 5
	clear
	./ky.sh
fi
#subdomain
if [ $ky == "9" ]; then
	clear
	echo "Mulai membuat folder untuk Portal"
	mkdir /var/www/html/portal
	sleep 5
	clear
	echo "Membuat index portal"
	nano /var/www/html/portal/index.html
	sleep 5
	clear
	echo -n "Copy 000-default ke :"
	read port
	cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$port
	sleep 2
	clear
	echo "Edit file portal"
	nano /etc/apache2/sites-available/$port	
	sleep 3
	clear
	echo "Mengaktifkan situs"
	a2ensite $port
	sleep 2
	clear
	echo "Restart Apache2"
	service apache2 force-reload
	service apache2 restart
	sleep 2
	clear
	./ky.sh
fi
#ftp
if [ $ky == "10" ]; then
	clear
	echo "Mulai install ftp"
	sleep 5
	clear
	echo "Proses"
	sleep 2
	clear
	apt-get install proftpd -y
	sleep 5
	clear
	echo "Configure FTP"
	nano /etc/proftpd/proftpd.conf
	sleep 3
	clear
	echo -n "Adduser :"
	read user
	adduser $user
	echo "Restart FTP"
	/etc/init.d/proftpd restart
	sleep 2
	clear
	./ky.sh
fi
#ssl
if [ $ky == "11" ]; then
	clear
	echo "Masih MAINTENANCE GAN !!!!!!"
	sleep 20
	clear
	#echo "Generate File SSL"
	#openssl req -new -x509 -days 365 -nodes -out /etc/apache2/apache2.pem -keyout /etc/apache2/apache2.pem
	#sleep 2
	#clear
	#echo "Mengaktifkan file SSL"
	#a2enmod ssl
	#sleep 3
	#clear
	#echo "Restart Apache"
	#service apache2 restart
	#sleep 1
	#clear
	#echo "Cek Listen 443"
	#cat /etc/apache2/ports.conf
	#sleep 2
	#clear
	#echo "Mengedit file 000-default.conf"
	#nano /etc/apache2/sites-available/000-default.conf
	#sleep 2
	#clear
	#echo "Restart Apache"
	#service apache2 restart
	#slee3p 1
	#clear
	./ky.sh
fi
#NTP
if [ $ky == "12" ]; then
	clear
	echo "Mulai install NTP"
	sleep 1
	clear
	echo "Proses"
	sleep 1
	clear
	apt-get install ntp ntpdate
	sleep 5
	clear
	echo "Configure NTP"
	sleep 2
	clear
	nano /etc/ntp.conf
	sleep 3
	clear
	echo "Restart NTP"
	sleep 2
	clear
	echo "Mengecek NTP"
	sleep 3
	clear
	ntpq -p
	sleep 2
	clear
	echo "Selesai"
	sleep 1
	clear
	./ky.sh
fi
#samba
if [ $ky == "13" ]; then
	clear
	echo "Mulai install samba"
	sleep 2
	clear
	echo "Proses"
	sleep 2
	clear
	apt-get install samba
	sleep 2
	clear
	echo "Configure samba"
	sleep 2
	clear
	nano /etc/samba/smb.conf
	sleep 2
	clear
	echo -n "Masukan user untuk samba:"
	read pwd
	smbpasswd -a $pwd
	sleep 2
	clear
	echo "Restart samba"
	sleep 2
	clear
	service samba restart
	sleep 2
	clear
	./ky.sh
fi
#mailserver
if [ $ky == "14" ]; then
	clear
	echo "Mulai install postfix courier-pop courier-imap"
	sleep 2
	clear
	echo "Proses"
	sleep 2
	clear
	apt-get install postfix courier-pop courier-imap -y
	sleep 2
	clear
	echo "Membuat folder mail"
	sleep 3
	clear
	maildirmake /etc/skel/Maildir
	sleep 2
	clear
	echo "Configure main.cf"
	sleep 3
	clear
	nano /etc/postfix/main.cf
	sleep 2
	clear
	echo "Reconfigure postfix"
	sleep 2
	clear
	dpkg-reconfigure postfix
	sleep 3
	clear
	echo "Mulai merestart postfix, courier-pop, courier-imap, bind9"
	sleep 2
	clear
	/etc/init.d/postfix restart
	sleep 2
	clear
	/etc/init.d/courier-pop restart
	sleep 2
	clear
	/etc/init.d/courier-imap
	sleep 2
	clear
	/etc/init.d/bind9 restart
	sleep 2
	clear
	echo -n "Masukkan user baru:"
	read usm
	adduser $usm
	sleep 2
	clear
	echo "Memulai install squirrelmail"
	sleep 2
	clear
	echo "Proses"
	sleep 1
	clear
	apt-get install squirrelmail
	sleep 2
	clear
	echo "Configure squirrelmail"
	sleep 2
	clear
	nano /etc/apache2/apache2.conf
	sleep 2
	clear
	echo "Merestart apache2"
	sleep 2
	clear
	service apache2 restart
	sleep 2
	clear	
	echo "Membuat shortcut"
	sleep 2
	clear
	ln -s /usr/share/squirrelmail/ /var/www/html/mail/
	sleep 2
	clear
	echo "Selesai"
	sleep 2
	clear
	./ky.sh
fi	
#update
if [ $ky == "15" ]; then
        clear
        echo "Update Gan !!"
        sleep 1
        clear
		  echo "Proses"
	     sleep 1
		  clear
         apt-get update -y
        clear
        echo "Selesai"
        sleep 1
        clear
        ./ky.sh
fi
#update
if [ $ky == "16" ]; then
        clear
        echo "Upgrade Gan !!"
        sleep 1
        clear
		  echo "Proses"
	     sleep 1
		  clear
         apt-get upgrade-y
        clear
        echo "Selesai"
        sleep 1
        clear
        ./ky.sh
fi
#cms
if [ $ky == "7" ]; then
        clear
        echo "Pilih paket CMS"
        sleep 1
        clear
        echo -e "# [1] Balitbang #"
        echo -e "# [2] Slims #"
	echo -e "# [3] Moodle #"
        echo -n "Pilih Gan:"
fi
read kaye;
#balitbang
if [ $kaye == "1" ]; then
	clear
	echo "Mendapatkan File"
	echo -n "Ditunggu ya gan"

	wget http://download1664.mediafire.com/3r73x1kcsftg/hqcr8x2sa2gallm/downloadrevisi1versi352.zip > /dev/null 2>&1
	sleep 1
	clear
	echo "Unzip file"
	echo -n "Tunggu ya gan"
	unzip downloadrevisi1versi352.zip 
	sleep 5
	clear
        chown -R www-data:www-data /var/www/html/
        chmod  777 /var/www/html
	clear
	echo "Pindah folder"
	 mv revisi\ 3.5.2\ stable\ 1  /var/www/html/
	sleep 5
	clear
	echo "Rename Folder"
	 mv /var/www/html/revisi\ 3.5.2\ stable\ 1 /var/www/html/balitbang
	sleep 5
	echo "Cek File Balitbang"
	 ls /var/www/html/balitbang
	sleep 5
	clear
	echo "Memberikan hak akses"
	chown -R www-data:www-data /var/www/html/balitbang
	chmod -R 755 /var/www/html/balitbang
	sleep 5
	clear
	echo "Penginstallan selesai"
	sleep 5
	clear
	./ky.sh  
fi
#slims
if [ $kaye == "2" ]; then
	clear
	echo "Mendapatkan File"
	echo -n "Ditunggu ya gan"
	wget https://github.com/slims/slims8_akasia/archive/master.zip > /dev/null 2>&1
	sleep 5
	clear
	echo "Unzip File"
	unzip master.zip
	sleep 5
	clear
	echo "Mempindahkan folder"
	 mv slims8_akasia-master /var/www/html/
	sleep 5
	clear
	echo "Mengganti nama folder"
	 mv /var/www/html/slims8_akasia-master /var/www/html/slims8
	sleep 5
	clear
	echo "Memberikan hak akses"
	chown -R www-data:www-data /var/www/html/slims8
	chmod -R 755 /var/www/html/slims8
	sleep 5
	clear
	echo "Penginstallan selesai"
	sleep 5
	clear 
	./ky.sh
fi
#moodle
if [ $kaye == "3" ]; then
        clear
        echo "Pilih Versi Moodle"
        sleep 1
        clear
        echo -e "# [1] Moodle 3.2#"
        echo -e "# [2] Moodle 3.1 #"
        echo -n "Pilih Gan:"
fi
read mod;
#moodle 3.2.
if [ $mod == "1" ]; then
	clear
	echo "Mendapatkan file" 
	echo -n "Ditunggu ya Gan"
	wget http://download1256.mediafire.com/wj1xesj17i6g/ckawbah8uj8t8jr/moodle-latest-32.zip > /dev/null 2>&1
	sleep 10
	clear
	echo "Unzip file"
	unzip moodle-latest-32.zip
	sleep 10
	clear
	echo "Pindah folder"
	 mv moodle /var/www/html/
	sleep 5
	clear	
	echo "Membuat folder data moodle"
	 mkdir /var/www/moodledata
	sleep 5
	clear
	echo "Memberikan hak akses"
	chown -R /var/www/moodledata
	chmod -R 755 /var/www/moodledata
	chown -R /var/www/html/moodle/
	chmod -R 755 /var/www/html/moodle/
	sleep 1
	clear
	echo "Penginstallan Selesai"
	sleep 5
	clear
	./ky.sh	
fi
#moodle 3.1
if [ $mod == "2" ]; then
	clear
	echo "Mendapatkan file" 
	echo -n "Ditunggu ya gan"
	wget http://download1798.mediafire.com/cpzh18r1j8bg/84loe6ie3bp8ohw/moodle-latest-31.zip > /dev/null 2>&1
	sleep 10
	clear
	echo "Unzip file"
	unzip moodle-latest-31.zip
	sleep 10
	clear
	echo "Pindah folder"
	 mv moodle /var/www/html/
	sleep 5
	clear	
	echo "Membuat folder data moodle"
	 mkdir /var/www/moodledata
	sleep 5
	clear
	echo "Memberikan hak akses"
	chown -R /var/www/moodledata
	chmod -R 755 /var/www/moodledata
	chown -R /var/www/html/moodle/
	chmod -R 755 /var/www/html/moodle/
	sleep 1
	clear
	echo "Penginstallan Selesai"
	sleep 5
	clear
	./ky.sh
fi
