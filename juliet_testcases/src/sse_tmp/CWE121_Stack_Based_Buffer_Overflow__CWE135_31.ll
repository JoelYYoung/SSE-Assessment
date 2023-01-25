; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  store i8* %0, i8** %dataCopy, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !32
  store i8* %1, i8** %data1, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !33, metadata !DIExpression()), !dbg !37
  %2 = load i8*, i8** %data1, align 8, !dbg !38
  %call = call i64 @strlen(i8* %2) #5, !dbg !39
  store i64 %call, i64* %dataLen, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !40, metadata !DIExpression()), !dbg !41
  %3 = load i64, i64* %dataLen, align 8, !dbg !42
  %add = add i64 %3, 1, !dbg !42
  %mul = mul i64 %add, 4, !dbg !42
  %4 = alloca i8, i64 %mul, align 16, !dbg !42
  store i8* %4, i8** %dest, align 8, !dbg !41
  %5 = load i8*, i8** %dest, align 8, !dbg !43
  %6 = bitcast i8* %5 to i32*, !dbg !43
  %7 = load i8*, i8** %data1, align 8, !dbg !44
  %8 = bitcast i8* %7 to i32*, !dbg !44
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !45
  %9 = load i8*, i8** %dest, align 8, !dbg !46
  call void @printLine(i8* %9), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_31_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  call void @goodB2G(), !dbg !51
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_31_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_31_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !76, metadata !DIExpression()), !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  store i8* %0, i8** %dataCopy, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !82
  store i8* %1, i8** %data1, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !83, metadata !DIExpression()), !dbg !85
  %2 = load i8*, i8** %data1, align 8, !dbg !86
  %call = call i64 @strlen(i8* %2) #5, !dbg !87
  store i64 %call, i64* %dataLen, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !88, metadata !DIExpression()), !dbg !89
  %3 = load i64, i64* %dataLen, align 8, !dbg !90
  %add = add i64 %3, 1, !dbg !90
  %mul = mul i64 %add, 1, !dbg !90
  %4 = alloca i8, i64 %mul, align 16, !dbg !90
  store i8* %4, i8** %dest, align 8, !dbg !89
  %5 = load i8*, i8** %dest, align 8, !dbg !91
  %6 = load i8*, i8** %data1, align 8, !dbg !92
  %call2 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !93
  %7 = load i8*, i8** %dest, align 8, !dbg !94
  call void @printLine(i8* %7), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !102, metadata !DIExpression()), !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  store i8* %0, i8** %dataCopy, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !106, metadata !DIExpression()), !dbg !107
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !108
  store i8* %1, i8** %data1, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = load i8*, i8** %data1, align 8, !dbg !112
  %3 = bitcast i8* %2 to i32*, !dbg !113
  %call = call i64 @wcslen(i32* %3) #5, !dbg !114
  store i64 %call, i64* %dataLen, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !115, metadata !DIExpression()), !dbg !116
  %4 = load i64, i64* %dataLen, align 8, !dbg !117
  %add = add i64 %4, 1, !dbg !117
  %mul = mul i64 %add, 4, !dbg !117
  %5 = alloca i8, i64 %mul, align 16, !dbg !117
  store i8* %5, i8** %dest, align 8, !dbg !116
  %6 = load i8*, i8** %dest, align 8, !dbg !118
  %7 = bitcast i8* %6 to i32*, !dbg !118
  %8 = load i8*, i8** %data1, align 8, !dbg !119
  %9 = bitcast i8* %8 to i32*, !dbg !119
  %call2 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !120
  %10 = load i8*, i8** %dest, align 8, !dbg !121
  %11 = bitcast i8* %10 to i32*, !dbg !122
  call void @printWLine(i32* %11), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_31_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_31.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 32, column: 10, scope: !18)
