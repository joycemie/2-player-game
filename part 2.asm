;; This program (Hangman game) reads a word entered by the player,
;; then reads a single letter and prints the guessed
;; letter in the correct spod if the letter is in that word
;; Total chance = 6


addi $10, $0, 0xa       ; ASCII for newline
addi $12, $0, 0x5f      ; ASCII for "_"
addi $6, $0, 6          ; chance = 6
addi $15, $0, 1     
addi $16, $0, 0x57      ; ASCII for W
addi $17, $0, 0x4c      ; ASCII for L
addi $18, $0, 4     
lis $4
.word 0xFFFF0004
lis $7
.word input

loopin:
lw $5, 0($4)            ; read input
addi $13, $3, 0         ; count # of input char
beq $5, $10, zero       ; if read newline, stop
addi $3, $3, 1          ; count # of letters in the word 
sw $5, 0($7)            ; save to array
addi $7, $7, 4          ; next item position
beq $0, $0, loopin

zero:
addi $7, $7, 4          ; next item position
sw $0, 0($7)            ; letter that haven't guessed correctly -> 0
addi $3, $3, -1
bne $3, $0, zero
addi $14, $0, input     
mult $13, $18           ; # of letters * 4
mflo $19                
add $14, $14, $19       ; save the array that indicate if guessed correctly
addi $19, $0, 0         
addi $8, $0, input      ; save the address of word array
beq $0, $0, startg

startg:
addi $3, $13, 0         ; # of letters in the word 
addi $19, $14, 0        ; save the array that indicate if guessed correctly
addi $8, $0, input
lw $5, 0($4)            ; char that player guess
lw $11, 0($4)           ; read newline char
addi $6, $6, -1         ; chance - 1
beq $0, $0, guess

guess:
lw $9, 0($8)            ; load correct letter
lw $11, 0($19)          ; load if guessed correctly value (1: yes, 0: no)
beq $11, $15, equal     ; if guessed correctly before -> print letter
bne $9, $5, notequal    ; do not guess correctly before & this time 
addi $20, $20, 1        ; correctly guessed: guessed # += 1
beq $0, $0, equal

equal:
lis $11
.word 0xffff000c        
sw $9, 0($11)           ; print correct letter
sw $15, 0($19)          ; guessed correctly value = 1
addi $19, $19, 4        ; next letter position
addi $8, $8, 4
addi $3, $3, -1         ; # of letter need to check -1
beq $3, $0, guessend
bne $3, $0, guess

notequal:
lis $11
.word 0xffff000c
sw $12, 0($11)          ; print "_"
addi $19, $19, 4        ; next letter position
addi $8, $8, 4
addi $3, $3, -1         ; # of letter need to check -1
beq $3, $0, guessend
bne $3, $0, guess

guessend:
lis $11
.word 0xffff000c
sw $10, 0($11)          ; print newline char
slt $21, $20, $13       ; compare total # of letter and guessed letter
bne $21, $15, 3         ; if guessed all, jump to result
bne $6, $0, startg      ; still have chance, loop
sw $17, 0($11)          ; print "L"
beq $0, $0, 1           ; loss condition
sw $16, 0($11)          ; win condition: print "W"
sw $10, 0($11)          ; print newline char
jr $31

input:

