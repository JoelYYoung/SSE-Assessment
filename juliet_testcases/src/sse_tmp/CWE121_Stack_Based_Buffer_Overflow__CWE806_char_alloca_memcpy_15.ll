; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %6 = load i8*, i8** %data, align 8, !dbg !36
  %call = call i64 @strlen(i8* %6) #7, !dbg !37
  %mul = mul i64 %call, 1, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !34
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %7 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %7), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #8, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #8, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 100, align 16, !dbg !72
  store i8* %0, i8** %dataBuffer, align 8, !dbg !71
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  store i8* %1, i8** %data, align 8, !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !81
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !81
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !82
  %5 = load i8*, i8** %data, align 8, !dbg !83
  %6 = load i8*, i8** %data, align 8, !dbg !84
  %call = call i64 @strlen(i8* %6) #7, !dbg !85
  %mul = mul i64 %call, 1, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !82
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !87
  store i8 0, i8* %arrayidx1, align 1, !dbg !88
  %7 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %7), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %0, i8** %dataBuffer, align 8, !dbg !96
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  store i8* %1, i8** %data, align 8, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  %call = call i64 @strlen(i8* %6) #7, !dbg !110
  %mul = mul i64 %call, 1, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !107
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !112
  store i8 0, i8* %arrayidx1, align 1, !dbg !113
  %7 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %7), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 32, column: 16, scope: !13)
!25 = !DILocation(line: 32, column: 9, scope: !13)
!26 = !DILocation(line: 33, column: 9, scope: !13)
!27 = !DILocation(line: 33, column: 21, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 41, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 41, column: 14, scope: !29)
!34 = !DILocation(line: 43, column: 9, scope: !29)
!35 = !DILocation(line: 43, column: 22, scope: !29)
!36 = !DILocation(line: 43, column: 35, scope: !29)
!37 = !DILocation(line: 43, column: 28, scope: !29)
!38 = !DILocation(line: 43, column: 40, scope: !29)
!39 = !DILocation(line: 44, column: 9, scope: !29)
!40 = !DILocation(line: 44, column: 20, scope: !29)
!41 = !DILocation(line: 45, column: 19, scope: !29)
!42 = !DILocation(line: 45, column: 9, scope: !29)
!43 = !DILocation(line: 47, column: 1, scope: !13)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_15_good", scope: !14, file: !14, line: 107, type: !15, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 109, column: 5, scope: !44)
!46 = !DILocation(line: 110, column: 5, scope: !44)
!47 = !DILocation(line: 111, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 123, type: !49, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !14, line: 123, type: !51)
!54 = !DILocation(line: 123, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !14, line: 123, type: !52)
!56 = !DILocation(line: 123, column: 27, scope: !48)
!57 = !DILocation(line: 126, column: 22, scope: !48)
!58 = !DILocation(line: 126, column: 12, scope: !48)
!59 = !DILocation(line: 126, column: 5, scope: !48)
!60 = !DILocation(line: 128, column: 5, scope: !48)
!61 = !DILocation(line: 129, column: 5, scope: !48)
!62 = !DILocation(line: 130, column: 5, scope: !48)
!63 = !DILocation(line: 133, column: 5, scope: !48)
!64 = !DILocation(line: 134, column: 5, scope: !48)
!65 = !DILocation(line: 135, column: 5, scope: !48)
!66 = !DILocation(line: 137, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !14, line: 56, type: !4)
!69 = !DILocation(line: 56, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !14, line: 57, type: !4)
!71 = !DILocation(line: 57, column: 12, scope: !67)
!72 = !DILocation(line: 57, column: 33, scope: !67)
!73 = !DILocation(line: 58, column: 12, scope: !67)
!74 = !DILocation(line: 58, column: 10, scope: !67)
!75 = !DILocation(line: 67, column: 16, scope: !67)
!76 = !DILocation(line: 67, column: 9, scope: !67)
!77 = !DILocation(line: 68, column: 9, scope: !67)
!78 = !DILocation(line: 68, column: 20, scope: !67)
!79 = !DILocalVariable(name: "dest", scope: !80, file: !14, line: 72, type: !30)
!80 = distinct !DILexicalBlock(scope: !67, file: !14, line: 71, column: 5)
!81 = !DILocation(line: 72, column: 14, scope: !80)
!82 = !DILocation(line: 74, column: 9, scope: !80)
!83 = !DILocation(line: 74, column: 22, scope: !80)
!84 = !DILocation(line: 74, column: 35, scope: !80)
!85 = !DILocation(line: 74, column: 28, scope: !80)
!86 = !DILocation(line: 74, column: 40, scope: !80)
!87 = !DILocation(line: 75, column: 9, scope: !80)
!88 = !DILocation(line: 75, column: 20, scope: !80)
!89 = !DILocation(line: 76, column: 19, scope: !80)
!90 = !DILocation(line: 76, column: 9, scope: !80)
!91 = !DILocation(line: 78, column: 1, scope: !67)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 83, type: !4)
!94 = !DILocation(line: 83, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !14, line: 84, type: !4)
!96 = !DILocation(line: 84, column: 12, scope: !92)
!97 = !DILocation(line: 84, column: 33, scope: !92)
!98 = !DILocation(line: 85, column: 12, scope: !92)
!99 = !DILocation(line: 85, column: 10, scope: !92)
!100 = !DILocation(line: 90, column: 16, scope: !92)
!101 = !DILocation(line: 90, column: 9, scope: !92)
!102 = !DILocation(line: 91, column: 9, scope: !92)
!103 = !DILocation(line: 91, column: 20, scope: !92)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !14, line: 99, type: !30)
!105 = distinct !DILexicalBlock(scope: !92, file: !14, line: 98, column: 5)
!106 = !DILocation(line: 99, column: 14, scope: !105)
!107 = !DILocation(line: 101, column: 9, scope: !105)
!108 = !DILocation(line: 101, column: 22, scope: !105)
!109 = !DILocation(line: 101, column: 35, scope: !105)
!110 = !DILocation(line: 101, column: 28, scope: !105)
!111 = !DILocation(line: 101, column: 40, scope: !105)
!112 = !DILocation(line: 102, column: 9, scope: !105)
!113 = !DILocation(line: 102, column: 20, scope: !105)
!114 = !DILocation(line: 103, column: 19, scope: !105)
!115 = !DILocation(line: 103, column: 9, scope: !105)
!116 = !DILocation(line: 105, column: 1, scope: !92)
