08048b10 <phase_1>:
 8048b10:       83 ec 2c                sub    $0x2c,%esp
 8048b13:       c7 44 24 1c 00 00 00    movl   $0x0,0x1c(%esp)
 8048b1a:       00 
 8048b1b:       8d 44 24 1c             lea    0x1c(%esp),%eax
 8048b1f:       89 44 24 08             mov    %eax,0x8(%esp)
 8048b23:       c7 44 24 04 bc a2 04    movl   $0x804a2bc,0x4(%esp)
 8048b2a:       08 
 8048b2b:       8b 44 24 30             mov    0x30(%esp),%eax
 8048b2f:       89 04 24                mov    %eax,(%esp)
 8048b32:       e8 d9 fc ff ff          call   8048810 <__isoc99_sscanf@plt>       # scan
 8048b37:       83 f8 01                cmp    $0x1,%eax                           # compare $eax to 1, $eax has to be 1 in order to not trigger the bomb.
 8048b3a:       74 05                   je     8048b41 <phase_1+0x31>              # if (x==y) jump to '8048b41'
 8048b3c:       e8 c4 05 00 00          call   8049105 <explode_bomb>
 8048b41:       81 7c 24 1c d9 00 00    cmpl   $0xd9,0x1c(%esp)                    # compare 0x1c(%esp) [a] to $0xd9 [b]
 8048b48:       00 
 8048b49:       74 05                   je     8048b50 <phase_1+0x40>              # if (a == b) jump to '8048b50'
 8048b4b:       e8 b5 05 00 00          call   8049105 <explode_bomb>
 8048b50:       83 c4 2c                add    $0x2c,%esp                          # %esp = %esp + $0x2c
 8048b53:       c3                      ret                                        # return %rax

08048b54 <phase_2>:
 8048b54:       83 ec 1c                sub    $0x1c,%esp
 8048b57:       c7 44 24 04 80 a0 04    movl   $0x804a080,0x4(%esp)
 8048b5e:       08 
 8048b5f:       8b 44 24 20             mov    0x20(%esp),%eax
 8048b63:       89 04 24                mov    %eax,(%esp)
 8048b66:       e8 ff 02 00 00          call   8048e6a <strings_not_equal>
 8048b6b:       85 c0                   test   %eax,%eax
 8048b6d:       74 05                   je     8048b74 <phase_2+0x20>
 8048b6f:       e8 91 05 00 00          call   8049105 <explode_bomb>
 8048b74:       83 c4 1c                add    $0x1c,%esp
 8048b77:       c3                      ret    

08048b78 <phase_3>:
 8048b78:       53                      push   %ebx
 8048b79:       83 ec 38                sub    $0x38,%esp
 8048b7c:       8d 44 24 18             lea    0x18(%esp),%eax
 8048b80:       89 44 24 04             mov    %eax,0x4(%esp)
 8048b84:       8b 44 24 40             mov    0x40(%esp),%eax
 8048b88:       89 04 24                mov    %eax,(%esp)
 8048b8b:       e8 b4 05 00 00          call   8049144 <read_six_numbers>
 8048b90:       83 7c 24 18 00          cmpl   $0x0,0x18(%esp)
 8048b95:       79 26                   jns    8048bbd <phase_3+0x45>
 8048b97:       e8 69 05 00 00          call   8049105 <explode_bomb>
 8048b9c:       eb 1f                   jmp    8048bbd <phase_3+0x45>
 8048b9e:       8d 04 9b                lea    (%ebx,%ebx,4),%eax
 8048ba1:       8d 04 83                lea    (%ebx,%eax,4),%eax
 8048ba4:       03 44 9c 14             add    0x14(%esp,%ebx,4),%eax
 8048ba8:       39 44 9c 18             cmp    %eax,0x18(%esp,%ebx,4)
 8048bac:       74 05                   je     8048bb3 <phase_3+0x3b>
 8048bae:       e8 52 05 00 00          call   8049105 <explode_bomb>
 8048bb3:       83 c3 01                add    $0x1,%ebx
 8048bb6:       83 fb 06                cmp    $0x6,%ebx
 8048bb9:       75 e3                   jne    8048b9e <phase_3+0x26>
 8048bbb:       eb 07                   jmp    8048bc4 <phase_3+0x4c>
 8048bbd:       bb 01 00 00 00          mov    $0x1,%ebx
 8048bc2:       eb da                   jmp    8048b9e <phase_3+0x26>
 8048bc4:       83 c4 38                add    $0x38,%esp
 8048bc7:       5b                      pop    %ebx
 8048bc8:       c3                      ret    

08048bc9 <phase_4>:
 8048bc9:       83 ec 2c                sub    $0x2c,%esp
 8048bcc:       8d 44 24 18             lea    0x18(%esp),%eax
 8048bd0:       89 44 24 0c             mov    %eax,0xc(%esp)
 8048bd4:       8d 44 24 1c             lea    0x1c(%esp),%eax
 8048bd8:       89 44 24 08             mov    %eax,0x8(%esp)
 8048bdc:       c7 44 24 04 b9 a2 04    movl   $0x804a2b9,0x4(%esp)
 8048be3:       08 
 8048be4:       8b 44 24 30             mov    0x30(%esp),%eax
 8048be8:       89 04 24                mov    %eax,(%esp)
 8048beb:       e8 20 fc ff ff          call   8048810 <__isoc99_sscanf@plt>
 8048bf0:       83 f8 01                cmp    $0x1,%eax
 8048bf3:       7f 05                   jg     8048bfa <phase_4+0x31>
 8048bf5:       e8 0b 05 00 00          call   8049105 <explode_bomb>
 8048bfa:       83 7c 24 1c 07          cmpl   $0x7,0x1c(%esp)
 8048bff:       77 66                   ja     8048c67 <phase_4+0x9e>
 8048c01:       8b 44 24 1c             mov    0x1c(%esp),%eax
 8048c05:       ff 24 85 a8 a0 04 08    jmp    *0x804a0a8(,%eax,4)
 8048c0c:       b8 00 00 00 00          mov    $0x0,%eax
 8048c11:       eb 05                   jmp    8048c18 <phase_4+0x4f>
 8048c13:       b8 4f 03 00 00          mov    $0x34f,%eax
 8048c18:       2d 72 03 00 00          sub    $0x372,%eax
 8048c1d:       eb 05                   jmp    8048c24 <phase_4+0x5b>
 8048c1f:       b8 00 00 00 00          mov    $0x0,%eax
 8048c24:       05 6e 01 00 00          add    $0x16e,%eax
 8048c29:       eb 05                   jmp    8048c30 <phase_4+0x67>
 8048c2b:       b8 00 00 00 00          mov    $0x0,%eax
 8048c30:       2d 5c 02 00 00          sub    $0x25c,%eax
 8048c35:       eb 05                   jmp    8048c3c <phase_4+0x73>
 8048c37:       b8 00 00 00 00          mov    $0x0,%eax
 8048c3c:       05 5c 02 00 00          add    $0x25c,%eax
 8048c41:       eb 05                   jmp    8048c48 <phase_4+0x7f>
 8048c43:       b8 00 00 00 00          mov    $0x0,%eax
 8048c48:       2d 5c 02 00 00          sub    $0x25c,%eax
 8048c4d:       eb 05                   jmp    8048c54 <phase_4+0x8b>
 8048c4f:       b8 00 00 00 00          mov    $0x0,%eax
 8048c54:       05 5c 02 00 00          add    $0x25c,%eax
 8048c59:       eb 05                   jmp    8048c60 <phase_4+0x97>
 8048c5b:       b8 00 00 00 00          mov    $0x0,%eax
 8048c60:       2d 5c 02 00 00          sub    $0x25c,%eax
 8048c65:       eb 0a                   jmp    8048c71 <phase_4+0xa8>
 8048c67:       e8 99 04 00 00          call   8049105 <explode_bomb>
 8048c6c:       b8 00 00 00 00          mov    $0x0,%eax
 8048c71:       83 7c 24 1c 05          cmpl   $0x5,0x1c(%esp)
 8048c76:       7f 06                   jg     8048c7e <phase_4+0xb5>
 8048c78:       3b 44 24 18             cmp    0x18(%esp),%eax
 8048c7c:       74 05                   je     8048c83 <phase_4+0xba>
 8048c7e:       e8 82 04 00 00          call   8049105 <explode_bomb>
 8048c83:       83 c4 2c                add    $0x2c,%esp
 8048c86:       c3                      ret    

08048c87 <phase_5>:
 8048c87:       53                      push   %ebx
 8048c88:       83 ec 28                sub    $0x28,%esp
 8048c8b:       8b 5c 24 30             mov    0x30(%esp),%ebx
 8048c8f:       89 1c 24                mov    %ebx,(%esp)
 8048c92:       e8 b4 01 00 00          call   8048e4b <string_length>
 8048c97:       83 f8 06                cmp    $0x6,%eax
 8048c9a:       74 46                   je     8048ce2 <phase_5+0x5b>
 8048c9c:       e8 64 04 00 00          call   8049105 <explode_bomb>
 8048ca1:       eb 3f                   jmp    8048ce2 <phase_5+0x5b>
 8048ca3:       0f b6 14 03             movzbl (%ebx,%eax,1),%edx
 8048ca7:       83 e2 0f                and    $0xf,%edx
 8048caa:       0f b6 92 c8 a0 04 08    movzbl 0x804a0c8(%edx),%edx
 8048cb1:       88 54 04 19             mov    %dl,0x19(%esp,%eax,1)
 8048cb5:       83 c0 01                add    $0x1,%eax
 8048cb8:       83 f8 06                cmp    $0x6,%eax
 8048cbb:       75 e6                   jne    8048ca3 <phase_5+0x1c>
 8048cbd:       c6 44 24 1f 00          movb   $0x0,0x1f(%esp)
 8048cc2:       c7 44 24 04 9e a0 04    movl   $0x804a09e,0x4(%esp)
 8048cc9:       08 
 8048cca:       8d 44 24 19             lea    0x19(%esp),%eax
 8048cce:       89 04 24                mov    %eax,(%esp)
 8048cd1:       e8 94 01 00 00          call   8048e6a <strings_not_equal>
 8048cd6:       85 c0                   test   %eax,%eax
 8048cd8:       74 0f                   je     8048ce9 <phase_5+0x62>
 8048cda:       e8 26 04 00 00          call   8049105 <explode_bomb>
 8048cdf:       90                      nop
 8048ce0:       eb 07                   jmp    8048ce9 <phase_5+0x62>
 8048ce2:       b8 00 00 00 00          mov    $0x0,%eax
 8048ce7:       eb ba                   jmp    8048ca3 <phase_5+0x1c>
 8048ce9:       83 c4 28                add    $0x28,%esp
 8048cec:       5b                      pop    %ebx
 8048ced:       c3                      ret    

