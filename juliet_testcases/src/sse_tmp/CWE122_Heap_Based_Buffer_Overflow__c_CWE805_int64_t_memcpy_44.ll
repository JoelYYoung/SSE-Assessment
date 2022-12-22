; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !28
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
  %2 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !39
  %3 = load i64*, i64** %data, align 8, !dbg !40
  call void %2(i64* %3), !dbg !39
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i64* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !50
  %1 = load i64*, i64** %data.addr, align 8, !dbg !51
  %2 = bitcast i64* %1 to i8*, !dbg !52
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !52
  %3 = bitcast i64* %arraydecay to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !52
  %4 = load i64*, i64** %data.addr, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !53
  %5 = load i64, i64* %arrayidx, align 8, !dbg !53
  call void @printLongLongLine(i64 %5), !dbg !54
  %6 = load i64*, i64** %data.addr, align 8, !dbg !55
  %7 = bitcast i64* %6 to i8*, !dbg !55
  call void @free(i8* %7) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !85, metadata !DIExpression()), !dbg !86
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !86
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
  %2 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !97
  %3 = load i64*, i64** %data, align 8, !dbg !98
  call void %2(i64* %3), !dbg !97
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i64* %data) #0 !dbg !100 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !105
  %1 = load i64*, i64** %data.addr, align 8, !dbg !106
  %2 = bitcast i64* %1 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !107
  %3 = bitcast i64* %arraydecay to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !107
  %4 = load i64*, i64** %data.addr, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !108
  %5 = load i64, i64* %arrayidx, align 8, !dbg !108
  call void @printLongLongLine(i64 %5), !dbg !109
  %6 = load i64*, i64** %data.addr, align 8, !dbg !110
  %7 = bitcast i64* %6 to i8*, !dbg !110
  call void @free(i8* %7) #7, !dbg !111
  ret void, !dbg !112
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44_bad", scope: !19, file: !19, line: 32, type: !20, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 34, type: !4)
!23 = !DILocation(line: 34, column: 15, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !19, line: 36, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !4}
!28 = !DILocation(line: 36, column: 12, scope: !18)
!29 = !DILocation(line: 37, column: 10, scope: !18)
!30 = !DILocation(line: 39, column: 23, scope: !18)
!31 = !DILocation(line: 39, column: 12, scope: !18)
!32 = !DILocation(line: 39, column: 10, scope: !18)
!33 = !DILocation(line: 40, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 9)
!35 = !DILocation(line: 40, column: 14, scope: !34)
!36 = !DILocation(line: 40, column: 9, scope: !18)
!37 = !DILocation(line: 40, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 40, column: 23)
!39 = !DILocation(line: 42, column: 5, scope: !18)
!40 = !DILocation(line: 42, column: 13, scope: !18)
!41 = !DILocation(line: 43, column: 1, scope: !18)
!42 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 21, type: !26, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !19, line: 21, type: !4)
!44 = !DILocation(line: 21, column: 31, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !19, line: 24, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !19, line: 23, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 24, column: 17, scope: !46)
!51 = !DILocation(line: 26, column: 16, scope: !46)
!52 = !DILocation(line: 26, column: 9, scope: !46)
!53 = !DILocation(line: 27, column: 27, scope: !46)
!54 = !DILocation(line: 27, column: 9, scope: !46)
!55 = !DILocation(line: 28, column: 14, scope: !46)
!56 = !DILocation(line: 28, column: 9, scope: !46)
!57 = !DILocation(line: 30, column: 1, scope: !42)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_44_good", scope: !19, file: !19, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 74, column: 5, scope: !58)
!60 = !DILocation(line: 75, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 86, type: !62, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !19, line: 86, type: !64)
!69 = !DILocation(line: 86, column: 14, scope: !61)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !19, line: 86, type: !65)
!71 = !DILocation(line: 86, column: 27, scope: !61)
!72 = !DILocation(line: 89, column: 22, scope: !61)
!73 = !DILocation(line: 89, column: 12, scope: !61)
!74 = !DILocation(line: 89, column: 5, scope: !61)
!75 = !DILocation(line: 91, column: 5, scope: !61)
!76 = !DILocation(line: 92, column: 5, scope: !61)
!77 = !DILocation(line: 93, column: 5, scope: !61)
!78 = !DILocation(line: 96, column: 5, scope: !61)
!79 = !DILocation(line: 97, column: 5, scope: !61)
!80 = !DILocation(line: 98, column: 5, scope: !61)
!81 = !DILocation(line: 100, column: 5, scope: !61)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !19, line: 63, type: !4)
!84 = !DILocation(line: 63, column: 15, scope: !82)
!85 = !DILocalVariable(name: "funcPtr", scope: !82, file: !19, line: 64, type: !25)
!86 = !DILocation(line: 64, column: 12, scope: !82)
!87 = !DILocation(line: 65, column: 10, scope: !82)
!88 = !DILocation(line: 67, column: 23, scope: !82)
!89 = !DILocation(line: 67, column: 12, scope: !82)
!90 = !DILocation(line: 67, column: 10, scope: !82)
!91 = !DILocation(line: 68, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !19, line: 68, column: 9)
!93 = !DILocation(line: 68, column: 14, scope: !92)
!94 = !DILocation(line: 68, column: 9, scope: !82)
!95 = !DILocation(line: 68, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 68, column: 23)
!97 = !DILocation(line: 69, column: 5, scope: !82)
!98 = !DILocation(line: 69, column: 13, scope: !82)
!99 = !DILocation(line: 70, column: 1, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 50, type: !26, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", arg: 1, scope: !100, file: !19, line: 50, type: !4)
!102 = !DILocation(line: 50, column: 35, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !19, line: 53, type: !47)
!104 = distinct !DILexicalBlock(scope: !100, file: !19, line: 52, column: 5)
!105 = !DILocation(line: 53, column: 17, scope: !104)
!106 = !DILocation(line: 55, column: 16, scope: !104)
!107 = !DILocation(line: 55, column: 9, scope: !104)
!108 = !DILocation(line: 56, column: 27, scope: !104)
!109 = !DILocation(line: 56, column: 9, scope: !104)
!110 = !DILocation(line: 57, column: 14, scope: !104)
!111 = !DILocation(line: 57, column: 9, scope: !104)
!112 = !DILocation(line: 59, column: 1, scope: !100)
