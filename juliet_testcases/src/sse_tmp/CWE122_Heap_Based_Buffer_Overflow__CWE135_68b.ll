; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE135_68_badData = external dso_local global i8*, align 8
@CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodG2BData = external dso_local global i8*, align 8
@CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodB2GData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_badSink() #0 !dbg !17 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_badData, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !24, metadata !DIExpression()), !dbg !28
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i64 @strlen(i8* %1) #6, !dbg !30
  store i64 %call, i64* %dataLen, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = load i64, i64* %dataLen, align 8, !dbg !33
  %add = add i64 %2, 1, !dbg !34
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !35
  store i8* %call1, i8** %dest, align 8, !dbg !32
  %3 = load i8*, i8** %dest, align 8, !dbg !36
  %cmp = icmp eq i8* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !42
  %5 = bitcast i8* %4 to i32*, !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  %7 = bitcast i8* %6 to i32*, !dbg !43
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !44
  %8 = load i8*, i8** %dest, align 8, !dbg !45
  call void @printLine(i8* %8), !dbg !46
  %9 = load i8*, i8** %dest, align 8, !dbg !47
  call void @free(i8* %9) #7, !dbg !48
  ret void, !dbg !49
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodG2BSink() #0 !dbg !50 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodG2BData, align 8, !dbg !53
  store i8* %0, i8** %data, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !54, metadata !DIExpression()), !dbg !56
  %1 = load i8*, i8** %data, align 8, !dbg !57
  %call = call i64 @strlen(i8* %1) #6, !dbg !58
  store i64 %call, i64* %dataLen, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %2 = load i64, i64* %dataLen, align 8, !dbg !61
  %add = add i64 %2, 1, !dbg !62
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !63
  store i8* %call1, i8** %dest, align 8, !dbg !60
  %3 = load i8*, i8** %dest, align 8, !dbg !64
  %cmp = icmp eq i8* %3, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !70
  %5 = load i8*, i8** %data, align 8, !dbg !71
  %call2 = call i8* @strcpy(i8* %4, i8* %5) #7, !dbg !72
  %6 = load i8*, i8** %dest, align 8, !dbg !73
  call void @printLine(i8* %6), !dbg !74
  %7 = load i8*, i8** %dest, align 8, !dbg !75
  call void @free(i8* %7) #7, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodB2GSink() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodB2GData, align 8, !dbg !81
  store i8* %0, i8** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !82, metadata !DIExpression()), !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %2 = bitcast i8* %1 to i32*, !dbg !86
  %call = call i64 @wcslen(i32* %2) #6, !dbg !87
  store i64 %call, i64* %dataLen, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !88, metadata !DIExpression()), !dbg !89
  %3 = load i64, i64* %dataLen, align 8, !dbg !90
  %add = add i64 %3, 1, !dbg !91
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !92
  store i8* %call1, i8** %dest, align 8, !dbg !89
  %4 = load i8*, i8** %dest, align 8, !dbg !93
  %cmp = icmp eq i8* %4, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !99
  %6 = bitcast i8* %5 to i32*, !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  %8 = bitcast i8* %7 to i32*, !dbg !100
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !101
  %9 = load i8*, i8** %dest, align 8, !dbg !102
  %10 = bitcast i8* %9 to i32*, !dbg !103
  call void @printWLine(i32* %10), !dbg !104
  %11 = load i8*, i8** %dest, align 8, !dbg !105
  call void @free(i8* %11) #7, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_badSink", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 30, type: !6)
