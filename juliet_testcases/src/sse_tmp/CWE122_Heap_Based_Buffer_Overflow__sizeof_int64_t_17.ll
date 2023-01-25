; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i64* null, i64** %data, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %0, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !35
  %1 = bitcast i8* %call to i64*, !dbg !37
  store i64* %1, i64** %data, align 8, !dbg !38
  %2 = load i64*, i64** %data, align 8, !dbg !39
  %cmp1 = icmp eq i64* %2, null, !dbg !41
  br i1 %cmp1, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %for.body
  %3 = load i64*, i64** %data, align 8, !dbg !45
  store i64 2147483643, i64* %3, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %4, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %5 = load i64*, i64** %data, align 8, !dbg !53
  %6 = load i64, i64* %5, align 8, !dbg !54
  call void @printLongLongLine(i64 %6), !dbg !55
  %7 = load i64*, i64** %data, align 8, !dbg !56
  %8 = bitcast i64* %7 to i8*, !dbg !56
  call void @free(i8* %8) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i64* null, i64** %data, align 8, !dbg !87
  store i32 0, i32* %h, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !91
  %cmp = icmp slt i32 %0, 1, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !95
  %1 = bitcast i8* %call to i64*, !dbg !97
  store i64* %1, i64** %data, align 8, !dbg !98
  %2 = load i64*, i64** %data, align 8, !dbg !99
  %cmp1 = icmp eq i64* %2, null, !dbg !101
  br i1 %cmp1, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %for.body
  %3 = load i64*, i64** %data, align 8, !dbg !105
  store i64 2147483643, i64* %3, align 8, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %h, align 4, !dbg !108
  %inc = add nsw i32 %4, 1, !dbg !108
  store i32 %inc, i32* %h, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %5 = load i64*, i64** %data, align 8, !dbg !112
  %6 = load i64, i64* %5, align 8, !dbg !113
  call void @printLongLongLine(i64 %6), !dbg !114
  %7 = load i64*, i64** %data, align 8, !dbg !115
  %8 = bitcast i64* %7 to i8*, !dbg !115
  call void @free(i8* %8) #5, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "i", scope: !18, file: !19, line: 23, type: !23)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DILocation(line: 23, column: 9, scope: !18)
!25 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 15, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 5)
!30 = !DILocation(line: 27, column: 9, scope: !29)
!31 = !DILocation(line: 27, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 5)
!33 = !DILocation(line: 27, column: 18, scope: !32)
!34 = !DILocation(line: 27, column: 5, scope: !29)
!35 = !DILocation(line: 31, column: 27, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 28, column: 5)
!37 = !DILocation(line: 31, column: 16, scope: !36)
!38 = !DILocation(line: 31, column: 14, scope: !36)
!39 = !DILocation(line: 32, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 32, column: 13)
!41 = !DILocation(line: 32, column: 18, scope: !40)
!42 = !DILocation(line: 32, column: 13, scope: !36)
!43 = !DILocation(line: 32, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 32, column: 27)
!45 = !DILocation(line: 33, column: 10, scope: !36)
!46 = !DILocation(line: 33, column: 15, scope: !36)
!47 = !DILocation(line: 34, column: 5, scope: !36)
!48 = !DILocation(line: 27, column: 24, scope: !32)
!49 = !DILocation(line: 27, column: 5, scope: !32)
!50 = distinct !{!50, !34, !51, !52}
!51 = !DILocation(line: 34, column: 5, scope: !29)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 36, column: 24, scope: !18)
!54 = !DILocation(line: 36, column: 23, scope: !18)
!55 = !DILocation(line: 36, column: 5, scope: !18)
!56 = !DILocation(line: 37, column: 10, scope: !18)
!57 = !DILocation(line: 37, column: 5, scope: !18)
!58 = !DILocation(line: 38, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_17_good", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 65, column: 5, scope: !59)
!61 = !DILocation(line: 66, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 78, type: !63, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!23, !23, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !19, line: 78, type: !23)
!69 = !DILocation(line: 78, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !19, line: 78, type: !65)
!71 = !DILocation(line: 78, column: 27, scope: !62)
!72 = !DILocation(line: 81, column: 22, scope: !62)
!73 = !DILocation(line: 81, column: 12, scope: !62)
!74 = !DILocation(line: 81, column: 5, scope: !62)
!75 = !DILocation(line: 83, column: 5, scope: !62)
!76 = !DILocation(line: 84, column: 5, scope: !62)
!77 = !DILocation(line: 85, column: 5, scope: !62)
!78 = !DILocation(line: 88, column: 5, scope: !62)
!79 = !DILocation(line: 89, column: 5, scope: !62)
!80 = !DILocation(line: 90, column: 5, scope: !62)
!81 = !DILocation(line: 92, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 45, type: !20, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "h", scope: !82, file: !19, line: 47, type: !23)
!84 = !DILocation(line: 47, column: 9, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !19, line: 48, type: !4)
!86 = !DILocation(line: 48, column: 15, scope: !82)
!87 = !DILocation(line: 50, column: 10, scope: !82)
!88 = !DILocation(line: 51, column: 11, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !19, line: 51, column: 5)
!90 = !DILocation(line: 51, column: 9, scope: !89)
!91 = !DILocation(line: 51, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !19, line: 51, column: 5)
!93 = !DILocation(line: 51, column: 18, scope: !92)
!94 = !DILocation(line: 51, column: 5, scope: !89)
!95 = !DILocation(line: 54, column: 27, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 52, column: 5)
!97 = !DILocation(line: 54, column: 16, scope: !96)
!98 = !DILocation(line: 54, column: 14, scope: !96)
!99 = !DILocation(line: 55, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !19, line: 55, column: 13)
!101 = !DILocation(line: 55, column: 18, scope: !100)
!102 = !DILocation(line: 55, column: 13, scope: !96)
!103 = !DILocation(line: 55, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !19, line: 55, column: 27)
!105 = !DILocation(line: 56, column: 10, scope: !96)
!106 = !DILocation(line: 56, column: 15, scope: !96)
!107 = !DILocation(line: 57, column: 5, scope: !96)
!108 = !DILocation(line: 51, column: 24, scope: !92)
!109 = !DILocation(line: 51, column: 5, scope: !92)
!110 = distinct !{!110, !94, !111, !52}
!111 = !DILocation(line: 57, column: 5, scope: !89)
!112 = !DILocation(line: 59, column: 24, scope: !82)
!113 = !DILocation(line: 59, column: 23, scope: !82)
!114 = !DILocation(line: 59, column: 5, scope: !82)
!115 = !DILocation(line: 60, column: 10, scope: !82)
!116 = !DILocation(line: 60, column: 5, scope: !82)
!117 = !DILocation(line: 61, column: 1, scope: !82)
