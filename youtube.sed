# youtube.sed 
# sed-Script für die Anpassung von YouTube-Song-Titeln
# Verwendung mit den Bash-script "youtube.sh". Weitere Infos siehe dort.

# Alles innerhalb Klammern entfernen (1. Zeile runde Klammern, 2. Zeile eckige
# Klammern). In denen von mir stichprobenartig geprüften YouTube-Titeln
# traten keine geschweiften oder spitze Klammern auf, so habe ich auf das
# verzichtet.
s/([^)]*)//g
s/\[[^]]*\]//g

# Gross -> Kleinschreibung
s/\([A-Z]\)/\L\1/g

# Einige Wörter und Ausdrücke abkürzen resp. Füllwörter entfernen.
# Allerdings wird bei den Füllwörtern noch nicht zwischen freistehenden
# Wörtern oder Muster in einem Wort unterschieden.
s/feat/ft/g
s/&//g
s/and//g
s/the//g

# Sonderzeichen durch Underscore ersetzen
s/[ -,\.:]/_/g

# gewisse Sonderzeichen ganz löschen.
s/[\"\']//g

# Underscore am Ende oder Anfang der Zeile entfernen
s/_$//g
s/^_//g

# Übrig gebliebene, doppelte Underscores entfernen.
s/_\+/_/g

