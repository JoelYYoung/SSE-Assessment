; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !33
  %1 = load i64*, i64** %0, align 8, !dbg !34
  store i64* %1, i64** %data1, align 8, !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !35
  %2 = bitcast i8* %call to i64*, !dbg !36
  store i64* %2, i64** %data1, align 8, !dbg !37
  %3 = load i64*, i64** %data1, align 8, !dbg !38
  %cmp = icmp eq i64* %3, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  %4 = load i64*, i64** %data1, align 8, !dbg !44
  %5 = load i64**, i64*** %dataPtr1, align 8, !dbg !45
  store i64* %4, i64** %5, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %6 = load i64**, i64*** %dataPtr2, align 8, !dbg !50
  %7 = load i64*, i64** %6, align 8, !dbg !51
  store i64* %7, i64** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  %8 = bitcast [100 x i64]* %source to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 800, i1 false), !dbg !57
  %9 = load i64*, i64** %data2, align 8, !dbg !58
  %10 = bitcast i64* %9 to i8*, !dbg !59
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !59
  %11 = bitcast i64* %arraydecay to i8*, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %10, i8* align 16 %11, i64 800, i1 false), !dbg !59
  %12 = load i64*, i64** %data2, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !60
  %13 = load i64, i64* %arrayidx, align 8, !dbg !60
  call void @printLongLongLine(i64 %13), !dbg !61
  %14 = load i64*, i64** %data2, align 8, !dbg !62
  %15 = bitcast i64* %14 to i8*, !dbg !62
  call void @free(i8* %15) #7, !dbg !63
  ret void, !dbg !64
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #7, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #7, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !95
  store i64* null, i64** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !100
  %1 = load i64*, i64** %0, align 8, !dbg !101
  store i64* %1, i64** %data1, align 8, !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !102
  %2 = bitcast i8* %call to i64*, !dbg !103
  store i64* %2, i64** %data1, align 8, !dbg !104
  %3 = load i64*, i64** %data1, align 8, !dbg !105
  %cmp = icmp eq i64* %3, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  %4 = load i64*, i64** %data1, align 8, !dbg !111
  %5 = load i64**, i64*** %dataPtr1, align 8, !dbg !112
  store i64* %4, i64** %5, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = load i64**, i64*** %dataPtr2, align 8, !dbg !117
  %7 = load i64*, i64** %6, align 8, !dbg !118
  store i64* %7, i64** %data2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %8 = bitcast [100 x i64]* %source to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 800, i1 false), !dbg !121
  %9 = load i64*, i64** %data2, align 8, !dbg !122
  %10 = bitcast i64* %9 to i8*, !dbg !123
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !123
  %11 = bitcast i64* %arraydecay to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %10, i8* align 16 %11, i64 800, i1 false), !dbg !123
  %12 = load i64*, i64** %data2, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i64, i64* %12, i64 0, !dbg !124
  %13 = load i64, i64* %arrayidx, align 8, !dbg !124
  call void @printLongLongLine(i64 %13), !dbg !125
  %14 = load i64*, i64** %data2, align 8, !dbg !126
  %15 = bitcast i64* %14 to i8*, !dbg !126
  call void @free(i8* %15) #7, !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 24, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!26 = !DILocation(line: 24, column: 16, scope: !18)
