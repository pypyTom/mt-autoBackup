:log info "rozpoczecie tworzenie binarnej kopi zapasowej";
#ustalenie bierzacej daty
:local currentDate [/system clock get date];
:local currentTime [/system clock get time];
#tworzenie kopi z data w nazwie
:local backupName ("backup_Date" . $currentDate . "time" . $currentTime . ".backup")
/system backup save name=$backupName;

#przerwa
:delay 10s;

:log info "rozpoczynam wysylanie kopi na maila"

#ustalnie nazwy routeta
:local  routerName [/system identity get name]

#tytul maila 
:local   emailSubject ("Kopia z " . $routerName . "z dnia" . $currentDate );

#wyslanie maila 
/tool e-mail send to ="trmarketingseo@gmial.pl" subject=$emailSubject file=$backupName body="kopia zapasowa pozdrawiam"
:log info "Zokonczone wysylanie"