
attack:     file format elf32-i386


Disassembly of section .text:

00001000 <insert>:
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 28             	sub    $0x28,%esp
    1006:	c7 45 f4 31 32 33 34 	movl   $0x34333231,-0xc(%ebp)
    100d:	c6 45 f0 68          	movb   $0x68,-0x10(%ebp)
    1011:	c6 45 f1 10          	movb   $0x10,-0xf(%ebp)
    1015:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    1019:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    101d:	c7 45 e0 41 42 43 44 	movl   $0x44434241,-0x20(%ebp)
    1024:	c7 45 e4 45 46 47 48 	movl   $0x48474645,-0x1c(%ebp)
    102b:	c7 45 e8 49 4a 4b 4c 	movl   $0x4c4b4a49,-0x18(%ebp)
    1032:	c7 45 ec 4d 4e 4f 50 	movl   $0x504f4e4d,-0x14(%ebp)
    1039:	83 ec 04             	sub    $0x4,%esp
    103c:	6a 14                	push   $0x14
    103e:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1041:	50                   	push   %eax
    1042:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1045:	50                   	push   %eax
    1046:	e8 45 04 00 00       	call   1490 <memcpy>
    104b:	83 c4 10             	add    $0x10,%esp
    104e:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1051:	83 c0 14             	add    $0x14,%eax
    1054:	83 ec 08             	sub    $0x8,%esp
    1057:	50                   	push   %eax
    1058:	68 08 18 00 00       	push   $0x1808
    105d:	e8 7c 00 00 00       	call   10de <printf>
    1062:	83 c4 10             	add    $0x10,%esp
    1065:	90                   	nop
    1066:	c9                   	leave  
    1067:	c3                   	ret    

00001068 <hack>:
    1068:	55                   	push   %ebp
    1069:	89 e5                	mov    %esp,%ebp
    106b:	83 ec 08             	sub    $0x8,%esp
    106e:	83 ec 0c             	sub    $0xc,%esp
    1071:	68 23 18 00 00       	push   $0x1823
    1076:	e8 63 00 00 00       	call   10de <printf>
    107b:	83 c4 10             	add    $0x10,%esp
    107e:	83 ec 0c             	sub    $0xc,%esp
    1081:	6a 01                	push   $0x1
    1083:	e8 0d 07 00 00       	call   1795 <exit>
    1088:	83 c4 10             	add    $0x10,%esp
    108b:	90                   	nop
    108c:	c9                   	leave  
    108d:	c3                   	ret    

0000108e <main>:
    108e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1092:	83 e4 f0             	and    $0xfffffff0,%esp
    1095:	ff 71 fc             	pushl  -0x4(%ecx)
    1098:	55                   	push   %ebp
    1099:	89 e5                	mov    %esp,%ebp
    109b:	51                   	push   %ecx
    109c:	83 ec 04             	sub    $0x4,%esp
    109f:	e8 5c ff ff ff       	call   1000 <insert>
    10a4:	83 ec 0c             	sub    $0xc,%esp
    10a7:	68 3f 18 00 00       	push   $0x183f
    10ac:	e8 2d 00 00 00       	call   10de <printf>
    10b1:	83 c4 10             	add    $0x10,%esp
    10b4:	b8 01 00 00 00       	mov    $0x1,%eax
    10b9:	8b 4d fc             	mov    -0x4(%ebp),%ecx
    10bc:	c9                   	leave  
    10bd:	8d 61 fc             	lea    -0x4(%ecx),%esp
    10c0:	c3                   	ret    
    10c1:	66 90                	xchg   %ax,%ax
    10c3:	66 90                	xchg   %ax,%ax
    10c5:	66 90                	xchg   %ax,%ax
    10c7:	66 90                	xchg   %ax,%ax
    10c9:	66 90                	xchg   %ax,%ax
    10cb:	66 90                	xchg   %ax,%ax
    10cd:	66 90                	xchg   %ax,%ax
    10cf:	90                   	nop

000010d0 <_start>:
    10d0:	50                   	push   %eax
    10d1:	51                   	push   %ecx
    10d2:	e8 b7 ff ff ff       	call   108e <main>
    10d7:	50                   	push   %eax
    10d8:	e8 b8 06 00 00       	call   1795 <exit>
    10dd:	f4                   	hlt    

000010de <printf>:
    10de:	55                   	push   %ebp
    10df:	89 e5                	mov    %esp,%ebp
    10e1:	81 ec 18 04 00 00    	sub    $0x418,%esp
    10e7:	8d 45 0c             	lea    0xc(%ebp),%eax
    10ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10ed:	8b 45 08             	mov    0x8(%ebp),%eax
    10f0:	83 ec 04             	sub    $0x4,%esp
    10f3:	ff 75 f4             	pushl  -0xc(%ebp)
    10f6:	50                   	push   %eax
    10f7:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    10fd:	50                   	push   %eax
    10fe:	e8 e6 00 00 00       	call   11e9 <vsprintf>
    1103:	83 c4 10             	add    $0x10,%esp
    1106:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1109:	83 ec 04             	sub    $0x4,%esp
    110c:	ff 75 f0             	pushl  -0x10(%ebp)
    110f:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    1115:	50                   	push   %eax
    1116:	6a 01                	push   $0x1
    1118:	e8 41 06 00 00       	call   175e <write>
    111d:	83 c4 10             	add    $0x10,%esp
    1120:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1123:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1126:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1129:	74 19                	je     1144 <printf+0x66>
    112b:	6a 50                	push   $0x50
    112d:	68 4e 18 00 00       	push   $0x184e
    1132:	68 4e 18 00 00       	push   $0x184e
    1137:	68 5b 18 00 00       	push   $0x185b
    113c:	e8 e4 05 00 00       	call   1725 <assertion_failure>
    1141:	83 c4 10             	add    $0x10,%esp
    1144:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1147:	c9                   	leave  
    1148:	c3                   	ret    

00001149 <printl>:
    1149:	55                   	push   %ebp
    114a:	89 e5                	mov    %esp,%ebp
    114c:	81 ec 18 04 00 00    	sub    $0x418,%esp
    1152:	8d 45 0c             	lea    0xc(%ebp),%eax
    1155:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1158:	8b 45 08             	mov    0x8(%ebp),%eax
    115b:	83 ec 04             	sub    $0x4,%esp
    115e:	ff 75 f4             	pushl  -0xc(%ebp)
    1161:	50                   	push   %eax
    1162:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    1168:	50                   	push   %eax
    1169:	e8 7b 00 00 00       	call   11e9 <vsprintf>
    116e:	83 c4 10             	add    $0x10,%esp
    1171:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1174:	83 ec 0c             	sub    $0xc,%esp
    1177:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    117d:	50                   	push   %eax
    117e:	e8 77 06 00 00       	call   17fa <printx>
    1183:	83 c4 10             	add    $0x10,%esp
    1186:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1189:	c9                   	leave  
    118a:	c3                   	ret    

0000118b <i2a>:
    118b:	55                   	push   %ebp
    118c:	89 e5                	mov    %esp,%ebp
    118e:	83 ec 18             	sub    $0x18,%esp
    1191:	8b 45 08             	mov    0x8(%ebp),%eax
    1194:	99                   	cltd   
    1195:	f7 7d 0c             	idivl  0xc(%ebp)
    1198:	89 55 f4             	mov    %edx,-0xc(%ebp)
    119b:	8b 45 08             	mov    0x8(%ebp),%eax
    119e:	99                   	cltd   
    119f:	f7 7d 0c             	idivl  0xc(%ebp)
    11a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    11a5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11a9:	74 14                	je     11bf <i2a+0x34>
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	ff 75 10             	pushl  0x10(%ebp)
    11b1:	ff 75 0c             	pushl  0xc(%ebp)
    11b4:	ff 75 f0             	pushl  -0x10(%ebp)
    11b7:	e8 cf ff ff ff       	call   118b <i2a>
    11bc:	83 c4 10             	add    $0x10,%esp
    11bf:	8b 45 10             	mov    0x10(%ebp),%eax
    11c2:	8b 00                	mov    (%eax),%eax
    11c4:	8d 48 01             	lea    0x1(%eax),%ecx
    11c7:	8b 55 10             	mov    0x10(%ebp),%edx
    11ca:	89 0a                	mov    %ecx,(%edx)
    11cc:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11d0:	7f 08                	jg     11da <i2a+0x4f>
    11d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11d5:	83 c2 30             	add    $0x30,%edx
    11d8:	eb 06                	jmp    11e0 <i2a+0x55>
    11da:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11dd:	83 c2 37             	add    $0x37,%edx
    11e0:	88 10                	mov    %dl,(%eax)
    11e2:	8b 45 10             	mov    0x10(%ebp),%eax
    11e5:	8b 00                	mov    (%eax),%eax
    11e7:	c9                   	leave  
    11e8:	c3                   	ret    