08048cee <phase_6>:
 8048cee:       56                      push   %esi
 8048cef:       53                      push   %ebx
 8048cf0:       83 ec 44                sub    $0x44,%esp
 8048cf3:       8d 44 24 28             lea    0x28(%esp),%eax
 8048cf7:       89 44 24 04             mov    %eax,0x4(%esp)
 8048cfb:       8b 44 24 50             mov    0x50(%esp),%eax
 8048cff:       89 04 24                mov    %eax,(%esp)
 8048d02:       e8 3d 04 00 00          call   8049144 <read_six_numbers>
 8048d07:       be 00 00 00 00          mov    $0x0,%esi
 8048d0c:       8b 44 b4 28             mov    0x28(%esp,%esi,4),%eax
 8048d10:       83 e8 01                sub    $0x1,%eax
 8048d13:       83 f8 05                cmp    $0x5,%eax
 8048d16:       76 05                   jbe    8048d1d <phase_6+0x2f>
 8048d18:       e8 e8 03 00 00          call   8049105 <explode_bomb>
 8048d1d:       83 c6 01                add    $0x1,%esi
 8048d20:       83 fe 06                cmp    $0x6,%esi
 8048d23:       75 07                   jne    8048d2c <phase_6+0x3e>
 8048d25:       bb 00 00 00 00          mov    $0x0,%ebx
 8048d2a:       eb 38                   jmp    8048d64 <phase_6+0x76>
 8048d2c:       89 f3                   mov    %esi,%ebx
 8048d2e:       8b 44 9c 28             mov    0x28(%esp,%ebx,4),%eax
 8048d32:       39 44 b4 24             cmp    %eax,0x24(%esp,%esi,4)
 8048d36:       75 05                   jne    8048d3d <phase_6+0x4f>
 8048d38:       e8 c8 03 00 00          call   8049105 <explode_bomb>
 8048d3d:       83 c3 01                add    $0x1,%ebx
 8048d40:       83 fb 05                cmp    $0x5,%ebx
 8048d43:       7e e9                   jle    8048d2e <phase_6+0x40>
 8048d45:       eb c5                   jmp    8048d0c <phase_6+0x1e>
 8048d47:       8b 52 08                mov    0x8(%edx),%edx
 8048d4a:       83 c0 01                add    $0x1,%eax
 8048d4d:       39 c8                   cmp    %ecx,%eax
 8048d4f:       75 f6                   jne    8048d47 <phase_6+0x59>
 8048d51:       eb 05                   jmp    8048d58 <phase_6+0x6a>
 8048d53:       ba a0 c0 04 08          mov    $0x804c0a0,%edx
 8048d58:       89 54 b4 10             mov    %edx,0x10(%esp,%esi,4)
 8048d5c:       83 c3 01                add    $0x1,%ebx
 8048d5f:       83 fb 06                cmp    $0x6,%ebx
 8048d62:       74 17                   je     8048d7b <phase_6+0x8d>
 8048d64:       89 de                   mov    %ebx,%esi
 8048d66:       8b 4c 9c 28             mov    0x28(%esp,%ebx,4),%ecx
 8048d6a:       83 f9 01                cmp    $0x1,%ecx
 8048d6d:       7e e4                   jle    8048d53 <phase_6+0x65>
 8048d6f:       b8 01 00 00 00          mov    $0x1,%eax
 8048d74:       ba a0 c0 04 08          mov    $0x804c0a0,%edx
 8048d79:       eb cc                   jmp    8048d47 <phase_6+0x59>
 8048d7b:       8b 5c 24 10             mov    0x10(%esp),%ebx
 8048d7f:       8d 44 24 14             lea    0x14(%esp),%eax
 8048d83:       8d 74 24 28             lea    0x28(%esp),%esi
 8048d87:       89 d9                   mov    %ebx,%ecx
 8048d89:       8b 10                   mov    (%eax),%edx
 8048d8b:       89 51 08                mov    %edx,0x8(%ecx)
 8048d8e:       83 c0 04                add    $0x4,%eax
 8048d91:       39 f0                   cmp    %esi,%eax
 8048d93:       74 04                   je     8048d99 <phase_6+0xab>
 8048d95:       89 d1                   mov    %edx,%ecx
 8048d97:       eb f0                   jmp    8048d89 <phase_6+0x9b>
 8048d99:       c7 42 08 00 00 00 00    movl   $0x0,0x8(%edx)
 8048da0:       be 05 00 00 00          mov    $0x5,%esi
 8048da5:       8b 43 08                mov    0x8(%ebx),%eax
 8048da8:       8b 00                   mov    (%eax),%eax
 8048daa:       39 03                   cmp    %eax,(%ebx)
 8048dac:       7e 05                   jle    8048db3 <phase_6+0xc5>
 8048dae:       e8 52 03 00 00          call   8049105 <explode_bomb>
 8048db3:       8b 5b 08                mov    0x8(%ebx),%ebx
 8048db6:       83 ee 01                sub    $0x1,%esi
 8048db9:       75 ea                   jne    8048da5 <phase_6+0xb7>
 8048dbb:       83 c4 44                add    $0x44,%esp
 8048dbe:       5b                      pop    %ebx
 8048dbf:       5e                      pop    %esi
 8048dc0:       c3                      ret    
 8048dc1:       66 90                   xchg   %ax,%ax
 8048dc3:       66 90                   xchg   %ax,%ax
 8048dc5:       66 90                   xchg   %ax,%ax
 8048dc7:       66 90                   xchg   %ax,%ax
 8048dc9:       66 90                   xchg   %ax,%ax
 8048dcb:       66 90                   xchg   %ax,%ax
 8048dcd:       66 90                   xchg   %ax,%ax
 8048dcf:       90                      nop

08048dd0 <sig_handler>:
 8048dd0:       83 ec 1c                sub    $0x1c,%esp
 8048dd3:       c7 04 24 d8 a0 04 08    movl   $0x804a0d8,(%esp)
 8048dda:       e8 d1 f9 ff ff          call   80487b0 <puts@plt>
 8048ddf:       c7 04 24 03 00 00 00    movl   $0x3,(%esp)
 8048de6:       e8 65 f9 ff ff          call   8048750 <sleep@plt>
 8048deb:       c7 04 24 35 a2 04 08    movl   $0x804a235,(%esp)
 8048df2:       e8 09 f9 ff ff          call   8048700 <printf@plt>
 8048df7:       a1 40 c7 04 08          mov    0x804c740,%eax
 8048dfc:       89 04 24                mov    %eax,(%esp)
 8048dff:       e8 0c f9 ff ff          call   8048710 <fflush@plt>
 8048e04:       c7 04 24 01 00 00 00    movl   $0x1,(%esp)
 8048e0b:       e8 40 f9 ff ff          call   8048750 <sleep@plt>
 8048e10:       c7 04 24 3d a2 04 08    movl   $0x804a23d,(%esp)
 8048e17:       e8 94 f9 ff ff          call   80487b0 <puts@plt>
 8048e1c:       c7 04 24 10 00 00 00    movl   $0x10,(%esp)
 8048e23:       e8 98 f9 ff ff          call   80487c0 <exit@plt>

08048e28 <invalid_phase>:
 8048e28:       83 ec 1c                sub    $0x1c,%esp
 8048e2b:       8b 44 24 20             mov    0x20(%esp),%eax
 8048e2f:       89 44 24 04             mov    %eax,0x4(%esp)
 8048e33:       c7 04 24 45 a2 04 08    movl   $0x804a245,(%esp)
 8048e3a:       e8 c1 f8 ff ff          call   8048700 <printf@plt>
 8048e3f:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 8048e46:       e8 75 f9 ff ff          call   80487c0 <exit@plt>

08048e4b <string_length>:
 8048e4b:       8b 54 24 04             mov    0x4(%esp),%edx
 8048e4f:       80 3a 00                cmpb   $0x0,(%edx)
 8048e52:       74 10                   je     8048e64 <string_length+0x19>
 8048e54:       b8 00 00 00 00          mov    $0x0,%eax
 8048e59:       83 c0 01                add    $0x1,%eax
 8048e5c:       80 3c 02 00             cmpb   $0x0,(%edx,%eax,1)
 8048e60:       75 f7                   jne    8048e59 <string_length+0xe>
 8048e62:       f3 c3                   repz ret 
 8048e64:       b8 00 00 00 00          mov    $0x0,%eax
 8048e69:       c3                      ret    

08048e6a <strings_not_equal>:
 8048e6a:       57                      push   %edi
 8048e6b:       56                      push   %esi
 8048e6c:       53                      push   %ebx
 8048e6d:       83 ec 04                sub    $0x4,%esp
 8048e70:       8b 5c 24 14             mov    0x14(%esp),%ebx
 8048e74:       8b 74 24 18             mov    0x18(%esp),%esi
 8048e78:       89 1c 24                mov    %ebx,(%esp)
 8048e7b:       e8 cb ff ff ff          call   8048e4b <string_length>
 8048e80:       89 c7                   mov    %eax,%edi
 8048e82:       89 34 24                mov    %esi,(%esp)
 8048e85:       e8 c1 ff ff ff          call   8048e4b <string_length>
 8048e8a:       ba 01 00 00 00          mov    $0x1,%edx
 8048e8f:       39 c7                   cmp    %eax,%edi
 8048e91:       75 3a                   jne    8048ecd <strings_not_equal+0x63>
 8048e93:       0f b6 03                movzbl (%ebx),%eax
 8048e96:       84 c0                   test   %al,%al
 8048e98:       74 20                   je     8048eba <strings_not_equal+0x50>
 8048e9a:       3a 06                   cmp    (%esi),%al
 8048e9c:       74 08                   je     8048ea6 <strings_not_equal+0x3c>
 8048e9e:       66 90                   xchg   %ax,%ax
 8048ea0:       eb 1f                   jmp    8048ec1 <strings_not_equal+0x57>
 8048ea2:       3a 06                   cmp    (%esi),%al
 8048ea4:       75 22                   jne    8048ec8 <strings_not_equal+0x5e>
 8048ea6:       83 c3 01                add    $0x1,%ebx
 8048ea9:       83 c6 01                add    $0x1,%esi
 8048eac:       0f b6 03                movzbl (%ebx),%eax
 8048eaf:       84 c0                   test   %al,%al
 8048eb1:       75 ef                   jne    8048ea2 <strings_not_equal+0x38>
 8048eb3:       ba 00 00 00 00          mov    $0x0,%edx
 8048eb8:       eb 13                   jmp    8048ecd <strings_not_equal+0x63>
 8048eba:       ba 00 00 00 00          mov    $0x0,%edx
 8048ebf:       eb 0c                   jmp    8048ecd <strings_not_equal+0x63>
 8048ec1:       ba 01 00 00 00          mov    $0x1,%edx
 8048ec6:       eb 05                   jmp    8048ecd <strings_not_equal+0x63>
 8048ec8:       ba 01 00 00 00          mov    $0x1,%edx
 8048ecd:       89 d0                   mov    %edx,%eax
 8048ecf:       83 c4 04                add    $0x4,%esp
 8048ed2:       5b                      pop    %ebx
 8048ed3:       5e                      pop    %esi
 8048ed4:       5f                      pop    %edi
 8048ed5:       c3                      ret    

08048ed6 <initialize_bomb>:
 8048ed6:       56                      push   %esi
 8048ed7:       53                      push   %ebx
 8048ed8:       81 ec 54 20 00 00       sub    $0x2054,%esp
 8048ede:       c7 44 24 04 d0 8d 04    movl   $0x8048dd0,0x4(%esp)
 8048ee5:       08 
 8048ee6:       c7 04 24 02 00 00 00    movl   $0x2,(%esp)
 8048eed:       e8 4e f8 ff ff          call   8048740 <signal@plt>
 8048ef2:       c7 44 24 04 40 00 00    movl   $0x40,0x4(%esp)
 8048ef9:       00 
 8048efa:       8d 84 24 10 20 00 00    lea    0x2010(%esp),%eax
 8048f01:       89 04 24                mov    %eax,(%esp)
 8048f04:       e8 87 f8 ff ff          call   8048790 <gethostname@plt>
 8048f09:       85 c0                   test   %eax,%eax
 8048f0b:       75 17                   jne    8048f24 <initialize_bomb+0x4e>
 8048f0d:       a1 20 c5 04 08          mov    0x804c520,%eax
 8048f12:       bb 00 00 00 00          mov    $0x0,%ebx
 8048f17:       8d b4 24 10 20 00 00    lea    0x2010(%esp),%esi
 8048f1e:       85 c0                   test   %eax,%eax
 8048f20:       75 1a                   jne    8048f3c <initialize_bomb+0x66>
 8048f22:       eb 58                   jmp    8048f7c <initialize_bomb+0xa6>
 8048f24:       c7 04 24 10 a1 04 08    movl   $0x804a110,(%esp)
 8048f2b:       e8 80 f8 ff ff          call   80487b0 <puts@plt>
 8048f30:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 8048f37:       e8 84 f8 ff ff          call   80487c0 <exit@plt>
 8048f3c:       89 74 24 04             mov    %esi,0x4(%esp)
 8048f40:       89 04 24                mov    %eax,(%esp)
 8048f43:       e8 b8 f8 ff ff          call   8048800 <strcasecmp@plt>
 8048f48:       85 c0                   test   %eax,%eax
 8048f4a:       74 48                   je     8048f94 <initialize_bomb+0xbe>
 8048f4c:       83 c3 01                add    $0x1,%ebx
 8048f4f:       8b 04 9d 20 c5 04 08    mov    0x804c520(,%ebx,4),%eax
 8048f56:       85 c0                   test   %eax,%eax
 8048f58:       75 e2                   jne    8048f3c <initialize_bomb+0x66>
 8048f5a:       eb 20                   jmp    8048f7c <initialize_bomb+0xa6>
 8048f5c:       8d 44 24 10             lea    0x10(%esp),%eax
 8048f60:       89 44 24 04             mov    %eax,0x4(%esp)
 8048f64:       c7 04 24 56 a2 04 08    movl   $0x804a256,(%esp)
 8048f6b:       e8 90 f7 ff ff          call   8048700 <printf@plt>
 8048f70:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 8048f77:       e8 44 f8 ff ff          call   80487c0 <exit@plt>
 8048f7c:       c7 04 24 48 a1 04 08    movl   $0x804a148,(%esp)
 8048f83:       e8 28 f8 ff ff          call   80487b0 <puts@plt>
 8048f88:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 8048f8f:       e8 2c f8 ff ff          call   80487c0 <exit@plt>
 8048f94:       8d 44 24 10             lea    0x10(%esp),%eax
 8048f98:       89 04 24                mov    %eax,(%esp)
 8048f9b:       e8 ba 0c 00 00          call   8049c5a <init_driver>
 8048fa0:       85 c0                   test   %eax,%eax
 8048fa2:       78 b8                   js     8048f5c <initialize_bomb+0x86>
 8048fa4:       81 c4 54 20 00 00       add    $0x2054,%esp
 8048faa:       5b                      pop    %ebx
 8048fab:       5e                      pop    %esi
 8048fac:       c3                      ret    

