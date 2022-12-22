; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05_bad() #0 !dbg !25 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end2, !dbg !33

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !34
  %1 = bitcast i8* %call to i64*, !dbg !36
  store i64* %1, i64** %data, align 8, !dbg !37
  %2 = load i64*, i64** %data, align 8, !dbg !38
  %cmp = icmp eq i64* %2, null, !dbg !40
  br i1 %cmp, label %if.then1, label %if.end, !dbg !41

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !44

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !50
  %4 = load i64*, i64** %data, align 8, !dbg !51
  %5 = bitcast i64* %4 to i8*, !dbg !52
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !52
  %6 = bitcast i64* %arraydecay to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 %6, i64 800, i1 false), !dbg !52
  %7 = load i64*, i64** %data, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !53
  %8 = load i64, i64* %arrayidx, align 8, !dbg !53
  call void @printLongLongLine(i64 %8), !dbg !54
  %9 = load i64*, i64** %data, align 8, !dbg !55
  %10 = bitcast i64* %9 to i8*, !dbg !55
  call void @free(i8* %10) #7, !dbg !56
  ret void, !dbg !57
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
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
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i64* null, i64** %data, align 8, !dbg !85
  %0 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end2, !dbg !91

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !92
  %1 = bitcast i8* %call to i64*, !dbg !94
  store i64* %1, i64** %data, align 8, !dbg !95
  %2 = load i64*, i64** %data, align 8, !dbg !96
  %cmp = icmp eq i64* %2, null, !dbg !98
  br i1 %cmp, label %if.then1, label %if.end, !dbg !99

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !104
  %4 = load i64*, i64** %data, align 8, !dbg !105
  %5 = bitcast i64* %4 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !106
  %6 = bitcast i64* %arraydecay to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 %6, i64 800, i1 false), !dbg !106
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end2, !dbg !118

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !119
  %1 = bitcast i8* %call to i64*, !dbg !121
  store i64* %1, i64** %data, align 8, !dbg !122
  %2 = load i64*, i64** %data, align 8, !dbg !123
  %cmp = icmp eq i64* %2, null, !dbg !125
  br i1 %cmp, label %if.then1, label %if.end, !dbg !126

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !129

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !132
  %4 = load i64*, i64** %data, align 8, !dbg !133
  %5 = bitcast i64* %4 to i8*, !dbg !134
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !134
  %6 = bitcast i64* %arraydecay to i8*, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 %6, i64 800, i1 false), !dbg !134
  %7 = load i64*, i64** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !135
  %8 = load i64, i64* %arrayidx, align 8, !dbg !135
  call void @printLongLongLine(i64 %8), !dbg !136
  %9 = load i64*, i64** %data, align 8, !dbg !137
  %10 = bitcast i64* %9 to i8*, !dbg !137
  call void @free(i8* %10) #7, !dbg !138
  ret void, !dbg !139
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
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !17, line: 23, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !17, line: 24, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05.c", directory: "/root/SSE-Assessment")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05_bad", scope: !17, file: !17, line: 28, type: !26, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !17, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 15, scope: !25)
!30 = !DILocation(line: 31, column: 10, scope: !25)
!31 = !DILocation(line: 32, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !17, line: 32, column: 8)
!33 = !DILocation(line: 32, column: 8, scope: !25)
!34 = !DILocation(line: 35, column: 27, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 33, column: 5)
!36 = !DILocation(line: 35, column: 16, scope: !35)
!37 = !DILocation(line: 35, column: 14, scope: !35)
!38 = !DILocation(line: 36, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !17, line: 36, column: 13)
!40 = !DILocation(line: 36, column: 18, scope: !39)
!41 = !DILocation(line: 36, column: 13, scope: !35)
!42 = !DILocation(line: 36, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 36, column: 27)
!44 = !DILocation(line: 37, column: 5, scope: !35)
!45 = !DILocalVariable(name: "source", scope: !46, file: !17, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !25, file: !17, line: 38, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 39, column: 17, scope: !46)
!51 = !DILocation(line: 41, column: 16, scope: !46)
!52 = !DILocation(line: 41, column: 9, scope: !46)
!53 = !DILocation(line: 42, column: 27, scope: !46)
!54 = !DILocation(line: 42, column: 9, scope: !46)
!55 = !DILocation(line: 43, column: 14, scope: !46)
!56 = !DILocation(line: 43, column: 9, scope: !46)
!57 = !DILocation(line: 45, column: 1, scope: !25)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_05_good", scope: !17, file: !17, line: 96, type: !26, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 98, column: 5, scope: !58)
!60 = !DILocation(line: 99, column: 5, scope: !58)
!61 = !DILocation(line: 100, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 112, type: !63, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!18, !18, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 112, type: !18)
!69 = !DILocation(line: 112, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 112, type: !65)
!71 = !DILocation(line: 112, column: 27, scope: !62)
!72 = !DILocation(line: 115, column: 22, scope: !62)
!73 = !DILocation(line: 115, column: 12, scope: !62)
!74 = !DILocation(line: 115, column: 5, scope: !62)
!75 = !DILocation(line: 117, column: 5, scope: !62)
!76 = !DILocation(line: 118, column: 5, scope: !62)
!77 = !DILocation(line: 119, column: 5, scope: !62)
!78 = !DILocation(line: 122, column: 5, scope: !62)
!79 = !DILocation(line: 123, column: 5, scope: !62)
!80 = !DILocation(line: 124, column: 5, scope: !62)
!81 = !DILocation(line: 126, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 52, type: !26, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 54, type: !6)
!84 = !DILocation(line: 54, column: 15, scope: !82)
!85 = !DILocation(line: 55, column: 10, scope: !82)
!86 = !DILocation(line: 56, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !17, line: 56, column: 8)
!88 = !DILocation(line: 56, column: 8, scope: !82)
!89 = !DILocation(line: 59, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !17, line: 57, column: 5)
!91 = !DILocation(line: 60, column: 5, scope: !90)
!92 = !DILocation(line: 64, column: 27, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !17, line: 62, column: 5)
!94 = !DILocation(line: 64, column: 16, scope: !93)
!95 = !DILocation(line: 64, column: 14, scope: !93)
!96 = !DILocation(line: 65, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 65, column: 13)
!98 = !DILocation(line: 65, column: 18, scope: !97)
!99 = !DILocation(line: 65, column: 13, scope: !93)
!100 = !DILocation(line: 65, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 65, column: 27)
!102 = !DILocalVariable(name: "source", scope: !103, file: !17, line: 68, type: !47)
!103 = distinct !DILexicalBlock(scope: !82, file: !17, line: 67, column: 5)
!104 = !DILocation(line: 68, column: 17, scope: !103)
!105 = !DILocation(line: 70, column: 16, scope: !103)
!106 = !DILocation(line: 70, column: 9, scope: !103)
!107 = !DILocation(line: 71, column: 27, scope: !103)
!108 = !DILocation(line: 71, column: 9, scope: !103)
!109 = !DILocation(line: 72, column: 14, scope: !103)
!110 = !DILocation(line: 72, column: 9, scope: !103)
!111 = !DILocation(line: 74, column: 1, scope: !82)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 77, type: !26, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 79, type: !6)
!114 = !DILocation(line: 79, column: 15, scope: !112)
!115 = !DILocation(line: 80, column: 10, scope: !112)
!116 = !DILocation(line: 81, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 81, column: 8)
!118 = !DILocation(line: 81, column: 8, scope: !112)
!119 = !DILocation(line: 84, column: 27, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !17, line: 82, column: 5)
!121 = !DILocation(line: 84, column: 16, scope: !120)
!122 = !DILocation(line: 84, column: 14, scope: !120)
!123 = !DILocation(line: 85, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 85, column: 13)
!125 = !DILocation(line: 85, column: 18, scope: !124)
!126 = !DILocation(line: 85, column: 13, scope: !120)
!127 = !DILocation(line: 85, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 85, column: 27)
!129 = !DILocation(line: 86, column: 5, scope: !120)
!130 = !DILocalVariable(name: "source", scope: !131, file: !17, line: 88, type: !47)
!131 = distinct !DILexicalBlock(scope: !112, file: !17, line: 87, column: 5)
!132 = !DILocation(line: 88, column: 17, scope: !131)
!133 = !DILocation(line: 90, column: 16, scope: !131)
!134 = !DILocation(line: 90, column: 9, scope: !131)
!135 = !DILocation(line: 91, column: 27, scope: !131)
!136 = !DILocation(line: 91, column: 9, scope: !131)
!137 = !DILocation(line: 92, column: 14, scope: !131)
!138 = !DILocation(line: 92, column: 9, scope: !131)
!139 = !DILocation(line: 94, column: 1, scope: !112)
