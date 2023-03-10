; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_badGlobal, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %call1 = call i64 @strlen(i8* %5) #7, !dbg !45
  %mul = mul i64 %call1, 1, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %4, i64 %mul, i1 false), !dbg !42
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %6), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #8, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #8, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 100, align 16, !dbg !79
  store i8* %0, i8** %dataBuffer, align 8, !dbg !78
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !80
  store i8* %1, i8** %data, align 8, !dbg !81
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B1Global, align 4, !dbg !82
  %2 = load i8*, i8** %data, align 8, !dbg !83
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B1Source(i8* %2), !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %call1 = call i64 @strlen(i8* %5) #7, !dbg !92
  %mul = mul i64 %call1, 1, !dbg !93
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %4, i64 %mul, i1 false), !dbg !89
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* %6), !dbg !97
  ret void, !dbg !98
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 100, align 16, !dbg !104
  store i8* %0, i8** %dataBuffer, align 8, !dbg !103
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  store i8* %1, i8** %data, align 8, !dbg !106
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B2Global, align 4, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B2Source(i8* %2), !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %5 = load i8*, i8** %data, align 8, !dbg !116
  %call1 = call i64 @strlen(i8* %5) #7, !dbg !117
  %mul = mul i64 %call1, 1, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %4, i64 %mul, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %6 = load i8*, i8** %data, align 8, !dbg !121
  call void @printLine(i8* %6), !dbg !122
  ret void, !dbg !123
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_badGlobal", scope: !2, file: !12, line: 24, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B1Global", scope: !2, file: !12, line: 49, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_goodG2B2Global", scope: !2, file: !12, line: 50, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_bad", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 30, type: !6)
!26 = !DILocation(line: 30, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 31, type: !6)
!28 = !DILocation(line: 31, column: 12, scope: !22)
!29 = !DILocation(line: 31, column: 33, scope: !22)
!30 = !DILocation(line: 32, column: 12, scope: !22)
!31 = !DILocation(line: 32, column: 10, scope: !22)
!32 = !DILocation(line: 33, column: 81, scope: !22)
!33 = !DILocation(line: 34, column: 88, scope: !22)
!34 = !DILocation(line: 34, column: 12, scope: !22)
!35 = !DILocation(line: 34, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 36, column: 14, scope: !37)
!42 = !DILocation(line: 38, column: 9, scope: !37)
!43 = !DILocation(line: 38, column: 23, scope: !37)
!44 = !DILocation(line: 38, column: 36, scope: !37)
!45 = !DILocation(line: 38, column: 29, scope: !37)
!46 = !DILocation(line: 38, column: 41, scope: !37)
!47 = !DILocation(line: 39, column: 9, scope: !37)
!48 = !DILocation(line: 39, column: 20, scope: !37)
!49 = !DILocation(line: 40, column: 19, scope: !37)
!50 = !DILocation(line: 40, column: 9, scope: !37)
!51 = !DILocation(line: 42, column: 1, scope: !22)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_22_good", scope: !12, file: !12, line: 90, type: !23, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 92, column: 5, scope: !52)
!54 = !DILocation(line: 93, column: 5, scope: !52)
!55 = !DILocation(line: 94, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !57, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!13, !13, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 106, type: !13)
!61 = !DILocation(line: 106, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 106, type: !59)
!63 = !DILocation(line: 106, column: 27, scope: !56)
!64 = !DILocation(line: 109, column: 22, scope: !56)
!65 = !DILocation(line: 109, column: 12, scope: !56)
!66 = !DILocation(line: 109, column: 5, scope: !56)
!67 = !DILocation(line: 111, column: 5, scope: !56)
!68 = !DILocation(line: 112, column: 5, scope: !56)
!69 = !DILocation(line: 113, column: 5, scope: !56)
!70 = !DILocation(line: 116, column: 5, scope: !56)
!71 = !DILocation(line: 117, column: 5, scope: !56)
!72 = !DILocation(line: 118, column: 5, scope: !56)
!73 = !DILocation(line: 120, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !23, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 57, type: !6)
!76 = !DILocation(line: 57, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 58, type: !6)
!78 = !DILocation(line: 58, column: 12, scope: !74)
!79 = !DILocation(line: 58, column: 33, scope: !74)
!80 = !DILocation(line: 59, column: 12, scope: !74)
!81 = !DILocation(line: 59, column: 10, scope: !74)
!82 = !DILocation(line: 60, column: 86, scope: !74)
!83 = !DILocation(line: 61, column: 93, scope: !74)
!84 = !DILocation(line: 61, column: 12, scope: !74)
!85 = !DILocation(line: 61, column: 10, scope: !74)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !12, line: 63, type: !38)
!87 = distinct !DILexicalBlock(scope: !74, file: !12, line: 62, column: 5)
!88 = !DILocation(line: 63, column: 14, scope: !87)
!89 = !DILocation(line: 65, column: 9, scope: !87)
!90 = !DILocation(line: 65, column: 23, scope: !87)
!91 = !DILocation(line: 65, column: 36, scope: !87)
!92 = !DILocation(line: 65, column: 29, scope: !87)
!93 = !DILocation(line: 65, column: 41, scope: !87)
!94 = !DILocation(line: 66, column: 9, scope: !87)
!95 = !DILocation(line: 66, column: 20, scope: !87)
!96 = !DILocation(line: 67, column: 19, scope: !87)
!97 = !DILocation(line: 67, column: 9, scope: !87)
!98 = !DILocation(line: 69, column: 1, scope: !74)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !23, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 76, type: !6)
!101 = !DILocation(line: 76, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !12, line: 77, type: !6)
!103 = !DILocation(line: 77, column: 12, scope: !99)
!104 = !DILocation(line: 77, column: 33, scope: !99)
!105 = !DILocation(line: 78, column: 12, scope: !99)
!106 = !DILocation(line: 78, column: 10, scope: !99)
!107 = !DILocation(line: 79, column: 86, scope: !99)
!108 = !DILocation(line: 80, column: 93, scope: !99)
!109 = !DILocation(line: 80, column: 12, scope: !99)
!110 = !DILocation(line: 80, column: 10, scope: !99)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 82, type: !38)
!112 = distinct !DILexicalBlock(scope: !99, file: !12, line: 81, column: 5)
!113 = !DILocation(line: 82, column: 14, scope: !112)
!114 = !DILocation(line: 84, column: 9, scope: !112)
!115 = !DILocation(line: 84, column: 23, scope: !112)
!116 = !DILocation(line: 84, column: 36, scope: !112)
!117 = !DILocation(line: 84, column: 29, scope: !112)
!118 = !DILocation(line: 84, column: 41, scope: !112)
!119 = !DILocation(line: 85, column: 9, scope: !112)
!120 = !DILocation(line: 85, column: 20, scope: !112)
!121 = !DILocation(line: 86, column: 19, scope: !112)
!122 = !DILocation(line: 86, column: 9, scope: !112)
!123 = !DILocation(line: 88, column: 1, scope: !99)
