include 'emu8086.inc'
 
org 100h 

LEA SI,msg1    ; set up pointer (SI) to msg
CALL print_string   ; print message that SI points to

LEA SI,msg2
CALL print_string 

LEA SI,msg3
CALL print_string 

LEA SI,msg4
CALL print_string 

LEA SI,msg5
CALL print_string  

start:  ;label1

LEA SI,msg6
CALL print_string



call scan_num  ; get number in CX.  
cmp cx,100
jg start  ;if percentage is greater than 100 it will take input again

printn ''
             
            
LEA SI,msg7
CALL print_string




cmp cx,80
jge gradeA+

cmp cx,75
jge gradeA

cmp cx,70
jge grdA-

cmp cx,65
jge gradeB+

cmp cx,60
jge gradeB

cmp cx,55
jge grdB- 

cmp cx,50
jge gradeC+ 

cmp cx,45
jge gradeC 

cmp cx,40
jge gradeD 

cmp cx,40
jl gradeF

gradeA+: 
printn 'A+ (Plus)' 

jmp stop

gradeA: 
printn 'A (Plain)'

jmp stop

grdA-: 
printn 'A- (Minus)' 
 
jmp stop

gradeB+: 
printn 'B+ (Plus)'

jmp stop

gradeB: 
printn 'B (Plain)'

jmp stop

grdB-: 
printn 'B- (Minus)'  

jmp stop

gradeC+: 
printn 'C+ (Plus)'

jmp stop

gradeC: 
printn 'C (Plain)'

jmp stop 

gradeD: 
printn 'D (Plain)'

jmp stop 


gradeF: 
printn 'F (Fail)'

jmp stop 

stop:    ;label2
 
LEA SI,msg8
CALL print_string
call scan_num ;store no in cx
mov ax,cx
cmp ax,1
je start  

ret   ; return to operating system.

;data 
msg1 DB 'grade policy ',0
msg2 DB 13,10, 'A+ (80-100)....A (75-79).....A- (70-74)',0  
msg3 DB 13,10, 'B+ (65-69)....B (60-64).....B- (55-59)',0
msg4 DB 13,10, 'C+ (50-54)....C (45-49).....D (40-44)',0 
msg5 DB 13,10, 'F (below 40)........................',0
msg6 DB 13,10, 'Input Marks % value :'  ,0 
msg7 DB 13,10, 'your grade is ; ',0 
msg8 DB 13,10, 'press 1 if you want to find grade again :  ',0 


;declaring functions

define_print_string
define_scan_num
define_print_num
define_print_num_uns 

end     ; directive to stop the compiler.
