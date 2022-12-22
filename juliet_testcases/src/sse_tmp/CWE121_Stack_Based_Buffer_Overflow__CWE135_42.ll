; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_42_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %call = call i8* @badSource(i8* %0), !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %call1 = call i64 @strlen(i8* %1) #5, !dbg !34
  store i64 %call1, i64* %dataLen, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = load i64, i64* %dataLen, align 8, !dbg !37
  %add = add i64 %2, 1, !dbg !37
  %mul = mul i64 %add, 4, !dbg !37
  %3 = alloca i8, i64 %mul, align 16, !dbg !37
  store i8* %3, i8** %dest, align 8, !dbg !36
  %4 = load i8*, i8** %dest, align 8, !dbg !38
  %5 = bitcast i8* %4 to i32*, !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !39
  %7 = bitcast i8* %6 to i32*, !dbg !39
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !40
  %8 = load i8*, i8** %dest, align 8, !dbg !41
  call void @printLine(i8* %8), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8* bitcast ([43 x i32]* @.str.4 to i8*), i8** %data.addr, align 8, !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  ret i8* %0, !dbg !51
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_42_good() #0 !dbg !52 {
entry:
  call void @goodB2G(), !dbg !53
  call void @goodG2B(), !dbg !54
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
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_42_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_42_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* null, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %call = call i8* @goodB2GSource(i8* %0), !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = load i8*, i8** %data, align 8, !dbg !84
  %2 = bitcast i8* %1 to i32*, !dbg !85
  %call1 = call i64 @wcslen(i32* %2) #5, !dbg !86
  store i64 %call1, i64* %dataLen, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !87, metadata !DIExpression()), !dbg !88
  %3 = load i64, i64* %dataLen, align 8, !dbg !89
  %add = add i64 %3, 1, !dbg !89
  %mul = mul i64 %add, 4, !dbg !89
  %4 = alloca i8, i64 %mul, align 16, !dbg !89
  store i8* %4, i8** %dest, align 8, !dbg !88
  %5 = load i8*, i8** %dest, align 8, !dbg !90
  %6 = bitcast i8* %5 to i32*, !dbg !90
  %7 = load i8*, i8** %data, align 8, !dbg !91
  %8 = bitcast i8* %7 to i32*, !dbg !91
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !92
  %9 = load i8*, i8** %dest, align 8, !dbg !93
  %10 = bitcast i8* %9 to i32*, !dbg !94
  call void @printWLine(i32* %10), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodB2GSource(i8* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* bitcast ([43 x i32]* @.str.4 to i8*), i8** %data.addr, align 8, !dbg !100
  %0 = load i8*, i8** %data.addr, align 8, !dbg !101
  ret i8* %0, !dbg !102
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %call = call i8* @goodG2BSource(i8* %0), !dbg !108
  store i8* %call, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %call1 = call i64 @strlen(i8* %1) #5, !dbg !114
  store i64 %call1, i64* %dataLen, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = load i64, i64* %dataLen, align 8, !dbg !117
  %add = add i64 %2, 1, !dbg !117
  %mul = mul i64 %add, 1, !dbg !117
  %3 = alloca i8, i64 %mul, align 16, !dbg !117
  store i8* %3, i8** %dest, align 8, !dbg !116
  %4 = load i8*, i8** %dest, align 8, !dbg !118
  %5 = load i8*, i8** %data, align 8, !dbg !119
  %call2 = call i8* @strcpy(i8* %4, i8* %5) #6, !dbg !120
  %6 = load i8*, i8** %dest, align 8, !dbg !121
  call void @printLine(i8* %6), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !124 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data.addr, align 8, !dbg !127
  %0 = load i8*, i8** %data.addr, align 8, !dbg !128
  ret i8* %0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_42_bad", scope: !19, file: !19, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_42.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 36, type: !4)
!23 = !DILocation(line: 36, column: 12, scope: !18)
!24 = !DILocation(line: 37, column: 10, scope: !18)
!25 = !DILocation(line: 38, column: 22, scope: !18)
!26 = !DILocation(line: 38, column: 12, scope: !18)
!27 = !DILocation(line: 38, column: 10, scope: !18)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !19, line: 41, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 41, column: 16, scope: !29)
!33 = !DILocation(line: 41, column: 41, scope: !29)
!34 = !DILocation(line: 41, column: 26, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !29, file: !19, line: 42, type: !4)
!36 = !DILocation(line: 42, column: 16, scope: !29)
!37 = !DILocation(line: 42, column: 31, scope: !29)
!38 = !DILocation(line: 43, column: 22, scope: !29)
!39 = !DILocation(line: 43, column: 28, scope: !29)
!40 = !DILocation(line: 43, column: 15, scope: !29)
!41 = !DILocation(line: 44, column: 27, scope: !29)
!42 = !DILocation(line: 44, column: 9, scope: !29)
!43 = !DILocation(line: 46, column: 1, scope: !18)
!44 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 27, type: !45, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!4, !4}
!47 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !19, line: 27, type: !4)
!48 = !DILocation(line: 27, column: 32, scope: !44)
!49 = !DILocation(line: 30, column: 10, scope: !44)
!50 = !DILocation(line: 31, column: 12, scope: !44)
!51 = !DILocation(line: 31, column: 5, scope: !44)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_42_good", scope: !19, file: !19, line: 96, type: !20, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 98, column: 5, scope: !52)
!54 = !DILocation(line: 99, column: 5, scope: !52)
!55 = !DILocation(line: 100, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 111, type: !57, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!11, !11, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !19, line: 111, type: !11)
!61 = !DILocation(line: 111, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !19, line: 111, type: !59)
!63 = !DILocation(line: 111, column: 27, scope: !56)
!64 = !DILocation(line: 114, column: 22, scope: !56)
!65 = !DILocation(line: 114, column: 12, scope: !56)
!66 = !DILocation(line: 114, column: 5, scope: !56)
!67 = !DILocation(line: 116, column: 5, scope: !56)
!68 = !DILocation(line: 117, column: 5, scope: !56)
!69 = !DILocation(line: 118, column: 5, scope: !56)
!70 = !DILocation(line: 121, column: 5, scope: !56)
!71 = !DILocation(line: 122, column: 5, scope: !56)
!72 = !DILocation(line: 123, column: 5, scope: !56)
!73 = !DILocation(line: 125, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !19, line: 84, type: !4)
!76 = !DILocation(line: 84, column: 12, scope: !74)
!77 = !DILocation(line: 85, column: 10, scope: !74)
!78 = !DILocation(line: 86, column: 26, scope: !74)
!79 = !DILocation(line: 86, column: 12, scope: !74)
!80 = !DILocation(line: 86, column: 10, scope: !74)
!81 = !DILocalVariable(name: "dataLen", scope: !82, file: !19, line: 89, type: !30)
!82 = distinct !DILexicalBlock(scope: !74, file: !19, line: 87, column: 5)
!83 = !DILocation(line: 89, column: 16, scope: !82)
!84 = !DILocation(line: 89, column: 44, scope: !82)
!85 = !DILocation(line: 89, column: 33, scope: !82)
!86 = !DILocation(line: 89, column: 26, scope: !82)
!87 = !DILocalVariable(name: "dest", scope: !82, file: !19, line: 90, type: !4)
!88 = !DILocation(line: 90, column: 16, scope: !82)
!89 = !DILocation(line: 90, column: 31, scope: !82)
!90 = !DILocation(line: 91, column: 22, scope: !82)
!91 = !DILocation(line: 91, column: 28, scope: !82)
!92 = !DILocation(line: 91, column: 15, scope: !82)
!93 = !DILocation(line: 92, column: 31, scope: !82)
!94 = !DILocation(line: 92, column: 20, scope: !82)
!95 = !DILocation(line: 92, column: 9, scope: !82)
!96 = !DILocation(line: 94, column: 1, scope: !74)
!97 = distinct !DISubprogram(name: "goodB2GSource", scope: !19, file: !19, line: 75, type: !45, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !19, line: 75, type: !4)
!99 = !DILocation(line: 75, column: 36, scope: !97)
!100 = !DILocation(line: 78, column: 10, scope: !97)
!101 = !DILocation(line: 79, column: 12, scope: !97)
!102 = !DILocation(line: 79, column: 5, scope: !97)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !19, line: 62, type: !4)
!105 = !DILocation(line: 62, column: 12, scope: !103)
!106 = !DILocation(line: 63, column: 10, scope: !103)
!107 = !DILocation(line: 64, column: 26, scope: !103)
!108 = !DILocation(line: 64, column: 12, scope: !103)
!109 = !DILocation(line: 64, column: 10, scope: !103)
!110 = !DILocalVariable(name: "dataLen", scope: !111, file: !19, line: 67, type: !30)
!111 = distinct !DILexicalBlock(scope: !103, file: !19, line: 65, column: 5)
!112 = !DILocation(line: 67, column: 16, scope: !111)
!113 = !DILocation(line: 67, column: 41, scope: !111)
!114 = !DILocation(line: 67, column: 26, scope: !111)
!115 = !DILocalVariable(name: "dest", scope: !111, file: !19, line: 68, type: !4)
!116 = !DILocation(line: 68, column: 16, scope: !111)
!117 = !DILocation(line: 68, column: 31, scope: !111)
!118 = !DILocation(line: 69, column: 22, scope: !111)
!119 = !DILocation(line: 69, column: 28, scope: !111)
!120 = !DILocation(line: 69, column: 15, scope: !111)
!121 = !DILocation(line: 70, column: 27, scope: !111)
!122 = !DILocation(line: 70, column: 9, scope: !111)
!123 = !DILocation(line: 72, column: 1, scope: !103)
!124 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 53, type: !45, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", arg: 1, scope: !124, file: !19, line: 53, type: !4)
!126 = !DILocation(line: 53, column: 36, scope: !124)
!127 = !DILocation(line: 56, column: 10, scope: !124)
!128 = !DILocation(line: 57, column: 12, scope: !124)
!129 = !DILocation(line: 57, column: 5, scope: !124)
