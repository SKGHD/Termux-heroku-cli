#!/data/data/com.termux/files/usr/bin/bash
pkg install wget tar gzip -y

mkdir heroku
wget http://cli-assets.heroku.com/heroku-linux-arm.tar.gz -O heroku.tar.gz
tar -xvzf heroku.tar.gz -C heroku
mkdir -p /data/data/com.termux/files/usr/lib/heroku
mv heroku/* /data/data/com.termux/files/usr/lib/heroku
ln -s /data/data/com.termux/files/usr/lib/heroku/bin/heroku /data/data/com.termux/files/usr/bin/heroku
cd /data/data/com.termux/files/usr/lib/heroku/bin/
sed -i 's/#!/#!\/data\/data\/com.termux\/files/g' heroku
pkg install nodejs -y
cd /data/data/com.termux/files/usr/lib/heroku/bin
mv node node.old
ln -s ../../../bin/node node
echo 'export PATH="/data/data/com.termux/files/usr/lib/heroku/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
heroku login -i