08048fad <initialize_bomb_solve>:
 8048fad:       f3 c3                   repz ret 

08048faf <blank_line>:
 8048faf:       56                      push   %esi
 8048fb0:       53                      push   %ebx
 8048fb1:       83 ec 04                sub    $0x4,%esp
 8048fb4:       8b 5c 24 10             mov    0x10(%esp),%ebx
 8048fb8:       eb 16                   jmp    8048fd0 <blank_line+0x21>
 8048fba:       e8 d1 f8 ff ff          call   8048890 <__ctype_b_loc@plt>
 8048fbf:       83 c3 01                add    $0x1,%ebx
 8048fc2:       89 f2                   mov    %esi,%edx
 8048fc4:       0f be f2                movsbl %dl,%esi
 8048fc7:       8b 00                   mov    (%eax),%eax
 8048fc9:       f6 44 70 01 20          testb  $0x20,0x1(%eax,%esi,2)
 8048fce:       74 10                   je     8048fe0 <blank_line+0x31>
 8048fd0:       0f b6 33                movzbl (%ebx),%esi
 8048fd3:       89 f0                   mov    %esi,%eax
 8048fd5:       84 c0                   test   %al,%al
 8048fd7:       75 e1                   jne    8048fba <blank_line+0xb>
 8048fd9:       b8 01 00 00 00          mov    $0x1,%eax
 8048fde:       eb 05                   jmp    8048fe5 <blank_line+0x36>
 8048fe0:       b8 00 00 00 00          mov    $0x0,%eax
 8048fe5:       83 c4 04                add    $0x4,%esp
 8048fe8:       5b                      pop    %ebx
 8048fe9:       5e                      pop    %esi
 8048fea:       c3                      ret    

08048feb <skip>:
 8048feb:       53                      push   %ebx
 8048fec:       83 ec 18                sub    $0x18,%esp
 8048fef:       a1 4c c7 04 08          mov    0x804c74c,%eax
 8048ff4:       89 44 24 08             mov    %eax,0x8(%esp)
 8048ff8:       c7 44 24 04 50 00 00    movl   $0x50,0x4(%esp)
 8048fff:       00 
 8049000:       a1 48 c7 04 08          mov    0x804c748,%eax
 8049005:       8d 04 80                lea    (%eax,%eax,4),%eax
 8049008:       c1 e0 04                shl    $0x4,%eax
 804900b:       05 60 c7 04 08          add    $0x804c760,%eax
 8049010:       89 04 24                mov    %eax,(%esp)
 8049013:       e8 18 f7 ff ff          call   8048730 <fgets@plt>
 8049018:       89 c3                   mov    %eax,%ebx
 804901a:       85 c0                   test   %eax,%eax
 804901c:       74 0c                   je     804902a <skip+0x3f>
 804901e:       89 04 24                mov    %eax,(%esp)
 8049021:       e8 89 ff ff ff          call   8048faf <blank_line>
 8049026:       85 c0                   test   %eax,%eax
 8049028:       75 c5                   jne    8048fef <skip+0x4>
 804902a:       89 d8                   mov    %ebx,%eax
 804902c:       83 c4 18                add    $0x18,%esp
 804902f:       5b                      pop    %ebx
 8049030:       c3                      ret    

08049031 <send_msg>:
 8049031:       57                      push   %edi
 8049032:       53                      push   %ebx
 8049033:       81 ec 24 40 00 00       sub    $0x4024,%esp
 8049039:       8b 15 48 c7 04 08       mov    0x804c748,%edx
 804903f:       8d 5c 92 fb             lea    -0x5(%edx,%edx,4),%ebx
 8049043:       c1 e3 04                shl    $0x4,%ebx
 8049046:       81 c3 60 c7 04 08       add    $0x804c760,%ebx
 804904c:       89 df                   mov    %ebx,%edi
 804904e:       b8 00 00 00 00          mov    $0x0,%eax
 8049053:       b9 ff ff ff ff          mov    $0xffffffff,%ecx
 8049058:       f2 ae                   repnz scas %es:(%edi),%al
 804905a:       f7 d1                   not    %ecx
 804905c:       83 c1 63                add    $0x63,%ecx
 804905f:       81 f9 00 20 00 00       cmp    $0x2000,%ecx
 8049065:       76 18                   jbe    804907f <send_msg+0x4e>
 8049067:       c7 04 24 80 a1 04 08    movl   $0x804a180,(%esp)
 804906e:       e8 8d f6 ff ff          call   8048700 <printf@plt>
 8049073:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 804907a:       e8 41 f7 ff ff          call   80487c0 <exit@plt>
 804907f:       83 bc 24 30 40 00 00    cmpl   $0x0,0x4030(%esp)
 8049086:       00 
 8049087:       b8 70 a2 04 08          mov    $0x804a270,%eax
 804908c:       b9 78 a2 04 08          mov    $0x804a278,%ecx
 8049091:       0f 44 c1                cmove  %ecx,%eax
 8049094:       89 5c 24 14             mov    %ebx,0x14(%esp)
 8049098:       89 54 24 10             mov    %edx,0x10(%esp)
 804909c:       89 44 24 0c             mov    %eax,0xc(%esp)
 80490a0:       a1 00 c5 04 08          mov    0x804c500,%eax
 80490a5:       89 44 24 08             mov    %eax,0x8(%esp)
 80490a9:       c7 44 24 04 81 a2 04    movl   $0x804a281,0x4(%esp)
 80490b0:       08 
 80490b1:       8d 9c 24 20 20 00 00    lea    0x2020(%esp),%ebx
 80490b8:       89 1c 24                mov    %ebx,(%esp)
 80490bb:       e8 80 f7 ff ff          call   8048840 <sprintf@plt>
 80490c0:       8d 44 24 20             lea    0x20(%esp),%eax
 80490c4:       89 44 24 0c             mov    %eax,0xc(%esp)
 80490c8:       c7 44 24 08 00 00 00    movl   $0x0,0x8(%esp)
 80490cf:       00 
 80490d0:       89 5c 24 04             mov    %ebx,0x4(%esp)
 80490d4:       c7 04 24 00 c1 04 08    movl   $0x804c100,(%esp)
 80490db:       e8 52 0d 00 00          call   8049e32 <driver_post>
 80490e0:       85 c0                   test   %eax,%eax
 80490e2:       79 18                   jns    80490fc <send_msg+0xcb>
 80490e4:       8d 44 24 20             lea    0x20(%esp),%eax
 80490e8:       89 04 24                mov    %eax,(%esp)
 80490eb:       e8 c0 f6 ff ff          call   80487b0 <puts@plt>
 80490f0:       c7 04 24 00 00 00 00    movl   $0x0,(%esp)
 80490f7:       e8 c4 f6 ff ff          call   80487c0 <exit@plt>
 80490fc:       81 c4 24 40 00 00       add    $0x4024,%esp
 8049102:       5b                      pop    %ebx
 8049103:       5f                      pop    %edi
 8049104:       c3                      ret    

08049105 <explode_bomb>:
 8049105:       83 ec 1c                sub    $0x1c,%esp
 8049108:       c7 04 24 8d a2 04 08    movl   $0x804a28d,(%esp)
 804910f:       e8 9c f6 ff ff          call   80487b0 <puts@plt>
 8049114:       c7 04 24 96 a2 04 08    movl   $0x804a296,(%esp)
 804911b:       e8 90 f6 ff ff          call   80487b0 <puts@plt>
 8049120:       c7 04 24 00 00 00 00    movl   $0x0,(%esp)
 8049127:       e8 05 ff ff ff          call   8049031 <send_msg>
 804912c:       c7 04 24 a4 a1 04 08    movl   $0x804a1a4,(%esp)
 8049133:       e8 78 f6 ff ff          call   80487b0 <puts@plt>
 8049138:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 804913f:       e8 7c f6 ff ff          call   80487c0 <exit@plt>

08049144 <read_six_numbers>:
 8049144:       83 ec 2c                sub    $0x2c,%esp
 8049147:       8b 44 24 34             mov    0x34(%esp),%eax
 804914b:       8d 50 14                lea    0x14(%eax),%edx
 804914e:       89 54 24 1c             mov    %edx,0x1c(%esp)
 8049152:       8d 50 10                lea    0x10(%eax),%edx
 8049155:       89 54 24 18             mov    %edx,0x18(%esp)
 8049159:       8d 50 0c                lea    0xc(%eax),%edx
 804915c:       89 54 24 14             mov    %edx,0x14(%esp)
 8049160:       8d 50 08                lea    0x8(%eax),%edx
 8049163:       89 54 24 10             mov    %edx,0x10(%esp)
 8049167:       8d 50 04                lea    0x4(%eax),%edx
 804916a:       89 54 24 0c             mov    %edx,0xc(%esp)
 804916e:       89 44 24 08             mov    %eax,0x8(%esp)
 8049172:       c7 44 24 04 ad a2 04    movl   $0x804a2ad,0x4(%esp)
 8049179:       08 
 804917a:       8b 44 24 30             mov    0x30(%esp),%eax
 804917e:       89 04 24                mov    %eax,(%esp)
 8049181:       e8 8a f6 ff ff          call   8048810 <__isoc99_sscanf@plt>
 8049186:       83 f8 05                cmp    $0x5,%eax
 8049189:       7f 05                   jg     8049190 <read_six_numbers+0x4c>
 804918b:       e8 75 ff ff ff          call   8049105 <explode_bomb>
 8049190:       83 c4 2c                add    $0x2c,%esp
 8049193:       c3                      ret    

