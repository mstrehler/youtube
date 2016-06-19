# youtube.sed 
# sed-Script f�r die Anpassung von YouTube-Song-Titeln
# Verwendung mit den Bash-script "youtube.sh". Weitere Infos siehe dort.

# Alles innerhalb Klammern entfernen (1. Zeile runde Klammern, 2. Zeile eckige
# Klammern). In denen von mir stichprobenartig gepr�ften YouTube-Titeln
# traten keine geschweiften oder spitze Klammern auf, so habe ich auf das
# verzichtet.
s/([^)]*)//g
s/\[[^]]*\]//g

# Gross -> Kleinschreibung
s/\([A-Z]\)/\L\1/g

# Einige W�rter und Ausdr�cke abk�rzen resp. F�llw�rter entfernen.
# Allerdings wird bei den F�llw�rtern noch nicht zwischen freistehenden
# W�rtern oder Muster in einem Wort unterschieden.
s/feat/ft/g
s/&//g
s/and//g
s/the//g

# Sonderzeichen durch Underscore ersetzen
s/[ -,\.:]/_/g

# gewisse Sonderzeichen ganz l�schen.
s/[\"\']//g

# Underscore am Ende oder Anfang der Zeile entfernen
s/_$//g
s/^_//g

# �brig gebliebene, doppelte Underscores entfernen.
s/_\+/_/g

