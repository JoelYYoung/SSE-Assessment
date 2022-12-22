; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  %1 = load i8*, i8** %0, align 8, !dbg !38
  store i8* %1, i8** %data1, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data1, align 8, !dbg !40
  %2 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %3 = load i8*, i8** %data1, align 8, !dbg !43
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %3, i8** %4, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %6 = load i8*, i8** %5, align 8, !dbg !50
  store i8* %6, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  %8 = load i8*, i8** %data2, align 8, !dbg !54
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !57
  %add = add i64 %call, 1, !dbg !58
  %mul = mul i64 %add, 1, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %arraydecay3, i64 %mul, i1 false), !dbg !55
  %9 = load i8*, i8** %data2, align 8, !dbg !60
  call void @printLine(i8* %9), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !98
  %1 = load i8*, i8** %0, align 8, !dbg !99
  store i8* %1, i8** %data1, align 8, !dbg !97
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay, i8** %data1, align 8, !dbg !101
  %2 = load i8*, i8** %data1, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %3 = load i8*, i8** %data1, align 8, !dbg !104
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !105
  store i8* %3, i8** %4, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !107, metadata !DIExpression()), !dbg !109
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !110
  %6 = load i8*, i8** %5, align 8, !dbg !111
  store i8* %6, i8** %data2, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !114
  %8 = load i8*, i8** %data2, align 8, !dbg !115
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !118
  %add = add i64 %call, 1, !dbg !119
  %mul = mul i64 %add, 1, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %arraydecay3, i64 %mul, i1 false), !dbg !116
  %9 = load i8*, i8** %data2, align 8, !dbg !121
  call void @printLine(i8* %9), !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 31, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !20)
!23 = !DILocation(line: 32, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 33, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 34, column: 10, scope: !11)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 36, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 16, scope: !35)
!37 = !DILocation(line: 36, column: 24, scope: !35)
!38 = !DILocation(line: 36, column: 23, scope: !35)
!39 = !DILocation(line: 39, column: 16, scope: !35)
!40 = !DILocation(line: 39, column: 14, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 40, column: 17, scope: !35)
!43 = !DILocation(line: 41, column: 21, scope: !35)
!44 = !DILocation(line: 41, column: 10, scope: !35)
!45 = !DILocation(line: 41, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 44, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!48 = !DILocation(line: 44, column: 16, scope: !47)
!49 = !DILocation(line: 44, column: 24, scope: !47)
!50 = !DILocation(line: 44, column: 23, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 46, type: !30)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 45, column: 9)
!53 = !DILocation(line: 46, column: 18, scope: !52)
!54 = !DILocation(line: 49, column: 20, scope: !52)
!55 = !DILocation(line: 49, column: 13, scope: !52)
!56 = !DILocation(line: 49, column: 42, scope: !52)
!57 = !DILocation(line: 49, column: 35, scope: !52)
!58 = !DILocation(line: 49, column: 50, scope: !52)
!59 = !DILocation(line: 49, column: 55, scope: !52)
!60 = !DILocation(line: 50, column: 23, scope: !52)
!61 = !DILocation(line: 50, column: 13, scope: !52)
!62 = !DILocation(line: 53, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_32_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 89, column: 5, scope: !63)
!65 = !DILocation(line: 90, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !67, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !20}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 101, type: !69)
!71 = !DILocation(line: 101, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 101, type: !20)
!73 = !DILocation(line: 101, column: 27, scope: !66)
!74 = !DILocation(line: 104, column: 22, scope: !66)
!75 = !DILocation(line: 104, column: 12, scope: !66)
!76 = !DILocation(line: 104, column: 5, scope: !66)
!77 = !DILocation(line: 106, column: 5, scope: !66)
!78 = !DILocation(line: 107, column: 5, scope: !66)
!79 = !DILocation(line: 108, column: 5, scope: !66)
!80 = !DILocation(line: 111, column: 5, scope: !66)
!81 = !DILocation(line: 112, column: 5, scope: !66)
!82 = !DILocation(line: 113, column: 5, scope: !66)
!83 = !DILocation(line: 115, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 62, type: !16)
!86 = !DILocation(line: 62, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !12, line: 63, type: !20)
!88 = !DILocation(line: 63, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !12, line: 64, type: !20)
!90 = !DILocation(line: 64, column: 13, scope: !84)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !12, line: 65, type: !25)
!92 = !DILocation(line: 65, column: 10, scope: !84)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !12, line: 66, type: !30)
!94 = !DILocation(line: 66, column: 10, scope: !84)
!95 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 68, type: !16)
!96 = distinct !DILexicalBlock(scope: !84, file: !12, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 16, scope: !96)
!98 = !DILocation(line: 68, column: 24, scope: !96)
!99 = !DILocation(line: 68, column: 23, scope: !96)
!100 = !DILocation(line: 71, column: 16, scope: !96)
!101 = !DILocation(line: 71, column: 14, scope: !96)
!102 = !DILocation(line: 72, column: 9, scope: !96)
!103 = !DILocation(line: 72, column: 17, scope: !96)
!104 = !DILocation(line: 73, column: 21, scope: !96)
!105 = !DILocation(line: 73, column: 10, scope: !96)
!106 = !DILocation(line: 73, column: 19, scope: !96)
!107 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 76, type: !16)
!108 = distinct !DILexicalBlock(scope: !84, file: !12, line: 75, column: 5)
!109 = !DILocation(line: 76, column: 16, scope: !108)
!110 = !DILocation(line: 76, column: 24, scope: !108)
!111 = !DILocation(line: 76, column: 23, scope: !108)
!112 = !DILocalVariable(name: "source", scope: !113, file: !12, line: 78, type: !30)
!113 = distinct !DILexicalBlock(scope: !108, file: !12, line: 77, column: 9)
!114 = !DILocation(line: 78, column: 18, scope: !113)
!115 = !DILocation(line: 81, column: 20, scope: !113)
!116 = !DILocation(line: 81, column: 13, scope: !113)
!117 = !DILocation(line: 81, column: 42, scope: !113)
!118 = !DILocation(line: 81, column: 35, scope: !113)
!119 = !DILocation(line: 81, column: 50, scope: !113)
!120 = !DILocation(line: 81, column: 55, scope: !113)
!121 = !DILocation(line: 82, column: 23, scope: !113)
!122 = !DILocation(line: 82, column: 13, scope: !113)
!123 = !DILocation(line: 85, column: 1, scope: !84)
