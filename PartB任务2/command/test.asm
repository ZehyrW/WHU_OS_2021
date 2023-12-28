
test：     文件格式 elf32-i386


Disassembly of section .text:

00001000 <main>:
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
    1009:	c7 04 24 08 18 00 00 	movl   $0x1808,(%esp)
    1010:	e8 49 00 00 00       	call   105e <printf>
    1015:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
    101c:	00 
    101d:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    1024:	00 
    1025:	8b 44 24 18          	mov    0x18(%esp),%eax
    1029:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    102d:	01 d0                	add    %edx,%eax
    102f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1033:	c7 04 24 14 18 00 00 	movl   $0x1814,(%esp)
    103a:	e8 1f 00 00 00       	call   105e <printf>
    103f:	b8 00 00 00 00       	mov    $0x0,%eax
    1044:	c9                   	leave  
    1045:	c3                   	ret    
    1046:	66 90                	xchg   %ax,%ax
    1048:	66 90                	xchg   %ax,%ax
    104a:	66 90                	xchg   %ax,%ax
    104c:	66 90                	xchg   %ax,%ax
    104e:	66 90                	xchg   %ax,%ax

00001050 <_start>:
    1050:	50                   	push   %eax
    1051:	51                   	push   %ecx
    1052:	e8 a9 ff ff ff       	call   1000 <main>
    1057:	50                   	push   %eax
    1058:	e8 22 07 00 00       	call   177f <exit>
    105d:	f4                   	hlt    

0000105e <printf>:
    105e:	55                   	push   %ebp
    105f:	89 e5                	mov    %esp,%ebp
    1061:	81 ec 28 04 00 00    	sub    $0x428,%esp
    1067:	8d 45 0c             	lea    0xc(%ebp),%eax
    106a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    106d:	8b 45 08             	mov    0x8(%ebp),%eax
    1070:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1073:	89 54 24 08          	mov    %edx,0x8(%esp)
    1077:	89 44 24 04          	mov    %eax,0x4(%esp)
    107b:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    1081:	89 04 24             	mov    %eax,(%esp)
    1084:	e8 f8 00 00 00       	call   1181 <vsprintf>
    1089:	89 45 f0             	mov    %eax,-0x10(%ebp)
    108c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    108f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1093:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    1099:	89 44 24 04          	mov    %eax,0x4(%esp)
    109d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10a4:	e8 97 06 00 00       	call   1740 <write>
    10a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    10ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10af:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    10b2:	74 24                	je     10d8 <printf+0x7a>
    10b4:	c7 44 24 0c 50 00 00 	movl   $0x50,0xc(%esp)
    10bb:	00 
    10bc:	c7 44 24 08 48 18 00 	movl   $0x1848,0x8(%esp)
    10c3:	00 
    10c4:	c7 44 24 04 48 18 00 	movl   $0x1848,0x4(%esp)
    10cb:	00 
    10cc:	c7 04 24 55 18 00 00 	movl   $0x1855,(%esp)
    10d3:	e8 22 06 00 00       	call   16fa <assertion_failure>
    10d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10db:	c9                   	leave  
    10dc:	c3                   	ret    

000010dd <printl>:
    10dd:	55                   	push   %ebp
    10de:	89 e5                	mov    %esp,%ebp
    10e0:	81 ec 28 04 00 00    	sub    $0x428,%esp
    10e6:	8d 45 0c             	lea    0xc(%ebp),%eax
    10e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10ec:	8b 45 08             	mov    0x8(%ebp),%eax
    10ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10f2:	89 54 24 08          	mov    %edx,0x8(%esp)
    10f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    10fa:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    1100:	89 04 24             	mov    %eax,(%esp)
    1103:	e8 79 00 00 00       	call   1181 <vsprintf>
    1108:	89 45 f0             	mov    %eax,-0x10(%ebp)
    110b:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    1111:	89 04 24             	mov    %eax,(%esp)
    1114:	e8 e1 06 00 00       	call   17fa <printx>
    1119:	8b 45 f0             	mov    -0x10(%ebp),%eax
    111c:	c9                   	leave  
    111d:	c3                   	ret    

