    	.intel_syntax noprefix
	.text
change_chars:
	push	rbp                     # Пролог функции
	mov	rbp, rsp
	sub	rsp, 176
	mov	QWORD PTR -168[rbp], rdi    # В регистре теперь формальный аргумент функции char *str
	mov	QWORD PTR -176[rbp], rsi    # В регистре теперь формальный аргумент функции char *changed_str
	mov	rax, QWORD PTR fs:40        
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -128[rbp], 65     # Заполнение массива ASCII-кодами гласных букв 
	mov	DWORD PTR -124[rbp], 69
	mov	DWORD PTR -120[rbp], 73
	mov	DWORD PTR -116[rbp], 79
	mov	DWORD PTR -112[rbp], 85
	mov	DWORD PTR -108[rbp], 89
	mov	DWORD PTR -104[rbp], 97
	mov	DWORD PTR -100[rbp], 101
	mov	DWORD PTR -96[rbp], 105
	mov	DWORD PTR -92[rbp], 111
	mov	DWORD PTR -88[rbp], 117
	mov	DWORD PTR -84[rbp], 121
	mov	DWORD PTR -80[rbp], 48      # Заполнение массива ASCII-кодами чисел шестнадцатиричной системы счисления 
	mov	DWORD PTR -76[rbp], 49
	mov	DWORD PTR -72[rbp], 50
	mov	DWORD PTR -68[rbp], 51
	mov	DWORD PTR -64[rbp], 52
	mov	DWORD PTR -60[rbp], 53
	mov	DWORD PTR -56[rbp], 54
	mov	DWORD PTR -52[rbp], 55
	mov	DWORD PTR -48[rbp], 56
	mov	DWORD PTR -44[rbp], 57
	mov	DWORD PTR -40[rbp], 65
	mov	DWORD PTR -36[rbp], 66
	mov	DWORD PTR -32[rbp], 67
	mov	DWORD PTR -28[rbp], 68
	mov	DWORD PTR -24[rbp], 69
	mov	DWORD PTR -20[rbp], 70
	lea	rax, -128[rbp]              # Указатель на первый элемент массива ASCII-кодов гласных букв
	mov	QWORD PTR -144[rbp], rax    
	lea	rax, -128[rbp]              # Указатель на первый элемент массива ASCII-кодов гласных букв
	add	rax, 48                     # Перенос указателя на последний элемент
	mov	QWORD PTR -136[rbp], rax    
	mov	DWORD PTR -160[rbp], 0      # Счетчик элементов преобразованной строки
	mov	DWORD PTR -156[rbp], 0      # Счетчик элементов исходной строки
	jmp	.L2                         # Вход в цикл
.L8:
	mov	eax, DWORD PTR -156[rbp]    # В eax счетчик элементов исходной строки
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -168[rbp]    # В rax элемент исходной строки
	add	rax, rdx                    # Сдвиг до текущего элемента
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	DWORD PTR -152[rbp], eax    # Запись текущего char-а в регистр
	lea	rax, -128[rbp]              # Указатель переносим на первый элемент массива ASCII-кодов гласных букв
	mov	QWORD PTR -144[rbp], rax    
	jmp	.L3                         # Вход в цикл проверки гласности элемента
.L5:
	add	QWORD PTR -144[rbp], 4      # Переход к следующему числу в массиве ASCII-кодов
.L3:
	mov	rax, QWORD PTR -144[rbp]    # В rax указатель на текущий элемент массива ASCII-кодов
	cmp	rax, QWORD PTR -136[rbp]    # Сравнение указателя с последним элементом массива ASCII-кодов
	jnb	.L4                         # Переход, если >=
	mov	rax, QWORD PTR -144[rbp]  
	mov	eax, DWORD PTR [rax]       
	cmp	DWORD PTR -152[rbp], eax    # Сравнение указателя с текущим элементов исходной строки
	jne	.L5                         # Переход, если !=