08049194 <read_line>:
 8049194:       57                      push   %edi
 8049195:       56                      push   %esi
 8049196:       53                      push   %ebx
 8049197:       83 ec 10                sub    $0x10,%esp
 804919a:       e8 4c fe ff ff          call   8048feb <skip>
 804919f:       85 c0                   test   %eax,%eax
 80491a1:       75 6c                   jne    804920f <read_line+0x7b>
 80491a3:       a1 24 c7 04 08          mov    0x804c724,%eax
 80491a8:       39 05 4c c7 04 08       cmp    %eax,0x804c74c
 80491ae:       75 18                   jne    80491c8 <read_line+0x34>
 80491b0:       c7 04 24 bf a2 04 08    movl   $0x804a2bf,(%esp)
 80491b7:       e8 f4 f5 ff ff          call   80487b0 <puts@plt>
 80491bc:       c7 04 24 08 00 00 00    movl   $0x8,(%esp)
 80491c3:       e8 f8 f5 ff ff          call   80487c0 <exit@plt>
 80491c8:       c7 04 24 dd a2 04 08    movl   $0x804a2dd,(%esp)
 80491cf:       e8 cc f5 ff ff          call   80487a0 <getenv@plt>
 80491d4:       85 c0                   test   %eax,%eax
 80491d6:       74 0c                   je     80491e4 <read_line+0x50>
 80491d8:       c7 04 24 00 00 00 00    movl   $0x0,(%esp)
 80491df:       e8 dc f5 ff ff          call   80487c0 <exit@plt>
 80491e4:       a1 24 c7 04 08          mov    0x804c724,%eax
 80491e9:       a3 4c c7 04 08          mov    %eax,0x804c74c
 80491ee:       e8 f8 fd ff ff          call   8048feb <skip>
 80491f3:       85 c0                   test   %eax,%eax
 80491f5:       75 18                   jne    804920f <read_line+0x7b>
 80491f7:       c7 04 24 bf a2 04 08    movl   $0x804a2bf,(%esp)
 80491fe:       e8 ad f5 ff ff          call   80487b0 <puts@plt>
 8049203:       c7 04 24 00 00 00 00    movl   $0x0,(%esp)
 804920a:       e8 b1 f5 ff ff          call   80487c0 <exit@plt>
 804920f:       8b 15 48 c7 04 08       mov    0x804c748,%edx
 8049215:       8d 1c 92                lea    (%edx,%edx,4),%ebx
 8049218:       c1 e3 04                shl    $0x4,%ebx
 804921b:       81 c3 60 c7 04 08       add    $0x804c760,%ebx
 8049221:       89 df                   mov    %ebx,%edi
 8049223:       b8 00 00 00 00          mov    $0x0,%eax
 8049228:       b9 ff ff ff ff          mov    $0xffffffff,%ecx
 804922d:       f2 ae                   repnz scas %es:(%edi),%al
 804922f:       f7 d1                   not    %ecx
 8049231:       83 e9 01                sub    $0x1,%ecx
 8049234:       83 f9 4e                cmp    $0x4e,%ecx
 8049237:       7e 6f                   jle    80492a8 <read_line+0x114>
 8049239:       c7 04 24 e8 a2 04 08    movl   $0x804a2e8,(%esp)
 8049240:       e8 6b f5 ff ff          call   80487b0 <puts@plt>
 8049245:       a1 48 c7 04 08          mov    0x804c748,%eax
 804924a:       8d 50 01                lea    0x1(%eax),%edx
 804924d:       89 15 48 c7 04 08       mov    %edx,0x804c748
 8049253:       6b c0 50                imul   $0x50,%eax,%eax
 8049256:       8d 90 60 c7 04 08       lea    0x804c760(%eax),%edx
 804925c:       89 d7                   mov    %edx,%edi
 804925e:       be 03 a3 04 08          mov    $0x804a303,%esi
 8049263:       b8 10 00 00 00          mov    $0x10,%eax
 8049268:       f6 c2 01                test   $0x1,%dl
 804926b:       74 03                   je     8049270 <read_line+0xdc>
 804926d:       a4                      movsb  %ds:(%esi),%es:(%edi)
 804926e:       b0 0f                   mov    $0xf,%al
 8049270:       f7 c7 02 00 00 00       test   $0x2,%edi
 8049276:       74 05                   je     804927d <read_line+0xe9>
 8049278:       66 a5                   movsw  %ds:(%esi),%es:(%edi)
 804927a:       83 e8 02                sub    $0x2,%eax
 804927d:       89 c1                   mov    %eax,%ecx
 804927f:       c1 e9 02                shr    $0x2,%ecx
 8049282:       f3 a5                   rep movsl %ds:(%esi),%es:(%edi)
 8049284:       ba 00 00 00 00          mov    $0x0,%edx
 8049289:       a8 02                   test   $0x2,%al
 804928b:       74 0b                   je     8049298 <read_line+0x104>
 804928d:       0f b7 16                movzwl (%esi),%edx
 8049290:       66 89 17                mov    %dx,(%edi)
 8049293:       ba 02 00 00 00          mov    $0x2,%edx
 8049298:       a8 01                   test   $0x1,%al
 804929a:       74 07                   je     80492a3 <read_line+0x10f>
 804929c:       0f b6 04 16             movzbl (%esi,%edx,1),%eax
 80492a0:       88 04 17                mov    %al,(%edi,%edx,1)
 80492a3:       e8 5d fe ff ff          call   8049105 <explode_bomb>
 80492a8:       8d 04 92                lea    (%edx,%edx,4),%eax
 80492ab:       c1 e0 04                shl    $0x4,%eax
 80492ae:       c6 84 01 5f c7 04 08    movb   $0x0,0x804c75f(%ecx,%eax,1)
 80492b5:       00 
 80492b6:       83 c2 01                add    $0x1,%edx
 80492b9:       89 15 48 c7 04 08       mov    %edx,0x804c748
 80492bf:       89 d8                   mov    %ebx,%eax
 80492c1:       83 c4 10                add    $0x10,%esp
 80492c4:       5b                      pop    %ebx
 80492c5:       5e                      pop    %esi
 80492c6:       5f                      pop    %edi
 80492c7:       c3                      ret    

080492c8 <phase_defused>:
 80492c8:       83 ec 1c                sub    $0x1c,%esp
 80492cb:       c7 04 24 01 00 00 00    movl   $0x1,(%esp)
 80492d2:       e8 5a fd ff ff          call   8049031 <send_msg>
 80492d7:       83 3d 48 c7 04 08 06    cmpl   $0x6,0x804c748
 80492de:       75 18                   jne    80492f8 <phase_defused+0x30>
 80492e0:       c7 04 24 c8 a1 04 08    movl   $0x804a1c8,(%esp)
 80492e7:       e8 c4 f4 ff ff          call   80487b0 <puts@plt>
 80492ec:       c7 04 24 f4 a1 04 08    movl   $0x804a1f4,(%esp)
 80492f3:       e8 b8 f4 ff ff          call   80487b0 <puts@plt>
 80492f8:       83 c4 1c                add    $0x1c,%esp
 80492fb:       c3                      ret    
 80492fc:       66 90                   xchg   %ax,%ax
 80492fe:       66 90                   xchg   %ax,%ax

08049300 <sigalrm_handler>:
 8049300:       83 ec 1c                sub    $0x1c,%esp
 8049303:       c7 44 24 08 00 00 00    movl   $0x0,0x8(%esp)
 804930a:       00 
 804930b:       c7 44 24 04 18 a7 04    movl   $0x804a718,0x4(%esp)
 8049312:       08 
 8049313:       a1 20 c7 04 08          mov    0x804c720,%eax
 8049318:       89 04 24                mov    %eax,(%esp)
 804931b:       e8 c0 f4 ff ff          call   80487e0 <fprintf@plt>
 8049320:       c7 04 24 01 00 00 00    movl   $0x1,(%esp)
 8049327:       e8 94 f4 ff ff          call   80487c0 <exit@plt>

0804932c <rio_readlineb>:
 804932c:       55                      push   %ebp
 804932d:       57                      push   %edi
 804932e:       56                      push   %esi
 804932f:       53                      push   %ebx
 8049330:       83 ec 3c                sub    $0x3c,%esp
 8049333:       89 d5                   mov    %edx,%ebp
 8049335:       83 f9 01                cmp    $0x1,%ecx
 8049338:       0f 86 c6 00 00 00       jbe    8049404 <rio_readlineb+0xd8>
 804933e:       89 c3                   mov    %eax,%ebx
 8049340:       89 4c 24 1c             mov    %ecx,0x1c(%esp)
 8049344:       c7 44 24 10 01 00 00    movl   $0x1,0x10(%esp)
 804934b:       00 
 804934c:       8d 78 0c                lea    0xc(%eax),%edi
 804934f:       eb 34                   jmp    8049385 <rio_readlineb+0x59>
 8049351:       c7 44 24 08 00 20 00    movl   $0x2000,0x8(%esp)
 8049358:       00 
 8049359:       89 7c 24 04             mov    %edi,0x4(%esp)
 804935d:       8b 03                   mov    (%ebx),%eax
 804935f:       89 04 24                mov    %eax,(%esp)
 8049362:       e8 89 f3 ff ff          call   80486f0 <read@plt>
 8049367:       89 43 04                mov    %eax,0x4(%ebx)
 804936a:       85 c0                   test   %eax,%eax
 804936c:       79 0f                   jns    804937d <rio_readlineb+0x51>
 804936e:       e8 bd f4 ff ff          call   8048830 <__errno_location@plt>
 8049373:       83 38 04                cmpl   $0x4,(%eax)
 8049376:       74 0d                   je     8049385 <rio_readlineb+0x59>
 8049378:       e9 99 00 00 00          jmp    8049416 <rio_readlineb+0xea>
 804937d:       85 c0                   test   %eax,%eax
 804937f:       90                      nop
 8049380:       74 66                   je     80493e8 <rio_readlineb+0xbc>
 8049382:       89 7b 08                mov    %edi,0x8(%ebx)
 8049385:       8b 73 04                mov    0x4(%ebx),%esi
 8049388:       85 f6                   test   %esi,%esi
 804938a:       7e c5                   jle    8049351 <rio_readlineb+0x25>
 804938c:       85 f6                   test   %esi,%esi
 804938e:       0f 95 c0                setne  %al
 8049391:       0f b6 c0                movzbl %al,%eax
 8049394:       89 44 24 14             mov    %eax,0x14(%esp)
 8049398:       8b 4b 08                mov    0x8(%ebx),%ecx
 804939b:       89 44 24 08             mov    %eax,0x8(%esp)
 804939f:       89 4c 24 18             mov    %ecx,0x18(%esp)
 80493a3:       89 4c 24 04             mov    %ecx,0x4(%esp)
 80493a7:       8d 54 24 2f             lea    0x2f(%esp),%edx
 80493ab:       89 14 24                mov    %edx,(%esp)
 80493ae:       e8 6d f3 ff ff          call   8048720 <memcpy@plt>
 80493b3:       8b 4c 24 18             mov    0x18(%esp),%ecx
 80493b7:       8b 54 24 14             mov    0x14(%esp),%edx
 80493bb:       01 d1                   add    %edx,%ecx
 80493bd:       89 4b 08                mov    %ecx,0x8(%ebx)
 80493c0:       29 d6                   sub    %edx,%esi
 80493c2:       89 73 04                mov    %esi,0x4(%ebx)
 80493c5:       83 fa 01                cmp    $0x1,%edx
 80493c8:       75 11                   jne    80493db <rio_readlineb+0xaf>
 80493ca:       83 c5 01                add    $0x1,%ebp
 80493cd:       0f b6 44 24 2f          movzbl 0x2f(%esp),%eax
 80493d2:       88 45 ff                mov    %al,-0x1(%ebp)
 80493d5:       3c 0a                   cmp    $0xa,%al
 80493d7:       75 1a                   jne    80493f3 <rio_readlineb+0xc7>
 80493d9:       eb 31                   jmp    804940c <rio_readlineb+0xe0>
 80493db:       83 7c 24 14 00          cmpl   $0x0,0x14(%esp)
 80493e0:       75 3b                   jne    804941d <rio_readlineb+0xf1>
 80493e2:       8b 44 24 10             mov    0x10(%esp),%eax
 80493e6:       eb 04                   jmp    80493ec <rio_readlineb+0xc0>
 80493e8:       8b 44 24 10             mov    0x10(%esp),%eax
 80493ec:       83 f8 01                cmp    $0x1,%eax
 80493ef:       75 1b                   jne    804940c <rio_readlineb+0xe0>
 80493f1:       eb 31                   jmp    8049424 <rio_readlineb+0xf8>
 80493f3:       83 44 24 10 01          addl   $0x1,0x10(%esp)
 80493f8:       8b 44 24 1c             mov    0x1c(%esp),%eax
 80493fc:       39 44 24 10             cmp    %eax,0x10(%esp)
 8049400:       74 0a                   je     804940c <rio_readlineb+0xe0>
 8049402:       eb 81                   jmp    8049385 <rio_readlineb+0x59>
 8049404:       c7 44 24 10 01 00 00    movl   $0x1,0x10(%esp)
 804940b:       00 
 804940c:       c6 45 00 00             movb   $0x0,0x0(%ebp)
 8049410:       8b 44 24 10             mov    0x10(%esp),%eax
 8049414:       eb 13                   jmp    8049429 <rio_readlineb+0xfd>
 8049416:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 804941b:       eb 0c                   jmp    8049429 <rio_readlineb+0xfd>
 804941d:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049422:       eb 05                   jmp    8049429 <rio_readlineb+0xfd>
 8049424:       b8 00 00 00 00          mov    $0x0,%eax
 8049429:       83 c4 3c                add    $0x3c,%esp
 804942c:       5b                      pop    %ebx
 804942d:       5e                      pop    %esi
 804942e:       5f                      pop    %edi
 804942f:       5d                      pop    %ebp
 8049430:       c3                      ret    

