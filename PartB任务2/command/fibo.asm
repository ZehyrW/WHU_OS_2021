
fibo:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 14             	sub    $0x14,%esp
    1011:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    1018:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    101f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    1026:	83 ec 04             	sub    $0x4,%esp
    1029:	ff 75 ec             	pushl  -0x14(%ebp)
    102c:	ff 75 f0             	pushl  -0x10(%ebp)
    102f:	68 d8 17 00 00       	push   $0x17d8
    1034:	e8 75 00 00 00       	call   10ae <printf>
    1039:	83 c4 10             	add    $0x10,%esp
    103c:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    1043:	eb 2e                	jmp    1073 <main+0x73>
    1045:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1048:	8b 45 f0             	mov    -0x10(%ebp),%eax
    104b:	01 d0                	add    %edx,%eax
    104d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1050:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1053:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1056:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1059:	89 45 ec             	mov    %eax,-0x14(%ebp)
    105c:	83 ec 08             	sub    $0x8,%esp
    105f:	ff 75 e8             	pushl  -0x18(%ebp)
    1062:	68 df 17 00 00       	push   $0x17df
    1067:	e8 42 00 00 00       	call   10ae <printf>
    106c:	83 c4 10             	add    $0x10,%esp
    106f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1073:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    1077:	7e cc                	jle    1045 <main+0x45>
    1079:	83 ec 0c             	sub    $0xc,%esp
    107c:	68 e3 17 00 00       	push   $0x17e3
    1081:	e8 28 00 00 00       	call   10ae <printf>
    1086:	83 c4 10             	add    $0x10,%esp
    1089:	b8 00 00 00 00       	mov    $0x0,%eax
    108e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
    1091:	c9                   	leave  
    1092:	8d 61 fc             	lea    -0x4(%ecx),%esp
    1095:	c3                   	ret    
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <_start>:
    10a0:	50                   	push   %eax
    10a1:	51                   	push   %ecx
    10a2:	e8 59 ff ff ff       	call   1000 <main>
    10a7:	50                   	push   %eax
    10a8:	e8 b8 06 00 00       	call   1765 <exit>
    10ad:	f4                   	hlt    

000010ae <printf>:
    10ae:	55                   	push   %ebp
    10af:	89 e5                	mov    %esp,%ebp
    10b1:	81 ec 18 04 00 00    	sub    $0x418,%esp
    10b7:	8d 45 0c             	lea    0xc(%ebp),%eax
    10ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10bd:	8b 45 08             	mov    0x8(%ebp),%eax
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	ff 75 f4             	pushl  -0xc(%ebp)
    10c6:	50                   	push   %eax
    10c7:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    10cd:	50                   	push   %eax
    10ce:	e8 e6 00 00 00       	call   11b9 <vsprintf>
    10d3:	83 c4 10             	add    $0x10,%esp
    10d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    10d9:	83 ec 04             	sub    $0x4,%esp
    10dc:	ff 75 f0             	pushl  -0x10(%ebp)
    10df:	8d 85 ec fb ff ff    	lea    -0x414(%ebp),%eax
    10e5:	50                   	push   %eax
    10e6:	6a 01                	push   $0x1
    10e8:	e8 41 06 00 00       	call   172e <write>
    10ed:	83 c4 10             	add    $0x10,%esp
    10f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    10f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10f6:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    10f9:	74 19                	je     1114 <printf+0x66>
    10fb:	6a 50                	push   $0x50
    10fd:	68 e5 17 00 00       	push   $0x17e5
    1102:	68 e5 17 00 00       	push   $0x17e5
    1107:	68 f2 17 00 00       	push   $0x17f2
    110c:	e8 e4 05 00 00       	call   16f5 <assertion_failure>
    1111:	83 c4 10             	add    $0x10,%esp
    1114:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1117:	c9                   	leave  
    1118:	c3                   	ret    

00001119 <printl>:
    1119:	55                   	push   %ebp
    111a:	89 e5                	mov    %esp,%ebp
    111c:	81 ec 18 04 00 00    	sub    $0x418,%esp
    1122:	8d 45 0c             	lea    0xc(%ebp),%eax
    1125:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1128:	8b 45 08             	mov    0x8(%ebp),%eax
    112b:	83 ec 04             	sub    $0x4,%esp
    112e:	ff 75 f4             	pushl  -0xc(%ebp)
    1131:	50                   	push   %eax
    1132:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    1138:	50                   	push   %eax
    1139:	e8 7b 00 00 00       	call   11b9 <vsprintf>
    113e:	83 c4 10             	add    $0x10,%esp
    1141:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1144:	83 ec 0c             	sub    $0xc,%esp
    1147:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
    114d:	50                   	push   %eax
    114e:	e8 77 06 00 00       	call   17ca <printx>
    1153:	83 c4 10             	add    $0x10,%esp
    1156:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1159:	c9                   	leave  
    115a:	c3                   	ret    

