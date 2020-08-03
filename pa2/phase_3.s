(gdb) disas
Dump of assembler code for function phase_3:
   0x08048b78 <+0>:	    push   %ebx
   0x08048b79 <+1>:	    sub    $0x38,%esp
   0x08048b7c <+4>:	    lea    0x18(%esp),%eax
   0x08048b80 <+8>:	    mov    %eax,0x4(%esp)
   0x08048b84 <+12>:	mov    0x40(%esp),%eax
   0x08048b88 <+16>:	mov    %eax,(%esp)
   0x08048b8b <+19>:	call   0x8049144 <read_six_numbers>     # parameter of "%d %d %d %d %d %d" from `strings bomb`.
   0x08048b90 <+24>:	cmpl   $0x0,0x18(%esp)                  # Compare the first int (arr[0]) with 0.
   0x08048b95 <+29>:	jns    0x8048bbd <phase_3+69>           # If the first int is above 0, then jump. `jns`: jump unsigned above.
   0x08048b97 <+31>:	call   0x8049105 <explode_bomb>
   0x08048b9c <+36>:	jmp    0x8048bbd <phase_3+69>
   0x08048b9e <+38>:	lea    (%ebx,%ebx,4),%eax               # x = i + 4*i = 5*i
   0x08048ba1 <+41>:	lea    (%ebx,%eax,4),%eax               # x = i + x*4 = i + (5*i)*4 = 21*i
   0x08048ba4 <+44>:	add    0x14(%esp,%ebx,4),%eax           # x = x + arr[i]
   0x08048ba8 <+48>:	cmp    %eax,0x18(%esp,%ebx,4)           # Compare arr[i+1] with x
   0x08048bac <+52>:	je     0x8048bb3 <phase_3+59>           # Jump if equal
   0x08048bae <+54>:	call   0x8049105 <explode_bomb>
   0x08048bb3 <+59>:	add    $0x1,%ebx                        # i++
   0x08048bb6 <+62>:	cmp    $0x6,%ebx                        # i - 6
   0x08048bb9 <+65>:	jne    0x8048b9e <phase_3+38>           # Jump if not equal
   0x08048bbb <+67>:	jmp    0x8048bc4 <phase_3+76>           # Jump, the loop is finished.
   0x08048bbd <+69>:	mov    $0x1,%ebx                        # i++;
=> 0x08048bc2 <+74>:	jmp    0x8048b9e <phase_3+38>           # Jump
   0x08048bc4 <+76>:	add    $0x38,%esp
   0x08048bc7 <+79>:	pop    %ebx
   0x08048bc8 <+80>:	ret
End of assembler dump.
(gdb) i r
eax            0x6	6
ecx            0x0	0
edx            0x0	0
ebx            0x1	1
esp            0xffffcfb0	0xffffcfb0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048bc2	0x8048bc2 <phase_3+74>
eflags         0x202	[ IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
# In order to make the input as simple as possible, the fisrt integer should be 1.
# arr[0] = 1, arr[1] = 21*1+1 = 22, arr[2] = 21*2+22 = 64 ...
# Then, the inputs are: 1 22 64 127 211 316