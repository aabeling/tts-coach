Dieses Projekt stellt ein kleines Shell-Script bereit, 
welches mir bei der Durchführung von Übungen zur Stärkung der 
Lendenwirbelsäule hilft.     

Das ist die einfachste Möglichkeit für mich gewesen,
um Abläufe von Übungen selber programmieren zu können.    

Es soll mir die Übungen automatisch ansagen und
die Wiederholungen der Übungen timen.

Dafür wird Text-to-Speech verwendet.      
In einer ersten Version wurde espeak verwendet,
welches aber zu roboterhaft ist. Außerdem habe ich dafür keine deutsche Ausgabe gefunden.     
https://github.com/marytts/marytts hat eine bessere Sprachqualität und beinhaltet auch deutsche Stimmen.    
https://github.com/synesthesiam/docker-marytts stellt die marytts als docker-image bereit.

An dem Shell-Script an sich ist dann nichts Besonderes mehr.