0000115b <i2a>:
    115b:	55                   	push   %ebp
    115c:	89 e5                	mov    %esp,%ebp
    115e:	83 ec 18             	sub    $0x18,%esp
    1161:	8b 45 08             	mov    0x8(%ebp),%eax
    1164:	99                   	cltd   
    1165:	f7 7d 0c             	idivl  0xc(%ebp)
    1168:	89 55 f4             	mov    %edx,-0xc(%ebp)
    116b:	8b 45 08             	mov    0x8(%ebp),%eax
    116e:	99                   	cltd   
    116f:	f7 7d 0c             	idivl  0xc(%ebp)
    1172:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1175:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1179:	74 14                	je     118f <i2a+0x34>
    117b:	83 ec 04             	sub    $0x4,%esp
    117e:	ff 75 10             	pushl  0x10(%ebp)
    1181:	ff 75 0c             	pushl  0xc(%ebp)
    1184:	ff 75 f0             	pushl  -0x10(%ebp)
    1187:	e8 cf ff ff ff       	call   115b <i2a>
    118c:	83 c4 10             	add    $0x10,%esp
    118f:	8b 45 10             	mov    0x10(%ebp),%eax
    1192:	8b 00                	mov    (%eax),%eax
    1194:	8d 48 01             	lea    0x1(%eax),%ecx
    1197:	8b 55 10             	mov    0x10(%ebp),%edx
    119a:	89 0a                	mov    %ecx,(%edx)
    119c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11a0:	7f 08                	jg     11aa <i2a+0x4f>
    11a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11a5:	83 c2 30             	add    $0x30,%edx
    11a8:	eb 06                	jmp    11b0 <i2a+0x55>
    11aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11ad:	83 c2 37             	add    $0x37,%edx
    11b0:	88 10                	mov    %dl,(%eax)
    11b2:	8b 45 10             	mov    0x10(%ebp),%eax
    11b5:	8b 00                	mov    (%eax),%eax
    11b7:	c9                   	leave  
    11b8:	c3                   	ret    