000011e9 <vsprintf>:
    11e9:	55                   	push   %ebp
    11ea:	89 e5                	mov    %esp,%ebp
    11ec:	81 ec 28 04 00 00    	sub    $0x428,%esp
    11f2:	8b 45 10             	mov    0x10(%ebp),%eax
    11f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    11f8:	8b 45 08             	mov    0x8(%ebp),%eax
    11fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    11fe:	e9 47 02 00 00       	jmp    144a <vsprintf+0x261>
    1203:	8b 45 0c             	mov    0xc(%ebp),%eax
    1206:	0f b6 00             	movzbl (%eax),%eax
    1209:	3c 25                	cmp    $0x25,%al
    120b:	74 16                	je     1223 <vsprintf+0x3a>
    120d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1210:	8d 50 01             	lea    0x1(%eax),%edx
    1213:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1216:	8b 55 0c             	mov    0xc(%ebp),%edx
    1219:	0f b6 12             	movzbl (%edx),%edx
    121c:	88 10                	mov    %dl,(%eax)
    121e:	e9 23 02 00 00       	jmp    1446 <vsprintf+0x25d>
    1223:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    122a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    122e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1231:	0f b6 00             	movzbl (%eax),%eax
    1234:	3c 25                	cmp    $0x25,%al
    1236:	75 16                	jne    124e <vsprintf+0x65>
    1238:	8b 45 f4             	mov    -0xc(%ebp),%eax
    123b:	8d 50 01             	lea    0x1(%eax),%edx
    123e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1241:	8b 55 0c             	mov    0xc(%ebp),%edx
    1244:	0f b6 12             	movzbl (%edx),%edx
    1247:	88 10                	mov    %dl,(%eax)
    1249:	e9 f8 01 00 00       	jmp    1446 <vsprintf+0x25d>
    124e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1251:	0f b6 00             	movzbl (%eax),%eax
    1254:	3c 30                	cmp    $0x30,%al
    1256:	75 0a                	jne    1262 <vsprintf+0x79>
    1258:	c6 45 eb 30          	movb   $0x30,-0x15(%ebp)
    125c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1260:	eb 28                	jmp    128a <vsprintf+0xa1>
    1262:	c6 45 eb 20          	movb   $0x20,-0x15(%ebp)
    1266:	eb 22                	jmp    128a <vsprintf+0xa1>
    1268:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    126b:	89 d0                	mov    %edx,%eax
    126d:	c1 e0 02             	shl    $0x2,%eax
    1270:	01 d0                	add    %edx,%eax
    1272:	01 c0                	add    %eax,%eax
    1274:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1277:	8b 45 0c             	mov    0xc(%ebp),%eax
    127a:	0f b6 00             	movzbl (%eax),%eax
    127d:	0f be c0             	movsbl %al,%eax
    1280:	83 e8 30             	sub    $0x30,%eax
    1283:	01 45 e4             	add    %eax,-0x1c(%ebp)
    1286:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    128a:	8b 45 0c             	mov    0xc(%ebp),%eax
    128d:	0f b6 00             	movzbl (%eax),%eax
    1290:	3c 2f                	cmp    $0x2f,%al
    1292:	76 0a                	jbe    129e <vsprintf+0xb5>
    1294:	8b 45 0c             	mov    0xc(%ebp),%eax
    1297:	0f b6 00             	movzbl (%eax),%eax
    129a:	3c 39                	cmp    $0x39,%al
    129c:	76 ca                	jbe    1268 <vsprintf+0x7f>
    129e:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    12a4:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    12aa:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    12b0:	83 ec 04             	sub    $0x4,%esp
    12b3:	68 00 04 00 00       	push   $0x400
    12b8:	6a 00                	push   $0x0
    12ba:	50                   	push   %eax
    12bb:	e8 f9 01 00 00       	call   14b9 <memset>
    12c0:	83 c4 10             	add    $0x10,%esp
    12c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c6:	0f b6 00             	movzbl (%eax),%eax
    12c9:	0f be c0             	movsbl %al,%eax
    12cc:	83 f8 64             	cmp    $0x64,%eax
    12cf:	74 67                	je     1338 <vsprintf+0x14f>
    12d1:	83 f8 64             	cmp    $0x64,%eax
    12d4:	7f 0a                	jg     12e0 <vsprintf+0xf7>
    12d6:	83 f8 63             	cmp    $0x63,%eax
    12d9:	74 18                	je     12f3 <vsprintf+0x10a>
    12db:	e9 d6 00 00 00       	jmp    13b6 <vsprintf+0x1cd>
    12e0:	83 f8 73             	cmp    $0x73,%eax
    12e3:	0f 84 8f 00 00 00    	je     1378 <vsprintf+0x18f>
    12e9:	83 f8 78             	cmp    $0x78,%eax
    12ec:	74 25                	je     1313 <vsprintf+0x12a>
    12ee:	e9 c3 00 00 00       	jmp    13b6 <vsprintf+0x1cd>
    12f3:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    12f9:	8d 50 01             	lea    0x1(%eax),%edx
    12fc:	89 95 dc fb ff ff    	mov    %edx,-0x424(%ebp)
    1302:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1305:	0f b6 12             	movzbl (%edx),%edx
    1308:	88 10                	mov    %dl,(%eax)
    130a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    130e:	e9 a3 00 00 00       	jmp    13b6 <vsprintf+0x1cd>
    1313:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1316:	8b 00                	mov    (%eax),%eax
    1318:	89 45 ec             	mov    %eax,-0x14(%ebp)
    131b:	83 ec 04             	sub    $0x4,%esp
    131e:	8d 85 dc fb ff ff    	lea    -0x424(%ebp),%eax
    1324:	50                   	push   %eax
    1325:	6a 10                	push   $0x10
    1327:	ff 75 ec             	pushl  -0x14(%ebp)
    132a:	e8 5c fe ff ff       	call   118b <i2a>
    132f:	83 c4 10             	add    $0x10,%esp
    1332:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1336:	eb 7e                	jmp    13b6 <vsprintf+0x1cd>
    1338:	8b 45 f0             	mov    -0x10(%ebp),%eax
    133b:	8b 00                	mov    (%eax),%eax
    133d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1340:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1344:	79 15                	jns    135b <vsprintf+0x172>
    1346:	f7 5d ec             	negl   -0x14(%ebp)
    1349:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    134f:	8d 50 01             	lea    0x1(%eax),%edx
    1352:	89 95 dc fb ff ff    	mov    %edx,-0x424(%ebp)
    1358:	c6 00 2d             	movb   $0x2d,(%eax)
    135b:	83 ec 04             	sub    $0x4,%esp
    135e:	8d 85 dc fb ff ff    	lea    -0x424(%ebp),%eax
    1364:	50                   	push   %eax
    1365:	6a 0a                	push   $0xa
    1367:	ff 75 ec             	pushl  -0x14(%ebp)
    136a:	e8 1c fe ff ff       	call   118b <i2a>
    136f:	83 c4 10             	add    $0x10,%esp
    1372:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1376:	eb 3e                	jmp    13b6 <vsprintf+0x1cd>
    1378:	8b 45 f0             	mov    -0x10(%ebp),%eax
    137b:	8b 10                	mov    (%eax),%edx
    137d:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    1383:	83 ec 08             	sub    $0x8,%esp
    1386:	52                   	push   %edx
    1387:	50                   	push   %eax
    1388:	e8 4d 01 00 00       	call   14da <strcpy>
    138d:	83 c4 10             	add    $0x10,%esp
    1390:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1393:	8b 00                	mov    (%eax),%eax
    1395:	83 ec 0c             	sub    $0xc,%esp
    1398:	50                   	push   %eax
    1399:	e8 54 01 00 00       	call   14f2 <strlen>
    139e:	83 c4 10             	add    $0x10,%esp
    13a1:	89 c2                	mov    %eax,%edx
    13a3:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    13a9:	01 d0                	add    %edx,%eax
    13ab:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    13b1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    13b5:	90                   	nop
    13b6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    13bd:	eb 13                	jmp    13d2 <vsprintf+0x1e9>
    13bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c2:	8d 50 01             	lea    0x1(%eax),%edx
    13c5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    13c8:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    13cc:	88 10                	mov    %dl,(%eax)
    13ce:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    13d2:	83 ec 0c             	sub    $0xc,%esp
    13d5:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    13db:	50                   	push   %eax
    13dc:	e8 11 01 00 00       	call   14f2 <strlen>
    13e1:	83 c4 10             	add    $0x10,%esp
    13e4:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    13e7:	7d 1b                	jge    1404 <vsprintf+0x21b>
    13e9:	83 ec 0c             	sub    $0xc,%esp
    13ec:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    13f2:	50                   	push   %eax
    13f3:	e8 fa 00 00 00       	call   14f2 <strlen>
    13f8:	83 c4 10             	add    $0x10,%esp
    13fb:	89 c2                	mov    %eax,%edx
    13fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1400:	29 d0                	sub    %edx,%eax
    1402:	eb 05                	jmp    1409 <vsprintf+0x220>
    1404:	b8 00 00 00 00       	mov    $0x0,%eax
    1409:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    140c:	7f b1                	jg     13bf <vsprintf+0x1d6>
    140e:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    1414:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    141a:	eb 1d                	jmp    1439 <vsprintf+0x250>
    141c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141f:	8d 50 01             	lea    0x1(%eax),%edx
    1422:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1425:	8b 95 dc fb ff ff    	mov    -0x424(%ebp),%edx
    142b:	8d 4a 01             	lea    0x1(%edx),%ecx
    142e:	89 8d dc fb ff ff    	mov    %ecx,-0x424(%ebp)
    1434:	0f b6 12             	movzbl (%edx),%edx
    1437:	88 10                	mov    %dl,(%eax)
    1439:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    143f:	0f b6 00             	movzbl (%eax),%eax
    1442:	84 c0                	test   %al,%al
    1444:	75 d6                	jne    141c <vsprintf+0x233>
    1446:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    144a:	8b 45 0c             	mov    0xc(%ebp),%eax
    144d:	0f b6 00             	movzbl (%eax),%eax
    1450:	84 c0                	test   %al,%al
    1452:	0f 85 ab fd ff ff    	jne    1203 <vsprintf+0x1a>
    1458:	8b 45 f4             	mov    -0xc(%ebp),%eax
    145b:	c6 00 00             	movb   $0x0,(%eax)
    145e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1461:	8b 45 08             	mov    0x8(%ebp),%eax
    1464:	29 c2                	sub    %eax,%edx
    1466:	89 d0                	mov    %edx,%eax
    1468:	c9                   	leave  
    1469:	c3                   	ret    

