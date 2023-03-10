; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_badSink(i8** %dataArray) #0 !dbg !17 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !26
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !26
  store i8* %1, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !27, metadata !DIExpression()), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %call = call i64 @strlen(i8* %2) #6, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i64, i64* %dataLen, align 8, !dbg !36
  %add = add i64 %3, 1, !dbg !37
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !38
  store i8* %call1, i8** %dest, align 8, !dbg !35
  %4 = load i8*, i8** %dest, align 8, !dbg !39
  %cmp = icmp eq i8* %4, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !45
  %6 = bitcast i8* %5 to i32*, !dbg !45
  %7 = load i8*, i8** %data, align 8, !dbg !46
  %8 = bitcast i8* %7 to i32*, !dbg !46
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !47
  %9 = load i8*, i8** %dest, align 8, !dbg !48
  call void @printLine(i8* %9), !dbg !49
  %10 = load i8*, i8** %dest, align 8, !dbg !50
  call void @free(i8* %10) #7, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodG2BSink(i8** %dataArray) #0 !dbg !53 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i8** %data, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !58
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !58
  store i8* %1, i8** %data, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !61
  %2 = load i8*, i8** %data, align 8, !dbg !62
  %call = call i64 @strlen(i8* %2) #6, !dbg !63
  store i64 %call, i64* %dataLen, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !64, metadata !DIExpression()), !dbg !65
  %3 = load i64, i64* %dataLen, align 8, !dbg !66
  %add = add i64 %3, 1, !dbg !67
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !68
  store i8* %call1, i8** %dest, align 8, !dbg !65
  %4 = load i8*, i8** %dest, align 8, !dbg !69
  %cmp = icmp eq i8* %4, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !75
  %6 = load i8*, i8** %data, align 8, !dbg !76
  %call2 = call i8* @strcpy(i8* %5, i8* %6) #7, !dbg !77
  %7 = load i8*, i8** %dest, align 8, !dbg !78
  call void @printLine(i8* %7), !dbg !79
  %8 = load i8*, i8** %dest, align 8, !dbg !80
  call void @free(i8* %8) #7, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodB2GSink(i8** %dataArray) #0 !dbg !83 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !88
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !88
  store i8* %1, i8** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !89, metadata !DIExpression()), !dbg !91
  %2 = load i8*, i8** %data, align 8, !dbg !92
  %3 = bitcast i8* %2 to i32*, !dbg !93
  %call = call i64 @wcslen(i32* %3) #6, !dbg !94
  store i64 %call, i64* %dataLen, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !95, metadata !DIExpression()), !dbg !96
  %4 = load i64, i64* %dataLen, align 8, !dbg !97
  %add = add i64 %4, 1, !dbg !98
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !99
  store i8* %call1, i8** %dest, align 8, !dbg !96
  %5 = load i8*, i8** %dest, align 8, !dbg !100
  %cmp = icmp eq i8* %5, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %6 = load i8*, i8** %dest, align 8, !dbg !106
  %7 = bitcast i8* %6 to i32*, !dbg !106
  %8 = load i8*, i8** %data, align 8, !dbg !107
  %9 = bitcast i8* %8 to i32*, !dbg !107
  %call2 = call i32* @wcscpy(i32* %7, i32* %9) #7, !dbg !108
  %10 = load i8*, i8** %dest, align 8, !dbg !109
  %11 = bitcast i8* %10 to i32*, !dbg !110
  call void @printWLine(i32* %11), !dbg !111
  %12 = load i8*, i8** %dest, align 8, !dbg !112
  call void @free(i8* %12) #7, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_badSink", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!22 = !DILocalVariable(name: "dataArray", arg: 1, scope: !17, file: !18, line: 24, type: !21)
