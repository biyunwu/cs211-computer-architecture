(gdb) disas
Dump of assembler code for function phase_6:                    # Test input: "6 5 4 3 2 1"
   0x08048cee <+0>:	push   %esi
   0x08048cef <+1>:	push   %ebx
   0x08048cf0 <+2>:	sub    $0x44,%esp
   0x08048cf3 <+5>:	lea    0x28(%esp),%eax
   0x08048cf7 <+9>:	mov    %eax,0x4(%esp)
   0x08048cfb <+13>:	mov    0x50(%esp),%eax
   0x08048cff <+17>:	mov    %eax,(%esp)
   0x08048d02 <+20>:	call   0x8049144 <read_six_numbers>
   0x08048d07 <+25>:	mov    $0x0,%esi                        # 1. %esi = 0.
   0x08048d0c <+30>:	mov    0x28(%esp,%esi,4),%eax           # 2. When %esi=0, 0x28(%esp,%esi,4) refers to the 1st num in input.
   0x08048d10 <+34>:	sub    $0x1,%eax                        # 3. %eax = 6-1 = 5.
   0x08048d13 <+37>:	cmp    $0x5,%eax                        # 4. Compare 5 with 5.
   0x08048d16 <+40>:	jbe    0x8048d1d <phase_6+47>           # 5. Below or equal.
   0x08048d18 <+42>:	call   0x8049105 <explode_bomb>
=> 0x08048d1d <+47>:	add    $0x1,%esi                        # 6. %esi = 0+1 = 1.
   0x08048d20 <+50>:	cmp    $0x6,%esi                        # 7. Compare %esi with 6, 1-6 = -5
   0x08048d23 <+53>:	jne    0x8048d2c <phase_6+62>           # 8. Not equal.
   0x08048d25 <+55>:	mov    $0x0,%ebx
   0x08048d2a <+60>:	jmp    0x8048d64 <phase_6+118>
   0x08048d2c <+62>:	mov    %esi,%ebx                        # 9. %ebx = %esi = 1.
   0x08048d2e <+64>:	mov    0x28(%esp,%ebx,4),%eax           # 10. %eax = (0x28 + %esp + 1*4), which is the 2nd number (5) in the input.
                                                                    # 16. %eax = (0x28 + %esp + 2*4), which is the 3rd number 4.
                                                                        # 22. %eax = (0x28 + %esp + 3*4), which is the 4th number 3.
                                                                            # 28. %eax = (0x28 + %esp + 4*4), which is the 5th number 2.
                                                                                # 34. %eax = (0x28 + %esp + 5*4), which is the 6th number 1.
   0x08048d32 <+68>:	cmp    %eax,0x24(%esp,%esi,4)           # 11. `p *(int *) (0x24 + $esp + 1*4)` returns 6, which is the first number of the input.
                                                                    # 17. `p *(int *) (0x24 + $esp + 1*4)` returns 6, which is the first number of the input.
                                                                        # 23. `p *(int *) (0x24 + $esp + 1*4)` returns 6, which is the first number of the input.
                                                                            # 29. `p *(int *) (0x24 + $esp + 1*4)` returns 6, which is the first number of the input.
                                                                                # 35. `p *(int *) (0x24 + $esp + 1*4)` returns 6, which is the first number of the input.
   0x08048d36 <+72>:	jne    0x8048d3d <phase_6+79>           # 12. Jump not equal.
                                                                    # 18. Jump not equal.
                                                                        # 24. Jump not equal.
                                                                            # 30. Jump not equal.
                                                                                # 36. Jump not equal.
   0x08048d38 <+74>:	call   0x8049105 <explode_bomb>
   0x08048d3d <+79>:	add    $0x1,%ebx                        # 13. %ebx = 1+1 = 2.
                                                                    # 19. %ebx = 2+1 = 3.
                                                                        # 25. %ebx = 3+1 = 4.
                                                                            # 31. %ebx = 4+1 = 5.
                                                                                # 37. %ebx = 5+1 = 6.
   0x08048d40 <+82>:	cmp    $0x5,%ebx                        # 14. Compare 2 with 5, 2-5 = -3.
                                                                    # 20. Compare 3 with 5, 3-5 = -2.
                                                                        # 26. Compare 4 with 5, 4-5 = -1.
                                                                            # 32. Compare 5 with 5, 5-5 = 0.
                                                                                # 38. Compare 6 with 5, 6-5 = 1.
   0x08048d43 <+85>:	jle    0x8048d2e <phase_6+64>           # 15. Jump less than or equal.
                                                                    # 21. Jump less than or equal.
                                                                        # 27. Jump less than or equal.
                                                                            # 33. Jump less than or equal.
   0x08048d45 <+87>:	jmp    0x8048d0c <phase_6+30>                           # 39. Jump. Loop here! Go to the second loop.
   0x08048d47 <+89>:	mov    0x8(%edx),%edx
   0x08048d4a <+92>:	add    $0x1,%eax
   0x08048d4d <+95>:	cmp    %ecx,%eax
   0x08048d4f <+97>:	jne    0x8048d47 <phase_6+89>
   0x08048d51 <+99>:	jmp    0x8048d58 <phase_6+106>
   0x08048d53 <+101>:	mov    $0x804c0a0,%edx
   0x08048d58 <+106>:	mov    %edx,0x10(%esp,%esi,4)
   0x08048d5c <+110>:	add    $0x1,%ebx
   0x08048d5f <+113>:	cmp    $0x6,%ebx
   0x08048d62 <+116>:	je     0x8048d7b <phase_6+141>
   0x08048d64 <+118>:	mov    %ebx,%esi
   0x08048d66 <+120>:	mov    0x28(%esp,%ebx,4),%ecx
   0x08048d6a <+124>:	cmp    $0x1,%ecx
   0x08048d6d <+127>:	jle    0x8048d53 <phase_6+101>
   0x08048d6f <+129>:	mov    $0x1,%eax
   0x08048d74 <+134>:	mov    $0x804c0a0,%edx
   0x08048d79 <+139>:	jmp    0x8048d47 <phase_6+89>
   0x08048d7b <+141>:	mov    0x10(%esp),%ebx
   0x08048d7f <+145>:	lea    0x14(%esp),%eax
   0x08048d83 <+149>:	lea    0x28(%esp),%esi
   0x08048d87 <+153>:	mov    %ebx,%ecx
   0x08048d89 <+155>:	mov    (%eax),%edx
   0x08048d8b <+157>:	mov    %edx,0x8(%ecx)
   0x08048d8e <+160>:	add    $0x4,%eax
   0x08048d91 <+163>:	cmp    %esi,%eax
