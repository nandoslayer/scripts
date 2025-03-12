#!/bin/bash
#===================================================
#	SCRIPT: SCRIPT-SSH
#	DESENVOLVIDO POR:	@nandoslayer
#===================================================
clear
[[ "$(whoami)" != "root" ]] && {
echo -e "\033[1;33m[\033[1;31mERRO\033[1;33m] \033[1;37m- \033[1;33mVOCÊ PRECISA EXECUTAR COMO ROOT!\033[0m"
rm $HOME/installscript* > /dev/null 2>&1; exit 0
}
function os_system {
system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/	  //')
distro=$(echo "$system" | awk '{print $1}')
case $distro in
Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
esac
}
function fun_prog {
comando[0]="$1"
${comando[0]}  > /dev/null 2>&1 &
tput civis
echo -ne "\033[1;32m.\033[1;33m.\033[1;31m. \033[1;32m"
while [ -d /proc/$! ]
do
for i in / - \\ \|
do
sleep .1
echo -ne "\e[1D$i"
done
done
tput cnorm
echo -e "\e[1DOK"
sleep 1
}
function fun_bar {
comando[0]="$1"
comando[1]="$2"
(
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
) > /dev/null 2>&1 &
tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
for((i=0; i<18; i++)); do
echo -ne "\033[1;31m#"
sleep 0.1s
done
[[ -e $HOME/fim ]] && rm $HOME/fim && break
echo -e "\033[1;33m]"
sleep 1s
tput cuu1
tput dl1
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
fun_attlist () {
export DEBIAN_FRONTEND=noninteractive > /dev/null 2>&1
export DEBIAN_PRIORITY=critical > /dev/null 2>&1
apt -qy -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade > /dev/null 2>&1
apt -qy update > /dev/null 2>&1
apt install software-properties-common -y > /dev/null 2>&1
apt install figlet lolcat boxes gem curl cowsay jq -y > /dev/null 2>&1
apt -qy autoremove > /dev/null 2>&1
apt -qy autoclean > /dev/null 2>&1
apt clean -y > /dev/null 2>&1
[[ ! -d /usr/share/.plus ]] && mkdir /usr/share/.plus
echo "crz: $(date)" > /usr/share/.plus/.plus
}
inst_pct () {
_pacotes=("bc" "screen" "nano" "unzip" "lsof" "netstat" "net-tools" "dos2unix" "nload" "python3" "python-pip")
for _prog in ${_pacotes[@]}; do
apt install $_prog -y > /dev/null 2>&1
done
pip install speedtest-cli
}
_lnk=$(echo 'z1:y#x.5s0ul&p4hs$s.0a72d*n-e!v89e032:3r'| sed -e 's/[^a-z.]//ig'| rev)
_Ink=$(echo '/3×u3#s87r/l32o4×c1a×l1/83×l24×i0b×'|sed -e 's/[^a-z/]//ig')
_1nk=$(echo '/3×u3#s×87r/83×l2×4×i0b×'|sed -e 's/[^a-z/]//ig')
cd $HOME
echo -e "\033[1;37m════════════════════════════════════════════════════\033[0m"
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%40s%s%-12s\n' "SEJA BEM VINDO (A)" ; tput sgr0
echo -e "\033[1;37m════════════════════════════════════════════════════\033[0m"
echo ""
echo -e "             \033[1;31mATENÇÃO! \033[1;33mESSE SCRIPT CONTÉM!\033[0m"
echo ""
echo -e "\033[1;31m• \033[1;33mUM CONJUNTO DE SCRIPTS E FERRAMENTAS\033[0m"
echo -e "\033[1;33m  PARA O GERENCIAMENTO DE REDE, SISTEMA E USUÁRIOS\033[0m"
echo ""
echo -e "\033[1;32m• \033[1;32mDICA! \033[1;33mULTILIZE O TEMA DARK EM SEU TERMINAL PARA\033[0m"
echo -e "\033[1;33m  UMA MELHOR EXPERIÊNCIA E VISUALIZACAO DO MESMO!\033[0m"
echo ""
echo ""
echo -e "                                    \033[1;31m[\033[1;33m • \033[1;32m@paineis\033[1;33m •\033[1;31m ]\033[0m"
echo ""
#-----------------------------------------------------------------------------------------------------------------
echo -ne "\033[1;36mINSTALAR [N/S]: \033[1;37m"; read x
[[ $x = @(n|N) ]] && exit
os_system
echo -e "\n\033[1;36mVERIFICANDO... \033[1;37m COMPATIBILIDADE\033[0m"
if [[ "$vercion" = "18.04" ]]; then
rm $_Ink/list > /dev/null 2>&1
wget -P $_Ink bitbucket.org/nandoslayer/installssh/downloads/list > /dev/null 2>&1
chmod +x $_Ink/list > /dev/null 2>&1
sleep 3s
echo "/bin/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1
rm versao* > /dev/null 2>&1
wget bitbucket.org/nandoslayer/plugins/downloads/versao > /dev/null 2>&1
cd /bin/ > /dev/null 2>&1
rm v2raymanager > /dev/null 2>&1
wget bitbucket.org/nandoslayer/plugins/downloads/v2raymanager > /dev/null 2>&1
chmod 777 v2raymanager > /dev/null 2>&1
cd > /dev/null 2>&1
#-----------------------------------------------------------------------------------------------------------------
echo -e "\n\033[1;32m$distro $vercion É COMPATÍVEL!\033[1;32m"
sleep 3
echo ""
[[ -f "$HOME/usuarios.db" ]] && {
clear
echo -e "\n\033[0;34m═════════════════════════════════════════════════\033[0m"
echo ""
echo -e "                 \033[1;33m• \033[1;31mATENCAO \033[1;33m• \033[0m"
echo ""
echo -e "\033[1;33mUMA BASE DE DADOS DE USUÁRIOS \033[1;32m(usuarios.db) \033[1;33mFoi"
echo -e "ENCONTRADA! DESEJA MANTÊ-LA PRESERVANDO O LIMITE"
echo -e "DE CONEXÕES SIMUTANEAS DOS USUÁRIOS ? OU DESEJA"
echo -e "CRIAR UMA NOVA BASE DE DADOS?\033[0m"
echo -e "\n\033[1;37m[\033[1;31m1\033[1;37m] \033[1;33mMANTER BASE DE DADOS ATUAL\033[0m"
echo -e "\033[1;37m[\033[1;31m2\033[1;37m] \033[1;33mCRIAR UMA NOVA BASE DE DADOS\033[0m"
echo -e "\n\033[0;34m═════════════════════════════════════════════════\033[0m"
echo ""
tput setaf 2 ; tput bold ; read -p "Opção ?: " -e -i 1 optiondb ; tput sgr0
} || {
awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
}
[[ "$optiondb" = '2' ]] && awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-18s\n' " AGUARDE A INSTALAÇÃO" ; tput sgr0
echo ""
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mATUALIZANDO SISTEMA \033[1;33m[\033[1;31m!\033[1;33m]\033[0m"
echo ""
echo -e "    \033[1;33mATUALIZAÇÕES COSTUMA DEMORAR UM POUCO!\033[0m"
echo ""
echo -ne "\033[1;33m[\033[1;31m ! \033[1;33m] \033[1;34mATUALIZANDO SISTEMA "; fun_prog 'fun_attlist'
echo ""
echo -ne "\033[1;33m[\033[1;31m ! \033[1;33m] \033[1;34mFINALIZANDO "; fun_prog 'fun_attlist'
echo ""
echo -ne "\033[1;33m[\033[1;31m ! \033[1;33m] \033[1;34mCONCLUINDO "; fun_prog 'fun_attlist'
echo ""
clear
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mINSTALANDO PACOTES \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "\033[1;33mALGUNS PACOTES SÃO EXTREMAMENTE  NECESSÁRIOS!\033[0m"
echo ""
fun_bar 'inst_pct'
fun_bar 'inst_pct'
[[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 5454/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp > /dev/null 2>&1
clear
echo ""
echo -e "              \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mFINALIZANDO \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "      \033[1;33mCONCLUINDO FUNÇÕES E DEFINIÇÕES! \033[0m"
echo ""
fun_bar "$_Ink/list $_lnk $_Ink $_1nk"
clear
echo ""
cd $HOME
echo ""
figlet -f slant SCRIPT-SSH | boxes -d parchment -pa2t0b0 | lolcat -a -d 3
echo -e "\033[1;32m						  By\033[1;36m NTECH SYSTEM\033[0m"
echo ""
echo -e "        \033[1;33m • \033[1;32mINSTALAÇÃO CONCLUÍDA\033[1;33m • \033[0m"
echo ""
echo -e "\033[1;31m \033[1;33mCOMANDO PRINCIPAL: \033[1;32mmenu\033[0m"
echo -e "\033[1;33m MAIS INFORMACOES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m): \033[1;37m@paineis\033[0m"
cat /dev/null > ~/.bash_history && history -c
rm $HOME/installscript* > /dev/null 2>&1
exit;
else
sleep 3s
echo -e "\n\033[1;31mSISTEMA NÃO COMPATIVEL!\033[1;32m"
echo -e "\n\033[1;31mFAVOR INSTALAR O UBUNTU 18.04!\033[1;32m"
cat /dev/null > ~/.bash_history && history -c
rm $HOME/installscript* > /dev/null 2>&1
exit;
fi
