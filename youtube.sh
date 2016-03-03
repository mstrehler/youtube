#!/bin/bash
# Script für Download eines YouTube-Videos und Umwandeln in ein ein Sound-File
# (ogg).  Aufruf des des Scripts mit "./youtube <video-url>".

# Name der Datei: mit der Option -e gibt youtube-dl nur den Titel zurück. Der
# String wird dann zu sed "gepipet" um die Leerzeichen in Underscore
# umzuwandeln und mit tr die Gross- in Kleinbuchstaben umzuwandeln.
# videotitel=`youtube-dl -e $1 |sed 's/ /_/g'|tr A-Z a-z`;

# sed liest ein externes Script ein, um die Umwandlung des Titels vorzunehmen.
# Aenderungen werden im Script "youtube.sed" vollzogen.
videotitel=`youtube-dl -e $1 |sed -f youtube.sed`

# Video hinunterladen, ergibt gibt ein mp4-Video-File. In $1 ist das Argument
# des Script-Aufrufes.
youtube-dl -o $videotitel.mp4 $1;

# Audio-Daten aus dem mp4-File extrahieren
avconv -i $videotitel.mp4 -vn $videotitel.ogg;

# Download (mp4) löschen
rm $videotitel.mp4