---Type <return> to continue, or q <return> to quit---q
Quit
(gdb) x/6w (char *) (0x28 + $esp)
0xffffcfc8:	6	5	4	3
0xffffcfd8:	2	1

# After all lopps:
(gdb) disas
Dump of assembler code for function phase_6:
   0x08048cee <+0>:	push   %esi
   0x08048cef <+1>:	push   %ebx
   ......
=> 0x08048d64 <+118>:	mov    %ebx,%esi
   0x08048d66 <+120>:	mov    0x28(%esp,%ebx,4),%ecx
   0x08048d6a <+124>:	cmp    $0x1,%ecx
   0x08048d6d <+127>:	jle    0x8048d53 <phase_6+101>
   0x08048d6f <+129>:	mov    $0x1,%eax
   0x08048d74 <+134>:	mov    $0x804c0a0,%edx
   0x08048d79 <+139>:	jmp    0x8048d47 <phase_6+89>
   0x08048d7b <+141>:	mov    0x10(%esp),%ebx
   0x08048d7f <+145>:	lea    0x14(%esp),%eax
   0x08048d83 <+149>:	lea    0x28(%esp),%esi
   0x08048d87 <+153>:	mov    %ebx,%ecx
   0x08048d89 <+155>:	mov    (%eax),%edx
   0x08048d8b <+157>:	mov    %edx,0x8(%ecx)
   0x08048d8e <+160>:	add    $0x4,%eax
   0x08048d91 <+163>:	cmp    %esi,%eax
   ......
