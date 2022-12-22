; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04_bad() #0 !dbg !15 {
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
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !30
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !41
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %8), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 400, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBuffer, align 8, !dbg !75
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %2, i32** %data, align 8, !dbg !79
  %3 = load i32*, i32** %data, align 8, !dbg !80
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !83
  %4 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !89
  %6 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !91
  %7 = load i32*, i32** %data, align 8, !dbg !92
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !93
  %8 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %8), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 400, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBuffer, align 8, !dbg !101
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %2, i32** %data, align 8, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !109
  %4 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !115
  %6 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !117
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !119
  %8 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %8), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04_bad", scope: !16, file: !16, line: 36, type: !17, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 38, type: !4)
!20 = !DILocation(line: 38, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 39, type: !4)
!22 = !DILocation(line: 39, column: 15, scope: !15)
!23 = !DILocation(line: 39, column: 39, scope: !15)
!24 = !DILocation(line: 39, column: 28, scope: !15)
!25 = !DILocation(line: 40, column: 12, scope: !15)
!26 = !DILocation(line: 40, column: 10, scope: !15)
!27 = !DILocation(line: 44, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !16, line: 42, column: 5)
!29 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 8)
!30 = !DILocation(line: 44, column: 9, scope: !28)
!31 = !DILocation(line: 45, column: 9, scope: !28)
!32 = !DILocation(line: 45, column: 21, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !16, line: 48, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 48, column: 17, scope: !34)
!39 = !DILocation(line: 50, column: 18, scope: !34)
!40 = !DILocation(line: 50, column: 31, scope: !34)
!41 = !DILocation(line: 50, column: 24, scope: !34)
!42 = !DILocation(line: 50, column: 45, scope: !34)
!43 = !DILocation(line: 50, column: 9, scope: !34)
!44 = !DILocation(line: 51, column: 20, scope: !34)
!45 = !DILocation(line: 51, column: 9, scope: !34)
!46 = !DILocation(line: 53, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_04_good", scope: !16, file: !16, line: 104, type: !17, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 106, column: 5, scope: !47)
!49 = !DILocation(line: 107, column: 5, scope: !47)
!50 = !DILocation(line: 108, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 120, type: !52, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 120, type: !7)
!58 = !DILocation(line: 120, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 120, type: !54)
!60 = !DILocation(line: 120, column: 27, scope: !51)
!61 = !DILocation(line: 123, column: 22, scope: !51)
!62 = !DILocation(line: 123, column: 12, scope: !51)
!63 = !DILocation(line: 123, column: 5, scope: !51)
!64 = !DILocation(line: 125, column: 5, scope: !51)
!65 = !DILocation(line: 126, column: 5, scope: !51)
!66 = !DILocation(line: 127, column: 5, scope: !51)
!67 = !DILocation(line: 130, column: 5, scope: !51)
!68 = !DILocation(line: 131, column: 5, scope: !51)
!69 = !DILocation(line: 132, column: 5, scope: !51)
!70 = !DILocation(line: 134, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !16, line: 62, type: !4)
!73 = !DILocation(line: 62, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !16, line: 63, type: !4)
!75 = !DILocation(line: 63, column: 15, scope: !71)
!76 = !DILocation(line: 63, column: 39, scope: !71)
!77 = !DILocation(line: 63, column: 28, scope: !71)
!78 = !DILocation(line: 64, column: 12, scope: !71)
!79 = !DILocation(line: 64, column: 10, scope: !71)
!80 = !DILocation(line: 73, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !16, line: 71, column: 5)
!82 = distinct !DILexicalBlock(scope: !71, file: !16, line: 65, column: 8)
!83 = !DILocation(line: 73, column: 9, scope: !81)
!84 = !DILocation(line: 74, column: 9, scope: !81)
!85 = !DILocation(line: 74, column: 20, scope: !81)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !16, line: 77, type: !35)
!87 = distinct !DILexicalBlock(scope: !71, file: !16, line: 76, column: 5)
!88 = !DILocation(line: 77, column: 17, scope: !87)
!89 = !DILocation(line: 79, column: 18, scope: !87)
!90 = !DILocation(line: 79, column: 31, scope: !87)
!91 = !DILocation(line: 79, column: 24, scope: !87)
!92 = !DILocation(line: 79, column: 45, scope: !87)
!93 = !DILocation(line: 79, column: 9, scope: !87)
!94 = !DILocation(line: 80, column: 20, scope: !87)
!95 = !DILocation(line: 80, column: 9, scope: !87)
!96 = !DILocation(line: 82, column: 1, scope: !71)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 87, type: !4)
!99 = !DILocation(line: 87, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !16, line: 88, type: !4)
!101 = !DILocation(line: 88, column: 15, scope: !97)
!102 = !DILocation(line: 88, column: 39, scope: !97)
!103 = !DILocation(line: 88, column: 28, scope: !97)
!104 = !DILocation(line: 89, column: 12, scope: !97)
!105 = !DILocation(line: 89, column: 10, scope: !97)
!106 = !DILocation(line: 93, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !16, line: 91, column: 5)
!108 = distinct !DILexicalBlock(scope: !97, file: !16, line: 90, column: 8)
!109 = !DILocation(line: 93, column: 9, scope: !107)
!110 = !DILocation(line: 94, column: 9, scope: !107)
!111 = !DILocation(line: 94, column: 20, scope: !107)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !16, line: 97, type: !35)
!113 = distinct !DILexicalBlock(scope: !97, file: !16, line: 96, column: 5)
!114 = !DILocation(line: 97, column: 17, scope: !113)
!115 = !DILocation(line: 99, column: 18, scope: !113)
!116 = !DILocation(line: 99, column: 31, scope: !113)
!117 = !DILocation(line: 99, column: 24, scope: !113)
!118 = !DILocation(line: 99, column: 45, scope: !113)
!119 = !DILocation(line: 99, column: 9, scope: !113)
!120 = !DILocation(line: 100, column: 20, scope: !113)
!121 = !DILocation(line: 100, column: 9, scope: !113)
!122 = !DILocation(line: 102, column: 1, scope: !97)
