.data 
msga : .asciiz "Donnez A : :"
msgb : .asciiz "Donnez B :"
msgpgcd : .asciiz "Le PGCD de A et B est : "
espace : .asciiz "\n"
.text 
#Afficher msga
li $v0,4
la $a0,msga
syscall 
#Lire A
li $v0,5
syscall 
#Mettre A dans t1
move $t1,$v0 
#Afficher msgb
li $v0,4
la $a0,msgb
syscall 
#Lire B 
li $v0,5
syscall 
#Mettre B dans t2
move $t2,$v0
#Logique
# Si A=B alors leur pgcd est egal à leur valeur donc on affiche un des deux
beq $t1,$t2,egal
#Si non on repete
repeter :
#Si A>B
bgt $t1,$t2,cas1
#Si non si B>A
blt $t1,$t2,cas2
#Quand A=B ca veut dire qu'on a trouvé le pgcd
beq $t1,$t2,egal
#A=A-B
cas1 : 
sub $t1,$t1,$t2
b repeter
#B=B-A
cas2 :
sub $t2,$t2,$t1
b repeter
#Le branchement qui affiche le resultat
egal :
#saut de ligne
li $v0,4
la $a0,espace
syscall
#afficher msgpgcd
li $v0,4
la $a0,msgpgcd
syscall 
#afficher Le PGCD
li $v0,1
move $a0,$t1
syscall