!23 = !DILocation(line: 24, column: 67, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 27, type: !6)
!25 = !DILocation(line: 27, column: 12, scope: !17)
!26 = !DILocation(line: 27, column: 19, scope: !17)
!27 = !DILocalVariable(name: "dataLen", scope: !28, file: !18, line: 30, type: !29)
!28 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 5)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !30)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 30, column: 16, scope: !28)
!32 = !DILocation(line: 30, column: 41, scope: !28)
!33 = !DILocation(line: 30, column: 26, scope: !28)
!34 = !DILocalVariable(name: "dest", scope: !28, file: !18, line: 31, type: !6)
!35 = !DILocation(line: 31, column: 16, scope: !28)
!36 = !DILocation(line: 31, column: 38, scope: !28)
!37 = !DILocation(line: 31, column: 45, scope: !28)
!38 = !DILocation(line: 31, column: 31, scope: !28)
!39 = !DILocation(line: 32, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !28, file: !18, line: 32, column: 13)
!41 = !DILocation(line: 32, column: 18, scope: !40)
!42 = !DILocation(line: 32, column: 13, scope: !28)
!43 = !DILocation(line: 32, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !18, line: 32, column: 27)
!45 = !DILocation(line: 33, column: 22, scope: !28)
!46 = !DILocation(line: 33, column: 28, scope: !28)
!47 = !DILocation(line: 33, column: 15, scope: !28)
!48 = !DILocation(line: 34, column: 27, scope: !28)
!49 = !DILocation(line: 34, column: 9, scope: !28)
!50 = !DILocation(line: 35, column: 14, scope: !28)
!51 = !DILocation(line: 35, column: 9, scope: !28)
!52 = !DILocation(line: 37, column: 1, scope: !17)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodG2BSink", scope: !18, file: !18, line: 44, type: !19, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "dataArray", arg: 1, scope: !53, file: !18, line: 44, type: !21)
!55 = !DILocation(line: 44, column: 71, scope: !53)
!56 = !DILocalVariable(name: "data", scope: !53, file: !18, line: 46, type: !6)
!57 = !DILocation(line: 46, column: 12, scope: !53)
!58 = !DILocation(line: 46, column: 19, scope: !53)
!59 = !DILocalVariable(name: "dataLen", scope: !60, file: !18, line: 49, type: !29)
!60 = distinct !DILexicalBlock(scope: !53, file: !18, line: 47, column: 5)
!61 = !DILocation(line: 49, column: 16, scope: !60)
!62 = !DILocation(line: 49, column: 41, scope: !60)
!63 = !DILocation(line: 49, column: 26, scope: !60)
!64 = !DILocalVariable(name: "dest", scope: !60, file: !18, line: 50, type: !6)
!65 = !DILocation(line: 50, column: 16, scope: !60)
!66 = !DILocation(line: 50, column: 38, scope: !60)
!67 = !DILocation(line: 50, column: 45, scope: !60)
!68 = !DILocation(line: 50, column: 31, scope: !60)
!69 = !DILocation(line: 51, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !60, file: !18, line: 51, column: 13)
!71 = !DILocation(line: 51, column: 18, scope: !70)
!72 = !DILocation(line: 51, column: 13, scope: !60)
!73 = !DILocation(line: 51, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !18, line: 51, column: 27)
!75 = !DILocation(line: 52, column: 22, scope: !60)
!76 = !DILocation(line: 52, column: 28, scope: !60)
!77 = !DILocation(line: 52, column: 15, scope: !60)
!78 = !DILocation(line: 53, column: 27, scope: !60)
!79 = !DILocation(line: 53, column: 9, scope: !60)
!80 = !DILocation(line: 54, column: 14, scope: !60)
!81 = !DILocation(line: 54, column: 9, scope: !60)
!82 = !DILocation(line: 56, column: 1, scope: !53)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodB2GSink", scope: !18, file: !18, line: 59, type: !19, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "dataArray", arg: 1, scope: !83, file: !18, line: 59, type: !21)
!85 = !DILocation(line: 59, column: 71, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !18, line: 61, type: !6)
!87 = !DILocation(line: 61, column: 12, scope: !83)
!88 = !DILocation(line: 61, column: 19, scope: !83)
!89 = !DILocalVariable(name: "dataLen", scope: !90, file: !18, line: 64, type: !29)
!90 = distinct !DILexicalBlock(scope: !83, file: !18, line: 62, column: 5)
!91 = !DILocation(line: 64, column: 16, scope: !90)
!92 = !DILocation(line: 64, column: 44, scope: !90)
!93 = !DILocation(line: 64, column: 33, scope: !90)
!94 = !DILocation(line: 64, column: 26, scope: !90)
!95 = !DILocalVariable(name: "dest", scope: !90, file: !18, line: 65, type: !6)
!96 = !DILocation(line: 65, column: 16, scope: !90)
!97 = !DILocation(line: 65, column: 38, scope: !90)
!98 = !DILocation(line: 65, column: 45, scope: !90)
!99 = !DILocation(line: 65, column: 31, scope: !90)
!100 = !DILocation(line: 66, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !90, file: !18, line: 66, column: 13)
!102 = !DILocation(line: 66, column: 18, scope: !101)
!103 = !DILocation(line: 66, column: 13, scope: !90)
!104 = !DILocation(line: 66, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !18, line: 66, column: 27)
!106 = !DILocation(line: 67, column: 22, scope: !90)
!107 = !DILocation(line: 67, column: 28, scope: !90)
!108 = !DILocation(line: 67, column: 15, scope: !90)
!109 = !DILocation(line: 68, column: 31, scope: !90)
!110 = !DILocation(line: 68, column: 20, scope: !90)
!111 = !DILocation(line: 68, column: 9, scope: !90)
!112 = !DILocation(line: 69, column: 14, scope: !90)
!113 = !DILocation(line: 69, column: 9, scope: !90)
!114 = !DILocation(line: 71, column: 1, scope: !83)
