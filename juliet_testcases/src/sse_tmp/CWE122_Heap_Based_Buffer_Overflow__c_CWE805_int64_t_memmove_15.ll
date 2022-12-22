; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !25
  %0 = bitcast i8* %call to i64*, !dbg !26
  store i64* %0, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %cmp = icmp eq i64* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !39
  %3 = load i64*, i64** %data, align 8, !dbg !40
  %4 = bitcast i64* %3 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !41
  %5 = bitcast i64* %arraydecay to i8*, !dbg !41
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !41
  %6 = load i64*, i64** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !42
  %7 = load i64, i64* %arrayidx, align 8, !dbg !42
  call void @printLongLongLine(i64 %7), !dbg !43
  %8 = load i64*, i64** %data, align 8, !dbg !44
  %9 = bitcast i64* %8 to i8*, !dbg !44
  call void @free(i8* %9) #7, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !77
  store i64* %0, i64** %data, align 8, !dbg !78
  %1 = load i64*, i64** %data, align 8, !dbg !79
  %cmp = icmp eq i64* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !87
  %3 = load i64*, i64** %data, align 8, !dbg !88
  %4 = bitcast i64* %3 to i8*, !dbg !89
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !89
  %5 = bitcast i64* %arraydecay to i8*, !dbg !89
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !89
  %6 = load i64*, i64** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !90
  %7 = load i64, i64* %arrayidx, align 8, !dbg !90
  call void @printLongLongLine(i64 %7), !dbg !91
  %8 = load i64*, i64** %data, align 8, !dbg !92
  %9 = bitcast i64* %8 to i8*, !dbg !92
  call void @free(i8* %9) #7, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i64* null, i64** %data, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !99
  %0 = bitcast i8* %call to i64*, !dbg !100
  store i64* %0, i64** %data, align 8, !dbg !101
  %1 = load i64*, i64** %data, align 8, !dbg !102
  %cmp = icmp eq i64* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !110
  %3 = load i64*, i64** %data, align 8, !dbg !111
  %4 = bitcast i64* %3 to i8*, !dbg !112
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !112
  %5 = bitcast i64* %arraydecay to i8*, !dbg !112
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !112
  %6 = load i64*, i64** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !113
  %7 = load i64, i64* %arrayidx, align 8, !dbg !113
  call void @printLongLongLine(i64 %7), !dbg !114
  %8 = load i64*, i64** %data, align 8, !dbg !115
  %9 = bitcast i64* %8 to i8*, !dbg !115
  call void @free(i8* %9) #7, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 29, column: 27, scope: !18)
!26 = !DILocation(line: 29, column: 16, scope: !18)
!27 = !DILocation(line: 29, column: 14, scope: !18)
!28 = !DILocation(line: 30, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 13)
!30 = !DILocation(line: 30, column: 18, scope: !29)
!31 = !DILocation(line: 30, column: 13, scope: !18)
!32 = !DILocation(line: 30, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 30, column: 27)
!34 = !DILocalVariable(name: "source", scope: !35, file: !19, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocation(line: 40, column: 17, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 41, column: 27, scope: !35)
!43 = !DILocation(line: 41, column: 9, scope: !35)
!44 = !DILocation(line: 42, column: 14, scope: !35)
!45 = !DILocation(line: 42, column: 9, scope: !35)
!46 = !DILocation(line: 44, column: 1, scope: !18)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_good", scope: !19, file: !19, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 104, column: 5, scope: !47)
!49 = !DILocation(line: 105, column: 5, scope: !47)
!50 = !DILocation(line: 106, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 118, type: !52, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !19, line: 118, type: !54)
!59 = !DILocation(line: 118, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !19, line: 118, type: !55)
!61 = !DILocation(line: 118, column: 27, scope: !51)
!62 = !DILocation(line: 121, column: 22, scope: !51)
!63 = !DILocation(line: 121, column: 12, scope: !51)
!64 = !DILocation(line: 121, column: 5, scope: !51)
!65 = !DILocation(line: 123, column: 5, scope: !51)
!66 = !DILocation(line: 124, column: 5, scope: !51)
!67 = !DILocation(line: 125, column: 5, scope: !51)
!68 = !DILocation(line: 128, column: 5, scope: !51)
!69 = !DILocation(line: 129, column: 5, scope: !51)
!70 = !DILocation(line: 130, column: 5, scope: !51)
!71 = !DILocation(line: 132, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !19, line: 53, type: !4)
!74 = !DILocation(line: 53, column: 15, scope: !72)
!75 = !DILocation(line: 54, column: 10, scope: !72)
!76 = !DILocation(line: 63, column: 27, scope: !72)
!77 = !DILocation(line: 63, column: 16, scope: !72)
!78 = !DILocation(line: 63, column: 14, scope: !72)
!79 = !DILocation(line: 64, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !19, line: 64, column: 13)
!81 = !DILocation(line: 64, column: 18, scope: !80)
!82 = !DILocation(line: 64, column: 13, scope: !72)
!83 = !DILocation(line: 64, column: 28, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !19, line: 64, column: 27)
!85 = !DILocalVariable(name: "source", scope: !86, file: !19, line: 68, type: !36)
!86 = distinct !DILexicalBlock(scope: !72, file: !19, line: 67, column: 5)
!87 = !DILocation(line: 68, column: 17, scope: !86)
!88 = !DILocation(line: 70, column: 17, scope: !86)
!89 = !DILocation(line: 70, column: 9, scope: !86)
!90 = !DILocation(line: 71, column: 27, scope: !86)
!91 = !DILocation(line: 71, column: 9, scope: !86)
!92 = !DILocation(line: 72, column: 14, scope: !86)
!93 = !DILocation(line: 72, column: 9, scope: !86)
!94 = !DILocation(line: 74, column: 1, scope: !72)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 77, type: !20, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !19, line: 79, type: !4)
!97 = !DILocation(line: 79, column: 15, scope: !95)
!98 = !DILocation(line: 80, column: 10, scope: !95)
!99 = !DILocation(line: 85, column: 27, scope: !95)
!100 = !DILocation(line: 85, column: 16, scope: !95)
!101 = !DILocation(line: 85, column: 14, scope: !95)
!102 = !DILocation(line: 86, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !19, line: 86, column: 13)
!104 = !DILocation(line: 86, column: 18, scope: !103)
!105 = !DILocation(line: 86, column: 13, scope: !95)
!106 = !DILocation(line: 86, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !19, line: 86, column: 27)
!108 = !DILocalVariable(name: "source", scope: !109, file: !19, line: 94, type: !36)
!109 = distinct !DILexicalBlock(scope: !95, file: !19, line: 93, column: 5)
!110 = !DILocation(line: 94, column: 17, scope: !109)
!111 = !DILocation(line: 96, column: 17, scope: !109)
!112 = !DILocation(line: 96, column: 9, scope: !109)
!113 = !DILocation(line: 97, column: 27, scope: !109)
!114 = !DILocation(line: 97, column: 9, scope: !109)
!115 = !DILocation(line: 98, column: 14, scope: !109)
!116 = !DILocation(line: 98, column: 9, scope: !109)
!117 = !DILocation(line: 100, column: 1, scope: !95)
