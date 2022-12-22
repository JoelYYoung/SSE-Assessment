; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_badSink(i64* %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !29
  %1 = load i64*, i64** %data.addr, align 8, !dbg !30
  %2 = bitcast i64* %1 to i8*, !dbg !31
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !31
  %3 = bitcast i64* %arraydecay to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !31
  %4 = load i64*, i64** %data.addr, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !32
  %5 = load i64, i64* %arrayidx, align 8, !dbg !32
  call void @printLongLongLine(i64 %5), !dbg !33
  %6 = load i64*, i64** %data.addr, align 8, !dbg !34
  %7 = bitcast i64* %6 to i8*, !dbg !34
  call void @free(i8* %7) #7, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !40, metadata !DIExpression()), !dbg !41
  store i64* null, i64** %data, align 8, !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !43
  %0 = bitcast i8* %call to i64*, !dbg !44
  store i64* %0, i64** %data, align 8, !dbg !45
  %1 = load i64*, i64** %data, align 8, !dbg !46
  %cmp = icmp eq i64* %1, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_badSink(i64* %2), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_goodG2BSink(i64* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !58, metadata !DIExpression()), !dbg !60
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !60
  %1 = load i64*, i64** %data.addr, align 8, !dbg !61
  %2 = bitcast i64* %1 to i8*, !dbg !62
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !62
  %3 = bitcast i64* %arraydecay to i8*, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !62
  %4 = load i64*, i64** %data.addr, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !63
  %5 = load i64, i64* %arrayidx, align 8, !dbg !63
  call void @printLongLongLine(i64 %5), !dbg !64
  %6 = load i64*, i64** %data.addr, align 8, !dbg !65
  %7 = bitcast i64* %6 to i8*, !dbg !65
  call void @free(i8* %7) #7, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i64* null, i64** %data, align 8, !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !96
  %0 = bitcast i8* %call to i64*, !dbg !97
  store i64* %0, i64** %data, align 8, !dbg !98
  %1 = load i64*, i64** %data, align 8, !dbg !99
  %cmp = icmp eq i64* %1, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_goodG2BSink(i64* %2), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_badSink", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !4}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 21, type: !4)
!23 = !DILocation(line: 21, column: 86, scope: !18)
!24 = !DILocalVariable(name: "source", scope: !25, file: !19, line: 24, type: !26)
!25 = distinct !DILexicalBlock(scope: !18, file: !19, line: 23, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 24, column: 17, scope: !25)
!30 = !DILocation(line: 26, column: 16, scope: !25)
!31 = !DILocation(line: 26, column: 9, scope: !25)
!32 = !DILocation(line: 27, column: 27, scope: !25)
!33 = !DILocation(line: 27, column: 9, scope: !25)
!34 = !DILocation(line: 28, column: 14, scope: !25)
!35 = !DILocation(line: 28, column: 9, scope: !25)
!36 = !DILocation(line: 30, column: 1, scope: !18)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_bad", scope: !19, file: !19, line: 32, type: !38, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !19, line: 34, type: !4)
!41 = !DILocation(line: 34, column: 15, scope: !37)
!42 = !DILocation(line: 35, column: 10, scope: !37)
!43 = !DILocation(line: 37, column: 23, scope: !37)
!44 = !DILocation(line: 37, column: 12, scope: !37)
!45 = !DILocation(line: 37, column: 10, scope: !37)
!46 = !DILocation(line: 38, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !37, file: !19, line: 38, column: 9)
!48 = !DILocation(line: 38, column: 14, scope: !47)
!49 = !DILocation(line: 38, column: 9, scope: !37)
!50 = !DILocation(line: 38, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !19, line: 38, column: 23)
!52 = !DILocation(line: 39, column: 75, scope: !37)
!53 = !DILocation(line: 39, column: 5, scope: !37)
!54 = !DILocation(line: 40, column: 1, scope: !37)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_goodG2BSink", scope: !19, file: !19, line: 46, type: !20, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !19, line: 46, type: !4)
!57 = !DILocation(line: 46, column: 90, scope: !55)
!58 = !DILocalVariable(name: "source", scope: !59, file: !19, line: 49, type: !26)
!59 = distinct !DILexicalBlock(scope: !55, file: !19, line: 48, column: 5)
!60 = !DILocation(line: 49, column: 17, scope: !59)
!61 = !DILocation(line: 51, column: 16, scope: !59)
!62 = !DILocation(line: 51, column: 9, scope: !59)
!63 = !DILocation(line: 52, column: 27, scope: !59)
!64 = !DILocation(line: 52, column: 9, scope: !59)
!65 = !DILocation(line: 53, column: 14, scope: !59)
!66 = !DILocation(line: 53, column: 9, scope: !59)
!67 = !DILocation(line: 55, column: 1, scope: !55)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_41_good", scope: !19, file: !19, line: 68, type: !38, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 70, column: 5, scope: !68)
!70 = !DILocation(line: 71, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 83, type: !72, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !19, line: 83, type: !74)
!79 = !DILocation(line: 83, column: 14, scope: !71)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !19, line: 83, type: !75)
!81 = !DILocation(line: 83, column: 27, scope: !71)
!82 = !DILocation(line: 86, column: 22, scope: !71)
!83 = !DILocation(line: 86, column: 12, scope: !71)
!84 = !DILocation(line: 86, column: 5, scope: !71)
!85 = !DILocation(line: 88, column: 5, scope: !71)
!86 = !DILocation(line: 89, column: 5, scope: !71)
!87 = !DILocation(line: 90, column: 5, scope: !71)
!88 = !DILocation(line: 93, column: 5, scope: !71)
!89 = !DILocation(line: 94, column: 5, scope: !71)
!90 = !DILocation(line: 95, column: 5, scope: !71)
!91 = !DILocation(line: 97, column: 5, scope: !71)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 58, type: !38, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !19, line: 60, type: !4)
!94 = !DILocation(line: 60, column: 15, scope: !92)
!95 = !DILocation(line: 61, column: 10, scope: !92)
!96 = !DILocation(line: 63, column: 23, scope: !92)
!97 = !DILocation(line: 63, column: 12, scope: !92)
!98 = !DILocation(line: 63, column: 10, scope: !92)
!99 = !DILocation(line: 64, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !19, line: 64, column: 9)
!101 = !DILocation(line: 64, column: 14, scope: !100)
!102 = !DILocation(line: 64, column: 9, scope: !92)
!103 = !DILocation(line: 64, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !19, line: 64, column: 23)
!105 = !DILocation(line: 65, column: 79, scope: !92)
!106 = !DILocation(line: 65, column: 5, scope: !92)
!107 = !DILocation(line: 66, column: 1, scope: !92)