(gdb) i r
eax            0x0	0
ecx            0x0	0
edx            0x0	0
ebx            0x0	0
esp            0xffffcfa0	0xffffcfa0
ebp            0xffffd008	0xffffd008
esi            0x6	6
edi            0x0	0
(gdb) p *(int *)(0x28+$esp+($ebx)*4)
$9 = 6

   0x08048d64 <+118>:	mov    %ebx,%esi
   0x08048d66 <+120>:	mov    0x28(%esp,%ebx,4),%ecx
   0x08048d6a <+124>:	cmp    $0x1,%ecx
   0x08048d6d <+127>:	jle    0x8048d53 <phase_6+101>
   0x08048d6f <+129>:	mov    $0x1,%eax
   0x08048d74 <+134>:	mov    $0x804c0a0,%edx
=> 0x08048d79 <+139>:	jmp    0x8048d47 <phase_6+89>
   0x08048d7b <+141>:	mov    0x10(%esp),%ebx
   0x08048d7f <+145>:	lea    0x14(%esp),%eax
   0x08048d83 <+149>:	lea    0x28(%esp),%esi
   0x08048d87 <+153>:	mov    %ebx,%ecx
   0x08048d89 <+155>:	mov    (%eax),%edx
   0x08048d8b <+157>:	mov    %edx,0x8(%ecx)
   0x08048d8e <+160>:	add    $0x4,%eax
   0x08048d91 <+163>:	cmp    %esi,%eax
(gdb) i r
eax            0x1	1
ecx            0x6	6
edx            0x804c0a0	134529184
ebx            0x0	0
esp            0xffffcfa0	0xffffcfa0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0
(gdb) print *(int *) 0x804c0a0
$10 = 328

   0x08048d47 <+89>:	mov    0x8(%edx),%edx              
=> 0x08048d4a <+92>:	add    $0x1,%eax
   0x08048d4d <+95>:	cmp    %ecx,%eax
   0x08048d4f <+97>:	jne    0x8048d47 <phase_6+89>      # Loop!
   0x08048d51 <+99>:	jmp    0x8048d58 <phase_6+106>
   0x08048d53 <+101>:	mov    $0x804c0a0,%edx
   0x08048d58 <+106>:	mov    %edx,0x10(%esp,%esi,4)
   0x08048d5c <+110>:	add    $0x1,%ebx
   0x08048d5f <+113>:	cmp    $0x6,%ebx
   0x08048d62 <+116>:	je     0x8048d7b <phase_6+141>
   0x08048d64 <+118>:	mov    %ebx,%esi
   0x08048d66 <+120>:	mov    0x28(%esp,%ebx,4),%ecx
   0x08048d6a <+124>:	cmp    $0x1,%ecx
   0x08048d6d <+127>:	jle    0x8048d53 <phase_6+101>
   0x08048d6f <+129>:	mov    $0x1,%eax
   0x08048d74 <+134>:	mov    $0x804c0a0,%edx                       
(gdb) i r
eax            0x1	1
ecx            0x6	6
edx            0x804c0ac	134529196
ebx            0x0	0
esp            0xffffcfa0	0xffffcfa0
ebp            0xffffd008	0xffffd008
esi            0x0	0
edi            0x0	0

