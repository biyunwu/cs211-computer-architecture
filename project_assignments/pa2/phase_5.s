Breakpoint 2, 0x08048c87 in phase_5 ()
(gdb) disas
Dump of assembler code for function phase_5:             # Test string: "fedcba".
=> 0x08048c87 <+0>:	push   %ebx
   0x08048c88 <+1>:	sub    $0x28,%esp
   0x08048c8b <+4>:	mov    0x30(%esp),%ebx
   0x08048c8f <+8>:	mov    %ebx,(%esp)
   0x08048c92 <+11>:	call   0x8048e4b <string_length>
   0x08048c97 <+16>:	cmp    $0x6,%eax                    # 1. %eax probably stores the input string's length.
   0x08048c9a <+19>:	je     0x8048ce2 <phase_5+91>       # 2. If the length is 6, then jump.
   0x08048c9c <+21>:	call   0x8049105 <explode_bomb>
   0x08048ca1 <+26>:	jmp    0x8048ce2 <phase_5+91>
   0x08048ca3 <+28>:	movzbl (%ebx,%eax,1),%edx               # 5. Move ($ebx + $eax) to %edx and zero extend to the full register of %edx.
   0x08048ca7 <+32>:	and    $0xf,%edx                        # 6. 1111 & %edx
   0x08048caa <+35>:	movzbl 0x804a0c8(%edx),%edx
   0x08048cb1 <+42>:	mov    %dl,0x19(%esp,%eax,1)
   0x08048cb5 <+46>:	add    $0x1,%eax
   0x08048cb8 <+49>:	cmp    $0x6,%eax
   0x08048cbb <+52>:	jne    0x8048ca3 <phase_5+28>
   0x08048cbd <+54>:	movb   $0x0,0x1f(%esp)
   0x08048cc2 <+59>:	movl   $0x804a09e,0x4(%esp)
   0x08048cca <+67>:	lea    0x19(%esp),%eax
   0x08048cce <+71>:	mov    %eax,(%esp)
   0x08048cd1 <+74>:	call   0x8048e6a <strings_not_equal>    # Its retuen value stores in %eax.
   0x08048cd6 <+79>:	test   %eax,%eax                        # %eax has to be 0.
   0x08048cd8 <+81>:	je     0x8048ce9 <phase_5+98>           # ZF, jump to +98.
   0x08048cda <+83>:	call   0x8049105 <explode_bomb>
   0x08048cdf <+88>:	nop
   0x08048ce0 <+89>:	jmp    0x8048ce9 <phase_5+98>
   0x08048ce2 <+91>:	mov    $0x0,%eax                    # 3. %eax = 0
   0x08048ce7 <+96>:	jmp    0x8048ca3 <phase_5+28>       # 4. Jump
   0x08048ce9 <+98>:	add    $0x28,%esp                       # continue until ret.
   0x08048cec <+101>:	pop    %ebx
   0x08048ced <+102>:	ret
End of assembler dump.

# The input string must be of length of 6.

(gdb) disas
Dump of assembler code for function phase_5:
   0x08048c87 <+0>:	push   %ebx
   0x08048c88 <+1>:	sub    $0x28,%esp
   0x08048c8b <+4>:	mov    0x30(%esp),%ebx
   0x08048c8f <+8>:	mov    %ebx,(%esp)
   0x08048c92 <+11>:	call   0x8048e4b <string_length>
   0x08048c97 <+16>:	cmp    $0x6,%eax                    # 1. %eax probably stores the input string's length.
   0x08048c9a <+19>:	je     0x8048ce2 <phase_5+91>       # 2. If the length is 6, then jump.
   0x08048c9c <+21>:	call   0x8049105 <explode_bomb>
   0x08048ca1 <+26>:	jmp    0x8048ce2 <phase_5+91>
   0x08048ca3 <+28>:	movzbl (%ebx,%eax,1),%edx               # 5. Move ($ebx + $eax) to %edx and zero extend to the full register of %edx.
