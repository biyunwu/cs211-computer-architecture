(gdb) disas
Dump of assembler code for function phase_2:
   0x08048b54 <+0>:	sub    $0x1c,%esp
   0x08048b57 <+3>:	movl   $0x804a080,0x4(%esp)
   0x08048b5f <+11>:	mov    0x20(%esp),%eax
   0x08048b63 <+15>:	mov    %eax,(%esp)                             # eax refers to the input string, see below.
=> 0x08048b66 <+18>:	call   0x8048e6a <strings_not_equal>
   0x08048b6b <+23>:	test   %eax,%eax
   0x08048b6d <+25>:	je     0x8048b74 <phase_2+32>
   0x08048b6f <+27>:	call   0x8049105 <explode_bomb>
   0x08048b74 <+32>:	add    $0x1c,%esp
   0x08048b77 <+35>:	ret
End of assembler dump.

(gdb) print (char *) 0x804a080
$8 = 0x804a080 "Public speaking is very easy."
(gdb) print (char *) $eax
$9 = 0x804c7b0 <input_strings+80> "Public speaking is very easy."

(gdb) disas strings_not_equal
Dump of assembler code for function strings_not_equal:
   0x08048e6a <+0>:	push   %edi
   0x08048e6b <+1>:	push   %esi
   0x08048e6c <+2>:	push   %ebx
   0x08048e6d <+3>:	sub    $0x4,%esp
   0x08048e70 <+6>:	mov    0x14(%esp),%ebx
   0x08048e74 <+10>:	mov    0x18(%esp),%esi
   0x08048e78 <+14>:	mov    %ebx,(%esp)
   0x08048e7b <+17>:	call   0x8048e4b <string_length>
   0x08048e80 <+22>:	mov    %eax,%edi
   0x08048e82 <+24>:	mov    %esi,(%esp)
   0x08048e85 <+27>:	call   0x8048e4b <string_length>
   0x08048e8a <+32>:	mov    $0x1,%edx
   0x08048e8f <+37>:	cmp    %eax,%edi
   0x08048e91 <+39>:	jne    0x8048ecd <strings_not_equal+99>
   0x08048e93 <+41>:	movzbl (%ebx),%eax
   0x08048e96 <+44>:	test   %al,%al
   0x08048e98 <+46>:	je     0x8048eba <strings_not_equal+80>
   0x08048e9a <+48>:	cmp    (%esi),%al
   0x08048e9c <+50>:	je     0x8048ea6 <strings_not_equal+60>
   0x08048e9e <+52>:	xchg   %ax,%ax
   0x08048ea0 <+54>:	jmp    0x8048ec1 <strings_not_equal+87>
   0x08048ea2 <+56>:	cmp    (%esi),%al
   0x08048ea4 <+58>:	jne    0x8048ec8 <strings_not_equal+94>
   0x08048ea6 <+60>:	add    $0x1,%ebx
   0x08048ea9 <+63>:	add    $0x1,%esi
   0x08048eac <+66>:	movzbl (%ebx),%eax
   0x08048eaf <+69>:	test   %al,%al
   0x08048eb1 <+71>:	jne    0x8048ea2 <strings_not_equal+56>
   0x08048eb3 <+73>:	mov    $0x0,%edx
   0x08048eb8 <+78>:	jmp    0x8048ecd <strings_not_equal+99>
   0x08048eba <+80>:	mov    $0x0,%edx
   0x08048ebf <+85>:	jmp    0x8048ecd <strings_not_equal+99>
   0x08048ec1 <+87>:	mov    $0x1,%edx
   0x08048ec6 <+92>:	jmp    0x8048ecd <strings_not_equal+99>
   0x08048ec8 <+94>:	mov    $0x1,%edx
   0x08048ecd <+99>:	mov    %edx,%eax
   0x08048ecf <+101>:	add    $0x4,%esp
   0x08048ed2 <+104>:	pop    %ebx
   0x08048ed3 <+105>:	pop    %esi
   0x08048ed4 <+106>:	pop    %edi
   0x08048ed5 <+107>:	ret
End of assembler dump.

(gdb) i r
eax            0x0	0
ecx            0x1e	30
edx            0x0	0
ebx            0xffffd0a4	-12124
esp            0xffffcfd0	0xffffcfd0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048b6b	0x8048b6b <phase_2+23>
eflags         0x296	[ PF AF SF IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99

(gdb) disas
Dump of assembler code for function phase_2:
   0x08048b54 <+0>:	sub    $0x1c,%esp
   0x08048b57 <+3>:	movl   $0x804a080,0x4(%esp)
   0x08048b5f <+11>:	mov    0x20(%esp),%eax
   0x08048b63 <+15>:	mov    %eax,(%esp)                             # eax refers to the input string, see below.
   0x08048b66 <+18>:	call   0x8048e6a <strings_not_equal>
=> 0x08048b6b <+23>:	test   %eax,%eax                               # test(0, 0) => return result of bitwise operation 0&0, which is 0. 
   0x08048b6d <+25>:	je     0x8048b74 <phase_2+32>                  # skip `explode_bomb()`.
   0x08048b6f <+27>:	call   0x8049105 <explode_bomb>
   0x08048b74 <+32>:	add    $0x1c,%esp
   0x08048b77 <+35>:	ret
End of assembler dump.