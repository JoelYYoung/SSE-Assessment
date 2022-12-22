; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %0 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end3, !dbg !32

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !33
  %1 = bitcast i8* %call to i64*, !dbg !35
  store i64* %1, i64** %data, align 8, !dbg !36
  %2 = load i64*, i64** %data, align 8, !dbg !37
  %cmp1 = icmp eq i64* %2, null, !dbg !39
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !40

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !49
  %4 = load i64*, i64** %data, align 8, !dbg !50
  %5 = bitcast i64* %4 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !51
  %6 = bitcast i64* %arraydecay to i8*, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 %6, i64 800, i1 false), !dbg !51
  %7 = load i64*, i64** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !52
  %8 = load i64, i64* %arrayidx, align 8, !dbg !52
  call void @printLongLongLine(i64 %8), !dbg !53
  %9 = load i64*, i64** %data, align 8, !dbg !54
  %10 = bitcast i64* %9 to i8*, !dbg !54
  call void @free(i8* %10) #7, !dbg !55
  ret void, !dbg !56
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i64* null, i64** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end3, !dbg !91

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !92
  %1 = bitcast i8* %call to i64*, !dbg !94
  store i64* %1, i64** %data, align 8, !dbg !95
  %2 = load i64*, i64** %data, align 8, !dbg !96
  %cmp1 = icmp eq i64* %2, null, !dbg !98
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !104
  %4 = load i64*, i64** %data, align 8, !dbg !105
  %5 = bitcast i64* %4 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !106
  %6 = bitcast i64* %arraydecay to i8*, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 %6, i64 800, i1 false), !dbg !106
  %7 = load i64*, i64** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !107
  %8 = load i64, i64* %arrayidx, align 8, !dbg !107
  call void @printLongLongLine(i64 %8), !dbg !108
  %9 = load i64*, i64** %data, align 8, !dbg !109
  %10 = bitcast i64* %9 to i8*, !dbg !109
  call void @free(i8* %10) #7, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i64* null, i64** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticFive, align 4, !dbg !116
  %cmp = icmp eq i32 %0, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.end3, !dbg !119

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !120
  %1 = bitcast i8* %call to i64*, !dbg !122
  store i64* %1, i64** %data, align 8, !dbg !123
  %2 = load i64*, i64** %data, align 8, !dbg !124
  %cmp1 = icmp eq i64* %2, null, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !127

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !130

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !133
  %4 = load i64*, i64** %data, align 8, !dbg !134
  %5 = bitcast i64* %4 to i8*, !dbg !135
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !135
  %6 = bitcast i64* %arraydecay to i8*, !dbg !135
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 %6, i64 800, i1 false), !dbg !135
  %7 = load i64*, i64** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !136
  %8 = load i64, i64* %arrayidx, align 8, !dbg !136
  call void @printLongLongLine(i64 %8), !dbg !137
  %9 = load i64*, i64** %data, align 8, !dbg !138
  %10 = bitcast i64* %9 to i8*, !dbg !138
  call void @free(i8* %10) #7, !dbg !139
  ret void, !dbg !140
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !15, line: 23, type: !16, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07.c", directory: "/root/SSE-Assessment")
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
!14 = !{!0}
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07.c", directory: "/root/SSE-Assessment")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07_bad", scope: !15, file: !15, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 29, type: !6)
!27 = !DILocation(line: 29, column: 15, scope: !23)
!28 = !DILocation(line: 30, column: 10, scope: !23)
!29 = !DILocation(line: 31, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 8)
!31 = !DILocation(line: 31, column: 18, scope: !30)
!32 = !DILocation(line: 31, column: 8, scope: !23)
!33 = !DILocation(line: 34, column: 27, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 32, column: 5)
!35 = !DILocation(line: 34, column: 16, scope: !34)
!36 = !DILocation(line: 34, column: 14, scope: !34)
!37 = !DILocation(line: 35, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 13)
!39 = !DILocation(line: 35, column: 18, scope: !38)
!40 = !DILocation(line: 35, column: 13, scope: !34)
!41 = !DILocation(line: 35, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 35, column: 27)
!43 = !DILocation(line: 36, column: 5, scope: !34)
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 38, type: !46)
!45 = distinct !DILexicalBlock(scope: !23, file: !15, line: 37, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 38, column: 17, scope: !45)
!50 = !DILocation(line: 40, column: 17, scope: !45)
!51 = !DILocation(line: 40, column: 9, scope: !45)
!52 = !DILocation(line: 41, column: 27, scope: !45)
!53 = !DILocation(line: 41, column: 9, scope: !45)
!54 = !DILocation(line: 42, column: 14, scope: !45)
!55 = !DILocation(line: 42, column: 9, scope: !45)
!56 = !DILocation(line: 44, column: 1, scope: !23)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_07_good", scope: !15, file: !15, line: 95, type: !24, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 97, column: 5, scope: !57)
!59 = !DILocation(line: 98, column: 5, scope: !57)
!60 = !DILocation(line: 99, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 111, type: !62, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!16, !16, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 111, type: !16)
!68 = !DILocation(line: 111, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 111, type: !64)
!70 = !DILocation(line: 111, column: 27, scope: !61)
!71 = !DILocation(line: 114, column: 22, scope: !61)
!72 = !DILocation(line: 114, column: 12, scope: !61)
!73 = !DILocation(line: 114, column: 5, scope: !61)
!74 = !DILocation(line: 116, column: 5, scope: !61)
!75 = !DILocation(line: 117, column: 5, scope: !61)
!76 = !DILocation(line: 118, column: 5, scope: !61)
!77 = !DILocation(line: 121, column: 5, scope: !61)
!78 = !DILocation(line: 122, column: 5, scope: !61)
!79 = !DILocation(line: 123, column: 5, scope: !61)
!80 = !DILocation(line: 125, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !24, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 53, type: !6)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocation(line: 54, column: 10, scope: !81)
!85 = !DILocation(line: 55, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !15, line: 55, column: 8)
!87 = !DILocation(line: 55, column: 18, scope: !86)
!88 = !DILocation(line: 55, column: 8, scope: !81)
!89 = !DILocation(line: 58, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 56, column: 5)
!91 = !DILocation(line: 59, column: 5, scope: !90)
!92 = !DILocation(line: 63, column: 27, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !15, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 16, scope: !93)
!95 = !DILocation(line: 63, column: 14, scope: !93)
!96 = !DILocation(line: 64, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 64, column: 13)
!98 = !DILocation(line: 64, column: 18, scope: !97)
!99 = !DILocation(line: 64, column: 13, scope: !93)
!100 = !DILocation(line: 64, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 64, column: 27)
!102 = !DILocalVariable(name: "source", scope: !103, file: !15, line: 67, type: !46)
!103 = distinct !DILexicalBlock(scope: !81, file: !15, line: 66, column: 5)
!104 = !DILocation(line: 67, column: 17, scope: !103)
!105 = !DILocation(line: 69, column: 17, scope: !103)
!106 = !DILocation(line: 69, column: 9, scope: !103)
!107 = !DILocation(line: 70, column: 27, scope: !103)
!108 = !DILocation(line: 70, column: 9, scope: !103)
!109 = !DILocation(line: 71, column: 14, scope: !103)
!110 = !DILocation(line: 71, column: 9, scope: !103)
!111 = !DILocation(line: 73, column: 1, scope: !81)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 76, type: !24, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 78, type: !6)
!114 = !DILocation(line: 78, column: 15, scope: !112)
!115 = !DILocation(line: 79, column: 10, scope: !112)
!116 = !DILocation(line: 80, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !15, line: 80, column: 8)
!118 = !DILocation(line: 80, column: 18, scope: !117)
!119 = !DILocation(line: 80, column: 8, scope: !112)
!120 = !DILocation(line: 83, column: 27, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 81, column: 5)
!122 = !DILocation(line: 83, column: 16, scope: !121)
!123 = !DILocation(line: 83, column: 14, scope: !121)
!124 = !DILocation(line: 84, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 84, column: 13)
!126 = !DILocation(line: 84, column: 18, scope: !125)
!127 = !DILocation(line: 84, column: 13, scope: !121)
!128 = !DILocation(line: 84, column: 28, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 84, column: 27)
!130 = !DILocation(line: 85, column: 5, scope: !121)
!131 = !DILocalVariable(name: "source", scope: !132, file: !15, line: 87, type: !46)
!132 = distinct !DILexicalBlock(scope: !112, file: !15, line: 86, column: 5)
!133 = !DILocation(line: 87, column: 17, scope: !132)
!134 = !DILocation(line: 89, column: 17, scope: !132)
!135 = !DILocation(line: 89, column: 9, scope: !132)
!136 = !DILocation(line: 90, column: 27, scope: !132)
!137 = !DILocation(line: 90, column: 9, scope: !132)
!138 = !DILocation(line: 91, column: 14, scope: !132)
!139 = !DILocation(line: 91, column: 9, scope: !132)
!140 = !DILocation(line: 93, column: 1, scope: !112)