08049431 <submitr>:
 8049431:       55                      push   %ebp
 8049432:       57                      push   %edi
 8049433:       56                      push   %esi
 8049434:       53                      push   %ebx
 8049435:       81 ec 5c a0 00 00       sub    $0xa05c,%esp
 804943b:       8b 9c 24 84 a0 00 00    mov    0xa084(%esp),%ebx
 8049442:       c7 84 24 30 20 00 00    movl   $0x0,0x2030(%esp)
 8049449:       00 00 00 00 
 804944d:       c7 44 24 08 00 00 00    movl   $0x0,0x8(%esp)
 8049454:       00 
 8049455:       c7 44 24 04 01 00 00    movl   $0x1,0x4(%esp)
 804945c:       00 
 804945d:       c7 04 24 02 00 00 00    movl   $0x2,(%esp)
 8049464:       e8 e7 f3 ff ff          call   8048850 <socket@plt>
 8049469:       89 c5                   mov    %eax,%ebp
 804946b:       85 c0                   test   %eax,%eax
 804946d:       79 55                   jns    80494c4 <submitr+0x93>
 804946f:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049476:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 804947c:       c7 40 04 72 3a 20 43    movl   $0x43203a72,0x4(%eax)
 8049483:       c7 40 08 6c 69 65 6e    movl   $0x6e65696c,0x8(%eax)
 804948a:       c7 40 0c 74 20 75 6e    movl   $0x6e752074,0xc(%eax)
 8049491:       c7 40 10 61 62 6c 65    movl   $0x656c6261,0x10(%eax)
 8049498:       c7 40 14 20 74 6f 20    movl   $0x206f7420,0x14(%eax)
 804949f:       c7 40 18 63 72 65 61    movl   $0x61657263,0x18(%eax)
 80494a6:       c7 40 1c 74 65 20 73    movl   $0x73206574,0x1c(%eax)
 80494ad:       c7 40 20 6f 63 6b 65    movl   $0x656b636f,0x20(%eax)
 80494b4:       66 c7 40 24 74 00       movw   $0x74,0x24(%eax)
 80494ba:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 80494bf:       e9 54 07 00 00          jmp    8049c18 <submitr+0x7e7>
 80494c4:       8b 84 24 70 a0 00 00    mov    0xa070(%esp),%eax
 80494cb:       89 04 24                mov    %eax,(%esp)
 80494ce:       e8 8d f3 ff ff          call   8048860 <gethostbyname@plt>
 80494d3:       85 c0                   test   %eax,%eax
 80494d5:       75 6f                   jne    8049546 <submitr+0x115>
 80494d7:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 80494de:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 80494e4:       c7 40 04 72 3a 20 44    movl   $0x44203a72,0x4(%eax)
 80494eb:       c7 40 08 4e 53 20 69    movl   $0x6920534e,0x8(%eax)
 80494f2:       c7 40 0c 73 20 75 6e    movl   $0x6e752073,0xc(%eax)
 80494f9:       c7 40 10 61 62 6c 65    movl   $0x656c6261,0x10(%eax)
 8049500:       c7 40 14 20 74 6f 20    movl   $0x206f7420,0x14(%eax)
 8049507:       c7 40 18 72 65 73 6f    movl   $0x6f736572,0x18(%eax)
 804950e:       c7 40 1c 6c 76 65 20    movl   $0x2065766c,0x1c(%eax)
 8049515:       c7 40 20 73 65 72 76    movl   $0x76726573,0x20(%eax)
 804951c:       c7 40 24 65 72 20 61    movl   $0x61207265,0x24(%eax)
 8049523:       c7 40 28 64 64 72 65    movl   $0x65726464,0x28(%eax)
 804952a:       66 c7 40 2c 73 73       movw   $0x7373,0x2c(%eax)
 8049530:       c6 40 2e 00             movb   $0x0,0x2e(%eax)
 8049534:       89 2c 24                mov    %ebp,(%esp)
 8049537:       e8 44 f3 ff ff          call   8048880 <close@plt>
 804953c:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049541:       e9 d2 06 00 00          jmp    8049c18 <submitr+0x7e7>
 8049546:       8d b4 24 40 a0 00 00    lea    0xa040(%esp),%esi
 804954d:       c7 84 24 40 a0 00 00    movl   $0x0,0xa040(%esp)
 8049554:       00 00 00 00 
 8049558:       c7 84 24 44 a0 00 00    movl   $0x0,0xa044(%esp)
 804955f:       00 00 00 00 
 8049563:       c7 84 24 48 a0 00 00    movl   $0x0,0xa048(%esp)
 804956a:       00 00 00 00 
 804956e:       c7 84 24 4c a0 00 00    movl   $0x0,0xa04c(%esp)
 8049575:       00 00 00 00 
 8049579:       66 c7 84 24 40 a0 00    movw   $0x2,0xa040(%esp)
 8049580:       00 02 00 
 8049583:       8b 50 0c                mov    0xc(%eax),%edx
 8049586:       89 54 24 08             mov    %edx,0x8(%esp)
 804958a:       8d 94 24 44 a0 00 00    lea    0xa044(%esp),%edx
 8049591:       89 54 24 04             mov    %edx,0x4(%esp)
 8049595:       8b 40 10                mov    0x10(%eax),%eax
 8049598:       8b 00                   mov    (%eax),%eax
 804959a:       89 04 24                mov    %eax,(%esp)
 804959d:       e8 ce f1 ff ff          call   8048770 <bcopy@plt>
 80495a2:       0f b7 84 24 74 a0 00    movzwl 0xa074(%esp),%eax
 80495a9:       00 
 80495aa:       66 c1 c8 08             ror    $0x8,%ax
 80495ae:       66 89 84 24 42 a0 00    mov    %ax,0xa042(%esp)
 80495b5:       00 
 80495b6:       c7 44 24 08 10 00 00    movl   $0x10,0x8(%esp)
 80495bd:       00 
 80495be:       89 74 24 04             mov    %esi,0x4(%esp)
 80495c2:       89 2c 24                mov    %ebp,(%esp)
 80495c5:       e8 a6 f2 ff ff          call   8048870 <connect@plt>
 80495ca:       85 c0                   test   %eax,%eax
 80495cc:       79 61                   jns    804962f <submitr+0x1fe>
 80495ce:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 80495d5:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 80495db:       c7 40 04 72 3a 20 55    movl   $0x55203a72,0x4(%eax)
 80495e2:       c7 40 08 6e 61 62 6c    movl   $0x6c62616e,0x8(%eax)
 80495e9:       c7 40 0c 65 20 74 6f    movl   $0x6f742065,0xc(%eax)
 80495f0:       c7 40 10 20 63 6f 6e    movl   $0x6e6f6320,0x10(%eax)
 80495f7:       c7 40 14 6e 65 63 74    movl   $0x7463656e,0x14(%eax)
 80495fe:       c7 40 18 20 74 6f 20    movl   $0x206f7420,0x18(%eax)
 8049605:       c7 40 1c 74 68 65 20    movl   $0x20656874,0x1c(%eax)
 804960c:       c7 40 20 73 65 72 76    movl   $0x76726573,0x20(%eax)
 8049613:       66 c7 40 24 65 72       movw   $0x7265,0x24(%eax)
 8049619:       c6 40 26 00             movb   $0x0,0x26(%eax)
 804961d:       89 2c 24                mov    %ebp,(%esp)
 8049620:       e8 5b f2 ff ff          call   8048880 <close@plt>
 8049625:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 804962a:       e9 e9 05 00 00          jmp    8049c18 <submitr+0x7e7>
 804962f:       ba ff ff ff ff          mov    $0xffffffff,%edx
 8049634:       89 df                   mov    %ebx,%edi
 8049636:       b8 00 00 00 00          mov    $0x0,%eax
 804963b:       89 d1                   mov    %edx,%ecx
 804963d:       f2 ae                   repnz scas %es:(%edi),%al
 804963f:       f7 d1                   not    %ecx
 8049641:       89 ce                   mov    %ecx,%esi
 8049643:       8b bc 24 78 a0 00 00    mov    0xa078(%esp),%edi
 804964a:       89 d1                   mov    %edx,%ecx
 804964c:       f2 ae                   repnz scas %es:(%edi),%al
 804964e:       89 4c 24 18             mov    %ecx,0x18(%esp)
 8049652:       8b bc 24 7c a0 00 00    mov    0xa07c(%esp),%edi
 8049659:       89 d1                   mov    %edx,%ecx
 804965b:       f2 ae                   repnz scas %es:(%edi),%al
 804965d:       f7 d1                   not    %ecx
 804965f:       89 4c 24 1c             mov    %ecx,0x1c(%esp)
 8049663:       8b bc 24 80 a0 00 00    mov    0xa080(%esp),%edi
 804966a:       89 d1                   mov    %edx,%ecx
 804966c:       f2 ae                   repnz scas %es:(%edi),%al
 804966e:       8b 44 24 1c             mov    0x1c(%esp),%eax
 8049672:       2b 44 24 18             sub    0x18(%esp),%eax
 8049676:       29 c8                   sub    %ecx,%eax
 8049678:       89 c2                   mov    %eax,%edx
 804967a:       8d 44 76 fd             lea    -0x3(%esi,%esi,2),%eax
 804967e:       8d 44 02 7b             lea    0x7b(%edx,%eax,1),%eax
 8049682:       3d 00 20 00 00          cmp    $0x2000,%eax
 8049687:       76 7a                   jbe    8049703 <submitr+0x2d2>
 8049689:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049690:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 8049696:       c7 40 04 72 3a 20 52    movl   $0x52203a72,0x4(%eax)
 804969d:       c7 40 08 65 73 75 6c    movl   $0x6c757365,0x8(%eax)
 80496a4:       c7 40 0c 74 20 73 74    movl   $0x74732074,0xc(%eax)
 80496ab:       c7 40 10 72 69 6e 67    movl   $0x676e6972,0x10(%eax)
 80496b2:       c7 40 14 20 74 6f 6f    movl   $0x6f6f7420,0x14(%eax)
 80496b9:       c7 40 18 20 6c 61 72    movl   $0x72616c20,0x18(%eax)
 80496c0:       c7 40 1c 67 65 2e 20    movl   $0x202e6567,0x1c(%eax)
 80496c7:       c7 40 20 49 6e 63 72    movl   $0x72636e49,0x20(%eax)
 80496ce:       c7 40 24 65 61 73 65    movl   $0x65736165,0x24(%eax)
 80496d5:       c7 40 28 20 53 55 42    movl   $0x42555320,0x28(%eax)
 80496dc:       c7 40 2c 4d 49 54 52    movl   $0x5254494d,0x2c(%eax)
 80496e3:       c7 40 30 5f 4d 41 58    movl   $0x58414d5f,0x30(%eax)
 80496ea:       c7 40 34 42 55 46 00    movl   $0x465542,0x34(%eax)
 80496f1:       89 2c 24                mov    %ebp,(%esp)
 80496f4:       e8 87 f1 ff ff          call   8048880 <close@plt>
 80496f9:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 80496fe:       e9 15 05 00 00          jmp    8049c18 <submitr+0x7e7>
 8049703:       8d 94 24 34 40 00 00    lea    0x4034(%esp),%edx
 804970a:       b9 00 08 00 00          mov    $0x800,%ecx
 804970f:       b8 00 00 00 00          mov    $0x0,%eax
 8049714:       89 d7                   mov    %edx,%edi
 8049716:       f3 ab                   rep stos %eax,%es:(%edi)
 8049718:       89 df                   mov    %ebx,%edi
 804971a:       b9 ff ff ff ff          mov    $0xffffffff,%ecx
 804971f:       f2 ae                   repnz scas %es:(%edi),%al
 8049721:       f7 d1                   not    %ecx
 8049723:       83 e9 01                sub    $0x1,%ecx
 8049726:       89 ce                   mov    %ecx,%esi
 8049728:       0f 84 00 04 00 00       je     8049b2e <submitr+0x6fd>
 804972e:       89 d7                   mov    %edx,%edi
 8049730:       0f b6 03                movzbl (%ebx),%eax
 8049733:       3c 2a                   cmp    $0x2a,%al
 8049735:       74 21                   je     8049758 <submitr+0x327>
 8049737:       8d 50 d3                lea    -0x2d(%eax),%edx
 804973a:       80 fa 01                cmp    $0x1,%dl
 804973d:       76 19                   jbe    8049758 <submitr+0x327>
 804973f:       3c 5f                   cmp    $0x5f,%al
 8049741:       74 15                   je     8049758 <submitr+0x327>
 8049743:       8d 50 d0                lea    -0x30(%eax),%edx
 8049746:       80 fa 09                cmp    $0x9,%dl
 8049749:       76 0d                   jbe    8049758 <submitr+0x327>
 804974b:       89 c2                   mov    %eax,%edx
 804974d:       83 e2 df                and    $0xffffffdf,%edx
 8049750:       83 ea 41                sub    $0x41,%edx
 8049753:       80 fa 19                cmp    $0x19,%dl
 8049756:       77 07                   ja     804975f <submitr+0x32e>
 8049758:       8d 57 01                lea    0x1(%edi),%edx
 804975b:       88 07                   mov    %al,(%edi)
 804975d:       eb 51                   jmp    80497b0 <submitr+0x37f>
 804975f:       3c 20                   cmp    $0x20,%al
 8049761:       75 08                   jne    804976b <submitr+0x33a>
 8049763:       8d 57 01                lea    0x1(%edi),%edx
 8049766:       c6 07 2b                movb   $0x2b,(%edi)
 8049769:       eb 45                   jmp    80497b0 <submitr+0x37f>
 804976b:       8d 50 e0                lea    -0x20(%eax),%edx
 804976e:       80 fa 5f                cmp    $0x5f,%dl
 8049771:       76 08                   jbe    804977b <submitr+0x34a>
 8049773:       3c 09                   cmp    $0x9,%al
 8049775:       0f 85 1d 04 00 00       jne    8049b98 <submitr+0x767>
 804977b:       0f b6 c0                movzbl %al,%eax
 804977e:       89 44 24 08             mov    %eax,0x8(%esp)
 8049782:       c7 44 24 04 24 a8 04    movl   $0x804a824,0x4(%esp)
 8049789:       08 
 804978a:       8d 44 24 28             lea    0x28(%esp),%eax
 804978e:       89 04 24                mov    %eax,(%esp)
 8049791:       e8 aa f0 ff ff          call   8048840 <sprintf@plt>
 8049796:       0f b6 44 24 28          movzbl 0x28(%esp),%eax
 804979b:       88 07                   mov    %al,(%edi)
 804979d:       0f b6 44 24 29          movzbl 0x29(%esp),%eax
 80497a2:       88 47 01                mov    %al,0x1(%edi)
 80497a5:       8d 57 03                lea    0x3(%edi),%edx
 80497a8:       0f b6 44 24 2a          movzbl 0x2a(%esp),%eax
 80497ad:       88 47 02                mov    %al,0x2(%edi)
 80497b0:       83 c3 01                add    $0x1,%ebx
 80497b3:       83 ee 01                sub    $0x1,%esi
 80497b6:       0f 84 72 03 00 00       je     8049b2e <submitr+0x6fd>
 80497bc:       89 d7                   mov    %edx,%edi
 80497be:       e9 6d ff ff ff          jmp    8049730 <submitr+0x2ff>
 80497c3:       89 5c 24 08             mov    %ebx,0x8(%esp)
 80497c7:       89 74 24 04             mov    %esi,0x4(%esp)
 80497cb:       89 2c 24                mov    %ebp,(%esp)
 80497ce:       e8 1d f0 ff ff          call   80487f0 <write@plt>
 80497d3:       85 c0                   test   %eax,%eax
 80497d5:       7f 10                   jg     80497e7 <submitr+0x3b6>
 80497d7:       e8 54 f0 ff ff          call   8048830 <__errno_location@plt>
 80497dc:       83 38 04                cmpl   $0x4,(%eax)
 80497df:       90                      nop
 80497e0:       75 0f                   jne    80497f1 <submitr+0x3c0>
 80497e2:       b8 00 00 00 00          mov    $0x0,%eax
 80497e7:       01 c6                   add    %eax,%esi
 80497e9:       29 c3                   sub    %eax,%ebx
 80497eb:       75 d6                   jne    80497c3 <submitr+0x392>
 80497ed:       85 ff                   test   %edi,%edi
 80497ef:       79 65                   jns    8049856 <submitr+0x425>
 80497f1:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 80497f8:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 80497fe:       c7 40 04 72 3a 20 43    movl   $0x43203a72,0x4(%eax)
 8049805:       c7 40 08 6c 69 65 6e    movl   $0x6e65696c,0x8(%eax)
 804980c:       c7 40 0c 74 20 75 6e    movl   $0x6e752074,0xc(%eax)
 8049813:       c7 40 10 61 62 6c 65    movl   $0x656c6261,0x10(%eax)
 804981a:       c7 40 14 20 74 6f 20    movl   $0x206f7420,0x14(%eax)
 8049821:       c7 40 18 77 72 69 74    movl   $0x74697277,0x18(%eax)
 8049828:       c7 40 1c 65 20 74 6f    movl   $0x6f742065,0x1c(%eax)
 804982f:       c7 40 20 20 74 68 65    movl   $0x65687420,0x20(%eax)
 8049836:       c7 40 24 20 73 65 72    movl   $0x72657320,0x24(%eax)
 804983d:       c7 40 28 76 65 72 00    movl   $0x726576,0x28(%eax)
 8049844:       89 2c 24                mov    %ebp,(%esp)
 8049847:       e8 34 f0 ff ff          call   8048880 <close@plt>
 804984c:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049851:       e9 c2 03 00 00          jmp    8049c18 <submitr+0x7e7>
 8049856:       89 ac 24 34 80 00 00    mov    %ebp,0x8034(%esp)
 804985d:       c7 84 24 38 80 00 00    movl   $0x0,0x8038(%esp)
 8049864:       00 00 00 00 
 8049868:       8d 84 24 40 80 00 00    lea    0x8040(%esp),%eax
 804986f:       89 84 24 3c 80 00 00    mov    %eax,0x803c(%esp)
 8049876:       b9 00 20 00 00          mov    $0x2000,%ecx
 804987b:       8d 94 24 34 60 00 00    lea    0x6034(%esp),%edx
 8049882:       8d 84 24 34 80 00 00    lea    0x8034(%esp),%eax
 8049889:       e8 9e fa ff ff          call   804932c <rio_readlineb>
 804988e:       85 c0                   test   %eax,%eax
 8049890:       7f 79                   jg     804990b <submitr+0x4da>
 8049892:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049899:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 804989f:       c7 40 04 72 3a 20 43    movl   $0x43203a72,0x4(%eax)
 80498a6:       c7 40 08 6c 69 65 6e    movl   $0x6e65696c,0x8(%eax)
 80498ad:       c7 40 0c 74 20 75 6e    movl   $0x6e752074,0xc(%eax)
 80498b4:       c7 40 10 61 62 6c 65    movl   $0x656c6261,0x10(%eax)
 80498bb:       c7 40 14 20 74 6f 20    movl   $0x206f7420,0x14(%eax)
 80498c2:       c7 40 18 72 65 61 64    movl   $0x64616572,0x18(%eax)
 80498c9:       c7 40 1c 20 66 69 72    movl   $0x72696620,0x1c(%eax)
 80498d0:       c7 40 20 73 74 20 68    movl   $0x68207473,0x20(%eax)
 80498d7:       c7 40 24 65 61 64 65    movl   $0x65646165,0x24(%eax)
 80498de:       c7 40 28 72 20 66 72    movl   $0x72662072,0x28(%eax)
 80498e5:       c7 40 2c 6f 6d 20 73    movl   $0x73206d6f,0x2c(%eax)
 80498ec:       c7 40 30 65 72 76 65    movl   $0x65767265,0x30(%eax)
 80498f3:       66 c7 40 34 72 00       movw   $0x72,0x34(%eax)
 80498f9:       89 2c 24                mov    %ebp,(%esp)
 80498fc:       e8 7f ef ff ff          call   8048880 <close@plt>
 8049901:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049906:       e9 0d 03 00 00          jmp    8049c18 <submitr+0x7e7>
 804990b:       8d 44 24 30             lea    0x30(%esp),%eax
 804990f:       89 44 24 10             mov    %eax,0x10(%esp)
 8049913:       8d 84 24 30 20 00 00    lea    0x2030(%esp),%eax
 804991a:       89 44 24 0c             mov    %eax,0xc(%esp)
 804991e:       8d 84 24 34 20 00 00    lea    0x2034(%esp),%eax
 8049925:       89 44 24 08             mov    %eax,0x8(%esp)
 8049929:       c7 44 24 04 2b a8 04    movl   $0x804a82b,0x4(%esp)
 8049930:       08 
 8049931:       8d 84 24 34 60 00 00    lea    0x6034(%esp),%eax
 8049938:       89 04 24                mov    %eax,(%esp)
 804993b:       e8 d0 ee ff ff          call   8048810 <__isoc99_sscanf@plt>
 8049940:       8b 84 24 30 20 00 00    mov    0x2030(%esp),%eax
 8049947:       3d c8 00 00 00          cmp    $0xc8,%eax
 804994c:       0f 84 c1 00 00 00       je     8049a13 <submitr+0x5e2>
 8049952:       8d 54 24 30             lea    0x30(%esp),%edx
 8049956:       89 54 24 0c             mov    %edx,0xc(%esp)
 804995a:       89 44 24 08             mov    %eax,0x8(%esp)
 804995e:       c7 44 24 04 3c a7 04    movl   $0x804a73c,0x4(%esp)
 8049965:       08 
 8049966:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 804996d:       89 04 24                mov    %eax,(%esp)
 8049970:       e8 cb ee ff ff          call   8048840 <sprintf@plt>
 8049975:       89 2c 24                mov    %ebp,(%esp)
 8049978:       e8 03 ef ff ff          call   8048880 <close@plt>
 804997d:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049982:       e9 91 02 00 00          jmp    8049c18 <submitr+0x7e7>
 8049987:       b9 00 20 00 00          mov    $0x2000,%ecx
 804998c:       8d 94 24 34 60 00 00    lea    0x6034(%esp),%edx
 8049993:       8d 84 24 34 80 00 00    lea    0x8034(%esp),%eax
 804999a:       e8 8d f9 ff ff          call   804932c <rio_readlineb>
 804999f:       85 c0                   test   %eax,%eax
 80499a1:       7f 70                   jg     8049a13 <submitr+0x5e2>
 80499a3:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 80499aa:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 80499b0:       c7 40 04 72 3a 20 43    movl   $0x43203a72,0x4(%eax)
 80499b7:       c7 40 08 6c 69 65 6e    movl   $0x6e65696c,0x8(%eax)
 80499be:       c7 40 0c 74 20 75 6e    movl   $0x6e752074,0xc(%eax)
 80499c5:       c7 40 10 61 62 6c 65    movl   $0x656c6261,0x10(%eax)
 80499cc:       c7 40 14 20 74 6f 20    movl   $0x206f7420,0x14(%eax)
 80499d3:       c7 40 18 72 65 61 64    movl   $0x64616572,0x18(%eax)
 80499da:       c7 40 1c 20 68 65 61    movl   $0x61656820,0x1c(%eax)
 80499e1:       c7 40 20 64 65 72 73    movl   $0x73726564,0x20(%eax)
 80499e8:       c7 40 24 20 66 72 6f    movl   $0x6f726620,0x24(%eax)
 80499ef:       c7 40 28 6d 20 73 65    movl   $0x6573206d,0x28(%eax)
 80499f6:       c7 40 2c 72 76 65 72    movl   $0x72657672,0x2c(%eax)
 80499fd:       c6 40 30 00             movb   $0x0,0x30(%eax)
 8049a01:       89 2c 24                mov    %ebp,(%esp)
 8049a04:       e8 77 ee ff ff          call   8048880 <close@plt>
 8049a09:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049a0e:       e9 05 02 00 00          jmp    8049c18 <submitr+0x7e7>
 8049a13:       80 bc 24 34 60 00 00    cmpb   $0xd,0x6034(%esp)
 8049a1a:       0d 
 8049a1b:       0f 85 66 ff ff ff       jne    8049987 <submitr+0x556>
 8049a21:       80 bc 24 35 60 00 00    cmpb   $0xa,0x6035(%esp)
 8049a28:       0a 
 8049a29:       0f 85 58 ff ff ff       jne    8049987 <submitr+0x556>
 8049a2f:       80 bc 24 36 60 00 00    cmpb   $0x0,0x6036(%esp)
 8049a36:       00 
 8049a37:       0f 85 4a ff ff ff       jne    8049987 <submitr+0x556>
 8049a3d:       b9 00 20 00 00          mov    $0x2000,%ecx
 8049a42:       8d 94 24 34 60 00 00    lea    0x6034(%esp),%edx
 8049a49:       8d 84 24 34 80 00 00    lea    0x8034(%esp),%eax
 8049a50:       e8 d7 f8 ff ff          call   804932c <rio_readlineb>
 8049a55:       85 c0                   test   %eax,%eax
 8049a57:       7f 7a                   jg     8049ad3 <submitr+0x6a2>
 8049a59:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049a60:       c7 00 45 72 72 6f       movl   $0x6f727245,(%eax)
 8049a66:       c7 40 04 72 3a 20 43    movl   $0x43203a72,0x4(%eax)
 8049a6d:       c7 40 08 6c 69 65 6e    movl   $0x6e65696c,0x8(%eax)
 8049a74:       c7 40 0c 74 20 75 6e    movl   $0x6e752074,0xc(%eax)
 8049a7b:       c7 40 10 61 62 6c 65    movl   $0x656c6261,0x10(%eax)
 8049a82:       c7 40 14 20 74 6f 20    movl   $0x206f7420,0x14(%eax)
 8049a89:       c7 40 18 72 65 61 64    movl   $0x64616572,0x18(%eax)
 8049a90:       c7 40 1c 20 73 74 61    movl   $0x61747320,0x1c(%eax)
 8049a97:       c7 40 20 74 75 73 20    movl   $0x20737574,0x20(%eax)
 8049a9e:       c7 40 24 6d 65 73 73    movl   $0x7373656d,0x24(%eax)
 8049aa5:       c7 40 28 61 67 65 20    movl   $0x20656761,0x28(%eax)
 8049aac:       c7 40 2c 66 72 6f 6d    movl   $0x6d6f7266,0x2c(%eax)
 8049ab3:       c7 40 30 20 73 65 72    movl   $0x72657320,0x30(%eax)
 8049aba:       c7 40 34 76 65 72 00    movl   $0x726576,0x34(%eax)
 8049ac1:       89 2c 24                mov    %ebp,(%esp)
 8049ac4:       e8 b7 ed ff ff          call   8048880 <close@plt>
 8049ac9:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049ace:       e9 45 01 00 00          jmp    8049c18 <submitr+0x7e7>
 8049ad3:       8d 84 24 34 60 00 00    lea    0x6034(%esp),%eax
 8049ada:       89 44 24 04             mov    %eax,0x4(%esp)
 8049ade:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049ae5:       89 04 24                mov    %eax,(%esp)
 8049ae8:       e8 93 ec ff ff          call   8048780 <strcpy@plt>
 8049aed:       89 2c 24                mov    %ebp,(%esp)
 8049af0:       e8 8b ed ff ff          call   8048880 <close@plt>
 8049af5:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049afc:       0f b6 00                movzbl (%eax),%eax
 8049aff:       83 e8 4f                sub    $0x4f,%eax
 8049b02:       75 1b                   jne    8049b1f <submitr+0x6ee>
 8049b04:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049b0b:       0f b6 40 01             movzbl 0x1(%eax),%eax
 8049b0f:       83 e8 4b                sub    $0x4b,%eax
 8049b12:       75 0b                   jne    8049b1f <submitr+0x6ee>
 8049b14:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049b1b:       0f b6 40 02             movzbl 0x2(%eax),%eax
 8049b1f:       85 c0                   test   %eax,%eax
 8049b21:       0f 95 c0                setne  %al
 8049b24:       0f b6 c0                movzbl %al,%eax
 8049b27:       f7 d8                   neg    %eax
 8049b29:       e9 ea 00 00 00          jmp    8049c18 <submitr+0x7e7>
 8049b2e:       8d 84 24 34 40 00 00    lea    0x4034(%esp),%eax
 8049b35:       89 44 24 14             mov    %eax,0x14(%esp)
 8049b39:       8b 84 24 80 a0 00 00    mov    0xa080(%esp),%eax
 8049b40:       89 44 24 10             mov    %eax,0x10(%esp)
 8049b44:       8b 84 24 7c a0 00 00    mov    0xa07c(%esp),%eax
 8049b4b:       89 44 24 0c             mov    %eax,0xc(%esp)
 8049b4f:       8b 84 24 78 a0 00 00    mov    0xa078(%esp),%eax
 8049b56:       89 44 24 08             mov    %eax,0x8(%esp)
 8049b5a:       c7 44 24 04 6c a7 04    movl   $0x804a76c,0x4(%esp)
 8049b61:       08 
 8049b62:       8d bc 24 34 60 00 00    lea    0x6034(%esp),%edi
 8049b69:       89 3c 24                mov    %edi,(%esp)
 8049b6c:       e8 cf ec ff ff          call   8048840 <sprintf@plt>
 8049b71:       b8 00 00 00 00          mov    $0x0,%eax
 8049b76:       b9 ff ff ff ff          mov    $0xffffffff,%ecx
 8049b7b:       f2 ae                   repnz scas %es:(%edi),%al
 8049b7d:       f7 d1                   not    %ecx
 8049b7f:       83 e9 01                sub    $0x1,%ecx
 8049b82:       89 cf                   mov    %ecx,%edi
 8049b84:       0f 84 cc fc ff ff       je     8049856 <submitr+0x425>
 8049b8a:       89 cb                   mov    %ecx,%ebx
 8049b8c:       8d b4 24 34 60 00 00    lea    0x6034(%esp),%esi
 8049b93:       e9 2b fc ff ff          jmp    80497c3 <submitr+0x392>
 8049b98:       8b bc 24 88 a0 00 00    mov    0xa088(%esp),%edi
 8049b9f:       be b8 a7 04 08          mov    $0x804a7b8,%esi
 8049ba4:       b8 43 00 00 00          mov    $0x43,%eax
 8049ba9:       f7 c7 01 00 00 00       test   $0x1,%edi
 8049baf:       74 1d                   je     8049bce <submitr+0x79d>
 8049bb1:       0f b6 05 b8 a7 04 08    movzbl 0x804a7b8,%eax
 8049bb8:       88 07                   mov    %al,(%edi)
 8049bba:       8b 84 24 88 a0 00 00    mov    0xa088(%esp),%eax
 8049bc1:       8d 78 01                lea    0x1(%eax),%edi
 8049bc4:       be b9 a7 04 08          mov    $0x804a7b9,%esi
 8049bc9:       b8 42 00 00 00          mov    $0x42,%eax
 8049bce:       f7 c7 02 00 00 00       test   $0x2,%edi
 8049bd4:       74 0f                   je     8049be5 <submitr+0x7b4>
 8049bd6:       0f b7 16                movzwl (%esi),%edx
 8049bd9:       66 89 17                mov    %dx,(%edi)
 8049bdc:       83 c7 02                add    $0x2,%edi
 8049bdf:       83 c6 02                add    $0x2,%esi
 8049be2:       83 e8 02                sub    $0x2,%eax
 8049be5:       89 c1                   mov    %eax,%ecx
 8049be7:       c1 e9 02                shr    $0x2,%ecx
 8049bea:       f3 a5                   rep movsl %ds:(%esi),%es:(%edi)
 8049bec:       ba 00 00 00 00          mov    $0x0,%edx
 8049bf1:       a8 02                   test   $0x2,%al
 8049bf3:       74 0b                   je     8049c00 <submitr+0x7cf>
 8049bf5:       0f b7 16                movzwl (%esi),%edx
 8049bf8:       66 89 17                mov    %dx,(%edi)
 8049bfb:       ba 02 00 00 00          mov    $0x2,%edx
 8049c00:       a8 01                   test   $0x1,%al
 8049c02:       74 07                   je     8049c0b <submitr+0x7da>
 8049c04:       0f b6 04 16             movzbl (%esi,%edx,1),%eax
 8049c08:       88 04 17                mov    %al,(%edi,%edx,1)
 8049c0b:       89 2c 24                mov    %ebp,(%esp)
 8049c0e:       e8 6d ec ff ff          call   8048880 <close@plt>
 8049c13:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049c18:       81 c4 5c a0 00 00       add    $0xa05c,%esp
 8049c1e:       5b                      pop    %ebx
 8049c1f:       5e                      pop    %esi
 8049c20:       5f                      pop    %edi
 8049c21:       5d                      pop    %ebp
 8049c22:       c3                      ret    