000011b9 <vsprintf>:
    11b9:	55                   	push   %ebp
    11ba:	89 e5                	mov    %esp,%ebp
    11bc:	81 ec 28 04 00 00    	sub    $0x428,%esp
    11c2:	8b 45 10             	mov    0x10(%ebp),%eax
    11c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    11c8:	8b 45 08             	mov    0x8(%ebp),%eax
    11cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    11ce:	e9 47 02 00 00       	jmp    141a <vsprintf+0x261>
    11d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d6:	0f b6 00             	movzbl (%eax),%eax
    11d9:	3c 25                	cmp    $0x25,%al
    11db:	74 16                	je     11f3 <vsprintf+0x3a>
    11dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e0:	8d 50 01             	lea    0x1(%eax),%edx
    11e3:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11e6:	8b 55 0c             	mov    0xc(%ebp),%edx
    11e9:	0f b6 12             	movzbl (%edx),%edx
    11ec:	88 10                	mov    %dl,(%eax)
    11ee:	e9 23 02 00 00       	jmp    1416 <vsprintf+0x25d>
    11f3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    11fa:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    11fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    1201:	0f b6 00             	movzbl (%eax),%eax
    1204:	3c 25                	cmp    $0x25,%al
    1206:	75 16                	jne    121e <vsprintf+0x65>
    1208:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120b:	8d 50 01             	lea    0x1(%eax),%edx
    120e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1211:	8b 55 0c             	mov    0xc(%ebp),%edx
    1214:	0f b6 12             	movzbl (%edx),%edx
    1217:	88 10                	mov    %dl,(%eax)
    1219:	e9 f8 01 00 00       	jmp    1416 <vsprintf+0x25d>
    121e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1221:	0f b6 00             	movzbl (%eax),%eax
    1224:	3c 30                	cmp    $0x30,%al
    1226:	75 0a                	jne    1232 <vsprintf+0x79>
    1228:	c6 45 eb 30          	movb   $0x30,-0x15(%ebp)
    122c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1230:	eb 28                	jmp    125a <vsprintf+0xa1>
    1232:	c6 45 eb 20          	movb   $0x20,-0x15(%ebp)
    1236:	eb 22                	jmp    125a <vsprintf+0xa1>
    1238:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    123b:	89 d0                	mov    %edx,%eax
    123d:	c1 e0 02             	shl    $0x2,%eax
    1240:	01 d0                	add    %edx,%eax
    1242:	01 c0                	add    %eax,%eax
    1244:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1247:	8b 45 0c             	mov    0xc(%ebp),%eax
    124a:	0f b6 00             	movzbl (%eax),%eax
    124d:	0f be c0             	movsbl %al,%eax
    1250:	83 e8 30             	sub    $0x30,%eax
    1253:	01 45 e4             	add    %eax,-0x1c(%ebp)
    1256:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    125a:	8b 45 0c             	mov    0xc(%ebp),%eax
    125d:	0f b6 00             	movzbl (%eax),%eax
    1260:	3c 2f                	cmp    $0x2f,%al
    1262:	76 0a                	jbe    126e <vsprintf+0xb5>
    1264:	8b 45 0c             	mov    0xc(%ebp),%eax
    1267:	0f b6 00             	movzbl (%eax),%eax
    126a:	3c 39                	cmp    $0x39,%al
    126c:	76 ca                	jbe    1238 <vsprintf+0x7f>
    126e:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    1274:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    127a:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    1280:	83 ec 04             	sub    $0x4,%esp
    1283:	68 00 04 00 00       	push   $0x400
    1288:	6a 00                	push   $0x0
    128a:	50                   	push   %eax
    128b:	e8 f9 01 00 00       	call   1489 <memset>
    1290:	83 c4 10             	add    $0x10,%esp
    1293:	8b 45 0c             	mov    0xc(%ebp),%eax
    1296:	0f b6 00             	movzbl (%eax),%eax
    1299:	0f be c0             	movsbl %al,%eax
    129c:	83 f8 64             	cmp    $0x64,%eax
    129f:	74 67                	je     1308 <vsprintf+0x14f>
    12a1:	83 f8 64             	cmp    $0x64,%eax
    12a4:	7f 0a                	jg     12b0 <vsprintf+0xf7>
    12a6:	83 f8 63             	cmp    $0x63,%eax
    12a9:	74 18                	je     12c3 <vsprintf+0x10a>
    12ab:	e9 d6 00 00 00       	jmp    1386 <vsprintf+0x1cd>
    12b0:	83 f8 73             	cmp    $0x73,%eax
    12b3:	0f 84 8f 00 00 00    	je     1348 <vsprintf+0x18f>
    12b9:	83 f8 78             	cmp    $0x78,%eax
    12bc:	74 25                	je     12e3 <vsprintf+0x12a>
    12be:	e9 c3 00 00 00       	jmp    1386 <vsprintf+0x1cd>
    12c3:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    12c9:	8d 50 01             	lea    0x1(%eax),%edx
    12cc:	89 95 dc fb ff ff    	mov    %edx,-0x424(%ebp)
    12d2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    12d5:	0f b6 12             	movzbl (%edx),%edx
    12d8:	88 10                	mov    %dl,(%eax)
    12da:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    12de:	e9 a3 00 00 00       	jmp    1386 <vsprintf+0x1cd>
    12e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12e6:	8b 00                	mov    (%eax),%eax
    12e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    12eb:	83 ec 04             	sub    $0x4,%esp
    12ee:	8d 85 dc fb ff ff    	lea    -0x424(%ebp),%eax
    12f4:	50                   	push   %eax
    12f5:	6a 10                	push   $0x10
    12f7:	ff 75 ec             	pushl  -0x14(%ebp)
    12fa:	e8 5c fe ff ff       	call   115b <i2a>
    12ff:	83 c4 10             	add    $0x10,%esp
    1302:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1306:	eb 7e                	jmp    1386 <vsprintf+0x1cd>
    1308:	8b 45 f0             	mov    -0x10(%ebp),%eax
    130b:	8b 00                	mov    (%eax),%eax
    130d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1310:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1314:	79 15                	jns    132b <vsprintf+0x172>
    1316:	f7 5d ec             	negl   -0x14(%ebp)
    1319:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    131f:	8d 50 01             	lea    0x1(%eax),%edx
    1322:	89 95 dc fb ff ff    	mov    %edx,-0x424(%ebp)
    1328:	c6 00 2d             	movb   $0x2d,(%eax)
    132b:	83 ec 04             	sub    $0x4,%esp
    132e:	8d 85 dc fb ff ff    	lea    -0x424(%ebp),%eax
    1334:	50                   	push   %eax
    1335:	6a 0a                	push   $0xa
    1337:	ff 75 ec             	pushl  -0x14(%ebp)
    133a:	e8 1c fe ff ff       	call   115b <i2a>
    133f:	83 c4 10             	add    $0x10,%esp
    1342:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1346:	eb 3e                	jmp    1386 <vsprintf+0x1cd>
    1348:	8b 45 f0             	mov    -0x10(%ebp),%eax
    134b:	8b 10                	mov    (%eax),%edx
    134d:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    1353:	83 ec 08             	sub    $0x8,%esp
    1356:	52                   	push   %edx
    1357:	50                   	push   %eax
    1358:	e8 4d 01 00 00       	call   14aa <strcpy>
    135d:	83 c4 10             	add    $0x10,%esp
    1360:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1363:	8b 00                	mov    (%eax),%eax
    1365:	83 ec 0c             	sub    $0xc,%esp
    1368:	50                   	push   %eax
    1369:	e8 54 01 00 00       	call   14c2 <strlen>
    136e:	83 c4 10             	add    $0x10,%esp
    1371:	89 c2                	mov    %eax,%edx
    1373:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    1379:	01 d0                	add    %edx,%eax
    137b:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    1381:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    1385:	90                   	nop
    1386:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    138d:	eb 13                	jmp    13a2 <vsprintf+0x1e9>
    138f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1392:	8d 50 01             	lea    0x1(%eax),%edx
    1395:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1398:	0f b6 55 eb          	movzbl -0x15(%ebp),%edx
    139c:	88 10                	mov    %dl,(%eax)
    139e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    13a2:	83 ec 0c             	sub    $0xc,%esp
    13a5:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    13ab:	50                   	push   %eax
    13ac:	e8 11 01 00 00       	call   14c2 <strlen>
    13b1:	83 c4 10             	add    $0x10,%esp
    13b4:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    13b7:	7d 1b                	jge    13d4 <vsprintf+0x21b>
    13b9:	83 ec 0c             	sub    $0xc,%esp
    13bc:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    13c2:	50                   	push   %eax
    13c3:	e8 fa 00 00 00       	call   14c2 <strlen>
    13c8:	83 c4 10             	add    $0x10,%esp
    13cb:	89 c2                	mov    %eax,%edx
    13cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13d0:	29 d0                	sub    %edx,%eax
    13d2:	eb 05                	jmp    13d9 <vsprintf+0x220>
    13d4:	b8 00 00 00 00       	mov    $0x0,%eax
    13d9:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    13dc:	7f b1                	jg     138f <vsprintf+0x1d6>
    13de:	8d 85 e0 fb ff ff    	lea    -0x420(%ebp),%eax
    13e4:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
    13ea:	eb 1d                	jmp    1409 <vsprintf+0x250>
    13ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ef:	8d 50 01             	lea    0x1(%eax),%edx
    13f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
    13f5:	8b 95 dc fb ff ff    	mov    -0x424(%ebp),%edx
    13fb:	8d 4a 01             	lea    0x1(%edx),%ecx
    13fe:	89 8d dc fb ff ff    	mov    %ecx,-0x424(%ebp)
    1404:	0f b6 12             	movzbl (%edx),%edx
    1407:	88 10                	mov    %dl,(%eax)
    1409:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
    140f:	0f b6 00             	movzbl (%eax),%eax
    1412:	84 c0                	test   %al,%al
    1414:	75 d6                	jne    13ec <vsprintf+0x233>
    1416:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    141a:	8b 45 0c             	mov    0xc(%ebp),%eax
    141d:	0f b6 00             	movzbl (%eax),%eax
    1420:	84 c0                	test   %al,%al
    1422:	0f 85 ab fd ff ff    	jne    11d3 <vsprintf+0x1a>
    1428:	8b 45 f4             	mov    -0xc(%ebp),%eax
    142b:	c6 00 00             	movb   $0x0,(%eax)
    142e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1431:	8b 45 08             	mov    0x8(%ebp),%eax
    1434:	29 c2                	sub    %eax,%edx
    1436:	89 d0                	mov    %edx,%eax
    1438:	c9                   	leave  
    1439:	c3                   	ret    