!27 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 25, type: !25)
!28 = !DILocation(line: 25, column: 16, scope: !18)
!29 = !DILocation(line: 26, column: 10, scope: !18)
!30 = !DILocalVariable(name: "data", scope: !31, file: !19, line: 28, type: !4)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 5)
!32 = !DILocation(line: 28, column: 19, scope: !31)
!33 = !DILocation(line: 28, column: 27, scope: !31)
!34 = !DILocation(line: 28, column: 26, scope: !31)
!35 = !DILocation(line: 30, column: 27, scope: !31)
!36 = !DILocation(line: 30, column: 16, scope: !31)
!37 = !DILocation(line: 30, column: 14, scope: !31)
!38 = !DILocation(line: 31, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !19, line: 31, column: 13)
!40 = !DILocation(line: 31, column: 18, scope: !39)
!41 = !DILocation(line: 31, column: 13, scope: !31)
!42 = !DILocation(line: 31, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !19, line: 31, column: 27)
!44 = !DILocation(line: 32, column: 21, scope: !31)
!45 = !DILocation(line: 32, column: 10, scope: !31)
!46 = !DILocation(line: 32, column: 19, scope: !31)
!47 = !DILocalVariable(name: "data", scope: !48, file: !19, line: 35, type: !4)
!48 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!49 = !DILocation(line: 35, column: 19, scope: !48)
!50 = !DILocation(line: 35, column: 27, scope: !48)
!51 = !DILocation(line: 35, column: 26, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !53, file: !19, line: 37, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !19, line: 36, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 37, column: 21, scope: !53)
!58 = !DILocation(line: 39, column: 20, scope: !53)
!59 = !DILocation(line: 39, column: 13, scope: !53)
!60 = !DILocation(line: 40, column: 31, scope: !53)
!61 = !DILocation(line: 40, column: 13, scope: !53)
!62 = !DILocation(line: 41, column: 18, scope: !53)
!63 = !DILocation(line: 41, column: 13, scope: !53)
!64 = !DILocation(line: 44, column: 1, scope: !18)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_32_good", scope: !19, file: !19, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 78, column: 5, scope: !65)
!67 = !DILocation(line: 79, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 90, type: !69, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !19, line: 90, type: !71)
!76 = !DILocation(line: 90, column: 14, scope: !68)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !19, line: 90, type: !72)
!78 = !DILocation(line: 90, column: 27, scope: !68)
!79 = !DILocation(line: 93, column: 22, scope: !68)
!80 = !DILocation(line: 93, column: 12, scope: !68)
!81 = !DILocation(line: 93, column: 5, scope: !68)
!82 = !DILocation(line: 95, column: 5, scope: !68)
!83 = !DILocation(line: 96, column: 5, scope: !68)
!84 = !DILocation(line: 97, column: 5, scope: !68)
!85 = !DILocation(line: 100, column: 5, scope: !68)
!86 = !DILocation(line: 101, column: 5, scope: !68)
!87 = !DILocation(line: 102, column: 5, scope: !68)
!88 = !DILocation(line: 104, column: 5, scope: !68)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !19, line: 53, type: !4)
!91 = !DILocation(line: 53, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !19, line: 54, type: !25)
!93 = !DILocation(line: 54, column: 16, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !19, line: 55, type: !25)
!95 = !DILocation(line: 55, column: 16, scope: !89)
!96 = !DILocation(line: 56, column: 10, scope: !89)
!97 = !DILocalVariable(name: "data", scope: !98, file: !19, line: 58, type: !4)
!98 = distinct !DILexicalBlock(scope: !89, file: !19, line: 57, column: 5)
!99 = !DILocation(line: 58, column: 19, scope: !98)
!100 = !DILocation(line: 58, column: 27, scope: !98)
!101 = !DILocation(line: 58, column: 26, scope: !98)
!102 = !DILocation(line: 60, column: 27, scope: !98)
!103 = !DILocation(line: 60, column: 16, scope: !98)
!104 = !DILocation(line: 60, column: 14, scope: !98)
!105 = !DILocation(line: 61, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !19, line: 61, column: 13)
!107 = !DILocation(line: 61, column: 18, scope: !106)
!108 = !DILocation(line: 61, column: 13, scope: !98)
!109 = !DILocation(line: 61, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !19, line: 61, column: 27)
!111 = !DILocation(line: 62, column: 21, scope: !98)
!112 = !DILocation(line: 62, column: 10, scope: !98)
!113 = !DILocation(line: 62, column: 19, scope: !98)
!114 = !DILocalVariable(name: "data", scope: !115, file: !19, line: 65, type: !4)
!115 = distinct !DILexicalBlock(scope: !89, file: !19, line: 64, column: 5)
!116 = !DILocation(line: 65, column: 19, scope: !115)
!117 = !DILocation(line: 65, column: 27, scope: !115)
!118 = !DILocation(line: 65, column: 26, scope: !115)
!119 = !DILocalVariable(name: "source", scope: !120, file: !19, line: 67, type: !54)
!120 = distinct !DILexicalBlock(scope: !115, file: !19, line: 66, column: 9)
!121 = !DILocation(line: 67, column: 21, scope: !120)
!122 = !DILocation(line: 69, column: 20, scope: !120)
!123 = !DILocation(line: 69, column: 13, scope: !120)
!124 = !DILocation(line: 70, column: 31, scope: !120)
!125 = !DILocation(line: 70, column: 13, scope: !120)
!126 = !DILocation(line: 71, column: 18, scope: !120)
!127 = !DILocation(line: 71, column: 13, scope: !120)
!128 = !DILocation(line: 74, column: 1, scope: !89)