0000146a <sprintf>:
    146a:	55                   	push   %ebp
    146b:	89 e5                	mov    %esp,%ebp
    146d:	83 ec 18             	sub    $0x18,%esp
    1470:	8d 45 0c             	lea    0xc(%ebp),%eax
    1473:	83 c0 04             	add    $0x4,%eax
    1476:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1479:	8b 45 0c             	mov    0xc(%ebp),%eax
    147c:	83 ec 04             	sub    $0x4,%esp
    147f:	ff 75 f4             	pushl  -0xc(%ebp)
    1482:	50                   	push   %eax
    1483:	ff 75 08             	pushl  0x8(%ebp)
    1486:	e8 5e fd ff ff       	call   11e9 <vsprintf>
    148b:	83 c4 10             	add    $0x10,%esp
    148e:	c9                   	leave  
    148f:	c3                   	ret    

00001490 <memcpy>:
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	56                   	push   %esi
    1494:	57                   	push   %edi
    1495:	51                   	push   %ecx
    1496:	8b 7d 08             	mov    0x8(%ebp),%edi
    1499:	8b 75 0c             	mov    0xc(%ebp),%esi
    149c:	8b 4d 10             	mov    0x10(%ebp),%ecx

0000149f <memcpy.1>:
    149f:	83 f9 00             	cmp    $0x0,%ecx
    14a2:	74 0b                	je     14af <memcpy.2>
    14a4:	3e 8a 06             	mov    %ds:(%esi),%al
    14a7:	46                   	inc    %esi
    14a8:	26 88 07             	mov    %al,%es:(%edi)
    14ab:	47                   	inc    %edi
    14ac:	49                   	dec    %ecx
    14ad:	eb f0                	jmp    149f <memcpy.1>

