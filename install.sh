#!/data/data/com.termux/files/usr/bin/bash
pkg install wget tar gzip -y

wget http://cli-assets.heroku.com/heroku-linux-arm.tar.gz -O heroku.tar.gz
tar -xvzf heroku.tar.gz
mkdir -p /data/data/com.termux/files/usr/lib/heroku
mv heroku/* /data/data/com.termux/files/usr/lib/heroku
ln -s /data/data/com.termux/files/usr/lib/heroku/bin/heroku /data/data/com.termux/files/usr/bin/heroku
cd /data/data/com.termux/files/usr/lib/heroku/bin/
sed -i 's/#!/#!\/data\/data\/com.termux\/files/g' heroku
pkg install nodejs -y
mv node node.old
ln -s ../../../bin/node node
echo 'export PATH="/data/data/com.termux/files/usr/lib/heroku/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
heroku --version