(gdb) disas
Dump of assembler code for function phase_6:
   0x08048cee <+0>:	push   %esi
   0x08048cef <+1>:	push   %ebx
   0x08048cf0 <+2>:	sub    $0x44,%esp
   0x08048cf3 <+5>:	lea    0x28(%esp),%eax
   0x08048cf7 <+9>:	mov    %eax,0x4(%esp)
   0x08048cfb <+13>:	mov    0x50(%esp),%eax
   0x08048cff <+17>:	mov    %eax,(%esp)
   0x08048d02 <+20>:	call   0x8049144 <read_six_numbers>
   0x08048d07 <+25>:	mov    $0x0,%esi
   0x08048d0c <+30>:	mov    0x28(%esp,%esi,4),%eax
   0x08048d10 <+34>:	sub    $0x1,%eax
   0x08048d13 <+37>:	cmp    $0x5,%eax
   0x08048d16 <+40>:	jbe    0x8048d1d <phase_6+47>
   0x08048d18 <+42>:	call   0x8049105 <explode_bomb>
   0x08048d1d <+47>:	add    $0x1,%esi
   0x08048d20 <+50>:	cmp    $0x6,%esi
   0x08048d23 <+53>:	jne    0x8048d2c <phase_6+62>
   0x08048d25 <+55>:	mov    $0x0,%ebx
   0x08048d2a <+60>:	jmp    0x8048d64 <phase_6+118>
   0x08048d2c <+62>:	mov    %esi,%ebx
   0x08048d2e <+64>:	mov    0x28(%esp,%ebx,4),%eax
   0x08048d32 <+68>:	cmp    %eax,0x24(%esp,%esi,4)
   0x08048d36 <+72>:	jne    0x8048d3d <phase_6+79>
   0x08048d38 <+74>:	call   0x8049105 <explode_bomb>
   0x08048d3d <+79>:	add    $0x1,%ebx
   0x08048d40 <+82>:	cmp    $0x5,%ebx
   0x08048d43 <+85>:	jle    0x8048d2e <phase_6+64>
   0x08048d45 <+87>:	jmp    0x8048d0c <phase_6+30>
   0x08048d47 <+89>:	mov    0x8(%edx),%edx
   0x08048d4a <+92>:	add    $0x1,%eax
   0x08048d4d <+95>:	cmp    %ecx,%eax
=> 0x08048d4f <+97>:	jne    0x8048d47 <phase_6+89>
   0x08048d51 <+99>:	jmp    0x8048d58 <phase_6+106>
   0x08048d53 <+101>:	mov    $0x804c0a0,%edx
   0x08048d58 <+106>:	mov    %edx,0x10(%esp,%esi,4)
   0x08048d5c <+110>:	add    $0x1,%ebx
   0x08048d5f <+113>:	cmp    $0x6,%ebx
   0x08048d62 <+116>:	je     0x8048d7b <phase_6+141>
   0x08048d64 <+118>:	mov    %ebx,%esi
   0x08048d66 <+120>:	mov    0x28(%esp,%ebx,4),%ecx
   0x08048d6a <+124>:	cmp    $0x1,%ecx
   0x08048d6d <+127>:	jle    0x8048d53 <phase_6+101>
   0x08048d6f <+129>:	mov    $0x1,%eax
   0x08048d74 <+134>:	mov    $0x804c0a0,%edx
   0x08048d79 <+139>:	jmp    0x8048d47 <phase_6+89>
   0x08048d7b <+141>:	mov    0x10(%esp),%ebx
   0x08048d7f <+145>:	lea    0x14(%esp),%eax
   0x08048d83 <+149>:	lea    0x28(%esp),%esi
---Type <return> to continue, or q <return> to quit---q
Quit
(gdb) i r
eax            0x4	4                                # The program is checking the 4th node.
ecx            0x6	6
edx            0x804c0c4	134529220
ebx            0x5	5
esp            0xffffcfa0	0xffffcfa0
ebp            0xffffd008	0xffffd008
esi            0x5	5
edi            0x0	0
eip            0x8048d4f	0x8048d4f <phase_6+97>
eflags         0x293	[ CF AF SF IF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
(gdb) x/d 0x804c0c
0x804c0c:	Cannot access memory at address 0x804c0c

(gdb) x/3x ($edx - 36)
0x804c0a0 <node1>:	0x00000148	0x00000001	0x0804c0ac # 2
(gdb) x/3x ($edx - 24)
0x804c0ac <node2>:	0x000003d5	0x00000002	0x0804c0b8 # 6, largest
(gdb) x/3x ($edx - 12)
0x804c0b8 <node3>:	0x000001df	0x00000003	0x0804c0c4 # 3
(gdb) x/3x ($edx)
0x804c0c4 <node4>:	0x000001f4	0x00000004	0x0804c0d0 # 4
(gdb) x/3x ($edx + 12)
0x804c0d0 <node5>:	0x00000329	0x00000005	0x0804c0dc # 5
(gdb) x/3x ($edx + 24)
0x804c0dc <node6>:	0x000000ad	0x00000006	0x00000000 # 1, smallest
(gdb)

# Nodes from smallest to largest: 6 1 3 4 5 2