0000111e <i2a>:
    111e:	55                   	push   %ebp
    111f:	89 e5                	mov    %esp,%ebp
    1121:	83 ec 28             	sub    $0x28,%esp
    1124:	8b 45 08             	mov    0x8(%ebp),%eax
    1127:	99                   	cltd   
    1128:	f7 7d 0c             	idivl  0xc(%ebp)
    112b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    112e:	8b 45 08             	mov    0x8(%ebp),%eax
    1131:	99                   	cltd   
    1132:	f7 7d 0c             	idivl  0xc(%ebp)
    1135:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1138:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    113c:	74 19                	je     1157 <i2a+0x39>
    113e:	8b 45 10             	mov    0x10(%ebp),%eax
    1141:	89 44 24 08          	mov    %eax,0x8(%esp)
    1145:	8b 45 0c             	mov    0xc(%ebp),%eax
    1148:	89 44 24 04          	mov    %eax,0x4(%esp)
    114c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    114f:	89 04 24             	mov    %eax,(%esp)
    1152:	e8 c7 ff ff ff       	call   111e <i2a>
    1157:	8b 45 10             	mov    0x10(%ebp),%eax
    115a:	8b 00                	mov    (%eax),%eax
    115c:	8d 48 01             	lea    0x1(%eax),%ecx
    115f:	8b 55 10             	mov    0x10(%ebp),%edx
    1162:	89 0a                	mov    %ecx,(%edx)
    1164:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1168:	7f 08                	jg     1172 <i2a+0x54>
    116a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    116d:	83 c2 30             	add    $0x30,%edx
    1170:	eb 06                	jmp    1178 <i2a+0x5a>
    1172:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1175:	83 c2 37             	add    $0x37,%edx
    1178:	88 10                	mov    %dl,(%eax)
    117a:	8b 45 10             	mov    0x10(%ebp),%eax
    117d:	8b 00                	mov    (%eax),%eax
    117f:	c9                   	leave  
    1180:	c3                   	ret    

00001181 <vsprintf>:
    1181:	55                   	push   %ebp
    1182:	89 e5                	mov    %esp,%ebp
    1184:	53                   	push   %ebx
    1185:	81 ec 34 04 00 00    	sub    $0x434,%esp
    118b:	8b 45 10             	mov    0x10(%ebp),%eax
    118e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1191:	8b 45 08             	mov    0x8(%ebp),%eax
    1194:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1197:	e9 49 02 00 00       	jmp    13e5 <vsprintf+0x264>
    119c:	8b 45 0c             	mov    0xc(%ebp),%eax
    119f:	0f b6 00             	movzbl (%eax),%eax
    11a2:	3c 25                	cmp    $0x25,%al
    11a4:	74 16                	je     11bc <vsprintf+0x3b>
    11a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11a9:	8d 50 01             	lea    0x1(%eax),%edx
    11ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11af:	8b 55 0c             	mov    0xc(%ebp),%edx
    11b2:	0f b6 12             	movzbl (%edx),%edx
    11b5:	88 10                	mov    %dl,(%eax)
    11b7:	e9 25 02 00 00       	jmp    13e1 <vsprintf+0x260>
    11bc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    11c3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    11c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ca:	0f b6 00             	movzbl (%eax),%eax
    11cd:	3c 25                	cmp    $0x25,%al
    11cf:	75 16                	jne    11e7 <vsprintf+0x66>
    11d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11d4:	8d 50 01             	lea    0x1(%eax),%edx
    11d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11da:	8b 55 0c             	mov    0xc(%ebp),%edx
    11dd:	0f b6 12             	movzbl (%edx),%edx
    11e0:	88 10                	mov    %dl,(%eax)
    11e2:	e9 fa 01 00 00       	jmp    13e1 <vsprintf+0x260>
    11e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ea:	0f b6 00             	movzbl (%eax),%eax
    11ed:	3c 30                	cmp    $0x30,%al
    11ef:	75 0a                	jne    11fb <vsprintf+0x7a>
    11f1:	c6 45 eb 30          	movb   $0x30,-0x15(%ebp)
    11f5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    11f9:	eb 28                	jmp    1223 <vsprintf+0xa2>
    11fb:	c6 45 eb 20          	movb   $0x20,-0x15(%ebp)
    11ff:	eb 22                	jmp    1223 <vsprintf+0xa2>
    1201:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1204:	89 d0                	mov    %edx,%eax
    1206:	c1 e0 02             	shl    $0x2,%eax
    1209:	01 d0                	add    %edx,%eax
    120b:	01 c0                	add    %eax,%eax
    120d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1210:	8b 45 0c             	mov    0xc(%ebp),%eax
    1213:	0f b6 00             	movzbl (%eax),%eax
    1216:	0f be c0             	movsbl %al,%eax
    1219:	83 e8 30             	sub    $0x30,%eax
    121c:	01 45 e4             	add    %eax,-0x1c(%ebp)
    121f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1223:	8b 45 0c             	mov    0xc(%ebp),%eax
    1226:	0f b6 00             	movzbl (%eax),%eax
    1229:	3c 2f                	cmp    $0x2f,%al
    122b:	76 0a                	jbe    1237 <vsprintf+0xb6>
    122d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1230:	0f b6 00             	movzbl (%eax),%eax
    1233:	3c 39                	cmp    $0x39,%al
    1235:	76 ca                	jbe    1201 <vsprintf+0x80>
    1237:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    123d:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    1243:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    1249:	c7 44 24 08 00 04 00 	movl   $0x400,0x8(%esp)
    1250:	00 
    1251:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1258:	00 
    1259:	89 04 24             	mov    %eax,(%esp)
    125c:	e8 08 02 00 00       	call   1469 <memset>
    1261:	8b 45 0c             	mov    0xc(%ebp),%eax
    1264:	0f b6 00             	movzbl (%eax),%eax
    1267:	0f be c0             	movsbl %al,%eax
    126a:	83 f8 64             	cmp    $0x64,%eax
    126d:	74 6d                	je     12dc <vsprintf+0x15b>
    126f:	83 f8 64             	cmp    $0x64,%eax
    1272:	7f 0a                	jg     127e <vsprintf+0xfd>
    1274:	83 f8 63             	cmp    $0x63,%eax
    1277:	74 18                	je     1291 <vsprintf+0x110>
    1279:	e9 db 00 00 00       	jmp    1359 <vsprintf+0x1d8>
    127e:	83 f8 73             	cmp    $0x73,%eax
    1281:	0f 84 9b 00 00 00    	je     1322 <vsprintf+0x1a1>
    1287:	83 f8 78             	cmp    $0x78,%eax
    128a:	74 25                	je     12b1 <vsprintf+0x130>
    128c:	e9 c8 00 00 00       	jmp    1359 <vsprintf+0x1d8>
    1291:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    1297:	8d 50 01             	lea    0x1(%eax),%edx
    129a:	89 95 dc fb ff ff    	mov    %edx,-0x424(%ebp)
    12a0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    12a3:	0f b6 12             	movzbl (%edx),%edx
    12a6:	88 10                	mov    %dl,(%eax)
    12a8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    12ac:	e9 a8 00 00 00       	jmp    1359 <vsprintf+0x1d8>
    12b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12b4:	8b 00                	mov    (%eax),%eax
    12b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    12b9:	8d 85 dc fb ff ff    	lea    -0x424(%ebp),%eax
    12bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    12c3:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    12ca:	00 
    12cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12ce:	89 04 24             	mov    %eax,(%esp)
    12d1:	e8 48 fe ff ff       	call   111e <i2a>
    12d6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    12da:	eb 7d                	jmp    1359 <vsprintf+0x1d8>
    12dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12df:	8b 00                	mov    (%eax),%eax
    12e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    12e4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    12e8:	79 15                	jns    12ff <vsprintf+0x17e>
    12ea:	f7 5d ec             	negl   -0x14(%ebp)
    12ed:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    12f3:	8d 50 01             	lea    0x1(%eax),%edx
    12f6:	89 95 dc fb ff ff    	mov    %edx,-0x424(%ebp)
    12fc:	c6 00 2d             	movb   $0x2d,(%eax)
    12ff:	8d 85 dc fb ff ff    	lea    -0x424(%ebp),%eax
    1305:	89 44 24 08          	mov    %eax,0x8(%esp)
    1309:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    1310:	00 
    1311:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1314:	89 04 24             	mov    %eax,(%esp)
    1317:	e8 02 fe ff ff       	call   111e <i2a>
    131c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1320:	eb 37                	jmp    1359 <vsprintf+0x1d8>
    1322:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1325:	8b 10                	mov    (%eax),%edx
    1327:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    132d:	89 54 24 04          	mov    %edx,0x4(%esp)
    1331:	89 04 24             	mov    %eax,(%esp)
    1334:	e8 51 01 00 00       	call   148a <strcpy>
    1339:	8b 9d dc fb ff ff    	mov    -0x424(%ebp),%ebx
    133f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1342:	8b 00                	mov    (%eax),%eax
    1344:	89 04 24             	mov    %eax,(%esp)
    1347:	e8 56 01 00 00       	call   14a2 <strlen>
    134c:	01 d8                	add    %ebx,%eax
    134e:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    1354:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1358:	90                   	nop
    1359:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1360:	eb 13                	jmp    1375 <vsprintf+0x1f4>
    1362:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1365:	8d 50 01             	lea    0x1(%eax),%edx
    1368:	89 55 f4             	mov    %edx,-0xc(%ebp)
    136b:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    136f:	88 10                	mov    %dl,(%eax)
    1371:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1375:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    137b:	89 04 24             	mov    %eax,(%esp)
    137e:	e8 1f 01 00 00       	call   14a2 <strlen>
    1383:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    1386:	7d 17                	jge    139f <vsprintf+0x21e>
    1388:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    138e:	89 04 24             	mov    %eax,(%esp)
    1391:	e8 0c 01 00 00       	call   14a2 <strlen>
    1396:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1399:	29 c2                	sub    %eax,%edx
    139b:	89 d0                	mov    %edx,%eax
    139d:	eb 05                	jmp    13a4 <vsprintf+0x223>
    139f:	b8 00 00 00 00       	mov    $0x0,%eax
    13a4:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    13a7:	7f b9                	jg     1362 <vsprintf+0x1e1>
    13a9:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    13af:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    13b5:	eb 1d                	jmp    13d4 <vsprintf+0x253>
    13b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ba:	8d 50 01             	lea    0x1(%eax),%edx
    13bd:	89 55 f4             	mov    %edx,-0xc(%ebp)
    13c0:	8b 95 dc fb ff ff    	mov    -0x424(%ebp),%edx
    13c6:	8d 4a 01             	lea    0x1(%edx),%ecx
    13c9:	89 8d dc fb ff ff    	mov    %ecx,-0x424(%ebp)
    13cf:	0f b6 12             	movzbl (%edx),%edx
    13d2:	88 10                	mov    %dl,(%eax)
    13d4:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    13da:	0f b6 00             	movzbl (%eax),%eax
    13dd:	84 c0                	test   %al,%al
    13df:	75 d6                	jne    13b7 <vsprintf+0x236>
    13e1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    13e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e8:	0f b6 00             	movzbl (%eax),%eax
    13eb:	84 c0                	test   %al,%al
    13ed:	0f 85 a9 fd ff ff    	jne    119c <vsprintf+0x1b>
    13f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13f6:	c6 00 00             	movb   $0x0,(%eax)
    13f9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    13fc:	8b 45 08             	mov    0x8(%ebp),%eax
    13ff:	29 c2                	sub    %eax,%edx
    1401:	89 d0                	mov    %edx,%eax
    1403:	81 c4 34 04 00 00    	add    $0x434,%esp
    1409:	5b                   	pop    %ebx
    140a:	5d                   	pop    %ebp
    140b:	c3                   	ret    

0000140c <sprintf>:
    140c:	55                   	push   %ebp
    140d:	89 e5                	mov    %esp,%ebp
    140f:	83 ec 28             	sub    $0x28,%esp
    1412:	8d 45 0c             	lea    0xc(%ebp),%eax
    1415:	83 c0 04             	add    $0x4,%eax
    1418:	89 45 f4             	mov    %eax,-0xc(%ebp)
    141b:	8b 45 0c             	mov    0xc(%ebp),%eax
    141e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1421:	89 54 24 08          	mov    %edx,0x8(%esp)
    1425:	89 44 24 04          	mov    %eax,0x4(%esp)
    1429:	8b 45 08             	mov    0x8(%ebp),%eax
    142c:	89 04 24             	mov    %eax,(%esp)
    142f:	e8 4d fd ff ff       	call   1181 <vsprintf>
    1434:	c9                   	leave  
    1435:	c3                   	ret    
    1436:	66 90                	xchg   %ax,%ax
    1438:	66 90                	xchg   %ax,%ax
    143a:	66 90                	xchg   %ax,%ax
    143c:	66 90                	xchg   %ax,%ax
    143e:	66 90                	xchg   %ax,%ax

00001440 <memcpy>:
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	56                   	push   %esi
    1444:	57                   	push   %edi
    1445:	51                   	push   %ecx
    1446:	8b 7d 08             	mov    0x8(%ebp),%edi
    1449:	8b 75 0c             	mov    0xc(%ebp),%esi
    144c:	8b 4d 10             	mov    0x10(%ebp),%ecx