000014af <memcpy.2>:
    14af:	8b 45 08             	mov    0x8(%ebp),%eax
    14b2:	59                   	pop    %ecx
    14b3:	5f                   	pop    %edi
    14b4:	5e                   	pop    %esi
    14b5:	89 ec                	mov    %ebp,%esp
    14b7:	5d                   	pop    %ebp
    14b8:	c3                   	ret    

000014b9 <memset>:
    14b9:	55                   	push   %ebp
    14ba:	89 e5                	mov    %esp,%ebp
    14bc:	56                   	push   %esi
    14bd:	57                   	push   %edi
    14be:	51                   	push   %ecx
    14bf:	8b 7d 08             	mov    0x8(%ebp),%edi
    14c2:	8b 55 0c             	mov    0xc(%ebp),%edx
    14c5:	8b 4d 10             	mov    0x10(%ebp),%ecx

000014c8 <memset.1>:
    14c8:	83 f9 00             	cmp    $0x0,%ecx
    14cb:	74 06                	je     14d3 <memset.2>
    14cd:	88 17                	mov    %dl,(%edi)
    14cf:	47                   	inc    %edi
    14d0:	49                   	dec    %ecx
    14d1:	eb f5                	jmp    14c8 <memset.1>

000014d3 <memset.2>:
    14d3:	59                   	pop    %ecx
    14d4:	5f                   	pop    %edi
    14d5:	5e                   	pop    %esi
    14d6:	89 ec                	mov    %ebp,%esp
    14d8:	5d                   	pop    %ebp
    14d9:	c3                   	ret    

000014da <strcpy>:
    14da:	55                   	push   %ebp
    14db:	89 e5                	mov    %esp,%ebp
    14dd:	8b 75 0c             	mov    0xc(%ebp),%esi
    14e0:	8b 7d 08             	mov    0x8(%ebp),%edi

000014e3 <strcpy.1>:
    14e3:	8a 06                	mov    (%esi),%al
    14e5:	46                   	inc    %esi
    14e6:	88 07                	mov    %al,(%edi)
    14e8:	47                   	inc    %edi
    14e9:	3c 00                	cmp    $0x0,%al
    14eb:	75 f6                	jne    14e3 <strcpy.1>
    14ed:	8b 45 08             	mov    0x8(%ebp),%eax
    14f0:	5d                   	pop    %ebp
    14f1:	c3                   	ret    