=> 0x08048ca7 <+32>:	and    $0xf,%edx                        # 6. %edx = %edx (0x66, 0b1100110) & 0b0001111 = 0b110 = 0x6
   0x08048caa <+35>:	movzbl 0x804a0c8(%edx),%edx
   0x08048cb1 <+42>:	mov    %dl,0x19(%esp,%eax,1)
   0x08048cb5 <+46>:	add    $0x1,%eax
   0x08048cb8 <+49>:	cmp    $0x6,%eax
   0x08048cbb <+52>:	jne    0x8048ca3 <phase_5+28>
   0x08048cbd <+54>:	movb   $0x0,0x1f(%esp)
   0x08048cc2 <+59>:	movl   $0x804a09e,0x4(%esp)
   0x08048cca <+67>:	lea    0x19(%esp),%eax
   0x08048cce <+71>:	mov    %eax,(%esp)
   0x08048cd1 <+74>:	call   0x8048e6a <strings_not_equal>    # Its retuen value stores in %eax.
   0x08048cd6 <+79>:	test   %eax,%eax                        # %eax has to be 0.
   0x08048cd8 <+81>:	je     0x8048ce9 <phase_5+98>           # ZF, jump to +98.
   0x08048cda <+83>:	call   0x8049105 <explode_bomb>
   0x08048cdf <+88>:	nop
   0x08048ce0 <+89>:	jmp    0x8048ce9 <phase_5+98>
   0x08048ce2 <+91>:	mov    $0x0,%eax                    # 3. %eax = 0
   0x08048ce7 <+96>:	jmp    0x8048ca3 <phase_5+28>       # 4. Jump
   0x08048ce9 <+98>:	add    $0x28,%esp                       # continue until ret.
   0x08048cec <+101>:	pop    %ebx
   0x08048ced <+102>:	ret
