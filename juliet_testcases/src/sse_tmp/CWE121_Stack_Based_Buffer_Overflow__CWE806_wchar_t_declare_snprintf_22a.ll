; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_badGlobal, align 4, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_badSource(i32* %0), !dbg !37
  store i32* %call, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !45
  %3 = load i32*, i32** %data, align 8, !dbg !46
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !48
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 %call2, i8* bitcast ([3 x i32]* @.str to i8*), i32* %4) #7, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %5), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B1Global, align 4, !dbg !84
  %0 = load i32*, i32** %data, align 8, !dbg !85
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B1Source(i32* %0), !dbg !86
  store i32* %call, i32** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !90
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !91
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !91
  %3 = load i32*, i32** %data, align 8, !dbg !92
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 %call2, i8* bitcast ([3 x i32]* @.str to i8*), i32* %4) #7, !dbg !95
  %5 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* %5), !dbg !97
  ret void, !dbg !98
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data, align 8, !dbg !105
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B2Global, align 4, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B2Source(i32* %0), !dbg !108
  store i32* %call, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !112
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !113
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !113
  %3 = load i32*, i32** %data, align 8, !dbg !114
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 %call2, i8* bitcast ([3 x i32]* @.str to i8*), i32* %4) #7, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %5), !dbg !119
  ret void, !dbg !120
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_badGlobal", scope: !2, file: !10, line: 30, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B1Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_goodG2B2Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_bad", scope: !10, file: !10, line: 34, type: !21, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 36, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 36, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 37, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 37, column: 13, scope: !20)
!33 = !DILocation(line: 38, column: 12, scope: !20)
!34 = !DILocation(line: 38, column: 10, scope: !20)
!35 = !DILocation(line: 39, column: 86, scope: !20)
!36 = !DILocation(line: 40, column: 93, scope: !20)
!37 = !DILocation(line: 40, column: 12, scope: !20)
!38 = !DILocation(line: 40, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 42, column: 17, scope: !40)
!45 = !DILocation(line: 44, column: 18, scope: !40)
!46 = !DILocation(line: 44, column: 31, scope: !40)
!47 = !DILocation(line: 44, column: 24, scope: !40)
!48 = !DILocation(line: 44, column: 45, scope: !40)
!49 = !DILocation(line: 44, column: 9, scope: !40)
!50 = !DILocation(line: 45, column: 20, scope: !40)
!51 = !DILocation(line: 45, column: 9, scope: !40)
!52 = !DILocation(line: 47, column: 1, scope: !20)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_22_good", scope: !10, file: !10, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 95, column: 5, scope: !53)
!55 = !DILocation(line: 96, column: 5, scope: !53)
!56 = !DILocation(line: 97, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 109, type: !58, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!11, !11, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !10, line: 109, type: !11)
!64 = !DILocation(line: 109, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !10, line: 109, type: !60)
!66 = !DILocation(line: 109, column: 27, scope: !57)
!67 = !DILocation(line: 112, column: 22, scope: !57)
!68 = !DILocation(line: 112, column: 12, scope: !57)
!69 = !DILocation(line: 112, column: 5, scope: !57)
!70 = !DILocation(line: 114, column: 5, scope: !57)
!71 = !DILocation(line: 115, column: 5, scope: !57)
!72 = !DILocation(line: 116, column: 5, scope: !57)
!73 = !DILocation(line: 119, column: 5, scope: !57)
!74 = !DILocation(line: 120, column: 5, scope: !57)
!75 = !DILocation(line: 121, column: 5, scope: !57)
!76 = !DILocation(line: 123, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 62, type: !24)
!79 = !DILocation(line: 62, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !10, line: 63, type: !29)
!81 = !DILocation(line: 63, column: 13, scope: !77)
!82 = !DILocation(line: 64, column: 12, scope: !77)
!83 = !DILocation(line: 64, column: 10, scope: !77)
!84 = !DILocation(line: 65, column: 91, scope: !77)
!85 = !DILocation(line: 66, column: 98, scope: !77)
!86 = !DILocation(line: 66, column: 12, scope: !77)
!87 = !DILocation(line: 66, column: 10, scope: !77)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !10, line: 68, type: !41)
!89 = distinct !DILexicalBlock(scope: !77, file: !10, line: 67, column: 5)
!90 = !DILocation(line: 68, column: 17, scope: !89)
!91 = !DILocation(line: 70, column: 18, scope: !89)
!92 = !DILocation(line: 70, column: 31, scope: !89)
!93 = !DILocation(line: 70, column: 24, scope: !89)
!94 = !DILocation(line: 70, column: 45, scope: !89)
!95 = !DILocation(line: 70, column: 9, scope: !89)
!96 = !DILocation(line: 71, column: 20, scope: !89)
!97 = !DILocation(line: 71, column: 9, scope: !89)
!98 = !DILocation(line: 73, column: 1, scope: !77)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 80, type: !24)
!101 = !DILocation(line: 80, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !10, line: 81, type: !29)
!103 = !DILocation(line: 81, column: 13, scope: !99)
!104 = !DILocation(line: 82, column: 12, scope: !99)
!105 = !DILocation(line: 82, column: 10, scope: !99)
!106 = !DILocation(line: 83, column: 91, scope: !99)
!107 = !DILocation(line: 84, column: 98, scope: !99)
!108 = !DILocation(line: 84, column: 12, scope: !99)
!109 = !DILocation(line: 84, column: 10, scope: !99)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !10, line: 86, type: !41)
!111 = distinct !DILexicalBlock(scope: !99, file: !10, line: 85, column: 5)
!112 = !DILocation(line: 86, column: 17, scope: !111)
!113 = !DILocation(line: 88, column: 18, scope: !111)
!114 = !DILocation(line: 88, column: 31, scope: !111)
!115 = !DILocation(line: 88, column: 24, scope: !111)
!116 = !DILocation(line: 88, column: 45, scope: !111)
!117 = !DILocation(line: 88, column: 9, scope: !111)
!118 = !DILocation(line: 89, column: 20, scope: !111)
!119 = !DILocation(line: 89, column: 9, scope: !111)
!120 = !DILocation(line: 91, column: 1, scope: !99)