08049c23 <init_timeout>:
 8049c23:       53                      push   %ebx
 8049c24:       83 ec 18                sub    $0x18,%esp
 8049c27:       8b 5c 24 20             mov    0x20(%esp),%ebx
 8049c2b:       85 db                   test   %ebx,%ebx
 8049c2d:       74 26                   je     8049c55 <init_timeout+0x32>
 8049c2f:       c7 44 24 04 00 93 04    movl   $0x8049300,0x4(%esp)
 8049c36:       08 
 8049c37:       c7 04 24 0e 00 00 00    movl   $0xe,(%esp)
 8049c3e:       e8 fd ea ff ff          call   8048740 <signal@plt>
 8049c43:       85 db                   test   %ebx,%ebx
 8049c45:       b8 00 00 00 00          mov    $0x0,%eax
 8049c4a:       0f 48 d8                cmovs  %eax,%ebx
 8049c4d:       89 1c 24                mov    %ebx,(%esp)
 8049c50:       e8 0b eb ff ff          call   8048760 <alarm@plt>
 8049c55:       83 c4 18                add    $0x18,%esp
 8049c58:       5b                      pop    %ebx
 8049c59:       c3                      ret    

08049c5a <init_driver>:
 8049c5a:       57                      push   %edi
 8049c5b:       56                      push   %esi
 8049c5c:       53                      push   %ebx
 8049c5d:       83 ec 20                sub    $0x20,%esp
 8049c60:       8b 74 24 30             mov    0x30(%esp),%esi
 8049c64:       c7 44 24 04 01 00 00    movl   $0x1,0x4(%esp)
 8049c6b:       00 
 8049c6c:       c7 04 24 0d 00 00 00    movl   $0xd,(%esp)
 8049c73:       e8 c8 ea ff ff          call   8048740 <signal@plt>
 8049c78:       c7 44 24 04 01 00 00    movl   $0x1,0x4(%esp)
 8049c7f:       00 
 8049c80:       c7 04 24 1d 00 00 00    movl   $0x1d,(%esp)
 8049c87:       e8 b4 ea ff ff          call   8048740 <signal@plt>
 8049c8c:       c7 44 24 04 01 00 00    movl   $0x1,0x4(%esp)
 8049c93:       00 
 8049c94:       c7 04 24 1d 00 00 00    movl   $0x1d,(%esp)
 8049c9b:       e8 a0 ea ff ff          call   8048740 <signal@plt>
 8049ca0:       c7 44 24 08 00 00 00    movl   $0x0,0x8(%esp)
 8049ca7:       00 
 8049ca8:       c7 44 24 04 01 00 00    movl   $0x1,0x4(%esp)
 8049caf:       00 
 8049cb0:       c7 04 24 02 00 00 00    movl   $0x2,(%esp)
 8049cb7:       e8 94 eb ff ff          call   8048850 <socket@plt>
 8049cbc:       89 c3                   mov    %eax,%ebx
 8049cbe:       85 c0                   test   %eax,%eax
 8049cc0:       79 4e                   jns    8049d10 <init_driver+0xb6>
 8049cc2:       c7 06 45 72 72 6f       movl   $0x6f727245,(%esi)
 8049cc8:       c7 46 04 72 3a 20 43    movl   $0x43203a72,0x4(%esi)
 8049ccf:       c7 46 08 6c 69 65 6e    movl   $0x6e65696c,0x8(%esi)
 8049cd6:       c7 46 0c 74 20 75 6e    movl   $0x6e752074,0xc(%esi)
 8049cdd:       c7 46 10 61 62 6c 65    movl   $0x656c6261,0x10(%esi)
 8049ce4:       c7 46 14 20 74 6f 20    movl   $0x206f7420,0x14(%esi)
 8049ceb:       c7 46 18 63 72 65 61    movl   $0x61657263,0x18(%esi)
 8049cf2:       c7 46 1c 74 65 20 73    movl   $0x73206574,0x1c(%esi)
 8049cf9:       c7 46 20 6f 63 6b 65    movl   $0x656b636f,0x20(%esi)
 8049d00:       66 c7 46 24 74 00       movw   $0x74,0x24(%esi)
 8049d06:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049d0b:       e9 1b 01 00 00          jmp    8049e2b <init_driver+0x1d1>
 8049d10:       c7 04 24 b8 a3 04 08    movl   $0x804a3b8,(%esp)
 8049d17:       e8 44 eb ff ff          call   8048860 <gethostbyname@plt>
 8049d1c:       85 c0                   test   %eax,%eax
 8049d1e:       75 68                   jne    8049d88 <init_driver+0x12e>
 8049d20:       c7 06 45 72 72 6f       movl   $0x6f727245,(%esi)
 8049d26:       c7 46 04 72 3a 20 44    movl   $0x44203a72,0x4(%esi)
 8049d2d:       c7 46 08 4e 53 20 69    movl   $0x6920534e,0x8(%esi)
 8049d34:       c7 46 0c 73 20 75 6e    movl   $0x6e752073,0xc(%esi)
 8049d3b:       c7 46 10 61 62 6c 65    movl   $0x656c6261,0x10(%esi)
 8049d42:       c7 46 14 20 74 6f 20    movl   $0x206f7420,0x14(%esi)
 8049d49:       c7 46 18 72 65 73 6f    movl   $0x6f736572,0x18(%esi)
 8049d50:       c7 46 1c 6c 76 65 20    movl   $0x2065766c,0x1c(%esi)
 8049d57:       c7 46 20 73 65 72 76    movl   $0x76726573,0x20(%esi)
 8049d5e:       c7 46 24 65 72 20 61    movl   $0x61207265,0x24(%esi)
 8049d65:       c7 46 28 64 64 72 65    movl   $0x65726464,0x28(%esi)
 8049d6c:       66 c7 46 2c 73 73       movw   $0x7373,0x2c(%esi)
 8049d72:       c6 46 2e 00             movb   $0x0,0x2e(%esi)
 8049d76:       89 1c 24                mov    %ebx,(%esp)
 8049d79:       e8 02 eb ff ff          call   8048880 <close@plt>
 8049d7e:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049d83:       e9 a3 00 00 00          jmp    8049e2b <init_driver+0x1d1>
 8049d88:       8d 7c 24 10             lea    0x10(%esp),%edi
 8049d8c:       c7 44 24 10 00 00 00    movl   $0x0,0x10(%esp)
 8049d93:       00 
 8049d94:       c7 44 24 14 00 00 00    movl   $0x0,0x14(%esp)
 8049d9b:       00 
 8049d9c:       c7 44 24 18 00 00 00    movl   $0x0,0x18(%esp)
 8049da3:       00 
 8049da4:       c7 44 24 1c 00 00 00    movl   $0x0,0x1c(%esp)
 8049dab:       00 
 8049dac:       66 c7 44 24 10 02 00    movw   $0x2,0x10(%esp)
 8049db3:       8b 50 0c                mov    0xc(%eax),%edx
 8049db6:       89 54 24 08             mov    %edx,0x8(%esp)
 8049dba:       8d 54 24 14             lea    0x14(%esp),%edx
 8049dbe:       89 54 24 04             mov    %edx,0x4(%esp)
 8049dc2:       8b 40 10                mov    0x10(%eax),%eax
 8049dc5:       8b 00                   mov    (%eax),%eax
 8049dc7:       89 04 24                mov    %eax,(%esp)
 8049dca:       e8 a1 e9 ff ff          call   8048770 <bcopy@plt>
 8049dcf:       66 c7 44 24 12 43 31    movw   $0x3143,0x12(%esp)
 8049dd6:       c7 44 24 08 10 00 00    movl   $0x10,0x8(%esp)
 8049ddd:       00 
 8049dde:       89 7c 24 04             mov    %edi,0x4(%esp)
 8049de2:       89 1c 24                mov    %ebx,(%esp)
 8049de5:       e8 86 ea ff ff          call   8048870 <connect@plt>
 8049dea:       85 c0                   test   %eax,%eax
 8049dec:       79 27                   jns    8049e15 <init_driver+0x1bb>
 8049dee:       c7 44 24 08 b8 a3 04    movl   $0x804a3b8,0x8(%esp)
 8049df5:       08 
 8049df6:       c7 44 24 04 fc a7 04    movl   $0x804a7fc,0x4(%esp)
 8049dfd:       08 
 8049dfe:       89 34 24                mov    %esi,(%esp)
 8049e01:       e8 3a ea ff ff          call   8048840 <sprintf@plt>
 8049e06:       89 1c 24                mov    %ebx,(%esp)
 8049e09:       e8 72 ea ff ff          call   8048880 <close@plt>
 8049e0e:       b8 ff ff ff ff          mov    $0xffffffff,%eax
 8049e13:       eb 16                   jmp    8049e2b <init_driver+0x1d1>
 8049e15:       89 1c 24                mov    %ebx,(%esp)
 8049e18:       e8 63 ea ff ff          call   8048880 <close@plt>
 8049e1d:       66 c7 06 4f 4b          movw   $0x4b4f,(%esi)
 8049e22:       c6 46 02 00             movb   $0x0,0x2(%esi)
 8049e26:       b8 00 00 00 00          mov    $0x0,%eax
 8049e2b:       83 c4 20                add    $0x20,%esp
 8049e2e:       5b                      pop    %ebx
 8049e2f:       5e                      pop    %esi
 8049e30:       5f                      pop    %edi
 8049e31:       c3                      ret    