.L4:
	mov	rax, QWORD PTR -144[rbp]    # В rax указатель на текущий элемент массива ASCII-кодов
	cmp	rax, QWORD PTR -136[rbp]    # Сравнение указателя с последним элементов массива ASCII-кодов
	jne	.L6                         # Переход, если !=
	mov	eax, DWORD PTR -160[rbp]    # В eax счетчик элементов преобразованной строки 
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -160[rbp], edx    
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -176[rbp]    # В rax следующий элемент измененной строки char *changed_str
	add	rax, rdx                    # Запись в rax текущего элемента изначальной строки из rdx
	mov	edx, DWORD PTR -152[rbp]    # В edx текущий элемент исходной строки
	mov	BYTE PTR [rax], dl
	jmp	.L7                         # Переход
.L6:
	mov	eax, DWORD PTR -160[rbp]    # В eax счетчик элементов преобразованной строки 
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -160[rbp], edx    
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -176[rbp]    # В rax следующий элемент измененной строки
	add	rax, rdx                    # Сдвиг до текущего элемента измененной строки
	mov	BYTE PTR [rax], 48          # Запись 0
	mov	eax, DWORD PTR -160[rbp]    # В eax счетчик элементов преобразованной строки
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -176[rbp]    # В rax следующий элемент измененной строки
	add	rax, rdx                    # Сдвиг до текущего элемента измененной строки
	mov	BYTE PTR [rax], 120         # Запись в rax x
	mov	eax, DWORD PTR -152[rbp]    
	cdq
	shr	edx, 28
	add	eax, edx
	and	eax, 15
	sub	eax, edx
	mov	DWORD PTR -148[rbp], eax    # Получение остатка деления текущего char-а на 16
	mov	eax, DWORD PTR -152[rbp]    # Получение шестнадцатиричного представления текущего char-а
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	lea	ecx, 48[rax]
	mov	eax, DWORD PTR -160[rbp]    # В eax счетчик элементов преобразованной строки
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -160[rbp], edx   
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -176[rbp]    # В rax следующий элемент измененной строки
	add	rax, rdx                    # Сдвиг до текущего элемента измененной строки
	mov	edx, ecx
	mov	BYTE PTR [rax], dl          # Запись первого числа из шестнадцатиричного представления
	mov	eax, DWORD PTR -148[rbp]    # В eax остаток от деления текущего char-а на 16
	cdqe
	mov	ecx, DWORD PTR -80[rbp+rax*4]  # В ecx элемент массива по индексу остатка от деления
	mov	eax, DWORD PTR -160[rbp]    # В eax счетчик элементов преобразованной строки
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -176[rbp]    # В rax следующий элемент измененной строки
	add	rax, rdx                    # Сдвиг до текущего элемента измененной строки
	mov	edx, ecx
	mov	BYTE PTR [rax], dl          # Запись второго числа из шестнадцатиричного представления
.L7:
	add	DWORD PTR -156[rbp], 1      # Добавление к счетчику элементов исходной строки  
.L2:
	mov	eax, DWORD PTR -156[rbp]    # В eax счетчик элементов исходной строки
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -168[rbp]    # В rax элемент char *str
	add	rax, rdx                    # Сдвиг до текущего элемента измененной строки
	movzx	eax, BYTE PTR [rax]     
	test	al, al                  # Сравнение текущего элемента исходной строки с '\0'
	jne	.L8                         # Переход, если не равно
	mov	eax, DWORD PTR -160[rbp]    # В eax счетчик элментов преобразованной строки
	movsx	rdx, eax                # В rdx сдвиг на eax элментов
	mov	rax, QWORD PTR -176[rbp]    # В rax элемент измененной строки
	add	rax, rdx                    # Сдвиг до текущего элемента
	mov	BYTE PTR [rax], 0           # Запись в последний элемент символа '\0'
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L9                         # Переход, если равно
	call	__stack_chk_fail@PLT
.L9:
	add rsp, 176                    # Эпилог функции
    	mov rsp, rbp
    	pop rbp
	ret
input:
	push	rbp                     # Пролог функции
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi     # В регистре теперь формальный аргумент функции char *str
	mov	DWORD PTR -8[rbp], 0        # Счетчик числа введенных char-ов
.L12:
	mov	rax, QWORD PTR stdin[rip]   # Считывание char-а
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -8[rbp]      # В eax счетчик элементов
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -8[rbp], edx
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -24[rbp]     # В rax элемент строки
	add	rax, rdx                    # Сдвиг до текущего элемента
	mov	edx, DWORD PTR -4[rbp]      
	mov	BYTE PTR [rax], dl
	cmp	DWORD PTR -4[rbp], -1       # Условие выхода из цикла
	je	.L11                        # Переход, если равно
	cmp	DWORD PTR -8[rbp], 99999    # Сравнение счетчика с 99999
	jle	.L12                        # Переход, если меньше или равно
