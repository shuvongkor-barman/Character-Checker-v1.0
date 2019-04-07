TITLE: A Program to check if a input character is number, uppercase, lowercase OR others

.MODEL SMALL
.STACK 100H
     
.DATA
CH DB ?

UPPER  DB 10, 13,"Uppercase", "$"
LOWER  DB 10, 13,"Lowercase",  "$"
NUMBER DB 10, 13,"Number",  "$"
OTHER  DB 10, 13,"Others $"

  
.CODE

 MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH,1
    INT 21H
    
    MOV BL, AL   
    MOV CH, BL
    MOV BL, CH 
    
    
    CMP BL, "A"
    JGE CHECK2
    
    CMP BL, "a"
    JGE CHECK3
    
    CMP BL, "0"
    JGE CHECK4   
    
   
    JMP OTHERD
    
    
    CHECK2:
        CMP BL, "Z"
        JLE UPPERD

    
    CHECK3:
        CMP BL, "z"
        JLE LOWERD
    
    CHECK4:
        CMP BL, "9"
        JLE NUMBERD
        JMP OTHERD


    UPPERD:
        MOV AH,9
        LEA DX, UPPER
        INT 21H
        
        JMP EXIT
        
        
    LOWERD:
        MOV AH,9
        LEA DX, LOWER
        INT 21H
        
        JMP EXIT
        
        
    NUMBERD:
        MOV AH,9
        LEA DX, NUMBER
        INT 21H
        
        JMP EXIT
    
        
    OTHERD:
        MOV AH,9
        LEA DX, OTHER
        INT 21H
 
    
    EXIT: 
        MOV AH, 4CH
        INT 21H
  
    
 MAIN ENDP
    
    END MAIN