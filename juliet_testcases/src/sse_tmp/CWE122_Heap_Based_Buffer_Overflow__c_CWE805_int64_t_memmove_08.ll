; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end3, !dbg !27

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
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !44
  %3 = load i64*, i64** %data, align 8, !dbg !45
  %4 = bitcast i64* %3 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !46
  %5 = bitcast i64* %arraydecay to i8*, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !46
  %6 = load i64*, i64** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !47
  %7 = load i64, i64* %arrayidx, align 8, !dbg !47
  call void @printLongLongLine(i64 %7), !dbg !48
  %8 = load i64*, i64** %data, align 8, !dbg !49
  %9 = bitcast i64* %8 to i8*, !dbg !49
  call void @free(i8* %9) #7, !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !77 {
entry:
  ret i32 1, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i64* null, i64** %data, align 8, !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end3, !dbg !90

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !91
  %0 = bitcast i8* %call1 to i64*, !dbg !93
  store i64* %0, i64** %data, align 8, !dbg !94
  %1 = load i64*, i64** %data, align 8, !dbg !95
  %cmp = icmp eq i64* %1, null, !dbg !97
  br i1 %cmp, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !103
  %3 = load i64*, i64** %data, align 8, !dbg !104
  %4 = bitcast i64* %3 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !105
  %5 = bitcast i64* %arraydecay to i8*, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !105
  %6 = load i64*, i64** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !106
  %7 = load i64, i64* %arrayidx, align 8, !dbg !106
  call void @printLongLongLine(i64 %7), !dbg !107
  %8 = load i64*, i64** %data, align 8, !dbg !108
  %9 = bitcast i64* %8 to i8*, !dbg !108
  call void @free(i8* %9) #7, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !111 {