End of assembler dump.
(gdb) i r
eax            0x0	0
ecx            0x7	7
edx            0x66	102
ebx            0x804c8a0	134531232
esp            0xffffcfc0	0xffffcfc0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048ca7	0x8048ca7 <phase_5+32>
eflags         0x246	[ PF ZF IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
(gdb) p/x *(int *) 0x804c8a0
$4 = 0x63646566                                          # (%ebx,%eax,1) = (%ebx + 0*1) = (%ebx) = (0x804c8a0), movzbl (%ebx,%eax,1),%edx => 0x66

(gdb) disas
Dump of assembler code for function phase_5:             # Test string: "fedcba".
   0x08048c87 <+0>:	push   %ebx
   0x08048c88 <+1>:	sub    $0x28,%esp
   0x08048c8b <+4>:	mov    0x30(%esp),%ebx
   0x08048c8f <+8>:	mov    %ebx,(%esp)
   0x08048c92 <+11>:	call   0x8048e4b <string_length>
   0x08048c97 <+16>:	cmp    $0x6,%eax                    # 1. %eax probably stores the input string's length.
   0x08048c9a <+19>:	je     0x8048ce2 <phase_5+91>       # 2. If the length is 6, then jump.
   0x08048c9c <+21>:	call   0x8049105 <explode_bomb>
   0x08048ca1 <+26>:	jmp    0x8048ce2 <phase_5+91>
   0x08048ca3 <+28>:	movzbl (%ebx,%eax,1),%edx               # 5. Move ($ebx + $eax) to %edx and zero extend to the full register of %edx.
   0x08048ca7 <+32>:	and    $0xf,%edx                        # 6. %edx = %edx (0x66, 0b1100110) & 0b0001111 = 0b110 = 0x6
=> 0x08048caa <+35>:	movzbl 0x804a0c8(%edx),%edx             # 7. %edx = 0x61 (see below)
   0x08048cb1 <+42>:	mov    %dl,0x19(%esp,%eax,1)            # %dl is the least significant byte of %edx
   0x08048cb5 <+46>:	add    $0x1,%eax
   0x08048cb8 <+49>:	cmp    $0x6,%eax
   0x08048cbb <+52>:	jne    0x8048ca3 <phase_5+28>
   0x08048cbd <+54>:	movb   $0x0,0x1f(%esp)
   0x08048cc2 <+59>:	movl   $0x804a09e,0x4(%esp)
   0x08048cca <+67>:	lea    0x19(%esp),%eax
   0x08048cce <+71>:	mov    %eax,(%esp)
   0x08048cd1 <+74>:	call   0x8048e6a <strings_not_equal>    # Its retuen value stores in %eax.
   0x08048cd6 <+79>:	test   %eax,%eax                        # %eax has to be 0.
   0x08048cd8 <+81>:	je     0x8048ce9 <phase_5+98>           # ZF, jump to +98.
   0x08048cda <+83>:	call   0x8049105 <explode_bomb>
   0x08048cdf <+88>:	nop
   0x08048ce0 <+89>:	jmp    0x8048ce9 <phase_5+98>
   0x08048ce2 <+91>:	mov    $0x0,%eax                    # 3. %eax = 0
   0x08048ce7 <+96>:	jmp    0x8048ca3 <phase_5+28>       # 4. Jump
   0x08048ce9 <+98>:	add    $0x28,%esp                       # continue until ret.
   0x08048cec <+101>:	pop    %ebx
   0x08048ced <+102>:	ret
End of assembler dump.
(gdb) i r
eax            0x0	0
ecx            0x7	7
edx            0x61	97                                  # Refers to char 'a'.
ebx            0x804c8a0	134531232
esp            0xffffcfc0	0xffffcfc0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048cb1	0x8048cb1 <phase_5+42>
eflags         0x206	[ PF IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
(gdb) p/x *(int *) (0x804a0c8 + 6)
$6 = 0x62727561                                           # movzbl 0x804a0c8(%edx),%edx => 0x61, refers to char 'a'

(gdb) disas
Dump of assembler code for function phase_5:             # Test string: "fedcba".
   0x08048c87 <+0>:	push   %ebx
   0x08048c88 <+1>:	sub    $0x28,%esp
   0x08048c8b <+4>:	mov    0x30(%esp),%ebx
   0x08048c8f <+8>:	mov    %ebx,(%esp)
   0x08048c92 <+11>:	call   0x8048e4b <string_length>
   0x08048c97 <+16>:	cmp    $0x6,%eax                    # 1. %eax probably stores the input string's length.
   0x08048c9a <+19>:	je     0x8048ce2 <phase_5+91>       # 2. If the length is 6, then jump.
   0x08048c9c <+21>:	call   0x8049105 <explode_bomb>
   0x08048ca1 <+26>:	jmp    0x8048ce2 <phase_5+91>
   0x08048ca3 <+28>:	movzbl (%ebx,%eax,1),%edx               # 5. Move ($ebx + $eax) to %edx and zero extend to the full register of %edx.
   0x08048ca7 <+32>:	and    $0xf,%edx                        # 6. %edx = %edx (0x66, 0b1100110) & 0b0001111 = 0b110 = 0x6
   0x08048caa <+35>:	movzbl 0x804a0c8(%edx),%edx             # 7. %edx = 0x61 (see below)
   0x08048cb1 <+42>:	mov    %dl,0x19(%esp,%eax,1)            # %dl is the least significant byte of %edx
   0x08048cb5 <+46>:	add    $0x1,%eax
=> 0x08048cb8 <+49>:	cmp    $0x6,%eax
   0x08048cbb <+52>:	jne    0x8048ca3 <phase_5+28>
   0x08048cbd <+54>:	movb   $0x0,0x1f(%esp)
   0x08048cc2 <+59>:	movl   $0x804a09e,0x4(%esp)
   0x08048cca <+67>:	lea    0x19(%esp),%eax
   0x08048cce <+71>:	mov    %eax,(%esp)
   0x08048cd1 <+74>:	call   0x8048e6a <strings_not_equal>    # Its retuen value stores in %eax.
   0x08048cd6 <+79>:	test   %eax,%eax                        # %eax has to be 0.
   0x08048cd8 <+81>:	je     0x8048ce9 <phase_5+98>           # ZF, jump to +98.
   0x08048cda <+83>:	call   0x8049105 <explode_bomb>
   0x08048cdf <+88>:	nop
   0x08048ce0 <+89>:	jmp    0x8048ce9 <phase_5+98>
   0x08048ce2 <+91>:	mov    $0x0,%eax                    # 3. %eax = 0
   0x08048ce7 <+96>:	jmp    0x8048ca3 <phase_5+28>       # 4. Jump
   0x08048ce9 <+98>:	add    $0x28,%esp                       # continue until ret.
   0x08048cec <+101>:	pop    %ebx
   0x08048ced <+102>:	ret
End of assembler dump.
(gdb) i r
eax            0x2	2
ecx            0x7	7
edx            0x65	101                                 # refers to char 'e'.
ebx            0x804c8a0	134531232
esp            0xffffcfc0	0xffffcfc0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048cb8	0x8048cb8 <phase_5+49>
eflags         0x202	[ IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
# Since there is no conditional instruction between <phase_5+28> to <phase_5+52>,
# it seems that these instructions are always executed as long as the input string's length is 6.

# After the loops executed:
(gdb) disas
Dump of assembler code for function phase_5:             # Test string: "fedcba".
   0x08048c87 <+0>:	push   %ebx
   0x08048c88 <+1>:	sub    $0x28,%esp
   0x08048c8b <+4>:	mov    0x30(%esp),%ebx
   0x08048c8f <+8>:	mov    %ebx,(%esp)
   0x08048c92 <+11>:	call   0x8048e4b <string_length>
   0x08048c97 <+16>:	cmp    $0x6,%eax                    # 1. %eax probably stores the input string's length.
   0x08048c9a <+19>:	je     0x8048ce2 <phase_5+91>       # 2. If the length is 6, then jump.
   0x08048c9c <+21>:	call   0x8049105 <explode_bomb>
   0x08048ca1 <+26>:	jmp    0x8048ce2 <phase_5+91>
   0x08048ca3 <+28>:	movzbl (%ebx,%eax,1),%edx               # 5. Move ($ebx + $eax) to %edx and zero extend to the full register of %edx.
   0x08048ca7 <+32>:	and    $0xf,%edx                        # 6. %edx = %edx (0x66, 0b1100110) & 0b0001111 = 0b110 = 0x6
   0x08048caa <+35>:	movzbl 0x804a0c8(%edx),%edx             # 7. %edx = 0x61 (see below)
   0x08048cb1 <+42>:	mov    %dl,0x19(%esp,%eax,1)            # %dl is the least significant byte of %edx
   0x08048cb5 <+46>:	add    $0x1,%eax                        # ...
   0x08048cb8 <+49>:	cmp    $0x6,%eax
   0x08048cbb <+52>:	jne    0x8048ca3 <phase_5+28>           # ...
   0x08048cbd <+54>:	movb   $0x0,0x1f(%esp)
=> 0x08048cc2 <+59>:	movl   $0x804a09e,0x4(%esp)
   0x08048cca <+67>:	lea    0x19(%esp),%eax
   0x08048cce <+71>:	mov    %eax,(%esp)
   0x08048cd1 <+74>:	call   0x8048e6a <strings_not_equal>    # Its retuen value stores in %eax.
   0x08048cd6 <+79>:	test   %eax,%eax                        # %eax has to be 0.
   0x08048cd8 <+81>:	je     0x8048ce9 <phase_5+98>           # ZF, jump to +98.
   0x08048cda <+83>:	call   0x8049105 <explode_bomb>
   0x08048cdf <+88>:	nop
   0x08048ce0 <+89>:	jmp    0x8048ce9 <phase_5+98>
   0x08048ce2 <+91>:	mov    $0x0,%eax                    # 3. %eax = 0
   0x08048ce7 <+96>:	jmp    0x8048ca3 <phase_5+28>       # 4. Jump
   0x08048ce9 <+98>:	add    $0x28,%esp                       # continue until ret.
   0x08048cec <+101>:	pop    %ebx
   0x08048ced <+102>:	ret
End of assembler dump.
(gdb) i r
eax            0x6	6
ecx            0x7	7
edx            0x79	121                                 # Refers to char 'y'
ebx            0x804c8a0	134531232
esp            0xffffcfc0	0xffffcfc0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048cbd	0x8048cbd <phase_5+54>
eflags         0x246	[ PF ZF IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
(gdb) p (char *) 0x804a09e
$11 = 0x804a09e "flames"                                 # A string provided by the program. It can be verified by `strings bomb`.

(gdb) disas
Dump of assembler code for function phase_5:
   0x08048c87 <+0>:	push   %ebx
   0x08048c88 <+1>:	sub    $0x28,%esp
   0x08048c8b <+4>:	mov    0x30(%esp),%ebx
   0x08048c8f <+8>:	mov    %ebx,(%esp)
   0x08048c92 <+11>:	call   0x8048e4b <string_length>
   0x08048c97 <+16>:	cmp    $0x6,%eax
   0x08048c9a <+19>:	je     0x8048ce2 <phase_5+91>
   0x08048c9c <+21>:	call   0x8049105 <explode_bomb>
   0x08048ca1 <+26>:	jmp    0x8048ce2 <phase_5+91>
   0x08048ca3 <+28>:	movzbl (%ebx,%eax,1),%edx
   0x08048ca7 <+32>:	and    $0xf,%edx
   0x08048caa <+35>:	movzbl 0x804a0c8(%edx),%edx
   0x08048cb1 <+42>:	mov    %dl,0x19(%esp,%eax,1)
   0x08048cb5 <+46>:	add    $0x1,%eax
   0x08048cb8 <+49>:	cmp    $0x6,%eax
   0x08048cbb <+52>:	jne    0x8048ca3 <phase_5+28>
   0x08048cbd <+54>:	movb   $0x0,0x1f(%esp)
   0x08048cc2 <+59>:	movl   $0x804a09e,0x4(%esp)
   0x08048cca <+67>:	lea    0x19(%esp),%eax
=> 0x08048cce <+71>:	mov    %eax,(%esp)
   0x08048cd1 <+74>:	call   0x8048e6a <strings_not_equal>
   0x08048cd6 <+79>:	test   %eax,%eax
   0x08048cd8 <+81>:	je     0x8048ce9 <phase_5+98>
   0x08048cda <+83>:	call   0x8049105 <explode_bomb>
   0x08048cdf <+88>:	nop
   0x08048ce0 <+89>:	jmp    0x8048ce9 <phase_5+98>
   0x08048ce2 <+91>:	mov    $0x0,%eax
   0x08048ce7 <+96>:	jmp    0x8048ca3 <phase_5+28>
   0x08048ce9 <+98>:	add    $0x28,%esp
   0x08048cec <+101>:	pop    %ebx
   0x08048ced <+102>:	ret
End of assembler dump.
(gdb) i r
eax            0xffffcfd9	-12327
ecx            0x7	7
edx            0x79	121
ebx            0x804c8a0	134531232
esp            0xffffcfc0	0xffffcfc0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
eip            0x8048cce	0x8048cce <phase_5+71>
eflags         0x246	[ PF ZF IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
(gdb) p (char *) $eax
$14 = 0xffffcfd9 "aesdty"
# It seems that the input "fedcba" was tranformed into "aesdty".
# The program is to compare "aesdty" with "flames" through `strings_not_equal()`. It should return 1.
# And `test 0x1 ox1` would not result in 0. The bomb is going to be triggered.
# Then, the goal is to reverse "flames" into its orininal form through <phase_5+28> to <phase_5+42>.
# When the input is "flames", `p (char *eax)` returns "alymed".
# When the input is "abcdef", `p (char *eax)` returns "ytdsea".
# When the input is "ghijkl", `p (char *eax)` returns "urbfvl".
# Then, the correct input should be "jlfmed".