08049e32 <driver_post>:
 8049e32:       53                      push   %ebx
 8049e33:       83 ec 28                sub    $0x28,%esp
 8049e36:       8b 44 24 30             mov    0x30(%esp),%eax
 8049e3a:       8b 5c 24 3c             mov    0x3c(%esp),%ebx
 8049e3e:       83 7c 24 38 00          cmpl   $0x0,0x38(%esp)
 8049e43:       74 24                   je     8049e69 <driver_post+0x37>
 8049e45:       8b 44 24 34             mov    0x34(%esp),%eax
 8049e49:       89 44 24 04             mov    %eax,0x4(%esp)
 8049e4d:       c7 04 24 3c a8 04 08    movl   $0x804a83c,(%esp)
 8049e54:       e8 a7 e8 ff ff          call   8048700 <printf@plt>
 8049e59:       66 c7 03 4f 4b          movw   $0x4b4f,(%ebx)
 8049e5e:       c6 43 02 00             movb   $0x0,0x2(%ebx)
 8049e62:       b8 00 00 00 00          mov    $0x0,%eax
 8049e67:       eb 4d                   jmp    8049eb6 <driver_post+0x84>
 8049e69:       85 c0                   test   %eax,%eax
 8049e6b:       74 3b                   je     8049ea8 <driver_post+0x76>
 8049e6d:       80 38 00                cmpb   $0x0,(%eax)
 8049e70:       74 36                   je     8049ea8 <driver_post+0x76>
 8049e72:       89 5c 24 18             mov    %ebx,0x18(%esp)
 8049e76:       8b 54 24 34             mov    0x34(%esp),%edx
 8049e7a:       89 54 24 14             mov    %edx,0x14(%esp)
 8049e7e:       c7 44 24 10 53 a8 04    movl   $0x804a853,0x10(%esp)
 8049e85:       08 
 8049e86:       89 44 24 0c             mov    %eax,0xc(%esp)
 8049e8a:       c7 44 24 08 5c a8 04    movl   $0x804a85c,0x8(%esp)
 8049e91:       08 
 8049e92:       c7 44 24 04 31 43 00    movl   $0x4331,0x4(%esp)
 8049e99:       00 
 8049e9a:       c7 04 24 b8 a3 04 08    movl   $0x804a3b8,(%esp)
 8049ea1:       e8 8b f5 ff ff          call   8049431 <submitr>
 8049ea6:       eb 0e                   jmp    8049eb6 <driver_post+0x84>
 8049ea8:       66 c7 03 4f 4b          movw   $0x4b4f,(%ebx)
 8049ead:       c6 43 02 00             movb   $0x0,0x2(%ebx)
 8049eb1:       b8 00 00 00 00          mov    $0x0,%eax
 8049eb6:       83 c4 28                add    $0x28,%esp
 8049eb9:       5b                      pop    %ebx
 8049eba:       c3                      ret    
 8049ebb:       66 90                   xchg   %ax,%ax
 8049ebd:       66 90                   xchg   %ax,%ax
 8049ebf:       90                      nop

