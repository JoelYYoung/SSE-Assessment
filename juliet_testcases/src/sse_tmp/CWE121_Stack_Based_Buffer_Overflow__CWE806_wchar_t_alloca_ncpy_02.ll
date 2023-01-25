; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02_bad() #0 !dbg !15 {
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
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !42
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %6, i64 %call1) #6, !dbg !43
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !44
  store i32 0, i32* %arrayidx3, align 4, !dbg !45
  %8 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %8), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 400, align 16, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %dataBuffer, align 8, !dbg !77
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  store i32* %2, i32** %data, align 8, !dbg !81
  %3 = load i32*, i32** %data, align 8, !dbg !82
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !85
  %4 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !91
  %6 = load i32*, i32** %data, align 8, !dbg !92
  %7 = load i32*, i32** %data, align 8, !dbg !93
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !94
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %6, i64 %call1) #6, !dbg !95
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !96
  store i32 0, i32* %arrayidx3, align 4, !dbg !97
  %8 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %8), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 400, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %2, i32** %data, align 8, !dbg !109
  %3 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !119
  %6 = load i32*, i32** %data, align 8, !dbg !120
  %7 = load i32*, i32** %data, align 8, !dbg !121
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !122
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %6, i64 %call1) #6, !dbg !123
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !124
  store i32 0, i32* %arrayidx3, align 4, !dbg !125
  %8 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %8), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 31, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !16, line: 29, column: 5)
!29 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!30 = !DILocation(line: 31, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 9, scope: !28)
!32 = !DILocation(line: 32, column: 21, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !16, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 17, scope: !34)
!39 = !DILocation(line: 37, column: 17, scope: !34)
!40 = !DILocation(line: 37, column: 23, scope: !34)
!41 = !DILocation(line: 37, column: 36, scope: !34)
!42 = !DILocation(line: 37, column: 29, scope: !34)
!43 = !DILocation(line: 37, column: 9, scope: !34)
!44 = !DILocation(line: 38, column: 9, scope: !34)
!45 = !DILocation(line: 38, column: 20, scope: !34)
!46 = !DILocation(line: 39, column: 20, scope: !34)
!47 = !DILocation(line: 39, column: 9, scope: !34)
!48 = !DILocation(line: 41, column: 1, scope: !15)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_02_good", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 96, column: 5, scope: !49)
!51 = !DILocation(line: 97, column: 5, scope: !49)
!52 = !DILocation(line: 98, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 110, type: !54, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !16, line: 110, type: !7)
!60 = !DILocation(line: 110, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !16, line: 110, type: !56)
!62 = !DILocation(line: 110, column: 27, scope: !53)
!63 = !DILocation(line: 113, column: 22, scope: !53)
!64 = !DILocation(line: 113, column: 12, scope: !53)
!65 = !DILocation(line: 113, column: 5, scope: !53)
!66 = !DILocation(line: 115, column: 5, scope: !53)
!67 = !DILocation(line: 116, column: 5, scope: !53)
!68 = !DILocation(line: 117, column: 5, scope: !53)
!69 = !DILocation(line: 120, column: 5, scope: !53)
!70 = !DILocation(line: 121, column: 5, scope: !53)
!71 = !DILocation(line: 122, column: 5, scope: !53)
!72 = !DILocation(line: 124, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !16, line: 50, type: !4)
!75 = !DILocation(line: 50, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !16, line: 51, type: !4)
!77 = !DILocation(line: 51, column: 15, scope: !73)
!78 = !DILocation(line: 51, column: 39, scope: !73)
!79 = !DILocation(line: 51, column: 28, scope: !73)
!80 = !DILocation(line: 52, column: 12, scope: !73)
!81 = !DILocation(line: 52, column: 10, scope: !73)
!82 = !DILocation(line: 61, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !16, line: 59, column: 5)
!84 = distinct !DILexicalBlock(scope: !73, file: !16, line: 53, column: 8)
!85 = !DILocation(line: 61, column: 9, scope: !83)
!86 = !DILocation(line: 62, column: 9, scope: !83)
!87 = !DILocation(line: 62, column: 20, scope: !83)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !16, line: 65, type: !35)
!89 = distinct !DILexicalBlock(scope: !73, file: !16, line: 64, column: 5)
!90 = !DILocation(line: 65, column: 17, scope: !89)
!91 = !DILocation(line: 67, column: 17, scope: !89)
!92 = !DILocation(line: 67, column: 23, scope: !89)
!93 = !DILocation(line: 67, column: 36, scope: !89)
!94 = !DILocation(line: 67, column: 29, scope: !89)
!95 = !DILocation(line: 67, column: 9, scope: !89)
!96 = !DILocation(line: 68, column: 9, scope: !89)
!97 = !DILocation(line: 68, column: 20, scope: !89)
!98 = !DILocation(line: 69, column: 20, scope: !89)
!99 = !DILocation(line: 69, column: 9, scope: !89)
!100 = !DILocation(line: 71, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 76, type: !4)
!103 = !DILocation(line: 76, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !16, line: 77, type: !4)
!105 = !DILocation(line: 77, column: 15, scope: !101)
!106 = !DILocation(line: 77, column: 39, scope: !101)
!107 = !DILocation(line: 77, column: 28, scope: !101)
!108 = !DILocation(line: 78, column: 12, scope: !101)
!109 = !DILocation(line: 78, column: 10, scope: !101)
!110 = !DILocation(line: 82, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !16, line: 80, column: 5)
!112 = distinct !DILexicalBlock(scope: !101, file: !16, line: 79, column: 8)
!113 = !DILocation(line: 82, column: 9, scope: !111)
!114 = !DILocation(line: 83, column: 9, scope: !111)
!115 = !DILocation(line: 83, column: 20, scope: !111)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !16, line: 86, type: !35)
!117 = distinct !DILexicalBlock(scope: !101, file: !16, line: 85, column: 5)
!118 = !DILocation(line: 86, column: 17, scope: !117)
!119 = !DILocation(line: 88, column: 17, scope: !117)
!120 = !DILocation(line: 88, column: 23, scope: !117)
!121 = !DILocation(line: 88, column: 36, scope: !117)
!122 = !DILocation(line: 88, column: 29, scope: !117)
!123 = !DILocation(line: 88, column: 9, scope: !117)
!124 = !DILocation(line: 89, column: 9, scope: !117)
!125 = !DILocation(line: 89, column: 20, scope: !117)
!126 = !DILocation(line: 90, column: 20, scope: !117)
!127 = !DILocation(line: 90, column: 9, scope: !117)
!128 = !DILocation(line: 92, column: 1, scope: !101)