entry:
  ret i32 0, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i64* null, i64** %data, align 8, !dbg !116
  %call = call i32 @staticReturnsTrue(), !dbg !117
  %tobool = icmp ne i32 %call, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end3, !dbg !119

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !120
  %0 = bitcast i8* %call1 to i64*, !dbg !122
  store i64* %0, i64** %data, align 8, !dbg !123
  %1 = load i64*, i64** %data, align 8, !dbg !124
  %cmp = icmp eq i64* %1, null, !dbg !126
  br i1 %cmp, label %if.then2, label %if.end, !dbg !127

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !130

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !133
  %3 = load i64*, i64** %data, align 8, !dbg !134
  %4 = bitcast i64* %3 to i8*, !dbg !135
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !135
  %5 = bitcast i64* %arraydecay to i8*, !dbg !135
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !135
  %6 = load i64*, i64** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !136
  %7 = load i64, i64* %arrayidx, align 8, !dbg !136
  call void @printLongLongLine(i64 %7), !dbg !137
  %8 = load i64*, i64** %data, align 8, !dbg !138
  %9 = bitcast i64* %8 to i8*, !dbg !138
  call void @free(i8* %9) #7, !dbg !139
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08_bad", scope: !19, file: !19, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 37, type: !4)
!23 = !DILocation(line: 37, column: 15, scope: !18)
!24 = !DILocation(line: 38, column: 10, scope: !18)
!25 = !DILocation(line: 39, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 8)
!27 = !DILocation(line: 39, column: 8, scope: !18)
!28 = !DILocation(line: 42, column: 27, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 40, column: 5)
!30 = !DILocation(line: 42, column: 16, scope: !29)
!31 = !DILocation(line: 42, column: 14, scope: !29)
!32 = !DILocation(line: 43, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 43, column: 13)
!34 = !DILocation(line: 43, column: 18, scope: !33)
!35 = !DILocation(line: 43, column: 13, scope: !29)
!36 = !DILocation(line: 43, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 43, column: 27)
!38 = !DILocation(line: 44, column: 5, scope: !29)
!39 = !DILocalVariable(name: "source", scope: !40, file: !19, line: 46, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 45, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 46, column: 17, scope: !40)
!45 = !DILocation(line: 48, column: 17, scope: !40)
!46 = !DILocation(line: 48, column: 9, scope: !40)
!47 = !DILocation(line: 49, column: 27, scope: !40)
!48 = !DILocation(line: 49, column: 9, scope: !40)
!49 = !DILocation(line: 50, column: 14, scope: !40)
!50 = !DILocation(line: 50, column: 9, scope: !40)
!51 = !DILocation(line: 52, column: 1, scope: !18)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_08_good", scope: !19, file: !19, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 105, column: 5, scope: !52)
!54 = !DILocation(line: 106, column: 5, scope: !52)
!55 = !DILocation(line: 107, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 119, type: !57, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !19, line: 119, type: !59)
!64 = !DILocation(line: 119, column: 14, scope: !56)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !19, line: 119, type: !60)
!66 = !DILocation(line: 119, column: 27, scope: !56)
!67 = !DILocation(line: 122, column: 22, scope: !56)
!68 = !DILocation(line: 122, column: 12, scope: !56)
!69 = !DILocation(line: 122, column: 5, scope: !56)
!70 = !DILocation(line: 124, column: 5, scope: !56)
!71 = !DILocation(line: 125, column: 5, scope: !56)
!72 = !DILocation(line: 126, column: 5, scope: !56)
!73 = !DILocation(line: 129, column: 5, scope: !56)
!74 = !DILocation(line: 130, column: 5, scope: !56)
!75 = !DILocation(line: 131, column: 5, scope: !56)
!76 = !DILocation(line: 133, column: 5, scope: !56)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !19, file: !19, line: 23, type: !78, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!59}
!80 = !DILocation(line: 25, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !19, line: 61, type: !4)
!83 = !DILocation(line: 61, column: 15, scope: !81)
!84 = !DILocation(line: 62, column: 10, scope: !81)
!85 = !DILocation(line: 63, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !19, line: 63, column: 8)
!87 = !DILocation(line: 63, column: 8, scope: !81)
!88 = !DILocation(line: 66, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !19, line: 64, column: 5)
!90 = !DILocation(line: 67, column: 5, scope: !89)
!91 = !DILocation(line: 71, column: 27, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !19, line: 69, column: 5)
!93 = !DILocation(line: 71, column: 16, scope: !92)
!94 = !DILocation(line: 71, column: 14, scope: !92)
!95 = !DILocation(line: 72, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 72, column: 13)
!97 = !DILocation(line: 72, column: 18, scope: !96)
!98 = !DILocation(line: 72, column: 13, scope: !92)
!99 = !DILocation(line: 72, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !19, line: 72, column: 27)
!101 = !DILocalVariable(name: "source", scope: !102, file: !19, line: 75, type: !41)
!102 = distinct !DILexicalBlock(scope: !81, file: !19, line: 74, column: 5)
!103 = !DILocation(line: 75, column: 17, scope: !102)
!104 = !DILocation(line: 77, column: 17, scope: !102)
!105 = !DILocation(line: 77, column: 9, scope: !102)
!106 = !DILocation(line: 78, column: 27, scope: !102)
!107 = !DILocation(line: 78, column: 9, scope: !102)
!108 = !DILocation(line: 79, column: 14, scope: !102)
!109 = !DILocation(line: 79, column: 9, scope: !102)
!110 = !DILocation(line: 81, column: 1, scope: !81)
!111 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !19, file: !19, line: 28, type: !78, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 30, column: 5, scope: !111)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 86, type: !4)
!115 = !DILocation(line: 86, column: 15, scope: !113)
!116 = !DILocation(line: 87, column: 10, scope: !113)
!117 = !DILocation(line: 88, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !19, line: 88, column: 8)
!119 = !DILocation(line: 88, column: 8, scope: !113)
!120 = !DILocation(line: 91, column: 27, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !19, line: 89, column: 5)
!122 = !DILocation(line: 91, column: 16, scope: !121)
!123 = !DILocation(line: 91, column: 14, scope: !121)
!124 = !DILocation(line: 92, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !19, line: 92, column: 13)
!126 = !DILocation(line: 92, column: 18, scope: !125)
!127 = !DILocation(line: 92, column: 13, scope: !121)
!128 = !DILocation(line: 92, column: 28, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !19, line: 92, column: 27)
!130 = !DILocation(line: 93, column: 5, scope: !121)
!131 = !DILocalVariable(name: "source", scope: !132, file: !19, line: 95, type: !41)
!132 = distinct !DILexicalBlock(scope: !113, file: !19, line: 94, column: 5)
!133 = !DILocation(line: 95, column: 17, scope: !132)
!134 = !DILocation(line: 97, column: 17, scope: !132)
!135 = !DILocation(line: 97, column: 9, scope: !132)
!136 = !DILocation(line: 98, column: 27, scope: !132)
!137 = !DILocation(line: 98, column: 9, scope: !132)
!138 = !DILocation(line: 99, column: 14, scope: !132)
!139 = !DILocation(line: 99, column: 9, scope: !132)
!140 = !DILocation(line: 101, column: 1, scope: !113)