0000144f <memcpy.1>:
    144f:	83 f9 00             	cmp    $0x0,%ecx
    1452:	74 0b                	je     145f <memcpy.2>
    1454:	3e 8a 06             	mov    %ds:(%esi),%al
    1457:	46                   	inc    %esi
    1458:	26 88 07             	mov    %al,%es:(%edi)
    145b:	47                   	inc    %edi
    145c:	49                   	dec    %ecx
    145d:	eb f0                	jmp    144f <memcpy.1>

0000145f <memcpy.2>:
    145f:	8b 45 08             	mov    0x8(%ebp),%eax
    1462:	59                   	pop    %ecx
    1463:	5f                   	pop    %edi
    1464:	5e                   	pop    %esi
    1465:	89 ec                	mov    %ebp,%esp
    1467:	5d                   	pop    %ebp
    1468:	c3                   	ret    

00001469 <memset>:
    1469:	55                   	push   %ebp
    146a:	89 e5                	mov    %esp,%ebp
    146c:	56                   	push   %esi
    146d:	57                   	push   %edi
    146e:	51                   	push   %ecx
    146f:	8b 7d 08             	mov    0x8(%ebp),%edi
    1472:	8b 55 0c             	mov    0xc(%ebp),%edx
    1475:	8b 4d 10             	mov    0x10(%ebp),%ecx

00001478 <memset.1>:
    1478:	83 f9 00             	cmp    $0x0,%ecx
    147b:	74 06                	je     1483 <memset.2>
    147d:	88 17                	mov    %dl,(%edi)
    147f:	47                   	inc    %edi
    1480:	49                   	dec    %ecx
    1481:	eb f5                	jmp    1478 <memset.1>

00001483 <memset.2>:
    1483:	59                   	pop    %ecx
    1484:	5f                   	pop    %edi
    1485:	5e                   	pop    %esi
    1486:	89 ec                	mov    %ebp,%esp
    1488:	5d                   	pop    %ebp
    1489:	c3                   	ret    

0000148a <strcpy>:
    148a:	55                   	push   %ebp
    148b:	89 e5                	mov    %esp,%ebp
    148d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1490:	8b 7d 08             	mov    0x8(%ebp),%edi

00001493 <strcpy.1>:
    1493:	8a 06                	mov    (%esi),%al
    1495:	46                   	inc    %esi
    1496:	88 07                	mov    %al,(%edi)
    1498:	47                   	inc    %edi
    1499:	3c 00                	cmp    $0x0,%al
    149b:	75 f6                	jne    1493 <strcpy.1>
    149d:	8b 45 08             	mov    0x8(%ebp),%eax
    14a0:	5d                   	pop    %ebp
    14a1:	c3                   	ret    

000014a2 <strlen>:
    14a2:	55                   	push   %ebp
    14a3:	89 e5                	mov    %esp,%ebp
    14a5:	b8 00 00 00 00       	mov    $0x0,%eax
    14aa:	8b 75 08             	mov    0x8(%ebp),%esi

000014ad <strlen.1>:
    14ad:	80 3e 00             	cmpb   $0x0,(%esi)
    14b0:	74 04                	je     14b6 <strlen.2>
    14b2:	46                   	inc    %esi
    14b3:	40                   	inc    %eax
    14b4:	eb f7                	jmp    14ad <strlen.1>

000014b6 <strlen.2>:
    14b6:	5d                   	pop    %ebp
    14b7:	c3                   	ret    

