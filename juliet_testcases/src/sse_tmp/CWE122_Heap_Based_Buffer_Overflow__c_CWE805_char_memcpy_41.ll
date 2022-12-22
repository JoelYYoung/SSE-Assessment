; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !30
  %1 = load i8*, i8** %data.addr, align 8, !dbg !31
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx2, align 1, !dbg !32
  %2 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @printLine(i8* %2), !dbg !34
  %3 = load i8*, i8** %data.addr, align 8, !dbg !35
  call void @free(i8* %3) #7, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  store i8* null, i8** %data, align 8, !dbg !43
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !44
  store i8* %call, i8** %data, align 8, !dbg !45
  %0 = load i8*, i8** %data, align 8, !dbg !46
  %cmp = icmp eq i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %2 = load i8*, i8** %data, align 8, !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_badSink(i8* %2), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_goodG2BSink(i8* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !60, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !63
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx, align 1, !dbg !65
  %0 = load i8*, i8** %data.addr, align 8, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !67
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !67
  %1 = load i8*, i8** %data.addr, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !68
  store i8 0, i8* %arrayidx2, align 1, !dbg !69
  %2 = load i8*, i8** %data.addr, align 8, !dbg !70
  call void @printLine(i8* %2), !dbg !71
  %3 = load i8*, i8** %data.addr, align 8, !dbg !72
  call void @free(i8* %3) #7, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %cmp = icmp eq i8* %0, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_goodG2BSink(i8* %2), !dbg !112
  ret void, !dbg !113
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
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 80, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 16, scope: !21)
!30 = !DILocation(line: 30, column: 9, scope: !21)
!31 = !DILocation(line: 31, column: 9, scope: !21)
!32 = !DILocation(line: 31, column: 21, scope: !21)
!33 = !DILocation(line: 32, column: 19, scope: !21)
!34 = !DILocation(line: 32, column: 9, scope: !21)
!35 = !DILocation(line: 33, column: 14, scope: !21)
!36 = !DILocation(line: 33, column: 9, scope: !21)
!37 = !DILocation(line: 35, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_bad", scope: !15, file: !15, line: 37, type: !39, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !15, line: 39, type: !4)
!42 = !DILocation(line: 39, column: 12, scope: !38)
!43 = !DILocation(line: 40, column: 10, scope: !38)
!44 = !DILocation(line: 42, column: 20, scope: !38)
!45 = !DILocation(line: 42, column: 10, scope: !38)
!46 = !DILocation(line: 43, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !15, line: 43, column: 9)
!48 = !DILocation(line: 43, column: 14, scope: !47)
!49 = !DILocation(line: 43, column: 9, scope: !38)
!50 = !DILocation(line: 43, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 43, column: 23)
!52 = !DILocation(line: 44, column: 5, scope: !38)
!53 = !DILocation(line: 44, column: 13, scope: !38)
!54 = !DILocation(line: 45, column: 72, scope: !38)
!55 = !DILocation(line: 45, column: 5, scope: !38)
!56 = !DILocation(line: 46, column: 1, scope: !38)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_goodG2BSink", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !15, line: 52, type: !4)
!59 = !DILocation(line: 52, column: 84, scope: !57)
!60 = !DILocalVariable(name: "source", scope: !61, file: !15, line: 55, type: !22)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 54, column: 5)
!62 = !DILocation(line: 55, column: 14, scope: !61)
!63 = !DILocation(line: 56, column: 9, scope: !61)
!64 = !DILocation(line: 57, column: 9, scope: !61)
!65 = !DILocation(line: 57, column: 23, scope: !61)
!66 = !DILocation(line: 59, column: 16, scope: !61)
!67 = !DILocation(line: 59, column: 9, scope: !61)
!68 = !DILocation(line: 60, column: 9, scope: !61)
!69 = !DILocation(line: 60, column: 21, scope: !61)
!70 = !DILocation(line: 61, column: 19, scope: !61)
!71 = !DILocation(line: 61, column: 9, scope: !61)
!72 = !DILocation(line: 62, column: 14, scope: !61)
!73 = !DILocation(line: 62, column: 9, scope: !61)
!74 = !DILocation(line: 64, column: 1, scope: !57)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_good", scope: !15, file: !15, line: 78, type: !39, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 80, column: 5, scope: !75)
!77 = !DILocation(line: 81, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !79, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !15, line: 93, type: !81)
!84 = !DILocation(line: 93, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !15, line: 93, type: !82)
!86 = !DILocation(line: 93, column: 27, scope: !78)
!87 = !DILocation(line: 96, column: 22, scope: !78)
!88 = !DILocation(line: 96, column: 12, scope: !78)
!89 = !DILocation(line: 96, column: 5, scope: !78)
!90 = !DILocation(line: 98, column: 5, scope: !78)
!91 = !DILocation(line: 99, column: 5, scope: !78)
!92 = !DILocation(line: 100, column: 5, scope: !78)
!93 = !DILocation(line: 103, column: 5, scope: !78)
!94 = !DILocation(line: 104, column: 5, scope: !78)
!95 = !DILocation(line: 105, column: 5, scope: !78)
!96 = !DILocation(line: 107, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !39, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !15, line: 69, type: !4)
!99 = !DILocation(line: 69, column: 12, scope: !97)
!100 = !DILocation(line: 70, column: 10, scope: !97)
!101 = !DILocation(line: 72, column: 20, scope: !97)
!102 = !DILocation(line: 72, column: 10, scope: !97)
!103 = !DILocation(line: 73, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !15, line: 73, column: 9)
!105 = !DILocation(line: 73, column: 14, scope: !104)
!106 = !DILocation(line: 73, column: 9, scope: !97)
!107 = !DILocation(line: 73, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 73, column: 23)
!109 = !DILocation(line: 74, column: 5, scope: !97)
!110 = !DILocation(line: 74, column: 13, scope: !97)
!111 = !DILocation(line: 75, column: 76, scope: !97)
!112 = !DILocation(line: 75, column: 5, scope: !97)
!113 = !DILocation(line: 76, column: 1, scope: !97)
