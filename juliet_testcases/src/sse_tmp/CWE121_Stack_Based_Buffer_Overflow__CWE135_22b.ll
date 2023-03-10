; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badGlobal = external dso_local global i32, align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Global = external dso_local global i32, align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badSink(i8* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badGlobal, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  %call = call i64 @strlen(i8* %1) #5, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = load i64, i64* %dataLen, align 8, !dbg !36
  %add = add i64 %2, 1, !dbg !36
  %mul = mul i64 %add, 4, !dbg !36
  %3 = alloca i8, i64 %mul, align 16, !dbg !36
  store i8* %3, i8** %dest, align 8, !dbg !35
  %4 = load i8*, i8** %dest, align 8, !dbg !37
  %5 = bitcast i8* %4 to i32*, !dbg !37
  %6 = load i8*, i8** %data.addr, align 8, !dbg !38
  %7 = bitcast i8* %6 to i32*, !dbg !38
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !39
  %8 = load i8*, i8** %dest, align 8, !dbg !40
  call void @printLine(i8* %8), !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink(i8* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Global, align 4, !dbg !47
  %tobool = icmp ne i32 %0, 0, !dbg !47
  br i1 %tobool, label %if.then, label %if.else, !dbg !49

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !50
  br label %if.end, !dbg !52

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !56
  %1 = load i8*, i8** %data.addr, align 8, !dbg !57
  %2 = bitcast i8* %1 to i32*, !dbg !58
  %call = call i64 @wcslen(i32* %2) #5, !dbg !59
  store i64 %call, i64* %dataLen, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !60, metadata !DIExpression()), !dbg !61
  %3 = load i64, i64* %dataLen, align 8, !dbg !62
  %add = add i64 %3, 1, !dbg !62
  %mul = mul i64 %add, 4, !dbg !62
  %4 = alloca i8, i64 %mul, align 16, !dbg !62
  store i8* %4, i8** %dest, align 8, !dbg !61
  %5 = load i8*, i8** %dest, align 8, !dbg !63
  %6 = bitcast i8* %5 to i32*, !dbg !63
  %7 = load i8*, i8** %data.addr, align 8, !dbg !64
  %8 = bitcast i8* %7 to i32*, !dbg !64
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !65
  %9 = load i8*, i8** %dest, align 8, !dbg !66
  %10 = bitcast i8* %9 to i32*, !dbg !67
  call void @printWLine(i32* %10), !dbg !68
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !69
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink(i8* %data) #0 !dbg !70 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Global, align 4, !dbg !73
  %tobool = icmp ne i32 %0, 0, !dbg !73
  br i1 %tobool, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !76, metadata !DIExpression()), !dbg !79
  %1 = load i8*, i8** %data.addr, align 8, !dbg !80
  %2 = bitcast i8* %1 to i32*, !dbg !81
  %call = call i64 @wcslen(i32* %2) #5, !dbg !82
  store i64 %call, i64* %dataLen, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !83, metadata !DIExpression()), !dbg !84
  %3 = load i64, i64* %dataLen, align 8, !dbg !85
  %add = add i64 %3, 1, !dbg !85
  %mul = mul i64 %add, 4, !dbg !85
  %4 = alloca i8, i64 %mul, align 16, !dbg !85
  store i8* %4, i8** %dest, align 8, !dbg !84
  %5 = load i8*, i8** %dest, align 8, !dbg !86
  %6 = bitcast i8* %5 to i32*, !dbg !86
  %7 = load i8*, i8** %data.addr, align 8, !dbg !87
  %8 = bitcast i8* %7 to i32*, !dbg !87
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !88
  %9 = load i8*, i8** %dest, align 8, !dbg !89
  %10 = bitcast i8* %9 to i32*, !dbg !90
  call void @printWLine(i32* %10), !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BSink(i8* %data) #0 !dbg !94 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal, align 4, !dbg !97
  %tobool = icmp ne i32 %0, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !100, metadata !DIExpression()), !dbg !103
  %1 = load i8*, i8** %data.addr, align 8, !dbg !104
  %call = call i64 @strlen(i8* %1) #5, !dbg !105
  store i64 %call, i64* %dataLen, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = load i64, i64* %dataLen, align 8, !dbg !108
  %add = add i64 %2, 1, !dbg !108
  %mul = mul i64 %add, 1, !dbg !108
  %3 = alloca i8, i64 %mul, align 16, !dbg !108
  store i8* %3, i8** %dest, align 8, !dbg !107
  %4 = load i8*, i8** %dest, align 8, !dbg !109
  %5 = load i8*, i8** %data.addr, align 8, !dbg !110
  %call1 = call i8* @strcpy(i8* %4, i8* %5) #6, !dbg !111
  %6 = load i8*, i8** %dest, align 8, !dbg !112
  call void @printLine(i8* %6), !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !115
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
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badSink", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !6}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 27, type: !6)
!22 = !DILocation(line: 27, column: 67, scope: !17)
!23 = !DILocation(line: 29, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 8)
!25 = !DILocation(line: 29, column: 8, scope: !17)
!26 = !DILocalVariable(name: "dataLen", scope: !27, file: !18, line: 33, type: !29)
!27 = distinct !DILexicalBlock(scope: !28, file: !18, line: 31, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !18, line: 30, column: 5)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !30)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 33, column: 20, scope: !27)
!32 = !DILocation(line: 33, column: 45, scope: !27)
!33 = !DILocation(line: 33, column: 30, scope: !27)
!34 = !DILocalVariable(name: "dest", scope: !27, file: !18, line: 34, type: !6)
!35 = !DILocation(line: 34, column: 20, scope: !27)
!36 = !DILocation(line: 34, column: 35, scope: !27)
!37 = !DILocation(line: 35, column: 26, scope: !27)
!38 = !DILocation(line: 35, column: 32, scope: !27)
!39 = !DILocation(line: 35, column: 19, scope: !27)
!40 = !DILocation(line: 36, column: 31, scope: !27)
!41 = !DILocation(line: 36, column: 13, scope: !27)
!42 = !DILocation(line: 38, column: 5, scope: !28)
!43 = !DILocation(line: 39, column: 1, scope: !17)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !18, line: 51, type: !6)
!46 = !DILocation(line: 51, column: 72, scope: !44)
!47 = !DILocation(line: 53, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !18, line: 53, column: 8)
!49 = !DILocation(line: 53, column: 8, scope: !44)
!50 = !DILocation(line: 56, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !18, line: 54, column: 5)
!52 = !DILocation(line: 57, column: 5, scope: !51)
!53 = !DILocalVariable(name: "dataLen", scope: !54, file: !18, line: 62, type: !29)
!54 = distinct !DILexicalBlock(scope: !55, file: !18, line: 60, column: 9)
!55 = distinct !DILexicalBlock(scope: !48, file: !18, line: 59, column: 5)
!56 = !DILocation(line: 62, column: 20, scope: !54)
!57 = !DILocation(line: 62, column: 48, scope: !54)
!58 = !DILocation(line: 62, column: 37, scope: !54)
!59 = !DILocation(line: 62, column: 30, scope: !54)
!60 = !DILocalVariable(name: "dest", scope: !54, file: !18, line: 63, type: !6)
!61 = !DILocation(line: 63, column: 20, scope: !54)
!62 = !DILocation(line: 63, column: 35, scope: !54)
!63 = !DILocation(line: 64, column: 26, scope: !54)
!64 = !DILocation(line: 64, column: 32, scope: !54)
!65 = !DILocation(line: 64, column: 19, scope: !54)
!66 = !DILocation(line: 65, column: 35, scope: !54)
!67 = !DILocation(line: 65, column: 24, scope: !54)
!68 = !DILocation(line: 65, column: 13, scope: !54)
!69 = !DILocation(line: 68, column: 1, scope: !44)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink", scope: !18, file: !18, line: 71, type: !19, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", arg: 1, scope: !70, file: !18, line: 71, type: !6)
!72 = !DILocation(line: 71, column: 72, scope: !70)
!73 = !DILocation(line: 73, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !18, line: 73, column: 8)
!75 = !DILocation(line: 73, column: 8, scope: !70)
!76 = !DILocalVariable(name: "dataLen", scope: !77, file: !18, line: 77, type: !29)
!77 = distinct !DILexicalBlock(scope: !78, file: !18, line: 75, column: 9)
!78 = distinct !DILexicalBlock(scope: !74, file: !18, line: 74, column: 5)
!79 = !DILocation(line: 77, column: 20, scope: !77)
!80 = !DILocation(line: 77, column: 48, scope: !77)
!81 = !DILocation(line: 77, column: 37, scope: !77)
!82 = !DILocation(line: 77, column: 30, scope: !77)
!83 = !DILocalVariable(name: "dest", scope: !77, file: !18, line: 78, type: !6)
!84 = !DILocation(line: 78, column: 20, scope: !77)
!85 = !DILocation(line: 78, column: 35, scope: !77)
!86 = !DILocation(line: 79, column: 26, scope: !77)
!87 = !DILocation(line: 79, column: 32, scope: !77)
!88 = !DILocation(line: 79, column: 19, scope: !77)
!89 = !DILocation(line: 80, column: 35, scope: !77)
!90 = !DILocation(line: 80, column: 24, scope: !77)
!91 = !DILocation(line: 80, column: 13, scope: !77)
!92 = !DILocation(line: 82, column: 5, scope: !78)
!93 = !DILocation(line: 83, column: 1, scope: !70)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BSink", scope: !18, file: !18, line: 86, type: !19, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", arg: 1, scope: !94, file: !18, line: 86, type: !6)
!96 = !DILocation(line: 86, column: 71, scope: !94)
!97 = !DILocation(line: 88, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !18, line: 88, column: 8)
!99 = !DILocation(line: 88, column: 8, scope: !94)
!100 = !DILocalVariable(name: "dataLen", scope: !101, file: !18, line: 92, type: !29)
!101 = distinct !DILexicalBlock(scope: !102, file: !18, line: 90, column: 9)
!102 = distinct !DILexicalBlock(scope: !98, file: !18, line: 89, column: 5)
!103 = !DILocation(line: 92, column: 20, scope: !101)
!104 = !DILocation(line: 92, column: 45, scope: !101)
!105 = !DILocation(line: 92, column: 30, scope: !101)
!106 = !DILocalVariable(name: "dest", scope: !101, file: !18, line: 93, type: !6)
!107 = !DILocation(line: 93, column: 20, scope: !101)
!108 = !DILocation(line: 93, column: 35, scope: !101)
!109 = !DILocation(line: 94, column: 26, scope: !101)
!110 = !DILocation(line: 94, column: 32, scope: !101)
!111 = !DILocation(line: 94, column: 19, scope: !101)
!112 = !DILocation(line: 95, column: 31, scope: !101)
!113 = !DILocation(line: 95, column: 13, scope: !101)
!114 = !DILocation(line: 97, column: 5, scope: !102)
!115 = !DILocation(line: 98, column: 1, scope: !94)