000014b8 <send_recv>:
    14b8:	55                   	push   %ebp
    14b9:	89 e5                	mov    %esp,%ebp
    14bb:	83 ec 28             	sub    $0x28,%esp
    14be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    14c5:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    14c9:	75 1b                	jne    14e6 <send_recv+0x2e>
    14cb:	c7 44 24 08 30 00 00 	movl   $0x30,0x8(%esp)
    14d2:	00 
    14d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14da:	00 
    14db:	8b 45 10             	mov    0x10(%ebp),%eax
    14de:	89 04 24             	mov    %eax,(%esp)
    14e1:	e8 83 ff ff ff       	call   1469 <memset>
    14e6:	8b 45 08             	mov    0x8(%ebp),%eax
    14e9:	83 f8 01             	cmp    $0x1,%eax
    14ec:	7c 6c                	jl     155a <send_recv+0xa2>
    14ee:	83 f8 02             	cmp    $0x2,%eax
    14f1:	7e 49                	jle    153c <send_recv+0x84>
    14f3:	83 f8 03             	cmp    $0x3,%eax
    14f6:	75 62                	jne    155a <send_recv+0xa2>
    14f8:	8b 45 10             	mov    0x10(%ebp),%eax
    14fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    14ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    1502:	89 44 24 04          	mov    %eax,0x4(%esp)
    1506:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    150d:	e8 ce 02 00 00       	call   17e0 <sendrec>
    1512:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1515:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1519:	75 1f                	jne    153a <send_recv+0x82>
    151b:	8b 45 10             	mov    0x10(%ebp),%eax
    151e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1522:	8b 45 0c             	mov    0xc(%ebp),%eax
    1525:	89 44 24 04          	mov    %eax,0x4(%esp)
    1529:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1530:	e8 ab 02 00 00       	call   17e0 <sendrec>
    1535:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1538:	eb 59                	jmp    1593 <send_recv+0xdb>
    153a:	eb 57                	jmp    1593 <send_recv+0xdb>
    153c:	8b 45 10             	mov    0x10(%ebp),%eax
    153f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1543:	8b 45 0c             	mov    0xc(%ebp),%eax
    1546:	89 44 24 04          	mov    %eax,0x4(%esp)
    154a:	8b 45 08             	mov    0x8(%ebp),%eax
    154d:	89 04 24             	mov    %eax,(%esp)
    1550:	e8 8b 02 00 00       	call   17e0 <sendrec>
    1555:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1558:	eb 39                	jmp    1593 <send_recv+0xdb>
    155a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    155e:	74 32                	je     1592 <send_recv+0xda>
    1560:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1564:	74 2c                	je     1592 <send_recv+0xda>
    1566:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    156a:	74 26                	je     1592 <send_recv+0xda>
    156c:	c7 44 24 0c 39 00 00 	movl   $0x39,0xc(%esp)
    1573:	00 
    1574:	c7 44 24 08 5c 18 00 	movl   $0x185c,0x8(%esp)
    157b:	00 
    157c:	c7 44 24 04 5c 18 00 	movl   $0x185c,0x4(%esp)
    1583:	00 
    1584:	c7 04 24 68 18 00 00 	movl   $0x1868,(%esp)
    158b:	e8 6a 01 00 00       	call   16fa <assertion_failure>
    1590:	eb 00                	jmp    1592 <send_recv+0xda>
    1592:	90                   	nop
    1593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1596:	c9                   	leave  
    1597:	c3                   	ret    

00001598 <memcmp>:
    1598:	55                   	push   %ebp
    1599:	89 e5                	mov    %esp,%ebp
    159b:	83 ec 10             	sub    $0x10,%esp
    159e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    15a2:	74 06                	je     15aa <memcmp+0x12>
    15a4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15a8:	75 0c                	jne    15b6 <memcmp+0x1e>
    15aa:	8b 55 08             	mov    0x8(%ebp),%edx
    15ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    15b0:	29 c2                	sub    %eax,%edx
    15b2:	89 d0                	mov    %edx,%eax
    15b4:	eb 56                	jmp    160c <memcmp+0x74>
    15b6:	8b 45 08             	mov    0x8(%ebp),%eax
    15b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    15bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
    15c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    15c9:	eb 34                	jmp    15ff <memcmp+0x67>
    15cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15ce:	0f b6 10             	movzbl (%eax),%edx
    15d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15d4:	0f b6 00             	movzbl (%eax),%eax
    15d7:	38 c2                	cmp    %al,%dl
    15d9:	74 18                	je     15f3 <memcmp+0x5b>
    15db:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15de:	0f b6 00             	movzbl (%eax),%eax
    15e1:	0f be d0             	movsbl %al,%edx
    15e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15e7:	0f b6 00             	movzbl (%eax),%eax
    15ea:	0f be c0             	movsbl %al,%eax
    15ed:	29 c2                	sub    %eax,%edx
    15ef:	89 d0                	mov    %edx,%eax
    15f1:	eb 19                	jmp    160c <memcmp+0x74>
    15f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    15f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    15fb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    15ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1602:	3b 45 10             	cmp    0x10(%ebp),%eax
    1605:	7c c4                	jl     15cb <memcmp+0x33>
    1607:	b8 00 00 00 00       	mov    $0x0,%eax
    160c:	c9                   	leave  
    160d:	c3                   	ret    

