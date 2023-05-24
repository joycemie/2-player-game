;; Print the state of the game after one guess, where if the guessed letter appears
;; in the word then it is printed in its correct spots, otherwise a underscore is printed
;; in the place of the letter in the word, after a newline character.
;; Registers: 
;;         $1 -> address of standard input
;;         $2 -> address of standard output
;;         $3 -> ASCII code of a NF character
;;         $4 -> ASCII code of _ character
;;         $5 -> single character input
;;         $6 -> the length of the word
;;         $7 -> single character input
;;         $8 -> the copy of the length of the word
;;         $9 -> the copy of the length of the word
         lis $1
         .word 0xffff0004   ;standard input
         lis $2
         .word 0xffff000c   ;standard output 
         addi $3, $0, 0xA   ;a NF character ASCII code
         addi $4, $0, 0x5F  ;_ character ASCII code
         addi $6, $6, 0     ;character count
   ;;read the string from the keyboard
         lw $5, 0($1)       ;read a character
loop:    beq $5, $3, endloop ;if $5 = NF, go to endrloop, or go to the next line
         addi $30, $30, -4  
         sw $5, 0($30)      ;push character into the stack
         addi $6, $6, 1     ;increase character count
         lw $5, 0($1)       ;read a character
         beq $0, $0, loop   

endloop: lw $5, 0($1)       ;read a character
         addi $8, $6, 0     ;$8 = the length of the word
         addi $9, $6, 0     ;$9 = the length of the word
   ;;change the keyboard by the rule
wloop:   lw $7, 0($30)      ;push from the stack
         beq $7, $5, next   ;if $7 = $5, go to the next, or go to the next line
         sw $4, 0($30)      ;push character into the stack
next:    addi $30, $30, 4   
         addi $6, $6, -1    ;reduce character count
         bne $6, $0, wloop  ;countinue until character count is 0
   ;;push $30 into $2
print:   addi $30, $30, -4  
         lw $7, 0($30)      ;read a character
         addi $8, $8, -1    ;reduce character count
         sw $7, 0($2)       ;push character into the stack
         bne $8, $0, print  ;continue until character count is 0
         sw $3, 0($2)       ;print LF
   ;;release all stack memory
aloop:   addi $30, $30, 4   
         addi $9, $9, -1    ;reduce character count
         bne $9, $0, aloop  ;countiue until character count is 0
         jr $31
