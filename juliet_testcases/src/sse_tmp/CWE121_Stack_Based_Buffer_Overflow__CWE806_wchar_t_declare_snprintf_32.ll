; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !36
  %1 = load i32*, i32** %0, align 8, !dbg !37
  store i32* %1, i32** %data1, align 8, !dbg !35
  %2 = load i32*, i32** %data1, align 8, !dbg !38
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !39
  %3 = load i32*, i32** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %4, i32** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %7 = load i32*, i32** %6, align 8, !dbg !49
  store i32* %7, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %8 = bitcast [50 x i32]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 200, i1 false), !dbg !55
  %arraydecay3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !56
  %9 = load i32*, i32** %data2, align 8, !dbg !57
  %call4 = call i64 @wcslen(i32* %9) #7, !dbg !58
  %10 = load i32*, i32** %data2, align 8, !dbg !59
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay3, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %10) #6, !dbg !60
  %11 = load i32*, i32** %data2, align 8, !dbg !61
  call void @printWLine(i32* %11), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !90, metadata !DIExpression()), !dbg !91
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !92, metadata !DIExpression()), !dbg !93
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !101
  %1 = load i32*, i32** %0, align 8, !dbg !102
  store i32* %1, i32** %data1, align 8, !dbg !100
  %2 = load i32*, i32** %data1, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !104
  %3 = load i32*, i32** %data1, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %4 = load i32*, i32** %data1, align 8, !dbg !107
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !108
  store i32* %4, i32** %5, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !110, metadata !DIExpression()), !dbg !112
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !113
  %7 = load i32*, i32** %6, align 8, !dbg !114
  store i32* %7, i32** %data2, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %8 = bitcast [50 x i32]* %dest to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 200, i1 false), !dbg !117
  %arraydecay3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !118
  %9 = load i32*, i32** %data2, align 8, !dbg !119
  %call4 = call i64 @wcslen(i32* %9) #7, !dbg !120
  %10 = load i32*, i32** %data2, align 8, !dbg !121
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay3, i64 %call4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %10) #6, !dbg !122
  %11 = load i32*, i32** %data2, align 8, !dbg !123
  call void @printWLine(i32* %11), !dbg !124
  ret void, !dbg !125
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 32, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 33, type: !22)
!25 = !DILocation(line: 33, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 34, column: 13, scope: !11)
!31 = !DILocation(line: 35, column: 12, scope: !11)
!32 = !DILocation(line: 35, column: 10, scope: !11)
!33 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 37, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!35 = !DILocation(line: 37, column: 19, scope: !34)
!36 = !DILocation(line: 37, column: 27, scope: !34)
!37 = !DILocation(line: 37, column: 26, scope: !34)
!38 = !DILocation(line: 39, column: 17, scope: !34)
!39 = !DILocation(line: 39, column: 9, scope: !34)
!40 = !DILocation(line: 40, column: 9, scope: !34)
!41 = !DILocation(line: 40, column: 21, scope: !34)
!42 = !DILocation(line: 41, column: 21, scope: !34)
!43 = !DILocation(line: 41, column: 10, scope: !34)
!44 = !DILocation(line: 41, column: 19, scope: !34)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 44, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!47 = !DILocation(line: 44, column: 19, scope: !46)
!48 = !DILocation(line: 44, column: 27, scope: !46)
!49 = !DILocation(line: 44, column: 26, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !12, line: 46, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !12, line: 45, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 46, column: 21, scope: !51)
!56 = !DILocation(line: 48, column: 22, scope: !51)
!57 = !DILocation(line: 48, column: 35, scope: !51)
!58 = !DILocation(line: 48, column: 28, scope: !51)
!59 = !DILocation(line: 48, column: 49, scope: !51)
!60 = !DILocation(line: 48, column: 13, scope: !51)
!61 = !DILocation(line: 49, column: 24, scope: !51)
!62 = !DILocation(line: 49, column: 13, scope: !51)
!63 = !DILocation(line: 52, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_32_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 86, column: 5, scope: !64)
!66 = !DILocation(line: 87, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !68, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!19, !19, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 98, type: !19)
!74 = !DILocation(line: 98, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 98, type: !70)
!76 = !DILocation(line: 98, column: 27, scope: !67)
!77 = !DILocation(line: 101, column: 22, scope: !67)
!78 = !DILocation(line: 101, column: 12, scope: !67)
!79 = !DILocation(line: 101, column: 5, scope: !67)
!80 = !DILocation(line: 103, column: 5, scope: !67)
!81 = !DILocation(line: 104, column: 5, scope: !67)
!82 = !DILocation(line: 105, column: 5, scope: !67)
!83 = !DILocation(line: 108, column: 5, scope: !67)
!84 = !DILocation(line: 109, column: 5, scope: !67)
!85 = !DILocation(line: 110, column: 5, scope: !67)
!86 = !DILocation(line: 112, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 61, type: !16)
!89 = !DILocation(line: 61, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataPtr1", scope: !87, file: !12, line: 62, type: !22)
!91 = !DILocation(line: 62, column: 16, scope: !87)
!92 = !DILocalVariable(name: "dataPtr2", scope: !87, file: !12, line: 63, type: !22)
!93 = !DILocation(line: 63, column: 16, scope: !87)
!94 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !12, line: 64, type: !27)
!95 = !DILocation(line: 64, column: 13, scope: !87)
!96 = !DILocation(line: 65, column: 12, scope: !87)
!97 = !DILocation(line: 65, column: 10, scope: !87)
!98 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 67, type: !16)
!99 = distinct !DILexicalBlock(scope: !87, file: !12, line: 66, column: 5)
!100 = !DILocation(line: 67, column: 19, scope: !99)
!101 = !DILocation(line: 67, column: 27, scope: !99)
!102 = !DILocation(line: 67, column: 26, scope: !99)
!103 = !DILocation(line: 69, column: 17, scope: !99)
!104 = !DILocation(line: 69, column: 9, scope: !99)
!105 = !DILocation(line: 70, column: 9, scope: !99)
!106 = !DILocation(line: 70, column: 20, scope: !99)
!107 = !DILocation(line: 71, column: 21, scope: !99)
!108 = !DILocation(line: 71, column: 10, scope: !99)
!109 = !DILocation(line: 71, column: 19, scope: !99)
!110 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 74, type: !16)
!111 = distinct !DILexicalBlock(scope: !87, file: !12, line: 73, column: 5)
!112 = !DILocation(line: 74, column: 19, scope: !111)
!113 = !DILocation(line: 74, column: 27, scope: !111)
!114 = !DILocation(line: 74, column: 26, scope: !111)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !12, line: 76, type: !52)
!116 = distinct !DILexicalBlock(scope: !111, file: !12, line: 75, column: 9)
!117 = !DILocation(line: 76, column: 21, scope: !116)
!118 = !DILocation(line: 78, column: 22, scope: !116)
!119 = !DILocation(line: 78, column: 35, scope: !116)
!120 = !DILocation(line: 78, column: 28, scope: !116)
!121 = !DILocation(line: 78, column: 49, scope: !116)
!122 = !DILocation(line: 78, column: 13, scope: !116)
!123 = !DILocation(line: 79, column: 24, scope: !116)
!124 = !DILocation(line: 79, column: 13, scope: !116)
!125 = !DILocation(line: 82, column: 1, scope: !87)
