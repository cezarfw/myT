#!/bin/bash

# INSTALA JENKINS UBUNTU 16.04


echo -e "Forçando IPV4 APT"
echo 'Acquire::ForceIPv4 \"true\";' 2>&1 > /etc/apt/apt.conf.d/99force-ipv4

echo "Adicionando chave do repositório"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
if [ $? != "0" ]
then
   echo -e "Ocorreu erro no processo de adicionar a chave, por favor contate o Admin do sistema"
exit 27 
fi

echo "Adicionando repositório"
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

echo "Atualizando apt"
apt update

echo "Instalando jenkins"
apt install jenkins

systemctl start jenkins
if [ $? == 0 ]
then
   echo "Jenkins iniciado com sucesso"
else
   echo "O serviço não pode ser iniciado, contate o administrador do sistema"
if
