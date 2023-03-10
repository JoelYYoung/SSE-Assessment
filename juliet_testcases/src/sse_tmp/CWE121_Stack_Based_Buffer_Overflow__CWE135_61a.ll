; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_61_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_badSource(i8* %0), !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %call1 = call i64 @strlen(i8* %1) #6, !dbg !34
  store i64 %call1, i64* %dataLen, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = load i64, i64* %dataLen, align 8, !dbg !37
  %add = add i64 %2, 1, !dbg !38
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !39
  store i8* %call2, i8** %dest, align 8, !dbg !36
  %3 = load i8*, i8** %dest, align 8, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %5 = load i64, i64* %dataLen, align 8, !dbg !42
  %add3 = add i64 %5, 1, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 %add3, i1 false), !dbg !44
  %6 = load i8*, i8** %dest, align 8, !dbg !45
  call void @printLine(i8* %6), !dbg !46
  %7 = load i8*, i8** %dest, align 8, !dbg !47
  call void @free(i8* %7) #7, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_badSource(i8*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_61_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  call void @goodB2G(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_61_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_61_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i8* null, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodG2BSource(i8* %0), !dbg !77
  store i8* %call, i8** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !79, metadata !DIExpression()), !dbg !81
  %1 = load i8*, i8** %data, align 8, !dbg !82
  %call1 = call i64 @strlen(i8* %1) #6, !dbg !83
  store i64 %call1, i64* %dataLen, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = load i64, i64* %dataLen, align 8, !dbg !86
  %add = add i64 %2, 1, !dbg !87
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !88
  store i8* %call2, i8** %dest, align 8, !dbg !85
  %3 = load i8*, i8** %dest, align 8, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %5 = load i64, i64* %dataLen, align 8, !dbg !91
  %add3 = add i64 %5, 1, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 %add3, i1 false), !dbg !93
  %6 = load i8*, i8** %dest, align 8, !dbg !94
  call void @printLine(i8* %6), !dbg !95
  %7 = load i8*, i8** %dest, align 8, !dbg !96
  call void @free(i8* %7) #7, !dbg !97
  ret void, !dbg !98
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodG2BSource(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodB2GSource(i8* %0), !dbg !104
  store i8* %call, i8** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = load i8*, i8** %data, align 8, !dbg !109
  %2 = bitcast i8* %1 to i32*, !dbg !110
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !111
  store i64 %call1, i64* %dataLen, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !112, metadata !DIExpression()), !dbg !113
  %3 = load i64, i64* %dataLen, align 8, !dbg !114
  %add = add i64 %3, 1, !dbg !115
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !116
  store i8* %call2, i8** %dest, align 8, !dbg !113
  %4 = load i8*, i8** %dest, align 8, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  %6 = load i64, i64* %dataLen, align 8, !dbg !119
  %add3 = add i64 %6, 1, !dbg !120
  %mul = mul i64 %add3, 4, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 %5, i64 %mul, i1 false), !dbg !122
  %7 = load i8*, i8** %dest, align 8, !dbg !123
  %8 = bitcast i8* %7 to i32*, !dbg !124
  call void @printWLine(i32* %8), !dbg !125
  %9 = load i8*, i8** %dest, align 8, !dbg !126
  call void @free(i8* %9) #7, !dbg !127
  ret void, !dbg !128
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodB2GSource(i8*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_61_bad", scope: !19, file: !19, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61a.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !18)
!24 = !DILocation(line: 33, column: 10, scope: !18)
!25 = !DILocation(line: 34, column: 69, scope: !18)
!26 = !DILocation(line: 34, column: 12, scope: !18)
!27 = !DILocation(line: 34, column: 10, scope: !18)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !19, line: 37, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 37, column: 16, scope: !29)
!33 = !DILocation(line: 37, column: 41, scope: !29)
!34 = !DILocation(line: 37, column: 26, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !29, file: !19, line: 38, type: !4)
!36 = !DILocation(line: 38, column: 16, scope: !29)
!37 = !DILocation(line: 38, column: 38, scope: !29)
!38 = !DILocation(line: 38, column: 45, scope: !29)
!39 = !DILocation(line: 38, column: 31, scope: !29)
!40 = !DILocation(line: 39, column: 16, scope: !29)
!41 = !DILocation(line: 39, column: 22, scope: !29)
!42 = !DILocation(line: 39, column: 29, scope: !29)
!43 = !DILocation(line: 39, column: 36, scope: !29)
!44 = !DILocation(line: 39, column: 9, scope: !29)
!45 = !DILocation(line: 40, column: 27, scope: !29)
!46 = !DILocation(line: 40, column: 9, scope: !29)
!47 = !DILocation(line: 41, column: 14, scope: !29)
!48 = !DILocation(line: 41, column: 9, scope: !29)
!49 = !DILocation(line: 43, column: 1, scope: !18)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_61_good", scope: !19, file: !19, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 87, column: 5, scope: !50)
!52 = !DILocation(line: 88, column: 5, scope: !50)
!53 = !DILocation(line: 89, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 100, type: !55, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !11, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !19, line: 100, type: !11)
!59 = !DILocation(line: 100, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !19, line: 100, type: !57)
!61 = !DILocation(line: 100, column: 27, scope: !54)
!62 = !DILocation(line: 103, column: 22, scope: !54)
!63 = !DILocation(line: 103, column: 12, scope: !54)
!64 = !DILocation(line: 103, column: 5, scope: !54)
!65 = !DILocation(line: 105, column: 5, scope: !54)
!66 = !DILocation(line: 106, column: 5, scope: !54)
!67 = !DILocation(line: 107, column: 5, scope: !54)
!68 = !DILocation(line: 110, column: 5, scope: !54)
!69 = !DILocation(line: 111, column: 5, scope: !54)
!70 = !DILocation(line: 112, column: 5, scope: !54)
!71 = !DILocation(line: 114, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !19, line: 54, type: !4)
!74 = !DILocation(line: 54, column: 12, scope: !72)
!75 = !DILocation(line: 55, column: 10, scope: !72)
!76 = !DILocation(line: 56, column: 73, scope: !72)
!77 = !DILocation(line: 56, column: 12, scope: !72)
!78 = !DILocation(line: 56, column: 10, scope: !72)
!79 = !DILocalVariable(name: "dataLen", scope: !80, file: !19, line: 59, type: !30)
!80 = distinct !DILexicalBlock(scope: !72, file: !19, line: 57, column: 5)
!81 = !DILocation(line: 59, column: 16, scope: !80)
!82 = !DILocation(line: 59, column: 41, scope: !80)
!83 = !DILocation(line: 59, column: 26, scope: !80)
!84 = !DILocalVariable(name: "dest", scope: !80, file: !19, line: 60, type: !4)
!85 = !DILocation(line: 60, column: 16, scope: !80)
!86 = !DILocation(line: 60, column: 38, scope: !80)
!87 = !DILocation(line: 60, column: 45, scope: !80)
!88 = !DILocation(line: 60, column: 31, scope: !80)
!89 = !DILocation(line: 61, column: 16, scope: !80)
!90 = !DILocation(line: 61, column: 22, scope: !80)
!91 = !DILocation(line: 61, column: 29, scope: !80)
!92 = !DILocation(line: 61, column: 36, scope: !80)
!93 = !DILocation(line: 61, column: 9, scope: !80)
!94 = !DILocation(line: 62, column: 27, scope: !80)
!95 = !DILocation(line: 62, column: 9, scope: !80)
!96 = !DILocation(line: 63, column: 14, scope: !80)
!97 = !DILocation(line: 63, column: 9, scope: !80)
!98 = !DILocation(line: 65, column: 1, scope: !72)
!99 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !19, line: 72, type: !4)
!101 = !DILocation(line: 72, column: 12, scope: !99)
!102 = !DILocation(line: 73, column: 10, scope: !99)
!103 = !DILocation(line: 74, column: 73, scope: !99)
!104 = !DILocation(line: 74, column: 12, scope: !99)
!105 = !DILocation(line: 74, column: 10, scope: !99)
!106 = !DILocalVariable(name: "dataLen", scope: !107, file: !19, line: 77, type: !30)
!107 = distinct !DILexicalBlock(scope: !99, file: !19, line: 75, column: 5)
!108 = !DILocation(line: 77, column: 16, scope: !107)
!109 = !DILocation(line: 77, column: 44, scope: !107)
!110 = !DILocation(line: 77, column: 33, scope: !107)
!111 = !DILocation(line: 77, column: 26, scope: !107)
!112 = !DILocalVariable(name: "dest", scope: !107, file: !19, line: 78, type: !4)
!113 = !DILocation(line: 78, column: 16, scope: !107)
!114 = !DILocation(line: 78, column: 38, scope: !107)
!115 = !DILocation(line: 78, column: 45, scope: !107)
!116 = !DILocation(line: 78, column: 31, scope: !107)
!117 = !DILocation(line: 79, column: 16, scope: !107)
!118 = !DILocation(line: 79, column: 22, scope: !107)
!119 = !DILocation(line: 79, column: 29, scope: !107)
!120 = !DILocation(line: 79, column: 36, scope: !107)
!121 = !DILocation(line: 79, column: 39, scope: !107)
!122 = !DILocation(line: 79, column: 9, scope: !107)
!123 = !DILocation(line: 80, column: 31, scope: !107)
!124 = !DILocation(line: 80, column: 20, scope: !107)
!125 = !DILocation(line: 80, column: 9, scope: !107)
!126 = !DILocation(line: 81, column: 14, scope: !107)
!127 = !DILocation(line: 81, column: 9, scope: !107)
!128 = !DILocation(line: 83, column: 1, scope: !99)