0000160e <strcmp>:
    160e:	55                   	push   %ebp
    160f:	89 e5                	mov    %esp,%ebp
    1611:	83 ec 10             	sub    $0x10,%esp
    1614:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1618:	74 06                	je     1620 <strcmp+0x12>
    161a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    161e:	75 0c                	jne    162c <strcmp+0x1e>
    1620:	8b 55 08             	mov    0x8(%ebp),%edx
    1623:	8b 45 0c             	mov    0xc(%ebp),%eax
    1626:	29 c2                	sub    %eax,%edx
    1628:	89 d0                	mov    %edx,%eax
    162a:	eb 52                	jmp    167e <strcmp+0x70>
    162c:	8b 45 08             	mov    0x8(%ebp),%eax
    162f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1632:	8b 45 0c             	mov    0xc(%ebp),%eax
    1635:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1638:	eb 1a                	jmp    1654 <strcmp+0x46>
    163a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    163d:	0f b6 10             	movzbl (%eax),%edx
    1640:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1643:	0f b6 00             	movzbl (%eax),%eax
    1646:	38 c2                	cmp    %al,%dl
    1648:	74 02                	je     164c <strcmp+0x3e>
    164a:	eb 1c                	jmp    1668 <strcmp+0x5a>
    164c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1650:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1654:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1657:	0f b6 00             	movzbl (%eax),%eax
    165a:	84 c0                	test   %al,%al
    165c:	74 0a                	je     1668 <strcmp+0x5a>
    165e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1661:	0f b6 00             	movzbl (%eax),%eax
    1664:	84 c0                	test   %al,%al
    1666:	75 d2                	jne    163a <strcmp+0x2c>
    1668:	8b 45 fc             	mov    -0x4(%ebp),%eax
    166b:	0f b6 00             	movzbl (%eax),%eax
    166e:	0f be d0             	movsbl %al,%edx
    1671:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1674:	0f b6 00             	movzbl (%eax),%eax
    1677:	0f be c0             	movsbl %al,%eax
    167a:	29 c2                	sub    %eax,%edx
    167c:	89 d0                	mov    %edx,%eax
    167e:	c9                   	leave  
    167f:	c3                   	ret    

00001680 <strcat>:
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	83 ec 10             	sub    $0x10,%esp
    1686:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    168a:	74 06                	je     1692 <strcat+0x12>
    168c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1690:	75 07                	jne    1699 <strcat+0x19>
    1692:	b8 00 00 00 00       	mov    $0x0,%eax
    1697:	eb 44                	jmp    16dd <strcat+0x5d>
    1699:	8b 45 08             	mov    0x8(%ebp),%eax
    169c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    169f:	eb 04                	jmp    16a5 <strcat+0x25>
    16a1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    16a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a8:	0f b6 00             	movzbl (%eax),%eax
    16ab:	84 c0                	test   %al,%al
    16ad:	75 f2                	jne    16a1 <strcat+0x21>
    16af:	8b 45 0c             	mov    0xc(%ebp),%eax
    16b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    16b5:	eb 13                	jmp    16ca <strcat+0x4a>
    16b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ba:	0f b6 10             	movzbl (%eax),%edx
    16bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c0:	88 10                	mov    %dl,(%eax)
    16c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    16c6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    16ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16cd:	0f b6 00             	movzbl (%eax),%eax
    16d0:	84 c0                	test   %al,%al
    16d2:	75 e3                	jne    16b7 <strcat+0x37>
    16d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d7:	c6 00 00             	movb   $0x0,(%eax)
    16da:	8b 45 08             	mov    0x8(%ebp),%eax
    16dd:	c9                   	leave  
    16de:	c3                   	ret    

000016df <spin>:
    16df:	55                   	push   %ebp
    16e0:	89 e5                	mov    %esp,%ebp
    16e2:	83 ec 18             	sub    $0x18,%esp
    16e5:	8b 45 08             	mov    0x8(%ebp),%eax
    16e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    16ec:	c7 04 24 aa 18 00 00 	movl   $0x18aa,(%esp)
    16f3:	e8 e5 f9 ff ff       	call   10dd <printl>
    16f8:	eb fe                	jmp    16f8 <spin+0x19>