0000143a <sprintf>:
    143a:	55                   	push   %ebp
    143b:	89 e5                	mov    %esp,%ebp
    143d:	83 ec 18             	sub    $0x18,%esp
    1440:	8d 45 0c             	lea    0xc(%ebp),%eax
    1443:	83 c0 04             	add    $0x4,%eax
    1446:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1449:	8b 45 0c             	mov    0xc(%ebp),%eax
    144c:	83 ec 04             	sub    $0x4,%esp
    144f:	ff 75 f4             	pushl  -0xc(%ebp)
    1452:	50                   	push   %eax
    1453:	ff 75 08             	pushl  0x8(%ebp)
    1456:	e8 5e fd ff ff       	call   11b9 <vsprintf>
    145b:	83 c4 10             	add    $0x10,%esp
    145e:	c9                   	leave  
    145f:	c3                   	ret    

00001460 <memcpy>:
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	56                   	push   %esi
    1464:	57                   	push   %edi
    1465:	51                   	push   %ecx
    1466:	8b 7d 08             	mov    0x8(%ebp),%edi
    1469:	8b 75 0c             	mov    0xc(%ebp),%esi
    146c:	8b 4d 10             	mov    0x10(%ebp),%ecx

0000146f <memcpy.1>:
    146f:	83 f9 00             	cmp    $0x0,%ecx
    1472:	74 0b                	je     147f <memcpy.2>
    1474:	3e 8a 06             	mov    %ds:(%esi),%al
    1477:	46                   	inc    %esi
    1478:	26 88 07             	mov    %al,%es:(%edi)
    147b:	47                   	inc    %edi
    147c:	49                   	dec    %ecx
    147d:	eb f0                	jmp    146f <memcpy.1>