000014f2 <strlen>:
    14f2:	55                   	push   %ebp
    14f3:	89 e5                	mov    %esp,%ebp
    14f5:	b8 00 00 00 00       	mov    $0x0,%eax
    14fa:	8b 75 08             	mov    0x8(%ebp),%esi

000014fd <strlen.1>:
    14fd:	80 3e 00             	cmpb   $0x0,(%esi)
    1500:	74 04                	je     1506 <strlen.2>
    1502:	46                   	inc    %esi
    1503:	40                   	inc    %eax
    1504:	eb f7                	jmp    14fd <strlen.1>

00001506 <strlen.2>:
    1506:	5d                   	pop    %ebp
    1507:	c3                   	ret    

00001508 <send_recv>:
    1508:	55                   	push   %ebp
    1509:	89 e5                	mov    %esp,%ebp
    150b:	83 ec 18             	sub    $0x18,%esp
    150e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1515:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    1519:	75 12                	jne    152d <send_recv+0x25>
    151b:	83 ec 04             	sub    $0x4,%esp
    151e:	6a 30                	push   $0x30
    1520:	6a 00                	push   $0x0
    1522:	ff 75 10             	pushl  0x10(%ebp)
    1525:	e8 8f ff ff ff       	call   14b9 <memset>
    152a:	83 c4 10             	add    $0x10,%esp
    152d:	8b 45 08             	mov    0x8(%ebp),%eax
    1530:	83 f8 01             	cmp    $0x1,%eax
    1533:	7c 57                	jl     158c <send_recv+0x84>
    1535:	83 f8 02             	cmp    $0x2,%eax
    1538:	7e 39                	jle    1573 <send_recv+0x6b>
    153a:	83 f8 03             	cmp    $0x3,%eax
    153d:	75 4d                	jne    158c <send_recv+0x84>
    153f:	83 ec 04             	sub    $0x4,%esp
    1542:	ff 75 10             	pushl  0x10(%ebp)
    1545:	ff 75 0c             	pushl  0xc(%ebp)
    1548:	6a 01                	push   $0x1
    154a:	e8 91 02 00 00       	call   17e0 <sendrec>
    154f:	83 c4 10             	add    $0x10,%esp
    1552:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1555:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1559:	75 5e                	jne    15b9 <send_recv+0xb1>
    155b:	83 ec 04             	sub    $0x4,%esp
    155e:	ff 75 10             	pushl  0x10(%ebp)
    1561:	ff 75 0c             	pushl  0xc(%ebp)
    1564:	6a 02                	push   $0x2
    1566:	e8 75 02 00 00       	call   17e0 <sendrec>
    156b:	83 c4 10             	add    $0x10,%esp
    156e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1571:	eb 46                	jmp    15b9 <send_recv+0xb1>
    1573:	83 ec 04             	sub    $0x4,%esp
    1576:	ff 75 10             	pushl  0x10(%ebp)
    1579:	ff 75 0c             	pushl  0xc(%ebp)
    157c:	ff 75 08             	pushl  0x8(%ebp)
    157f:	e8 5c 02 00 00       	call   17e0 <sendrec>
    1584:	83 c4 10             	add    $0x10,%esp
    1587:	89 45 f4             	mov    %eax,-0xc(%ebp)
    158a:	eb 31                	jmp    15bd <send_recv+0xb5>
    158c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    1590:	74 2a                	je     15bc <send_recv+0xb4>
    1592:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1596:	74 24                	je     15bc <send_recv+0xb4>
    1598:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    159c:	74 1e                	je     15bc <send_recv+0xb4>
    159e:	6a 39                	push   $0x39
    15a0:	68 64 18 00 00       	push   $0x1864
    15a5:	68 64 18 00 00       	push   $0x1864
    15aa:	68 70 18 00 00       	push   $0x1870
    15af:	e8 71 01 00 00       	call   1725 <assertion_failure>
    15b4:	83 c4 10             	add    $0x10,%esp
    15b7:	eb 03                	jmp    15bc <send_recv+0xb4>
    15b9:	90                   	nop
    15ba:	eb 01                	jmp    15bd <send_recv+0xb5>
    15bc:	90                   	nop
    15bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c0:	c9                   	leave  
    15c1:	c3                   	ret    