!22 = !DILocation(line: 30, column: 12, scope: !17)
!23 = !DILocation(line: 30, column: 19, scope: !17)
!24 = !DILocalVariable(name: "dataLen", scope: !25, file: !18, line: 33, type: !26)
!25 = distinct !DILexicalBlock(scope: !17, file: !18, line: 31, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !27)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 33, column: 16, scope: !25)
!29 = !DILocation(line: 33, column: 41, scope: !25)
!30 = !DILocation(line: 33, column: 26, scope: !25)
!31 = !DILocalVariable(name: "dest", scope: !25, file: !18, line: 34, type: !6)
!32 = !DILocation(line: 34, column: 16, scope: !25)
!33 = !DILocation(line: 34, column: 38, scope: !25)
!34 = !DILocation(line: 34, column: 45, scope: !25)
!35 = !DILocation(line: 34, column: 31, scope: !25)
!36 = !DILocation(line: 35, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !25, file: !18, line: 35, column: 13)
!38 = !DILocation(line: 35, column: 18, scope: !37)
!39 = !DILocation(line: 35, column: 13, scope: !25)
!40 = !DILocation(line: 35, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !18, line: 35, column: 27)
!42 = !DILocation(line: 36, column: 22, scope: !25)
!43 = !DILocation(line: 36, column: 28, scope: !25)
!44 = !DILocation(line: 36, column: 15, scope: !25)
!45 = !DILocation(line: 37, column: 27, scope: !25)
!46 = !DILocation(line: 37, column: 9, scope: !25)
!47 = !DILocation(line: 38, column: 14, scope: !25)
!48 = !DILocation(line: 38, column: 9, scope: !25)
!49 = !DILocation(line: 40, column: 1, scope: !17)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodG2BSink", scope: !18, file: !18, line: 47, type: !19, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", scope: !50, file: !18, line: 49, type: !6)
!52 = !DILocation(line: 49, column: 12, scope: !50)
!53 = !DILocation(line: 49, column: 19, scope: !50)
!54 = !DILocalVariable(name: "dataLen", scope: !55, file: !18, line: 52, type: !26)
!55 = distinct !DILexicalBlock(scope: !50, file: !18, line: 50, column: 5)
!56 = !DILocation(line: 52, column: 16, scope: !55)
!57 = !DILocation(line: 52, column: 41, scope: !55)
!58 = !DILocation(line: 52, column: 26, scope: !55)
!59 = !DILocalVariable(name: "dest", scope: !55, file: !18, line: 53, type: !6)
!60 = !DILocation(line: 53, column: 16, scope: !55)
!61 = !DILocation(line: 53, column: 38, scope: !55)
!62 = !DILocation(line: 53, column: 45, scope: !55)
!63 = !DILocation(line: 53, column: 31, scope: !55)
!64 = !DILocation(line: 54, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !18, line: 54, column: 13)
!66 = !DILocation(line: 54, column: 18, scope: !65)
!67 = !DILocation(line: 54, column: 13, scope: !55)
!68 = !DILocation(line: 54, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !18, line: 54, column: 27)
!70 = !DILocation(line: 55, column: 22, scope: !55)
!71 = !DILocation(line: 55, column: 28, scope: !55)
!72 = !DILocation(line: 55, column: 15, scope: !55)
!73 = !DILocation(line: 56, column: 27, scope: !55)
!74 = !DILocation(line: 56, column: 9, scope: !55)
!75 = !DILocation(line: 57, column: 14, scope: !55)
!76 = !DILocation(line: 57, column: 9, scope: !55)
!77 = !DILocation(line: 59, column: 1, scope: !50)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodB2GSink", scope: !18, file: !18, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !18, line: 64, type: !6)
!80 = !DILocation(line: 64, column: 12, scope: !78)
!81 = !DILocation(line: 64, column: 19, scope: !78)
!82 = !DILocalVariable(name: "dataLen", scope: !83, file: !18, line: 67, type: !26)
!83 = distinct !DILexicalBlock(scope: !78, file: !18, line: 65, column: 5)
!84 = !DILocation(line: 67, column: 16, scope: !83)
!85 = !DILocation(line: 67, column: 44, scope: !83)
!86 = !DILocation(line: 67, column: 33, scope: !83)
!87 = !DILocation(line: 67, column: 26, scope: !83)
!88 = !DILocalVariable(name: "dest", scope: !83, file: !18, line: 68, type: !6)
!89 = !DILocation(line: 68, column: 16, scope: !83)
!90 = !DILocation(line: 68, column: 38, scope: !83)
!91 = !DILocation(line: 68, column: 45, scope: !83)
!92 = !DILocation(line: 68, column: 31, scope: !83)
!93 = !DILocation(line: 69, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !83, file: !18, line: 69, column: 13)
!95 = !DILocation(line: 69, column: 18, scope: !94)
!96 = !DILocation(line: 69, column: 13, scope: !83)
!97 = !DILocation(line: 69, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !18, line: 69, column: 27)
!99 = !DILocation(line: 70, column: 22, scope: !83)
!100 = !DILocation(line: 70, column: 28, scope: !83)
!101 = !DILocation(line: 70, column: 15, scope: !83)
!102 = !DILocation(line: 71, column: 31, scope: !83)
!103 = !DILocation(line: 71, column: 20, scope: !83)
!104 = !DILocation(line: 71, column: 9, scope: !83)
!105 = !DILocation(line: 72, column: 14, scope: !83)
!106 = !DILocation(line: 72, column: 9, scope: !83)
!107 = !DILocation(line: 74, column: 1, scope: !78)
