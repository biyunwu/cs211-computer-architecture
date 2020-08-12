# Test input: 5 6
(gdb) disas
Dump of assembler code for function phase_4:
   0x08048bc9 <+0>:	sub    $0x2c,%esp
   0x08048bcc <+3>:	lea    0x18(%esp),%eax
   0x08048bd0 <+7>:	mov    %eax,0xc(%esp)
   0x08048bd4 <+11>:	lea    0x1c(%esp),%eax
   0x08048bd8 <+15>:	mov    %eax,0x8(%esp)
   0x08048bdc <+19>:	movl   $0x804a2b9,0x4(%esp)
   0x08048be4 <+27>:	mov    0x30(%esp),%eax
   0x08048be8 <+31>:	mov    %eax,(%esp)
   0x08048beb <+34>:	call   0x8048810 <__isoc99_sscanf@plt>
   0x08048bf0 <+39>:	cmp    $0x1,%eax                        # %eax stores the number of inputs, it should be larger than 1.
   0x08048bf3 <+42>:	jg     0x8048bfa <phase_4+49>           # %eax > 1, jump.
   0x08048bf5 <+44>:	call   0x8049105 <explode_bomb>
   0x08048bfa <+49>:	cmpl   $0x7,0x1c(%esp)                  # Compare the input with 7.
   0x08048bff <+54>:	ja     0x8048c67 <phase_4+158>          # The input should be less than 7 in order to skip the bomb.
=> 0x08048c01 <+56>:	mov    0x1c(%esp),%eax                  # Store input in %eax.
   0x08048c05 <+60>:	jmp    *0x804a0a8(,%eax,4)              # Jump to location by reference. It may indicate `switch`.
                                                                # *(0x804a0a8 + ($eax)*4)
                                                                # When %eax = 3, p/x *(0x804a0a8 + ($eax)*4) yields 0x08048c2b
                                                                # When %eax = 4, p/x *(0x804a0a8 + ($eax)*4) yields 0x08048c37
                                                                # When %eax = 5  ............................yields 0x08048c43, which doesn't exist.
                                                                # Choose 4 for the 1st input to avoid unneccessary jumps.
   0x08048c0c <+67>:	mov    $0x0,%eax
   0x08048c11 <+72>:	jmp    0x8048c18 <phase_4+79>
   0x08048c13 <+74>:	mov    $0x34f,%eax
   0x08048c18 <+79>:	sub    $0x372,%eax
   0x08048c1d <+84>:	jmp    0x8048c24 <phase_4+91>
   0x08048c1f <+86>:	mov    $0x0,%eax
   0x08048c24 <+91>:	add    $0x16e,%eax
   0x08048c29 <+96>:	jmp    0x8048c30 <phase_4+103>
   0x08048c2b <+98>:	mov    $0x0,%eax
   0x08048c30 <+103>:	sub    $0x25c,%eax
   0x08048c35 <+108>:	jmp    0x8048c3c <phase_4+115>
   0x08048c37 <+110>:	mov    $0x0,%eax                        # %eax = 0
   0x08048c3c <+115>:	add    $0x25c,%eax                      # %eax = 0 + 0x25c = 0x25c
   0x08048c41 <+120>:	jmp    0x8048c48 <phase_4+127>          # Jump
   0x08048c43 <+122>:	mov    $0x0,%eax
   0x08048c48 <+127>:	sub    $0x25c,%eax                      # %eax = 0x25c - 0x25c = 0
   0x08048c4d <+132>:	jmp    0x8048c54 <phase_4+139>          # Jump
   0x08048c4f <+134>:	mov    $0x0,%eax
   0x08048c54 <+139>:	add    $0x25c,%eax                      # %eax = 0 + 0x25c = 0x25c
   0x08048c59 <+144>:	jmp    0x8048c60 <phase_4+151>          # Jump
   0x08048c5b <+146>:	mov    $0x0,%eax
   0x08048c60 <+151>:	sub    $0x25c,%eax                      # %eax = 0x25c - 0x25c = 0
   0x08048c65 <+156>:	jmp    0x8048c71 <phase_4+168>          # Jump
   0x08048c67 <+158>:	call   0x8049105 <explode_bomb>
   0x08048c6c <+163>:	mov    $0x0,%eax
   0x08048c71 <+168>:	cmpl   $0x5,0x1c(%esp)                  # Compare the 1st input with 5.
   0x08048c76 <+173>:	jg     0x8048c7e <phase_4+181>          # It must be <= 5. 
   0x08048c78 <+175>:	cmp    0x18(%esp),%eax                  # 0x18(%esp) points to the 2nd input, %eax = 0.
   0x08048c7c <+179>:	je     0x8048c83 <phase_4+186>          # The 2nd input must be 0 in order to jump.
   0x08048c7e <+181>:	call   0x8049105 <explode_bomb>
   0x08048c83 <+186>:	add    $0x2c,%esp
   0x08048c86 <+189>:	ret
End of assembler dump.