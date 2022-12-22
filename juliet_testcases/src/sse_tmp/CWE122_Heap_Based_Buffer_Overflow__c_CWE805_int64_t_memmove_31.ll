; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
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
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %2 = load i64*, i64** %data, align 8, !dbg !37
  store i64* %2, i64** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %3 = load i64*, i64** %dataCopy, align 8, !dbg !40
  store i64* %3, i64** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !46
  %5 = load i64*, i64** %data1, align 8, !dbg !47
  %6 = bitcast i64* %5 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !48
  %7 = bitcast i64* %arraydecay to i8*, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !48
  %8 = load i64*, i64** %data1, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !49
  %9 = load i64, i64* %arrayidx, align 8, !dbg !49
  call void @printLongLongLine(i64 %9), !dbg !50
  %10 = load i64*, i64** %data1, align 8, !dbg !51
  %11 = bitcast i64* %10 to i8*, !dbg !51
  call void @free(i8* %11) #7, !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i64* null, i64** %data, align 8, !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !82
  %0 = bitcast i8* %call to i64*, !dbg !83
  store i64* %0, i64** %data, align 8, !dbg !84
  %1 = load i64*, i64** %data, align 8, !dbg !85
  %cmp = icmp eq i64* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = load i64*, i64** %data, align 8, !dbg !94
  store i64* %2, i64** %dataCopy, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !95, metadata !DIExpression()), !dbg !96
  %3 = load i64*, i64** %dataCopy, align 8, !dbg !97
  store i64* %3, i64** %data1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !100
  %5 = load i64*, i64** %data1, align 8, !dbg !101
  %6 = bitcast i64* %5 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !102
  %7 = bitcast i64* %arraydecay to i8*, !dbg !102
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !102
  %8 = load i64*, i64** %data1, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !103
  %9 = load i64, i64* %arrayidx, align 8, !dbg !103
  call void @printLongLongLine(i64 %9), !dbg !104
  %10 = load i64*, i64** %data1, align 8, !dbg !105
  %11 = bitcast i64* %10 to i8*, !dbg !105
  call void @free(i8* %11) #7, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 26, column: 23, scope: !18)
!26 = !DILocation(line: 26, column: 12, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 9, scope: !18)
!32 = !DILocation(line: 27, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 23)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !19, line: 29, type: !4)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 5)
!36 = !DILocation(line: 29, column: 19, scope: !35)
!37 = !DILocation(line: 29, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !19, line: 30, type: !4)
!39 = !DILocation(line: 30, column: 19, scope: !35)
!40 = !DILocation(line: 30, column: 26, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !19, line: 32, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !19, line: 31, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 32, column: 21, scope: !42)
!47 = !DILocation(line: 34, column: 21, scope: !42)
!48 = !DILocation(line: 34, column: 13, scope: !42)
!49 = !DILocation(line: 35, column: 31, scope: !42)
!50 = !DILocation(line: 35, column: 13, scope: !42)
!51 = !DILocation(line: 36, column: 18, scope: !42)
!52 = !DILocation(line: 36, column: 13, scope: !42)
!53 = !DILocation(line: 39, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_31_good", scope: !19, file: !19, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 68, column: 5, scope: !54)
!56 = !DILocation(line: 69, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 80, type: !58, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !19, line: 80, type: !60)
!65 = !DILocation(line: 80, column: 14, scope: !57)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !19, line: 80, type: !61)
!67 = !DILocation(line: 80, column: 27, scope: !57)
!68 = !DILocation(line: 83, column: 22, scope: !57)
!69 = !DILocation(line: 83, column: 12, scope: !57)
!70 = !DILocation(line: 83, column: 5, scope: !57)
!71 = !DILocation(line: 85, column: 5, scope: !57)
!72 = !DILocation(line: 86, column: 5, scope: !57)
!73 = !DILocation(line: 87, column: 5, scope: !57)
!74 = !DILocation(line: 90, column: 5, scope: !57)
!75 = !DILocation(line: 91, column: 5, scope: !57)
!76 = !DILocation(line: 92, column: 5, scope: !57)
!77 = !DILocation(line: 94, column: 5, scope: !57)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 46, type: !20, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !19, line: 48, type: !4)
!80 = !DILocation(line: 48, column: 15, scope: !78)
!81 = !DILocation(line: 49, column: 10, scope: !78)
!82 = !DILocation(line: 51, column: 23, scope: !78)
!83 = !DILocation(line: 51, column: 12, scope: !78)
!84 = !DILocation(line: 51, column: 10, scope: !78)
!85 = !DILocation(line: 52, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !19, line: 52, column: 9)
!87 = !DILocation(line: 52, column: 14, scope: !86)
!88 = !DILocation(line: 52, column: 9, scope: !78)
!89 = !DILocation(line: 52, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !19, line: 52, column: 23)
!91 = !DILocalVariable(name: "dataCopy", scope: !92, file: !19, line: 54, type: !4)
!92 = distinct !DILexicalBlock(scope: !78, file: !19, line: 53, column: 5)
!93 = !DILocation(line: 54, column: 19, scope: !92)
!94 = !DILocation(line: 54, column: 30, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !19, line: 55, type: !4)
!96 = !DILocation(line: 55, column: 19, scope: !92)
!97 = !DILocation(line: 55, column: 26, scope: !92)
!98 = !DILocalVariable(name: "source", scope: !99, file: !19, line: 57, type: !43)
!99 = distinct !DILexicalBlock(scope: !92, file: !19, line: 56, column: 9)
!100 = !DILocation(line: 57, column: 21, scope: !99)
!101 = !DILocation(line: 59, column: 21, scope: !99)
!102 = !DILocation(line: 59, column: 13, scope: !99)
!103 = !DILocation(line: 60, column: 31, scope: !99)
!104 = !DILocation(line: 60, column: 13, scope: !99)
!105 = !DILocation(line: 61, column: 18, scope: !99)
!106 = !DILocation(line: 61, column: 13, scope: !99)
!107 = !DILocation(line: 64, column: 1, scope: !78)