000016fa <assertion_failure>:
    16fa:	55                   	push   %ebp
    16fb:	89 e5                	mov    %esp,%ebp
    16fd:	83 ec 28             	sub    $0x28,%esp
    1700:	8b 45 14             	mov    0x14(%ebp),%eax
    1703:	89 44 24 14          	mov    %eax,0x14(%esp)
    1707:	8b 45 10             	mov    0x10(%ebp),%eax
    170a:	89 44 24 10          	mov    %eax,0x10(%esp)
    170e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1711:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1715:	8b 45 08             	mov    0x8(%ebp),%eax
    1718:	89 44 24 08          	mov    %eax,0x8(%esp)
    171c:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    1723:	00 
    1724:	c7 04 24 c0 18 00 00 	movl   $0x18c0,(%esp)
    172b:	e8 ad f9 ff ff       	call   10dd <printl>
    1730:	c7 04 24 f5 18 00 00 	movl   $0x18f5,(%esp)
    1737:	e8 a3 ff ff ff       	call   16df <spin>
    173c:	0f 0b                	ud2    
    173e:	c9                   	leave  
    173f:	c3                   	ret    

00001740 <write>:
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	83 ec 48             	sub    $0x48,%esp
    1746:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
    174d:	8b 45 08             	mov    0x8(%ebp),%eax
    1750:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1753:	8b 45 0c             	mov    0xc(%ebp),%eax
    1756:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1759:	8b 45 10             	mov    0x10(%ebp),%eax
    175c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    175f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1762:	89 44 24 08          	mov    %eax,0x8(%esp)
    1766:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    176d:	00 
    176e:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    1775:	e8 3e fd ff ff       	call   14b8 <send_recv>
    177a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    177d:	c9                   	leave  
    177e:	c3                   	ret    

0000177f <exit>:
    177f:	55                   	push   %ebp
    1780:	89 e5                	mov    %esp,%ebp
    1782:	83 ec 48             	sub    $0x48,%esp
    1785:	c7 45 cc 11 00 00 00 	movl   $0x11,-0x34(%ebp)
    178c:	8b 45 08             	mov    0x8(%ebp),%eax
    178f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1792:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1795:	89 44 24 08          	mov    %eax,0x8(%esp)
    1799:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    17a0:	00 
    17a1:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    17a8:	e8 0b fd ff ff       	call   14b8 <send_recv>
    17ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
    17b0:	83 f8 12             	cmp    $0x12,%eax
    17b3:	74 24                	je     17d9 <exit+0x5a>
    17b5:	c7 44 24 0c 26 00 00 	movl   $0x26,0xc(%esp)
    17bc:	00 
    17bd:	c7 44 24 08 09 19 00 	movl   $0x1909,0x8(%esp)
    17c4:	00 
    17c5:	c7 44 24 04 09 19 00 	movl   $0x1909,0x4(%esp)
    17cc:	00 
    17cd:	c7 04 24 14 19 00 00 	movl   $0x1914,(%esp)
    17d4:	e8 21 ff ff ff       	call   16fa <assertion_failure>
    17d9:	c9                   	leave  
    17da:	c3                   	ret    
    17db:	66 90                	xchg   %ax,%ax
    17dd:	66 90                	xchg   %ax,%ax
    17df:	90                   	nop

000017e0 <sendrec>:
    17e0:	53                   	push   %ebx
    17e1:	51                   	push   %ecx
    17e2:	52                   	push   %edx
    17e3:	b8 01 00 00 00       	mov    $0x1,%eax
    17e8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    17ec:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    17f0:	8b 54 24 18          	mov    0x18(%esp),%edx
    17f4:	cd 90                	int    $0x90
    17f6:	5a                   	pop    %edx
    17f7:	59                   	pop    %ecx
    17f8:	5b                   	pop    %ebx
    17f9:	c3                   	ret    

000017fa <printx>:
    17fa:	52                   	push   %edx
    17fb:	b8 00 00 00 00       	mov    $0x0,%eax
    1800:	8b 54 24 08          	mov    0x8(%esp),%edx
    1804:	cd 90                	int    $0x90
    1806:	5a                   	pop    %edx
    1807:	c3                   	ret    