0000147f <memcpy.2>:
    147f:	8b 45 08             	mov    0x8(%ebp),%eax
    1482:	59                   	pop    %ecx
    1483:	5f                   	pop    %edi
    1484:	5e                   	pop    %esi
    1485:	89 ec                	mov    %ebp,%esp
    1487:	5d                   	pop    %ebp
    1488:	c3                   	ret    

00001489 <memset>:
    1489:	55                   	push   %ebp
    148a:	89 e5                	mov    %esp,%ebp
    148c:	56                   	push   %esi
    148d:	57                   	push   %edi
    148e:	51                   	push   %ecx
    148f:	8b 7d 08             	mov    0x8(%ebp),%edi
    1492:	8b 55 0c             	mov    0xc(%ebp),%edx
    1495:	8b 4d 10             	mov    0x10(%ebp),%ecx

00001498 <memset.1>:
    1498:	83 f9 00             	cmp    $0x0,%ecx
    149b:	74 06                	je     14a3 <memset.2>
    149d:	88 17                	mov    %dl,(%edi)
    149f:	47                   	inc    %edi
    14a0:	49                   	dec    %ecx
    14a1:	eb f5                	jmp    1498 <memset.1>

000014a3 <memset.2>:
    14a3:	59                   	pop    %ecx
    14a4:	5f                   	pop    %edi
    14a5:	5e                   	pop    %esi
    14a6:	89 ec                	mov    %ebp,%esp
    14a8:	5d                   	pop    %ebp
    14a9:	c3                   	ret    

000014aa <strcpy>:
    14aa:	55                   	push   %ebp
    14ab:	89 e5                	mov    %esp,%ebp
    14ad:	8b 75 0c             	mov    0xc(%ebp),%esi
    14b0:	8b 7d 08             	mov    0x8(%ebp),%edi

000014b3 <strcpy.1>:
    14b3:	8a 06                	mov    (%esi),%al
    14b5:	46                   	inc    %esi
    14b6:	88 07                	mov    %al,(%edi)
    14b8:	47                   	inc    %edi
    14b9:	3c 00                	cmp    $0x0,%al
    14bb:	75 f6                	jne    14b3 <strcpy.1>
    14bd:	8b 45 08             	mov    0x8(%ebp),%eax
    14c0:	5d                   	pop    %ebp
    14c1:	c3                   	ret    

000014c2 <strlen>:
    14c2:	55                   	push   %ebp
    14c3:	89 e5                	mov    %esp,%ebp
    14c5:	b8 00 00 00 00       	mov    $0x0,%eax
    14ca:	8b 75 08             	mov    0x8(%ebp),%esi

000014cd <strlen.1>:
    14cd:	80 3e 00             	cmpb   $0x0,(%esi)
    14d0:	74 04                	je     14d6 <strlen.2>
    14d2:	46                   	inc    %esi
    14d3:	40                   	inc    %eax
    14d4:	eb f7                	jmp    14cd <strlen.1>

000014d6 <strlen.2>:
    14d6:	5d                   	pop    %ebp
    14d7:	c3                   	ret    