000015c2 <memcmp>:
    15c2:	55                   	push   %ebp
    15c3:	89 e5                	mov    %esp,%ebp
    15c5:	83 ec 10             	sub    $0x10,%esp
    15c8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    15cc:	74 06                	je     15d4 <memcmp+0x12>
    15ce:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15d2:	75 0c                	jne    15e0 <memcmp+0x1e>
    15d4:	8b 55 08             	mov    0x8(%ebp),%edx
    15d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    15da:	29 c2                	sub    %eax,%edx
    15dc:	89 d0                	mov    %edx,%eax
    15de:	eb 56                	jmp    1636 <memcmp+0x74>
    15e0:	8b 45 08             	mov    0x8(%ebp),%eax
    15e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    15e9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    15ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    15f3:	eb 34                	jmp    1629 <memcmp+0x67>
    15f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15f8:	0f b6 10             	movzbl (%eax),%edx
    15fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15fe:	0f b6 00             	movzbl (%eax),%eax
    1601:	38 c2                	cmp    %al,%dl
    1603:	74 18                	je     161d <memcmp+0x5b>
    1605:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1608:	0f b6 00             	movzbl (%eax),%eax
    160b:	0f be d0             	movsbl %al,%edx
    160e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1611:	0f b6 00             	movzbl (%eax),%eax
    1614:	0f be c0             	movsbl %al,%eax
    1617:	29 c2                	sub    %eax,%edx
    1619:	89 d0                	mov    %edx,%eax
    161b:	eb 19                	jmp    1636 <memcmp+0x74>
    161d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1621:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1625:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1629:	8b 45 f4             	mov    -0xc(%ebp),%eax
    162c:	3b 45 10             	cmp    0x10(%ebp),%eax
    162f:	7c c4                	jl     15f5 <memcmp+0x33>
    1631:	b8 00 00 00 00       	mov    $0x0,%eax
    1636:	c9                   	leave  
    1637:	c3                   	ret    

00001638 <strcmp>:
    1638:	55                   	push   %ebp
    1639:	89 e5                	mov    %esp,%ebp
    163b:	83 ec 10             	sub    $0x10,%esp
    163e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1642:	74 06                	je     164a <strcmp+0x12>
    1644:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1648:	75 0c                	jne    1656 <strcmp+0x1e>
    164a:	8b 55 08             	mov    0x8(%ebp),%edx
    164d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1650:	29 c2                	sub    %eax,%edx
    1652:	89 d0                	mov    %edx,%eax
    1654:	eb 53                	jmp    16a9 <strcmp+0x71>
    1656:	8b 45 08             	mov    0x8(%ebp),%eax
    1659:	89 45 fc             	mov    %eax,-0x4(%ebp)
    165c:	8b 45 0c             	mov    0xc(%ebp),%eax
    165f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1662:	eb 18                	jmp    167c <strcmp+0x44>
    1664:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1667:	0f b6 10             	movzbl (%eax),%edx
    166a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166d:	0f b6 00             	movzbl (%eax),%eax
    1670:	38 c2                	cmp    %al,%dl
    1672:	75 1e                	jne    1692 <strcmp+0x5a>
    1674:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1678:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    167c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    167f:	0f b6 00             	movzbl (%eax),%eax
    1682:	84 c0                	test   %al,%al
    1684:	74 0d                	je     1693 <strcmp+0x5b>
    1686:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1689:	0f b6 00             	movzbl (%eax),%eax
    168c:	84 c0                	test   %al,%al
    168e:	75 d4                	jne    1664 <strcmp+0x2c>
    1690:	eb 01                	jmp    1693 <strcmp+0x5b>
    1692:	90                   	nop
    1693:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1696:	0f b6 00             	movzbl (%eax),%eax
    1699:	0f be d0             	movsbl %al,%edx
    169c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    169f:	0f b6 00             	movzbl (%eax),%eax
    16a2:	0f be c0             	movsbl %al,%eax
    16a5:	29 c2                	sub    %eax,%edx
    16a7:	89 d0                	mov    %edx,%eax
    16a9:	c9                   	leave  
    16aa:	c3                   	ret    

000016ab <strcat>:
    16ab:	55                   	push   %ebp
    16ac:	89 e5                	mov    %esp,%ebp
    16ae:	83 ec 10             	sub    $0x10,%esp
    16b1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    16b5:	74 06                	je     16bd <strcat+0x12>
    16b7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    16bb:	75 07                	jne    16c4 <strcat+0x19>
    16bd:	b8 00 00 00 00       	mov    $0x0,%eax
    16c2:	eb 44                	jmp    1708 <strcat+0x5d>
    16c4:	8b 45 08             	mov    0x8(%ebp),%eax
    16c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16ca:	eb 04                	jmp    16d0 <strcat+0x25>
    16cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    16d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d3:	0f b6 00             	movzbl (%eax),%eax
    16d6:	84 c0                	test   %al,%al
    16d8:	75 f2                	jne    16cc <strcat+0x21>
    16da:	8b 45 0c             	mov    0xc(%ebp),%eax
    16dd:	89 45 f8             	mov    %eax,-0x8(%ebp)
    16e0:	eb 13                	jmp    16f5 <strcat+0x4a>
    16e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16e5:	0f b6 10             	movzbl (%eax),%edx
    16e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16eb:	88 10                	mov    %dl,(%eax)
    16ed:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    16f1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    16f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16f8:	0f b6 00             	movzbl (%eax),%eax
    16fb:	84 c0                	test   %al,%al
    16fd:	75 e3                	jne    16e2 <strcat+0x37>
    16ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1702:	c6 00 00             	movb   $0x0,(%eax)
    1705:	8b 45 08             	mov    0x8(%ebp),%eax
    1708:	c9                   	leave  
    1709:	c3                   	ret    

