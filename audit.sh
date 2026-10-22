#!/bin/bash

clear

echo "================================================="
echo "               LINUX AUDIT REPORT"
echo "================================================="
echo

echo "Data/Hora : $(date '+%d/%m/%Y %H:%M:%S')"
echo

echo "[ SISTEMA ]"
echo "Hostname : $(hostname)"
echo "Usuário  : $(whoami)"
echo "Kernel   : $(uname -r)"
echo "Uptime   : $(uptime -p | sed 's/up //')"

echo
echo "-------------------------------------------------"

echo
echo "[ MEMÓRIA ]"
free -h | awk '/Mem:/{
print "Total    : "$2
print "Usado    : "$3
print "Livre    : "$4
}'

echo
echo "-------------------------------------------------"

echo
echo "[ DISCO ]"
df -h / | awk 'NR==2{
print "Partição : "$6
print "Tamanho  : "$2
print "Usado    : "$3
print "Livre    : "$4
print "Uso      : "$5
}'

echo
echo "-------------------------------------------------"

echo
echo "[ REDE ]"
echo "IP(s)    : $(hostname -I)"

echo
echo "-------------------------------------------------"

echo
echo "[ PORTAS ABERTAS ]"
ss -tuln | tail -n +2

echo
echo "-------------------------------------------------"

echo
echo "[ USUÁRIOS LOGADOS ]"
who

echo
echo "================================================="
echo "Fim do relatório."
echo "================================================="