000014d8 <send_recv>:
    14d8:	55                   	push   %ebp
    14d9:	89 e5                	mov    %esp,%ebp
    14db:	83 ec 18             	sub    $0x18,%esp
    14de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    14e5:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    14e9:	75 12                	jne    14fd <send_recv+0x25>
    14eb:	83 ec 04             	sub    $0x4,%esp
    14ee:	6a 30                	push   $0x30
    14f0:	6a 00                	push   $0x0
    14f2:	ff 75 10             	pushl  0x10(%ebp)
    14f5:	e8 8f ff ff ff       	call   1489 <memset>
    14fa:	83 c4 10             	add    $0x10,%esp
    14fd:	8b 45 08             	mov    0x8(%ebp),%eax
    1500:	83 f8 01             	cmp    $0x1,%eax
    1503:	7c 57                	jl     155c <send_recv+0x84>
    1505:	83 f8 02             	cmp    $0x2,%eax
    1508:	7e 39                	jle    1543 <send_recv+0x6b>
    150a:	83 f8 03             	cmp    $0x3,%eax
    150d:	75 4d                	jne    155c <send_recv+0x84>
    150f:	83 ec 04             	sub    $0x4,%esp
    1512:	ff 75 10             	pushl  0x10(%ebp)
    1515:	ff 75 0c             	pushl  0xc(%ebp)
    1518:	6a 01                	push   $0x1
    151a:	e8 91 02 00 00       	call   17b0 <sendrec>
    151f:	83 c4 10             	add    $0x10,%esp
    1522:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1525:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1529:	75 5e                	jne    1589 <send_recv+0xb1>
    152b:	83 ec 04             	sub    $0x4,%esp
    152e:	ff 75 10             	pushl  0x10(%ebp)
    1531:	ff 75 0c             	pushl  0xc(%ebp)
    1534:	6a 02                	push   $0x2
    1536:	e8 75 02 00 00       	call   17b0 <sendrec>
    153b:	83 c4 10             	add    $0x10,%esp
    153e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1541:	eb 46                	jmp    1589 <send_recv+0xb1>
    1543:	83 ec 04             	sub    $0x4,%esp
    1546:	ff 75 10             	pushl  0x10(%ebp)
    1549:	ff 75 0c             	pushl  0xc(%ebp)
    154c:	ff 75 08             	pushl  0x8(%ebp)
    154f:	e8 5c 02 00 00       	call   17b0 <sendrec>
    1554:	83 c4 10             	add    $0x10,%esp
    1557:	89 45 f4             	mov    %eax,-0xc(%ebp)
    155a:	eb 31                	jmp    158d <send_recv+0xb5>
    155c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    1560:	74 2a                	je     158c <send_recv+0xb4>
    1562:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1566:	74 24                	je     158c <send_recv+0xb4>
    1568:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    156c:	74 1e                	je     158c <send_recv+0xb4>
    156e:	6a 39                	push   $0x39
    1570:	68 fc 17 00 00       	push   $0x17fc
    1575:	68 fc 17 00 00       	push   $0x17fc
    157a:	68 08 18 00 00       	push   $0x1808
    157f:	e8 71 01 00 00       	call   16f5 <assertion_failure>
    1584:	83 c4 10             	add    $0x10,%esp
    1587:	eb 03                	jmp    158c <send_recv+0xb4>
    1589:	90                   	nop
    158a:	eb 01                	jmp    158d <send_recv+0xb5>
    158c:	90                   	nop
    158d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1590:	c9                   	leave  
    1591:	c3                   	ret    

00001592 <memcmp>:
    1592:	55                   	push   %ebp
    1593:	89 e5                	mov    %esp,%ebp
    1595:	83 ec 10             	sub    $0x10,%esp
    1598:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    159c:	74 06                	je     15a4 <memcmp+0x12>
    159e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15a2:	75 0c                	jne    15b0 <memcmp+0x1e>
    15a4:	8b 55 08             	mov    0x8(%ebp),%edx
    15a7:	8b 45 0c             	mov    0xc(%ebp),%eax
    15aa:	29 c2                	sub    %eax,%edx
    15ac:	89 d0                	mov    %edx,%eax
    15ae:	eb 56                	jmp    1606 <memcmp+0x74>
    15b0:	8b 45 08             	mov    0x8(%ebp),%eax
    15b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    15b9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    15bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    15c3:	eb 34                	jmp    15f9 <memcmp+0x67>
    15c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15c8:	0f b6 10             	movzbl (%eax),%edx
    15cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15ce:	0f b6 00             	movzbl (%eax),%eax
    15d1:	38 c2                	cmp    %al,%dl
    15d3:	74 18                	je     15ed <memcmp+0x5b>
    15d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15d8:	0f b6 00             	movzbl (%eax),%eax
    15db:	0f be d0             	movsbl %al,%edx
    15de:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15e1:	0f b6 00             	movzbl (%eax),%eax
    15e4:	0f be c0             	movsbl %al,%eax
    15e7:	29 c2                	sub    %eax,%edx
    15e9:	89 d0                	mov    %edx,%eax
    15eb:	eb 19                	jmp    1606 <memcmp+0x74>
    15ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    15f1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    15f5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    15f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15fc:	3b 45 10             	cmp    0x10(%ebp),%eax
    15ff:	7c c4                	jl     15c5 <memcmp+0x33>
    1601:	b8 00 00 00 00       	mov    $0x0,%eax
    1606:	c9                   	leave  
    1607:	c3                   	ret    