!26 = !DILocalVariable(name: "dataCopy", scope: !27, file: !19, line: 34, type: !4)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 33, column: 5)
!28 = !DILocation(line: 34, column: 16, scope: !27)
!29 = !DILocation(line: 34, column: 27, scope: !27)
!30 = !DILocalVariable(name: "data", scope: !27, file: !19, line: 35, type: !4)
!31 = !DILocation(line: 35, column: 16, scope: !27)
!32 = !DILocation(line: 35, column: 23, scope: !27)
!33 = !DILocalVariable(name: "dataLen", scope: !34, file: !19, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !27, file: !19, line: 36, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 38, column: 20, scope: !34)
!38 = !DILocation(line: 38, column: 45, scope: !34)
!39 = !DILocation(line: 38, column: 30, scope: !34)
!40 = !DILocalVariable(name: "dest", scope: !34, file: !19, line: 39, type: !4)
!41 = !DILocation(line: 39, column: 20, scope: !34)
!42 = !DILocation(line: 39, column: 35, scope: !34)
!43 = !DILocation(line: 40, column: 26, scope: !34)
!44 = !DILocation(line: 40, column: 32, scope: !34)
!45 = !DILocation(line: 40, column: 19, scope: !34)
!46 = !DILocation(line: 41, column: 31, scope: !34)
!47 = !DILocation(line: 41, column: 13, scope: !34)
!48 = !DILocation(line: 44, column: 1, scope: !18)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_31_good", scope: !19, file: !19, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 92, column: 5, scope: !49)
!51 = !DILocation(line: 93, column: 5, scope: !49)
!52 = !DILocation(line: 94, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 104, type: !54, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!11, !11, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !19, line: 104, type: !11)
!58 = !DILocation(line: 104, column: 14, scope: !53)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !19, line: 104, type: !56)
!60 = !DILocation(line: 104, column: 27, scope: !53)
!61 = !DILocation(line: 107, column: 22, scope: !53)
!62 = !DILocation(line: 107, column: 12, scope: !53)
!63 = !DILocation(line: 107, column: 5, scope: !53)
!64 = !DILocation(line: 109, column: 5, scope: !53)
!65 = !DILocation(line: 110, column: 5, scope: !53)
!66 = !DILocation(line: 111, column: 5, scope: !53)
!67 = !DILocation(line: 114, column: 5, scope: !53)
!68 = !DILocation(line: 115, column: 5, scope: !53)
!69 = !DILocation(line: 116, column: 5, scope: !53)
!70 = !DILocation(line: 118, column: 5, scope: !53)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !19, line: 53, type: !4)
!73 = !DILocation(line: 53, column: 12, scope: !71)
!74 = !DILocation(line: 54, column: 10, scope: !71)
!75 = !DILocation(line: 56, column: 10, scope: !71)
!76 = !DILocalVariable(name: "dataCopy", scope: !77, file: !19, line: 58, type: !4)
!77 = distinct !DILexicalBlock(scope: !71, file: !19, line: 57, column: 5)
!78 = !DILocation(line: 58, column: 16, scope: !77)
!79 = !DILocation(line: 58, column: 27, scope: !77)
!80 = !DILocalVariable(name: "data", scope: !77, file: !19, line: 59, type: !4)
!81 = !DILocation(line: 59, column: 16, scope: !77)
!82 = !DILocation(line: 59, column: 23, scope: !77)
!83 = !DILocalVariable(name: "dataLen", scope: !84, file: !19, line: 62, type: !35)
!84 = distinct !DILexicalBlock(scope: !77, file: !19, line: 60, column: 9)
!85 = !DILocation(line: 62, column: 20, scope: !84)
!86 = !DILocation(line: 62, column: 45, scope: !84)
!87 = !DILocation(line: 62, column: 30, scope: !84)
!88 = !DILocalVariable(name: "dest", scope: !84, file: !19, line: 63, type: !4)
!89 = !DILocation(line: 63, column: 20, scope: !84)
!90 = !DILocation(line: 63, column: 35, scope: !84)
!91 = !DILocation(line: 64, column: 26, scope: !84)
!92 = !DILocation(line: 64, column: 32, scope: !84)
!93 = !DILocation(line: 64, column: 19, scope: !84)
!94 = !DILocation(line: 65, column: 31, scope: !84)
!95 = !DILocation(line: 65, column: 13, scope: !84)
!96 = !DILocation(line: 68, column: 1, scope: !71)
!97 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 73, type: !4)
!99 = !DILocation(line: 73, column: 12, scope: !97)
!100 = !DILocation(line: 74, column: 10, scope: !97)
!101 = !DILocation(line: 76, column: 10, scope: !97)
!102 = !DILocalVariable(name: "dataCopy", scope: !103, file: !19, line: 78, type: !4)
!103 = distinct !DILexicalBlock(scope: !97, file: !19, line: 77, column: 5)
!104 = !DILocation(line: 78, column: 16, scope: !103)
!105 = !DILocation(line: 78, column: 27, scope: !103)
!106 = !DILocalVariable(name: "data", scope: !103, file: !19, line: 79, type: !4)
!107 = !DILocation(line: 79, column: 16, scope: !103)
!108 = !DILocation(line: 79, column: 23, scope: !103)
!109 = !DILocalVariable(name: "dataLen", scope: !110, file: !19, line: 82, type: !35)
!110 = distinct !DILexicalBlock(scope: !103, file: !19, line: 80, column: 9)
!111 = !DILocation(line: 82, column: 20, scope: !110)
!112 = !DILocation(line: 82, column: 48, scope: !110)
!113 = !DILocation(line: 82, column: 37, scope: !110)
!114 = !DILocation(line: 82, column: 30, scope: !110)
!115 = !DILocalVariable(name: "dest", scope: !110, file: !19, line: 83, type: !4)
!116 = !DILocation(line: 83, column: 20, scope: !110)
!117 = !DILocation(line: 83, column: 35, scope: !110)
!118 = !DILocation(line: 84, column: 26, scope: !110)
!119 = !DILocation(line: 84, column: 32, scope: !110)
!120 = !DILocation(line: 84, column: 19, scope: !110)
!121 = !DILocation(line: 85, column: 35, scope: !110)
!122 = !DILocation(line: 85, column: 24, scope: !110)
!123 = !DILocation(line: 85, column: 13, scope: !110)
!124 = !DILocation(line: 88, column: 1, scope: !97)
