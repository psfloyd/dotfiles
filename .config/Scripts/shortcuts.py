import csv
import os

home = os.getenv("HOME");
os.chdir(home);

# qute = ""
rang = ""
alsh = ""

# with open(".config/qutebrowser/keys.conf.base") as qb:
    # qute+=qb.read()
with open(".config/ranger/rc.conf.base") as rg:
    rang+=rg.read()
with open(".config/Scripts/aliases_sh.base") as ash:
    alsh+=ash.read()

rang+=("# cd Aliases{{{"+"\n")
alsh+=("# cd Aliases{{{"+"\n")
with open(".config/Scripts/folders") as fold:
    for line in csv.reader(fold, dialect="excel-tab"):
        # Adds the qutebrowser downloads commands:
        # qute+="set storage download-directory "+line[1]+" ;; hint links download\n\t;"+line[0]+"\n"
        #Adds the ranger go, tab, move and yank commands:
        line1Nospace = line[1].replace(" ", "\ ")
        rang+=("map g"+line[0]+" cd "+line[1]+"\n")
        rang+=("map t"+line[0]+" chain tab_new; cd "+line[1]+"\n")
        rang+=("map m"+line[0]+" shell mv %s "+line1Nospace +"\n")
        rang+=("map Y"+line[0]+" shell cp -r %s "+line1Nospace+"\n")
        #Adds the alsh shortcuts:
        alsh+=("alias cd"+line[0]+"=\"cd "+line[1]+" && ls -a\"\n")

rang+=("# }}}"+"\n"+"\n")
alsh+=("# }}}"+"\n"+"\n")
#Goes thru the config file file and adds the shortcuts to both alsh and ranger.

rang+=("# Config Aliases{{{"+"\n")
alsh+=("# Config Aliases{{{"+"\n")

with open(".config/Scripts/configs") as conf:
    for line in csv.reader(conf, dialect="excel-tab"):
        rang+=("map "+line[0]+" shell vim "+line[1]+"\n")
        alsh+=("alias "+line[0]+"=\"vim "+line[1]+"\"\n")

rang+=("# }}}"+"\n"+"\n")
alsh+=("# }}}"+"\n"+"\n")

# with open(".config/qutebrowser/keys.conf","w") as outqb:
    # outqb.write(qute)
with open(".config/ranger/rc.conf", "w") as outrang:
    outrang.write(rang)
with open(".aliases_sh","w") as outalsh:
    outalsh.write(alsh)