00001608 <strcmp>:
    1608:	55                   	push   %ebp
    1609:	89 e5                	mov    %esp,%ebp
    160b:	83 ec 10             	sub    $0x10,%esp
    160e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1612:	74 06                	je     161a <strcmp+0x12>
    1614:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1618:	75 0c                	jne    1626 <strcmp+0x1e>
    161a:	8b 55 08             	mov    0x8(%ebp),%edx
    161d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1620:	29 c2                	sub    %eax,%edx
    1622:	89 d0                	mov    %edx,%eax
    1624:	eb 53                	jmp    1679 <strcmp+0x71>
    1626:	8b 45 08             	mov    0x8(%ebp),%eax
    1629:	89 45 fc             	mov    %eax,-0x4(%ebp)
    162c:	8b 45 0c             	mov    0xc(%ebp),%eax
    162f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1632:	eb 18                	jmp    164c <strcmp+0x44>
    1634:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1637:	0f b6 10             	movzbl (%eax),%edx
    163a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    163d:	0f b6 00             	movzbl (%eax),%eax
    1640:	38 c2                	cmp    %al,%dl
    1642:	75 1e                	jne    1662 <strcmp+0x5a>
    1644:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1648:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    164c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    164f:	0f b6 00             	movzbl (%eax),%eax
    1652:	84 c0                	test   %al,%al
    1654:	74 0d                	je     1663 <strcmp+0x5b>
    1656:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1659:	0f b6 00             	movzbl (%eax),%eax
    165c:	84 c0                	test   %al,%al
    165e:	75 d4                	jne    1634 <strcmp+0x2c>
    1660:	eb 01                	jmp    1663 <strcmp+0x5b>
    1662:	90                   	nop
    1663:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1666:	0f b6 00             	movzbl (%eax),%eax
    1669:	0f be d0             	movsbl %al,%edx
    166c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166f:	0f b6 00             	movzbl (%eax),%eax
    1672:	0f be c0             	movsbl %al,%eax
    1675:	29 c2                	sub    %eax,%edx
    1677:	89 d0                	mov    %edx,%eax
    1679:	c9                   	leave  
    167a:	c3                   	ret    

0000167b <strcat>:
    167b:	55                   	push   %ebp
    167c:	89 e5                	mov    %esp,%ebp
    167e:	83 ec 10             	sub    $0x10,%esp
    1681:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1685:	74 06                	je     168d <strcat+0x12>
    1687:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    168b:	75 07                	jne    1694 <strcat+0x19>
    168d:	b8 00 00 00 00       	mov    $0x0,%eax
    1692:	eb 44                	jmp    16d8 <strcat+0x5d>
    1694:	8b 45 08             	mov    0x8(%ebp),%eax
    1697:	89 45 fc             	mov    %eax,-0x4(%ebp)
    169a:	eb 04                	jmp    16a0 <strcat+0x25>
    169c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    16a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a3:	0f b6 00             	movzbl (%eax),%eax
    16a6:	84 c0                	test   %al,%al
    16a8:	75 f2                	jne    169c <strcat+0x21>
    16aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ad:	89 45 f8             	mov    %eax,-0x8(%ebp)
    16b0:	eb 13                	jmp    16c5 <strcat+0x4a>
    16b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b5:	0f b6 10             	movzbl (%eax),%edx
    16b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16bb:	88 10                	mov    %dl,(%eax)
    16bd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    16c1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    16c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c8:	0f b6 00             	movzbl (%eax),%eax
    16cb:	84 c0                	test   %al,%al
    16cd:	75 e3                	jne    16b2 <strcat+0x37>
    16cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d2:	c6 00 00             	movb   $0x0,(%eax)
    16d5:	8b 45 08             	mov    0x8(%ebp),%eax
    16d8:	c9                   	leave  
    16d9:	c3                   	ret    

000016da <spin>:
    16da:	55                   	push   %ebp
    16db:	89 e5                	mov    %esp,%ebp
    16dd:	83 ec 08             	sub    $0x8,%esp
    16e0:	83 ec 08             	sub    $0x8,%esp
    16e3:	ff 75 08             	pushl  0x8(%ebp)
    16e6:	68 4a 18 00 00       	push   $0x184a
    16eb:	e8 29 fa ff ff       	call   1119 <printl>
    16f0:	83 c4 10             	add    $0x10,%esp
    16f3:	eb fe                	jmp    16f3 <spin+0x19>