0000170a <spin>:
    170a:	55                   	push   %ebp
    170b:	89 e5                	mov    %esp,%ebp
    170d:	83 ec 08             	sub    $0x8,%esp
    1710:	83 ec 08             	sub    $0x8,%esp
    1713:	ff 75 08             	pushl  0x8(%ebp)
    1716:	68 b2 18 00 00       	push   $0x18b2
    171b:	e8 29 fa ff ff       	call   1149 <printl>
    1720:	83 c4 10             	add    $0x10,%esp
    1723:	eb fe                	jmp    1723 <spin+0x19>

00001725 <assertion_failure>:
    1725:	55                   	push   %ebp
    1726:	89 e5                	mov    %esp,%ebp
    1728:	83 ec 08             	sub    $0x8,%esp
    172b:	83 ec 08             	sub    $0x8,%esp
    172e:	ff 75 14             	pushl  0x14(%ebp)
    1731:	ff 75 10             	pushl  0x10(%ebp)
    1734:	ff 75 0c             	pushl  0xc(%ebp)
    1737:	ff 75 08             	pushl  0x8(%ebp)
    173a:	6a 03                	push   $0x3
    173c:	68 c8 18 00 00       	push   $0x18c8
    1741:	e8 03 fa ff ff       	call   1149 <printl>
    1746:	83 c4 20             	add    $0x20,%esp
    1749:	83 ec 0c             	sub    $0xc,%esp
    174c:	68 fd 18 00 00       	push   $0x18fd
    1751:	e8 b4 ff ff ff       	call   170a <spin>
    1756:	83 c4 10             	add    $0x10,%esp
    1759:	0f 0b                	ud2    
    175b:	90                   	nop
    175c:	c9                   	leave  
    175d:	c3                   	ret    

0000175e <write>:
    175e:	55                   	push   %ebp
    175f:	89 e5                	mov    %esp,%ebp
    1761:	83 ec 38             	sub    $0x38,%esp
    1764:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
    176b:	8b 45 08             	mov    0x8(%ebp),%eax
    176e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1771:	8b 45 0c             	mov    0xc(%ebp),%eax
    1774:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1777:	8b 45 10             	mov    0x10(%ebp),%eax
    177a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    177d:	83 ec 04             	sub    $0x4,%esp
    1780:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1783:	50                   	push   %eax
    1784:	6a 03                	push   $0x3
    1786:	6a 03                	push   $0x3
    1788:	e8 7b fd ff ff       	call   1508 <send_recv>
    178d:	83 c4 10             	add    $0x10,%esp
    1790:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1793:	c9                   	leave  
    1794:	c3                   	ret    

00001795 <exit>:
    1795:	55                   	push   %ebp
    1796:	89 e5                	mov    %esp,%ebp
    1798:	83 ec 38             	sub    $0x38,%esp
    179b:	c7 45 cc 11 00 00 00 	movl   $0x11,-0x34(%ebp)
    17a2:	8b 45 08             	mov    0x8(%ebp),%eax
    17a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    17a8:	83 ec 04             	sub    $0x4,%esp
    17ab:	8d 45 c8             	lea    -0x38(%ebp),%eax
    17ae:	50                   	push   %eax
    17af:	6a 04                	push   $0x4
    17b1:	6a 03                	push   $0x3
    17b3:	e8 50 fd ff ff       	call   1508 <send_recv>
    17b8:	83 c4 10             	add    $0x10,%esp
    17bb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    17be:	83 f8 12             	cmp    $0x12,%eax
    17c1:	74 19                	je     17dc <exit+0x47>
    17c3:	6a 26                	push   $0x26
    17c5:	68 11 19 00 00       	push   $0x1911
    17ca:	68 11 19 00 00       	push   $0x1911
    17cf:	68 1c 19 00 00       	push   $0x191c
    17d4:	e8 4c ff ff ff       	call   1725 <assertion_failure>
    17d9:	83 c4 10             	add    $0x10,%esp
    17dc:	90                   	nop
    17dd:	c9                   	leave  
    17de:	c3                   	ret    
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
