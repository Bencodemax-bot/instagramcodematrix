# Não copie o código sem créditos
# Leia a LICENÇA primeiro.
string4 = $ ( openssl rand -hex 32 | cut -c 1-4 )
string8 = $ ( openssl rand -hex 32   | cut -c 1-8 )
string12 = $ ( openssl rand -hex 32 | cut -c 1-12 )
string16 = $ ( openssl rand -hex 32 | cut -c 1-16 )
device = " Android- $ String16 "
uuid = $ ( openssl rand -hex 32 | cut -c 1-32 )
telefone = " $ string8 - $ string4 - $ string4 - $ string4 - $ string12 "
guid = " $ string8 - $ string4 - $ string4 - $ string4 - $ string12 "
header = ' Connection: "close", "Accept": "* / *", "Content-type": "application / x-www-form-urlencoded; charset = UTF-8", "Cookie2": "$ Versão = 1 "" Accept-Language ":" en-US "," User-Agent ":" Instagram 10.26.0 Android (18 / 4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US) " '
var = $ ( curl -i -s -H " $ header " https://i.instagram.com/api/v1/si/fetch_headers/ ? challenge_type = signup & guid = $ uuid  > / dev / null )
var2 = $ ( echo $ var  | grep -o ' csrftoken =. * '  | cut -d ' ; ' -f1 | cut -d ' = ' -f2 )
ig_sig = " 4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178 "

Claro

banner () {
echo  " "
echo -e " \ e [1; 91m ═╦═ \ e [1; 92m┌─┐ ┌┌──┐ \ e [1; 91m╔══╗ \ e [1; 92m┌──┐┬ ┬ ┌ ──┐┬ ┬ ┬ "
echo -e " \ e [1; 91m ║ \ e [1; 92m│ │ ││ \ e [1; 91m║ \ e [1; 92m│ ││ │ │ ││ │ │ "
echo -e " \ e [1; 91m ║ \ e [1; 92m│ │ │└──┐ \ e [1; 91m╠═╣ \ ​​e [1; 92m│ ││ │ │ ││ │ │ "
echo -e " \ e [1; 91m ║ \ e [1; 92m┘ └─┘└──┘ \ e [1; 91m║ \ e [1; 92m└──┘┴──┘┴──┘ └──┘└─┴─┘ "
echo -e " \ e [1; 91m ═╩═ \ e [1; 92m \ e [1; 91m╩ "
echo  " "
echo -e " \ e [1; 91m [+] YouTube: \ e [1; 92mTermuxProfessorYT "
echo -e " \ e [1; 91m [+] Github: \ e [1; 92mtermuxprofessor "
echo -e " \ e [1; 91m [+] Instagram: \ e [1; 92mtermuxprofessor \ e [1; 97r "
echo  " "

}

login_user () {


if [[ $ user  ==  " " ]] ;  então
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m * \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Login \ e [0m \ n "
ler -p $ ' \ e [1; 31m [ \ e [0m \ e [1; 77m + \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Nome de usuário: \ e [0m ' do utilizador
fi

if [[ -e cookie. $ user ]] ;  então

printf  " \ e [1; 31m [\ e [0m \ e [1; 77m * \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Cookies encontrados para o usuário \ e [0m \ e [1; 77m% s \ e [0m \ n "  $ usuário

default_use_cookie = " Y "

ler -p $ ' \ e [1; 31m [ \ e [0m \ e [1; 77m + \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Usar? \ e [0m \ e [1; 77m [Y / n] \ e [0m ' use_cookie

use_cookie = " $ {use_cookie : - $ {default_use_cookie} } "

if [[ $ use_cookie  ==  * ' Y ' *  ||  $ use_cookie  ==  * ' y ' * ]] ;  então
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m * \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Usando credenciais salvas \ e [0m \ n "
outro
rm -rf cookie. $ user
login_user
fi


outro

leia -p $ ' \ e [1; 31m [ \ e [0m \ e [1; 77m * \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Senha: \ e [0m ' passar
printf  " \ n "
data = ' {"phone_id": " ' $ phone ' ", "_csrftoken": " ' $ var2 ' ", "username": " ' $ user ' ", "guid": " ' $ guid ' ", "device_id ":" ' $ device ' "," password ":" ' $ pass ' "," login_attempt_count ":" 0 "} '

IFS = $ ' \ n '

hmac = $ ( echo -n " $ data "  | openssl dgst -sha256 -hmac " $ {ig_sig} "  | cut -d "  " -f2 )
useragent = ' User-Agent: "Instagram 10.26.0 Android (18 / 4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)" '

printf  " \ e [1; 77m [\ e [0m \ e [1; 92m + \ e [0m \ e [1; 77m] Tentando fazer login como \ e [0m \ e [1; 93m% s \ e [0m \ n "  $ usuário
IFS = $ ' \ n '
var = $ ( curl -c cookie. $ user -d " ig_sig_key_version = 4 & signed_body = $ hmac . $ data " -s --user-agent ' User-Agent: "Instagram 10.26.0 Android (18 / 4.3; 320dpi; 720x1280 ; Xiaomi; HM 1SW; armani; qcom; en_US) " ' -w " \ n% {http_code} \ n " -H " $ header "  " https://i.instagram.com/api/v1/accounts/login / "  | grep -o " logging_in_user \ | desafio \ | muitas tentativas \ | Aguarde "  | uniq ) ; 
if [[ $ var  ==  " desafio " ]] ;  então  printf  " \ e [1; 93m \ n [!] Desafio necessário \ n "  ;  saída 1 ;  elif [[ $ var  ==  " logging_in_user " ]] ;  então  printf  " \ e [1; 92m \ n [+] Login bem-sucedido \ n "  ;  elif [[ $ var  ==  " Por favor, aguarde " ]] ;  em seguida,  echo  " Por favor, aguarde " ; 

else  printf  " \ e [1; 91m \ n [-] Erro ao acessar sua conta do Instagram \ n " ;
     printf  " \ e [1; 91m \ n [*] Verifique suas credenciais de login \ n " ;
saída 1 ;

fi ;

fi

}


boost_followers () {

printf  " \ e [1; 77m [\ e [0m \ e [1; 31m + \ e [0m \ e [1; 77m] Esta técnica consiste em seguir / desenrolar celebgramas \ e [0m \ n "
printf  " \ e [1; 77m [\ e [0m \ e [1; 31m + \ e [0m \ e [1; 77m] Pode aumentar seus seguidores até cerca de +30 em 1 hora \ e [0m \ n "
printf  " \ e [1; 77m [\ e [0m \ e [1; 31m + \ e [0m \ e [1; 77m] \ e [0m \ e [1; 93m Pressione Ctrl + C para parar \ e [0m \ n "
dormir 5

username_id = $ ( curl -L -s ' https://www.instagram.com/ ' $ user ' '  > getid && grep -o   ' profilePage_ [0-9] *. ' getid | cut -d " _ " - f2 | tr -d ' " ' )

selena = " 460563723 "
neymar = " 26669533 "
ariana = " 7719696 "
beyonce = " 247944034 "
cristiano = " 173560420 "
kimkardashian = " 18428658 "
kendall = " 6380930 "
therock = " 232192182 "
kylie = " 12281817 "
jelopez = " 305701719 "
messi = " 427553890 "

dualipa = " 12331195 "
mileycyrus = " 325734299 "
shawnmendes = " 212742998 "
katyperry = " 407964088 "
charlieputh = " 7555881 "
lelepons = " 177402262 "
camila_cabello = " 19596899 "
madonna = " 181306552 "
leonardodicaprio = " 1506607755 "
ladygaga = " 184692323 "
taylorswift = " 11830955 "
instagram = " 25025320 "


if [[ !  -e celeb_id]] ;  então
printf  " % s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n % s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n% s \ n "  $ dualipa  $ mileycyrus  $ Shawn Mendes  $ KatyPerry  $ Charlie Puth  $ lelepons  $ camila_cabello  $ madonna  $ Leonardo DiCaprio  $ ladygaga  $ taylorswift  $ instagram  $ neymar  $ selena  $ ariana  $ beyonce  $ cristiano  $ kimkardashian  $ Kendall  $ therock  $ Kylie  $ jelopez  $ messi  > celeb_id
fi

while [[ true ]] ;  Faz


para  celebridades  em  $ ( cat celeb_id ) ;  Faz

data = ' {"_uuid": " ' $ guid ' ", "_uid": " ' $ username_id ' ", "user_id": " ' $ celeb ' ", "_csrftoken": " ' $ var2 ' "} '
hmac = $ ( echo -n " $ data "  | openssl dgst -sha256 -hmac " $ {ig_sig} "  | cut -d "  " -f2 )
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m + \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Tentando seguir celebgram% s ... "  $ celeb

check_follow = $ ( curl -s -L -b cookie. $ user -d " ig_sig_key_version = 4 & signed_body = $ hmac . $ data " -s --user-agent ' User-Agent: "Instagram 10.26.0 Android (18 / 4.3 ; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US) " ' -w " \ n% {http_code} \ n " -H " $ header "  " https://i.instagram.com/api/v1 / amizade / criar / $ celeb / "  | grep -o ' " seguinte ": verdadeiro ' )

if [[ $ check_follow  ==  " " ]] ;  então
printf  " \ n \ e [1; 93m [!] Erro \ n "
printf  " \ n \ e [1; 93m [!] Você atingiu o limite de seguidores e paragens de hoje \ n "
printf  " \ n \ e [1; 93m [8] Para resolver este erro não siga ou pare de seguir ninguém no instagram por 24 horas, execute este script novamente e ele funcionará \ n "
saída 1
outro
printf  " \ e [1; 92mOK \ e [0m \ n "
fi

dormir 3

feito
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m + \ e [0m \ e [1; 31m] \ e [0m \ e [1; 77m Dormindo 60 segundos ... \ e [0m \ n "
dormir 60
# deixar de seguir
para  celebridades  em  $ ( cat celeb_id ) ;  Faz
data = ' {"_uuid": " ' $ guid ' ", "_uid": " ' $ username_id ' ", "user_id": " ' $ celeb ' ", "_csrftoken": " ' $ var2 ' "} '
hmac = $ ( echo -n " $ data "  | openssl dgst -sha256 -hmac " $ {ig_sig} "  | cut -d "  " -f2 )
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m + \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Tentando deixar de seguir o celebgram% s ... "  $ celeb
check_unfollow = $ ( curl -s -L -b cookie. $ user -d " ig_sig_key_version = 4 & signed_body = $ hmac . $ data " -s --user-agent ' User-Agent: "Instagram 10.26.0 Android (18 / 4.3 ; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US) " ' -w " \ n% {http_code} \ n " -H " $ header "  " https://i.instagram.com/api/v1 / amizade / destruir / $ celeb / "  | grep -o ' " seguinte ": falso '  ) 

if [[ $ check_unfollow  ==  " " ]] ;  então
printf  " \ n \ e [1; 93m [!] Erro, parando para evitar bloqueio \ n "
saída 1
outro
printf  " \ e [1; 92mOK \ e [0m \ n "
fi

dormir 3
feito
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m + \ e [0m \ e [1; 31m] \ e [0m \ e [1; 77m Dormindo 60 segundos ... \ e [0m \ n "
dormir 60


feito


}

menu () {

printf  " \ n "
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m01 \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Aumento de Seguidores \ e [0m \ n "
printf  " \ e [1; 31m [\ e [0m \ e [1; 77m02 \ e [0m \ e [1; 31m] \ e [0m \ e [1; 93m Saída \ e [0m \ n "
printf  " \ n "


leia -p $ '  \ e [1; 31m [ \ e [0m \ e [1; 77m :: \ e [0m \ e [1; 31m] \ e [0m \ e [1; 77m Escolha uma opção: \ e opção [0m '

if [[ $ opção  -eq 1]] ;  então
login_user
aumentar_ seguidores

elif [[ $ opção  -eq 2]] ;  então
Claro
Saída

outro

printf  " \ e [1; 93m [!] Opção inválida! \ e [0m \ n "
dormir 2
cardápio

fi
}


bandeira
cardápio
