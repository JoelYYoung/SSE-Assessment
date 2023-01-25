; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType = type { i8* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay, i8** %data, align 8, !dbg !37
  %0 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !41
  store i8* %1, i8** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !46
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !46
  store i8* %2, i8** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !49
  %4 = load i8*, i8** %data1, align 8, !dbg !50
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !51
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !53
  %add = add i64 %call, 1, !dbg !54
  %mul = mul i64 %add, 1, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 %arraydecay2, i64 %mul, i1 false), !dbg !51
  %5 = load i8*, i8** %data1, align 8, !dbg !56
  call void @printLine(i8* %5), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType* %myUnion, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !91
  %0 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !95
  store i8* %1, i8** %unionFirst, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType* %myUnion to i8**, !dbg !100
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !100
  store i8* %2, i8** %data1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !103
  %4 = load i8*, i8** %data1, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !106
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !107
  %add = add i64 %call, 1, !dbg !108
  %mul = mul i64 %add, 1, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 %arraydecay2, i64 %mul, i1 false), !dbg !105
  %5 = load i8*, i8** %data1, align 8, !dbg !110
  call void @printLine(i8* %5), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 36, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_unionType", file: !12, line: 30, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 26, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 28, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 29, baseType: !16, size: 64)
!25 = !DILocation(line: 37, column: 81, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 38, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 39, column: 10, scope: !11)
!36 = !DILocation(line: 42, column: 12, scope: !11)
!37 = !DILocation(line: 42, column: 10, scope: !11)
!38 = !DILocation(line: 43, column: 5, scope: !11)
!39 = !DILocation(line: 43, column: 13, scope: !11)
!40 = !DILocation(line: 44, column: 26, scope: !11)
!41 = !DILocation(line: 44, column: 13, scope: !11)
!42 = !DILocation(line: 44, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 46, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!45 = !DILocation(line: 46, column: 16, scope: !44)
!46 = !DILocation(line: 46, column: 31, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 48, type: !32)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 47, column: 9)
!49 = !DILocation(line: 48, column: 18, scope: !48)
!50 = !DILocation(line: 51, column: 20, scope: !48)
!51 = !DILocation(line: 51, column: 13, scope: !48)
!52 = !DILocation(line: 51, column: 42, scope: !48)
!53 = !DILocation(line: 51, column: 35, scope: !48)
!54 = !DILocation(line: 51, column: 50, scope: !48)
!55 = !DILocation(line: 51, column: 55, scope: !48)
!56 = !DILocation(line: 52, column: 23, scope: !48)
!57 = !DILocation(line: 52, column: 13, scope: !48)
!58 = !DILocation(line: 55, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_34_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 87, column: 5, scope: !59)
!61 = !DILocation(line: 88, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !63, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 99, type: !65)
!68 = !DILocation(line: 99, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 99, type: !66)
!70 = !DILocation(line: 99, column: 27, scope: !62)
!71 = !DILocation(line: 102, column: 22, scope: !62)
!72 = !DILocation(line: 102, column: 12, scope: !62)
!73 = !DILocation(line: 102, column: 5, scope: !62)
!74 = !DILocation(line: 104, column: 5, scope: !62)
!75 = !DILocation(line: 105, column: 5, scope: !62)
!76 = !DILocation(line: 106, column: 5, scope: !62)
!77 = !DILocation(line: 109, column: 5, scope: !62)
!78 = !DILocation(line: 110, column: 5, scope: !62)
!79 = !DILocation(line: 111, column: 5, scope: !62)
!80 = !DILocation(line: 113, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 64, type: !16)
!83 = !DILocation(line: 64, column: 12, scope: !81)
!84 = !DILocalVariable(name: "myUnion", scope: !81, file: !12, line: 65, type: !20)
!85 = !DILocation(line: 65, column: 81, scope: !81)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 66, type: !27)
!87 = !DILocation(line: 66, column: 10, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 67, type: !32)
!89 = !DILocation(line: 67, column: 10, scope: !81)
!90 = !DILocation(line: 70, column: 12, scope: !81)
!91 = !DILocation(line: 70, column: 10, scope: !81)
!92 = !DILocation(line: 71, column: 5, scope: !81)
!93 = !DILocation(line: 71, column: 13, scope: !81)
!94 = !DILocation(line: 72, column: 26, scope: !81)
!95 = !DILocation(line: 72, column: 13, scope: !81)
!96 = !DILocation(line: 72, column: 24, scope: !81)
!97 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 74, type: !16)
!98 = distinct !DILexicalBlock(scope: !81, file: !12, line: 73, column: 5)
!99 = !DILocation(line: 74, column: 16, scope: !98)
!100 = !DILocation(line: 74, column: 31, scope: !98)
!101 = !DILocalVariable(name: "source", scope: !102, file: !12, line: 76, type: !32)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 75, column: 9)
!103 = !DILocation(line: 76, column: 18, scope: !102)
!104 = !DILocation(line: 79, column: 20, scope: !102)
!105 = !DILocation(line: 79, column: 13, scope: !102)
!106 = !DILocation(line: 79, column: 42, scope: !102)
!107 = !DILocation(line: 79, column: 35, scope: !102)
!108 = !DILocation(line: 79, column: 50, scope: !102)
!109 = !DILocation(line: 79, column: 55, scope: !102)
!110 = !DILocation(line: 80, column: 23, scope: !102)
!111 = !DILocation(line: 80, column: 13, scope: !102)
!112 = !DILocation(line: 83, column: 1, scope: !81)
