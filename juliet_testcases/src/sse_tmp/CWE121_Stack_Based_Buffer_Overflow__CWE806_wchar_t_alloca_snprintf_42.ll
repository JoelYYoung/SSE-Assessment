; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %7), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32*, i32** %data.addr, align 8, !dbg !49
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !50
  %1 = load i32*, i32** %data.addr, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  %2 = load i32*, i32** %data.addr, align 8, !dbg !53
  ret i32* %2, !dbg !54
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBuffer, align 8, !dbg !82
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  store i32* %2, i32** %data, align 8, !dbg !86
  %3 = load i32*, i32** %data, align 8, !dbg !87
  %call = call i32* @goodG2BSource(i32* %3), !dbg !88
  store i32* %call, i32** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %7), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i32*, i32** %data.addr, align 8, !dbg !104
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !105
  %1 = load i32*, i32** %data.addr, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %2 = load i32*, i32** %data.addr, align 8, !dbg !108
  ret i32* %2, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 39, scope: !15)
!24 = !DILocation(line: 40, column: 28, scope: !15)
!25 = !DILocation(line: 41, column: 12, scope: !15)
!26 = !DILocation(line: 41, column: 10, scope: !15)
!27 = !DILocation(line: 42, column: 22, scope: !15)
!28 = !DILocation(line: 42, column: 12, scope: !15)
!29 = !DILocation(line: 42, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 44, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 44, column: 17, scope: !31)
!36 = !DILocation(line: 46, column: 18, scope: !31)
!37 = !DILocation(line: 46, column: 31, scope: !31)
!38 = !DILocation(line: 46, column: 24, scope: !31)
!39 = !DILocation(line: 46, column: 45, scope: !31)
!40 = !DILocation(line: 46, column: 9, scope: !31)
!41 = !DILocation(line: 47, column: 20, scope: !31)
!42 = !DILocation(line: 47, column: 9, scope: !31)
!43 = !DILocation(line: 49, column: 1, scope: !15)
!44 = distinct !DISubprogram(name: "badSource", scope: !16, file: !16, line: 29, type: !45, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!4, !4}
!47 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !16, line: 29, type: !4)
!48 = !DILocation(line: 29, column: 38, scope: !44)
!49 = !DILocation(line: 32, column: 13, scope: !44)
!50 = !DILocation(line: 32, column: 5, scope: !44)
!51 = !DILocation(line: 33, column: 5, scope: !44)
!52 = !DILocation(line: 33, column: 17, scope: !44)
!53 = !DILocation(line: 34, column: 12, scope: !44)
!54 = !DILocation(line: 34, column: 5, scope: !44)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_42_good", scope: !16, file: !16, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 80, column: 5, scope: !55)
!57 = !DILocation(line: 81, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 93, type: !59, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 93, type: !7)
!65 = !DILocation(line: 93, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 93, type: !61)
!67 = !DILocation(line: 93, column: 27, scope: !58)
!68 = !DILocation(line: 96, column: 22, scope: !58)
!69 = !DILocation(line: 96, column: 12, scope: !58)
!70 = !DILocation(line: 96, column: 5, scope: !58)
!71 = !DILocation(line: 98, column: 5, scope: !58)
!72 = !DILocation(line: 99, column: 5, scope: !58)
!73 = !DILocation(line: 100, column: 5, scope: !58)
!74 = !DILocation(line: 103, column: 5, scope: !58)
!75 = !DILocation(line: 104, column: 5, scope: !58)
!76 = !DILocation(line: 105, column: 5, scope: !58)
!77 = !DILocation(line: 107, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 64, type: !17, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 66, type: !4)
!80 = !DILocation(line: 66, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !16, line: 67, type: !4)
!82 = !DILocation(line: 67, column: 15, scope: !78)
!83 = !DILocation(line: 67, column: 39, scope: !78)
!84 = !DILocation(line: 67, column: 28, scope: !78)
!85 = !DILocation(line: 68, column: 12, scope: !78)
!86 = !DILocation(line: 68, column: 10, scope: !78)
!87 = !DILocation(line: 69, column: 26, scope: !78)
!88 = !DILocation(line: 69, column: 12, scope: !78)
!89 = !DILocation(line: 69, column: 10, scope: !78)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !16, line: 71, type: !32)
!91 = distinct !DILexicalBlock(scope: !78, file: !16, line: 70, column: 5)
!92 = !DILocation(line: 71, column: 17, scope: !91)
!93 = !DILocation(line: 73, column: 18, scope: !91)
!94 = !DILocation(line: 73, column: 31, scope: !91)
!95 = !DILocation(line: 73, column: 24, scope: !91)
!96 = !DILocation(line: 73, column: 45, scope: !91)
!97 = !DILocation(line: 73, column: 9, scope: !91)
!98 = !DILocation(line: 74, column: 20, scope: !91)
!99 = !DILocation(line: 74, column: 9, scope: !91)
!100 = !DILocation(line: 76, column: 1, scope: !78)
!101 = distinct !DISubprogram(name: "goodG2BSource", scope: !16, file: !16, line: 55, type: !45, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !16, line: 55, type: !4)
!103 = !DILocation(line: 55, column: 42, scope: !101)
!104 = !DILocation(line: 58, column: 13, scope: !101)
!105 = !DILocation(line: 58, column: 5, scope: !101)
!106 = !DILocation(line: 59, column: 5, scope: !101)
!107 = !DILocation(line: 59, column: 16, scope: !101)
!108 = !DILocation(line: 60, column: 12, scope: !101)
!109 = !DILocation(line: 60, column: 5, scope: !101)
