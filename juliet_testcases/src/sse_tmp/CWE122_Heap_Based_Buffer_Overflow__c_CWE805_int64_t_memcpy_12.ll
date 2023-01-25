; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !28
  %0 = bitcast i8* %call1 to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %cmp = icmp eq i64* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !38

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !39
  %2 = bitcast i8* %call3 to i64*, !dbg !41
  store i64* %2, i64** %data, align 8, !dbg !42
  %3 = load i64*, i64** %data, align 8, !dbg !43
  %cmp4 = icmp eq i64* %3, null, !dbg !45
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !46

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !47
  unreachable, !dbg !47

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !54
  %5 = load i64*, i64** %data, align 8, !dbg !55
  %6 = bitcast i64* %5 to i8*, !dbg !56
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !56
  %7 = bitcast i64* %arraydecay to i8*, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !56
  %8 = load i64*, i64** %data, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !57
  %9 = load i64, i64* %arrayidx, align 8, !dbg !57
  call void @printLongLongLine(i64 %9), !dbg !58
  %10 = load i64*, i64** %data, align 8, !dbg !59
  %11 = bitcast i64* %10 to i8*, !dbg !59
  call void @free(i8* %11) #7, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i64* null, i64** %data, align 8, !dbg !89
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !93
  %0 = bitcast i8* %call1 to i64*, !dbg !95
  store i64* %0, i64** %data, align 8, !dbg !96
  %1 = load i64*, i64** %data, align 8, !dbg !97
  %cmp = icmp eq i64* %1, null, !dbg !99
  br i1 %cmp, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !103

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !104
  %2 = bitcast i8* %call3 to i64*, !dbg !106
  store i64* %2, i64** %data, align 8, !dbg !107
  %3 = load i64*, i64** %data, align 8, !dbg !108
  %cmp4 = icmp eq i64* %3, null, !dbg !110
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !111

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !116
  %5 = load i64*, i64** %data, align 8, !dbg !117
  %6 = bitcast i64* %5 to i8*, !dbg !118
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !118
  %7 = bitcast i64* %arraydecay to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !118
  %8 = load i64*, i64** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !119
  %9 = load i64, i64* %arrayidx, align 8, !dbg !119
  call void @printLongLongLine(i64 %9), !dbg !120
  %10 = load i64*, i64** %data, align 8, !dbg !121
  %11 = bitcast i64* %10 to i8*, !dbg !121
  call void @free(i8* %11) #7, !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 25, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 8)
!27 = !DILocation(line: 25, column: 8, scope: !18)
!28 = !DILocation(line: 28, column: 27, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 26, column: 5)
!30 = !DILocation(line: 28, column: 16, scope: !29)
!31 = !DILocation(line: 28, column: 14, scope: !29)
!32 = !DILocation(line: 29, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 29, column: 13)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 13, scope: !29)
!36 = !DILocation(line: 29, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 29, column: 27)
!38 = !DILocation(line: 30, column: 5, scope: !29)
!39 = !DILocation(line: 34, column: 27, scope: !40)
!40 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 5)
!41 = !DILocation(line: 34, column: 16, scope: !40)
!42 = !DILocation(line: 34, column: 14, scope: !40)
!43 = !DILocation(line: 35, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 35, column: 13)
!45 = !DILocation(line: 35, column: 18, scope: !44)
!46 = !DILocation(line: 35, column: 13, scope: !40)
!47 = !DILocation(line: 35, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !19, line: 35, column: 27)
!49 = !DILocalVariable(name: "source", scope: !50, file: !19, line: 38, type: !51)
!50 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 38, column: 17, scope: !50)
!55 = !DILocation(line: 40, column: 16, scope: !50)
!56 = !DILocation(line: 40, column: 9, scope: !50)
!57 = !DILocation(line: 41, column: 27, scope: !50)
!58 = !DILocation(line: 41, column: 9, scope: !50)
!59 = !DILocation(line: 42, column: 14, scope: !50)
!60 = !DILocation(line: 42, column: 9, scope: !50)
!61 = !DILocation(line: 44, column: 1, scope: !18)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_12_good", scope: !19, file: !19, line: 77, type: !20, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 79, column: 5, scope: !62)
!64 = !DILocation(line: 80, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 92, type: !66, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !19, line: 92, type: !68)
!73 = !DILocation(line: 92, column: 14, scope: !65)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !19, line: 92, type: !69)
!75 = !DILocation(line: 92, column: 27, scope: !65)
!76 = !DILocation(line: 95, column: 22, scope: !65)
!77 = !DILocation(line: 95, column: 12, scope: !65)
!78 = !DILocation(line: 95, column: 5, scope: !65)
!79 = !DILocation(line: 97, column: 5, scope: !65)
!80 = !DILocation(line: 98, column: 5, scope: !65)
!81 = !DILocation(line: 99, column: 5, scope: !65)
!82 = !DILocation(line: 102, column: 5, scope: !65)
!83 = !DILocation(line: 103, column: 5, scope: !65)
!84 = !DILocation(line: 104, column: 5, scope: !65)
!85 = !DILocation(line: 106, column: 5, scope: !65)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !19, line: 54, type: !4)
!88 = !DILocation(line: 54, column: 15, scope: !86)
!89 = !DILocation(line: 55, column: 10, scope: !86)
!90 = !DILocation(line: 56, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !19, line: 56, column: 8)
!92 = !DILocation(line: 56, column: 8, scope: !86)
!93 = !DILocation(line: 59, column: 27, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !19, line: 57, column: 5)
!95 = !DILocation(line: 59, column: 16, scope: !94)
!96 = !DILocation(line: 59, column: 14, scope: !94)
!97 = !DILocation(line: 60, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !19, line: 60, column: 13)
!99 = !DILocation(line: 60, column: 18, scope: !98)
!100 = !DILocation(line: 60, column: 13, scope: !94)
!101 = !DILocation(line: 60, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !19, line: 60, column: 27)
!103 = !DILocation(line: 61, column: 5, scope: !94)
!104 = !DILocation(line: 65, column: 27, scope: !105)
!105 = distinct !DILexicalBlock(scope: !91, file: !19, line: 63, column: 5)
!106 = !DILocation(line: 65, column: 16, scope: !105)
!107 = !DILocation(line: 65, column: 14, scope: !105)
!108 = !DILocation(line: 66, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !19, line: 66, column: 13)
!110 = !DILocation(line: 66, column: 18, scope: !109)
!111 = !DILocation(line: 66, column: 13, scope: !105)
!112 = !DILocation(line: 66, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !19, line: 66, column: 27)
!114 = !DILocalVariable(name: "source", scope: !115, file: !19, line: 69, type: !51)
!115 = distinct !DILexicalBlock(scope: !86, file: !19, line: 68, column: 5)
!116 = !DILocation(line: 69, column: 17, scope: !115)
!117 = !DILocation(line: 71, column: 16, scope: !115)
!118 = !DILocation(line: 71, column: 9, scope: !115)
!119 = !DILocation(line: 72, column: 27, scope: !115)
!120 = !DILocation(line: 72, column: 9, scope: !115)
!121 = !DILocation(line: 73, column: 14, scope: !115)
!122 = !DILocation(line: 73, column: 9, scope: !115)
!123 = !DILocation(line: 75, column: 1, scope: !86)