.L11:
	mov	eax, DWORD PTR -8[rbp]      # Последний элемент - '\0'
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	add rsp, 32                     # Эпилог функции
    	mov rsp, rbp
    	pop rbp
	ret
output:
	push	rbp                     # Пролог функции
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi     # В регистре теперь формальный аргумент функции char *str
	mov	DWORD PTR -4[rbp], 0        # Счетчик
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]      # В eax счетчик элементов
	lea	edx, 1[rax]                 # Увеличение счетчика после операции
	mov	DWORD PTR -4[rbp], edx
	movsx	rdx, eax                # В rdx сдвиг на eax элементов
	mov	rax, QWORD PTR -24[rbp]     # В rax следующий элемент строки
	add	rax, rdx                    # Сдвиг до текущего элемента
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
.L14:
	mov	eax, DWORD PTR -4[rbp]      # В eax счетчик элементов
	movsx	rdx, eax                # В rdx сдвиг на eax элементов  
	mov	rax, QWORD PTR -24[rbp]     # В rax следующий элемент строки
	add	rax, rdx                    # Сдвиг до текущего элемента
	movzx	eax, BYTE PTR [rax]
	test	al, al                  
	jne	.L15
	mov	edi, 10
	call	putchar@PLT
	nop
	add rsp, 32                     # Эпилог функции
    	mov rsp, rbp
   	pop rbp
	ret
        .section .rodata
.LC0:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\202\320\265\320\272\321\201\321\202:" # Вспомогательная информация
	.align 8
.LC1:
	.string	"\320\230\320\267\320\274\320\265\320\275\320\265\320\275\320\275\321\213\320\271 \321\202\320\265\320\272\321\201\321\202:" # Вспомогательная информация
	.text
	.globl	main
main:
	push	rbp                     # Пролог функции    
	mov	rbp, rsp
	sub	rsp, 16
	mov	edi, 100000                 # Максимальный размер буфера в регистре rdi
	call	malloc@PLT              # Выделение памяти 
	mov	QWORD PTR -16[rbp], rax     # Переменная char *str
	lea	rax, .LC0[rip]              # Вывод вспомогательной информации
	mov	rdi, rax                    # В rdi Вспомогательная информация
	call	puts@PLT
	mov	rax, QWORD PTR -16[rbp]     # В rdi Переменная char *str
	mov	rdi, rax                    
	call	input                   # Вызов input с фактическим аргументом char *str в регистре rdi
	mov	edi, 400000                 # Максимальный размер буфера
	call	malloc@PLT              # Выделение памяти
	mov	QWORD PTR -8[rbp], rax      # Переменная char *changed_str
	mov	rdx, QWORD PTR -8[rbp]      # В rsi Переменная char *changed_str
	mov	rax, QWORD PTR -16[rbp]     # В rdi Переменная char *str
	mov	rsi, rdx
	mov	rdi, rax                    
	call	change_chars            # Вызов change_chars с фактическими аргументами char *str, char *changed_str в регистрах rdi и rsi
	mov	edi, 10                     # Вывод '\n'
	call	putchar@PLT
	lea	rax, .LC1[rip]              # Вывод вспомогательной информации
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]      # В rdi Переменная char *changed_str
	mov	rdi, rax
	call	output                  # Вызов output с фактическим аргументом char *changed_str в регистре rdi
	mov	rax, QWORD PTR -8[rbp]      # В rdi Переменная char *changed_str
	mov	rdi, rax
	call	free@PLT                # Очищение памяти, фактический аргумент char *changed_str в регистре rdi
	mov	rax, QWORD PTR -16[rbp]     # В rdi Переменная char *str
	mov	rdi, rax
	call	free@PLT                # Очищение памяти, фактический аргумент char *str в регистре rdi
	mov	eax, 0                      # 0 в eax, индикатор успешного завершения программы
	add rsp, 16                     # Эпилог функции
    	mov rsp, rbp
    	pop rbp
	ret