000016f5 <assertion_failure>:
    16f5:	55                   	push   %ebp
    16f6:	89 e5                	mov    %esp,%ebp
    16f8:	83 ec 08             	sub    $0x8,%esp
    16fb:	83 ec 08             	sub    $0x8,%esp
    16fe:	ff 75 14             	pushl  0x14(%ebp)
    1701:	ff 75 10             	pushl  0x10(%ebp)
    1704:	ff 75 0c             	pushl  0xc(%ebp)
    1707:	ff 75 08             	pushl  0x8(%ebp)
    170a:	6a 03                	push   $0x3
    170c:	68 60 18 00 00       	push   $0x1860
    1711:	e8 03 fa ff ff       	call   1119 <printl>
    1716:	83 c4 20             	add    $0x20,%esp
    1719:	83 ec 0c             	sub    $0xc,%esp
    171c:	68 95 18 00 00       	push   $0x1895
    1721:	e8 b4 ff ff ff       	call   16da <spin>
    1726:	83 c4 10             	add    $0x10,%esp
    1729:	0f 0b                	ud2    
    172b:	90                   	nop
    172c:	c9                   	leave  
    172d:	c3                   	ret    

0000172e <write>:
    172e:	55                   	push   %ebp
    172f:	89 e5                	mov    %esp,%ebp
    1731:	83 ec 38             	sub    $0x38,%esp
    1734:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
    173b:	8b 45 08             	mov    0x8(%ebp),%eax
    173e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1741:	8b 45 0c             	mov    0xc(%ebp),%eax
    1744:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1747:	8b 45 10             	mov    0x10(%ebp),%eax
    174a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    174d:	83 ec 04             	sub    $0x4,%esp
    1750:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1753:	50                   	push   %eax
    1754:	6a 03                	push   $0x3
    1756:	6a 03                	push   $0x3
    1758:	e8 7b fd ff ff       	call   14d8 <send_recv>
    175d:	83 c4 10             	add    $0x10,%esp
    1760:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1763:	c9                   	leave  
    1764:	c3                   	ret    

00001765 <exit>:
    1765:	55                   	push   %ebp
    1766:	89 e5                	mov    %esp,%ebp
    1768:	83 ec 38             	sub    $0x38,%esp
    176b:	c7 45 cc 11 00 00 00 	movl   $0x11,-0x34(%ebp)
    1772:	8b 45 08             	mov    0x8(%ebp),%eax
    1775:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1778:	83 ec 04             	sub    $0x4,%esp
    177b:	8d 45 c8             	lea    -0x38(%ebp),%eax
    177e:	50                   	push   %eax
    177f:	6a 04                	push   $0x4
    1781:	6a 03                	push   $0x3
    1783:	e8 50 fd ff ff       	call   14d8 <send_recv>
    1788:	83 c4 10             	add    $0x10,%esp
    178b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    178e:	83 f8 12             	cmp    $0x12,%eax
    1791:	74 19                	je     17ac <exit+0x47>
    1793:	6a 26                	push   $0x26
    1795:	68 a9 18 00 00       	push   $0x18a9
    179a:	68 a9 18 00 00       	push   $0x18a9
    179f:	68 b4 18 00 00       	push   $0x18b4
    17a4:	e8 4c ff ff ff       	call   16f5 <assertion_failure>
    17a9:	83 c4 10             	add    $0x10,%esp
    17ac:	90                   	nop
    17ad:	c9                   	leave  
    17ae:	c3                   	ret    
    17af:	90                   	nop

000017b0 <sendrec>:
    17b0:	53                   	push   %ebx
    17b1:	51                   	push   %ecx
    17b2:	52                   	push   %edx
    17b3:	b8 01 00 00 00       	mov    $0x1,%eax
    17b8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    17bc:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    17c0:	8b 54 24 18          	mov    0x18(%esp),%edx
    17c4:	cd 90                	int    $0x90
    17c6:	5a                   	pop    %edx
    17c7:	59                   	pop    %ecx
    17c8:	5b                   	pop    %ebx
    17c9:	c3                   	ret    

000017ca <printx>:
    17ca:	52                   	push   %edx
    17cb:	b8 00 00 00 00       	mov    $0x0,%eax
    17d0:	8b 54 24 08          	mov    0x8(%esp),%edx
    17d4:	cd 90                	int    $0x90
    17d6:	5a                   	pop    %edx
    17d7:	c3                   	ret    