08049ec0 <__libc_csu_init>:
 8049ec0:       55                      push   %ebp
 8049ec1:       57                      push   %edi
 8049ec2:       31 ff                   xor    %edi,%edi
 8049ec4:       56                      push   %esi
 8049ec5:       53                      push   %ebx
 8049ec6:       e8 15 ea ff ff          call   80488e0 <__x86.get_pc_thunk.bx>
 8049ecb:       81 c3 35 21 00 00       add    $0x2135,%ebx
 8049ed1:       83 ec 1c                sub    $0x1c,%esp
 8049ed4:       8b 6c 24 30             mov    0x30(%esp),%ebp
 8049ed8:       8d b3 0c ff ff ff       lea    -0xf4(%ebx),%esi
 8049ede:       e8 d9 e7 ff ff          call   80486bc <_init>
 8049ee3:       8d 83 08 ff ff ff       lea    -0xf8(%ebx),%eax
 8049ee9:       29 c6                   sub    %eax,%esi
 8049eeb:       c1 fe 02                sar    $0x2,%esi
 8049eee:       85 f6                   test   %esi,%esi
 8049ef0:       74 27                   je     8049f19 <__libc_csu_init+0x59>
 8049ef2:       8d b6 00 00 00 00       lea    0x0(%esi),%esi
 8049ef8:       8b 44 24 38             mov    0x38(%esp),%eax
 8049efc:       89 2c 24                mov    %ebp,(%esp)
 8049eff:       89 44 24 08             mov    %eax,0x8(%esp)
 8049f03:       8b 44 24 34             mov    0x34(%esp),%eax
 8049f07:       89 44 24 04             mov    %eax,0x4(%esp)
 8049f0b:       ff 94 bb 08 ff ff ff    call   *-0xf8(%ebx,%edi,4)
 8049f12:       83 c7 01                add    $0x1,%edi
 8049f15:       39 f7                   cmp    %esi,%edi
 8049f17:       75 df                   jne    8049ef8 <__libc_csu_init+0x38>
 8049f19:       83 c4 1c                add    $0x1c,%esp
 8049f1c:       5b                      pop    %ebx
 8049f1d:       5e                      pop    %esi
 8049f1e:       5f                      pop    %edi
 8049f1f:       5d                      pop    %ebp
 8049f20:       c3                      ret    
 8049f21:       eb 0d                   jmp    8049f30 <__libc_csu_fini>
 8049f23:       90                      nop
 8049f24:       90                      nop
 8049f25:       90                      nop
 8049f26:       90                      nop
 8049f27:       90                      nop
 8049f28:       90                      nop
 8049f29:       90                      nop
 8049f2a:       90                      nop
 8049f2b:       90                      nop
 8049f2c:       90                      nop
 8049f2d:       90                      nop
 8049f2e:       90                      nop
 8049f2f:       90                      nop

08049f30 <__libc_csu_fini>:
 8049f30:       f3 c3                   repz ret 

Disassembly of section .fini:

08049f34 <_fini>:
 8049f34:       53                      push   %ebx
 8049f35:       83 ec 08                sub    $0x8,%esp
 8049f38:       e8 a3 e9 ff ff          call   80488e0 <__x86.get_pc_thunk.bx>
 8049f3d:       81 c3 c3 20 00 00       add    $0x20c3,%ebx
 8049f43:       83 c4 08                add    $0x8,%esp
 8049f46:       5b                      pop    %ebx
 8049f47:       c3                      ret    