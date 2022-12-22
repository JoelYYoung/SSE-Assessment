; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_goodG2BData = internal global i64* null, align 8, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_bad() #0 !dbg !24 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !30
  %0 = bitcast i8* %call to i64*, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !32
  %1 = load i64*, i64** %data, align 8, !dbg !33
  %cmp = icmp eq i64* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !39
  store i64* %2, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_badData, align 8, !dbg !70
  store i64* %0, i64** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !76
  %2 = load i64*, i64** %data, align 8, !dbg !77
  %3 = bitcast i64* %2 to i8*, !dbg !78
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !78
  %4 = bitcast i64* %arraydecay to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !78
  %5 = load i64*, i64** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !79
  %6 = load i64, i64* %arrayidx, align 8, !dbg !79
  call void @printLongLongLine(i64 %6), !dbg !80
  %7 = load i64*, i64** %data, align 8, !dbg !81
  %8 = bitcast i64* %7 to i8*, !dbg !81
  call void @free(i8* %8) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i64* null, i64** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !88
  %0 = bitcast i8* %call to i64*, !dbg !89
  store i64* %0, i64** %data, align 8, !dbg !90
  %1 = load i64*, i64** %data, align 8, !dbg !91
  %cmp = icmp eq i64* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !97
  store i64* %2, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_goodG2BData, align 8, !dbg !98
  call void @goodG2BSink(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_goodG2BData, align 8, !dbg !104
  store i64* %0, i64** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !107
  %2 = load i64*, i64** %data, align 8, !dbg !108
  %3 = bitcast i64* %2 to i8*, !dbg !109
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !109
  %4 = bitcast i64* %arraydecay to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !109
  %5 = load i64*, i64** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !110
  %6 = load i64, i64* %arrayidx, align 8, !dbg !110
  call void @printLongLongLine(i64 %6), !dbg !111
  %7 = load i64*, i64** %data, align 8, !dbg !112
  %8 = bitcast i64* %7 to i8*, !dbg !112
  call void @free(i8* %8) #7, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_badData", scope: !2, file: !17, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_goodG2BData", scope: !2, file: !17, line: 20, type: !6, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45.c", directory: "/root/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_bad", scope: !17, file: !17, line: 36, type: !25, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 38, type: !6)
!28 = !DILocation(line: 38, column: 15, scope: !24)
!29 = !DILocation(line: 39, column: 10, scope: !24)
!30 = !DILocation(line: 41, column: 23, scope: !24)
!31 = !DILocation(line: 41, column: 12, scope: !24)
!32 = !DILocation(line: 41, column: 10, scope: !24)
!33 = !DILocation(line: 42, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 9)
!35 = !DILocation(line: 42, column: 14, scope: !34)
!36 = !DILocation(line: 42, column: 9, scope: !24)
!37 = !DILocation(line: 42, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 42, column: 23)
!39 = !DILocation(line: 43, column: 77, scope: !24)
!40 = !DILocation(line: 43, column: 75, scope: !24)
!41 = !DILocation(line: 44, column: 5, scope: !24)
!42 = !DILocation(line: 45, column: 1, scope: !24)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_45_good", scope: !17, file: !17, line: 75, type: !25, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 77, column: 5, scope: !43)
!45 = !DILocation(line: 78, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 89, type: !47, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !17, line: 89, type: !49)
!54 = !DILocation(line: 89, column: 14, scope: !46)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !17, line: 89, type: !50)
!56 = !DILocation(line: 89, column: 27, scope: !46)
!57 = !DILocation(line: 92, column: 22, scope: !46)
!58 = !DILocation(line: 92, column: 12, scope: !46)
!59 = !DILocation(line: 92, column: 5, scope: !46)
!60 = !DILocation(line: 94, column: 5, scope: !46)
!61 = !DILocation(line: 95, column: 5, scope: !46)
!62 = !DILocation(line: 96, column: 5, scope: !46)
!63 = !DILocation(line: 99, column: 5, scope: !46)
!64 = !DILocation(line: 100, column: 5, scope: !46)
!65 = !DILocation(line: 101, column: 5, scope: !46)
!66 = !DILocation(line: 103, column: 5, scope: !46)
!67 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 24, type: !25, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !17, line: 26, type: !6)
!69 = !DILocation(line: 26, column: 15, scope: !67)
!70 = !DILocation(line: 26, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !17, line: 28, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !17, line: 27, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 100)
!76 = !DILocation(line: 28, column: 17, scope: !72)
!77 = !DILocation(line: 30, column: 16, scope: !72)
!78 = !DILocation(line: 30, column: 9, scope: !72)
!79 = !DILocation(line: 31, column: 27, scope: !72)
!80 = !DILocation(line: 31, column: 9, scope: !72)
!81 = !DILocation(line: 32, column: 14, scope: !72)
!82 = !DILocation(line: 32, column: 9, scope: !72)
!83 = !DILocation(line: 34, column: 1, scope: !67)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 64, type: !25, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 66, type: !6)
!86 = !DILocation(line: 66, column: 15, scope: !84)
!87 = !DILocation(line: 67, column: 10, scope: !84)
!88 = !DILocation(line: 69, column: 23, scope: !84)
!89 = !DILocation(line: 69, column: 12, scope: !84)
!90 = !DILocation(line: 69, column: 10, scope: !84)
!91 = !DILocation(line: 70, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !17, line: 70, column: 9)
!93 = !DILocation(line: 70, column: 14, scope: !92)
!94 = !DILocation(line: 70, column: 9, scope: !84)
!95 = !DILocation(line: 70, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 70, column: 23)
!97 = !DILocation(line: 71, column: 81, scope: !84)
!98 = !DILocation(line: 71, column: 79, scope: !84)
!99 = !DILocation(line: 72, column: 5, scope: !84)
!100 = !DILocation(line: 73, column: 1, scope: !84)
!101 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 52, type: !25, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !17, line: 54, type: !6)
!103 = !DILocation(line: 54, column: 15, scope: !101)
!104 = !DILocation(line: 54, column: 22, scope: !101)
!105 = !DILocalVariable(name: "source", scope: !106, file: !17, line: 56, type: !73)
!106 = distinct !DILexicalBlock(scope: !101, file: !17, line: 55, column: 5)
!107 = !DILocation(line: 56, column: 17, scope: !106)
!108 = !DILocation(line: 58, column: 16, scope: !106)
!109 = !DILocation(line: 58, column: 9, scope: !106)
!110 = !DILocation(line: 59, column: 27, scope: !106)
!111 = !DILocation(line: 59, column: 9, scope: !106)
!112 = !DILocation(line: 60, column: 14, scope: !106)
!113 = !DILocation(line: 60, column: 9, scope: !106)
!114 = !DILocation(line: 62, column: 1, scope: !101)
