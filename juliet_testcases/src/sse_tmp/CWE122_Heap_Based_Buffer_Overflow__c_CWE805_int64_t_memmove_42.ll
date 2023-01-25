; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i64*, i64** %data, align 8, !dbg !25
  %call = call i64* @badSource(i64* %0), !dbg !26
  store i64* %call, i64** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !33
  %2 = load i64*, i64** %data, align 8, !dbg !34
  %3 = bitcast i64* %2 to i8*, !dbg !35
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !35
  %4 = bitcast i64* %arraydecay to i8*, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !35
  %5 = load i64*, i64** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !36
  %6 = load i64, i64* %arrayidx, align 8, !dbg !36
  call void @printLongLongLine(i64 %6), !dbg !37
  %7 = load i64*, i64** %data, align 8, !dbg !38
  %8 = bitcast i64* %7 to i8*, !dbg !38
  call void @free(i8* %8) #7, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64* @badSource(i64* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !46
  %0 = bitcast i8* %call to i64*, !dbg !47
  store i64* %0, i64** %data.addr, align 8, !dbg !48
  %1 = load i64*, i64** %data.addr, align 8, !dbg !49
  %cmp = icmp eq i64* %1, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !55
  ret i64* %2, !dbg !56
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i64* null, i64** %data, align 8, !dbg !84
  %0 = load i64*, i64** %data, align 8, !dbg !85
  %call = call i64* @goodG2BSource(i64* %0), !dbg !86
  store i64* %call, i64** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !90
  %2 = load i64*, i64** %data, align 8, !dbg !91
  %3 = bitcast i64* %2 to i8*, !dbg !92
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !92
  %4 = bitcast i64* %arraydecay to i8*, !dbg !92
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !92
  %5 = load i64*, i64** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !93
  %6 = load i64, i64* %arrayidx, align 8, !dbg !93
  call void @printLongLongLine(i64 %6), !dbg !94
  %7 = load i64*, i64** %data, align 8, !dbg !95
  %8 = bitcast i64* %7 to i8*, !dbg !95
  call void @free(i8* %8) #7, !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2BSource(i64* %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !101
  %0 = bitcast i8* %call to i64*, !dbg !102
  store i64* %0, i64** %data.addr, align 8, !dbg !103
  %1 = load i64*, i64** %data.addr, align 8, !dbg !104
  %cmp = icmp eq i64* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !110
  ret i64* %2, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !11}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42_bad", scope: !19, file: !19, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 15, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 22, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 10, scope: !18)
!28 = !DILocalVariable(name: "source", scope: !29, file: !19, line: 35, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 35, column: 17, scope: !29)
!34 = !DILocation(line: 37, column: 17, scope: !29)
!35 = !DILocation(line: 37, column: 9, scope: !29)
!36 = !DILocation(line: 38, column: 27, scope: !29)
!37 = !DILocation(line: 38, column: 9, scope: !29)
!38 = !DILocation(line: 39, column: 14, scope: !29)
!39 = !DILocation(line: 39, column: 9, scope: !29)
!40 = !DILocation(line: 41, column: 1, scope: !18)
!41 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 21, type: !42, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!5, !5}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !19, line: 21, type: !5)
!45 = !DILocation(line: 21, column: 38, scope: !41)
!46 = !DILocation(line: 24, column: 23, scope: !41)
!47 = !DILocation(line: 24, column: 12, scope: !41)
!48 = !DILocation(line: 24, column: 10, scope: !41)
!49 = !DILocation(line: 25, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !19, line: 25, column: 9)
!51 = !DILocation(line: 25, column: 14, scope: !50)
!52 = !DILocation(line: 25, column: 9, scope: !41)
!53 = !DILocation(line: 25, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !19, line: 25, column: 23)
!55 = !DILocation(line: 26, column: 12, scope: !41)
!56 = !DILocation(line: 26, column: 5, scope: !41)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_42_good", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 72, column: 5, scope: !57)
!59 = !DILocation(line: 73, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 85, type: !61, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !19, line: 85, type: !63)
!68 = !DILocation(line: 85, column: 14, scope: !60)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !19, line: 85, type: !64)
!70 = !DILocation(line: 85, column: 27, scope: !60)
!71 = !DILocation(line: 88, column: 22, scope: !60)
!72 = !DILocation(line: 88, column: 12, scope: !60)
!73 = !DILocation(line: 88, column: 5, scope: !60)
!74 = !DILocation(line: 90, column: 5, scope: !60)
!75 = !DILocation(line: 91, column: 5, scope: !60)
!76 = !DILocation(line: 92, column: 5, scope: !60)
!77 = !DILocation(line: 95, column: 5, scope: !60)
!78 = !DILocation(line: 96, column: 5, scope: !60)
!79 = !DILocation(line: 97, column: 5, scope: !60)
!80 = !DILocation(line: 99, column: 5, scope: !60)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !19, line: 58, type: !5)
!83 = !DILocation(line: 58, column: 15, scope: !81)
!84 = !DILocation(line: 59, column: 10, scope: !81)
!85 = !DILocation(line: 60, column: 26, scope: !81)
!86 = !DILocation(line: 60, column: 12, scope: !81)
!87 = !DILocation(line: 60, column: 10, scope: !81)
!88 = !DILocalVariable(name: "source", scope: !89, file: !19, line: 62, type: !30)
!89 = distinct !DILexicalBlock(scope: !81, file: !19, line: 61, column: 5)
!90 = !DILocation(line: 62, column: 17, scope: !89)
!91 = !DILocation(line: 64, column: 17, scope: !89)
!92 = !DILocation(line: 64, column: 9, scope: !89)
!93 = !DILocation(line: 65, column: 27, scope: !89)
!94 = !DILocation(line: 65, column: 9, scope: !89)
!95 = !DILocation(line: 66, column: 14, scope: !89)
!96 = !DILocation(line: 66, column: 9, scope: !89)
!97 = !DILocation(line: 68, column: 1, scope: !81)
!98 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 47, type: !42, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !19, line: 47, type: !5)
!100 = !DILocation(line: 47, column: 42, scope: !98)
!101 = !DILocation(line: 50, column: 23, scope: !98)
!102 = !DILocation(line: 50, column: 12, scope: !98)
!103 = !DILocation(line: 50, column: 10, scope: !98)
!104 = !DILocation(line: 51, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !19, line: 51, column: 9)
!106 = !DILocation(line: 51, column: 14, scope: !105)
!107 = !DILocation(line: 51, column: 9, scope: !98)
!108 = !DILocation(line: 51, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !19, line: 51, column: 23)
!110 = !DILocation(line: 52, column: 12, scope: !98)
!111 = !DILocation(line: 52, column: 5, scope: !98)
