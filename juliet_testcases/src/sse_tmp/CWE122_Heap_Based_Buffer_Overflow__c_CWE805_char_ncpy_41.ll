; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_badSink(i8* %data) #0 !dbg !14 {
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
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx2, align 1, !dbg !33
  %2 = load i8*, i8** %data.addr, align 8, !dbg !34
  call void @printLine(i8* %2), !dbg !35
  %3 = load i8*, i8** %data.addr, align 8, !dbg !36
  call void @free(i8* %3) #6, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_bad() #0 !dbg !39 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i8* null, i8** %data, align 8, !dbg !44
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !45
  store i8* %call, i8** %data, align 8, !dbg !46
  %0 = load i8*, i8** %data, align 8, !dbg !47
  %cmp = icmp eq i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !51
  unreachable, !dbg !51

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %2 = load i8*, i8** %data, align 8, !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_badSink(i8* %2), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !61, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !64
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %0 = load i8*, i8** %data.addr, align 8, !dbg !67
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !68
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !69
  %1 = load i8*, i8** %data.addr, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !70
  store i8 0, i8* %arrayidx2, align 1, !dbg !71
  %2 = load i8*, i8** %data.addr, align 8, !dbg !72
  call void @printLine(i8* %2), !dbg !73
  %3 = load i8*, i8** %data.addr, align 8, !dbg !74
  call void @free(i8* %3) #6, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %cmp = icmp eq i8* %0, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %2 = load i8*, i8** %data, align 8, !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_goodG2BSink(i8* %2), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 78, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 17, scope: !21)
!30 = !DILocation(line: 30, column: 23, scope: !21)
!31 = !DILocation(line: 30, column: 9, scope: !21)
!32 = !DILocation(line: 31, column: 9, scope: !21)
!33 = !DILocation(line: 31, column: 21, scope: !21)
!34 = !DILocation(line: 32, column: 19, scope: !21)
!35 = !DILocation(line: 32, column: 9, scope: !21)
!36 = !DILocation(line: 33, column: 14, scope: !21)
!37 = !DILocation(line: 33, column: 9, scope: !21)
!38 = !DILocation(line: 35, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_bad", scope: !15, file: !15, line: 37, type: !40, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !15, line: 39, type: !4)
!43 = !DILocation(line: 39, column: 12, scope: !39)
!44 = !DILocation(line: 40, column: 10, scope: !39)
!45 = !DILocation(line: 42, column: 20, scope: !39)
!46 = !DILocation(line: 42, column: 10, scope: !39)
!47 = !DILocation(line: 43, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !15, line: 43, column: 9)
!49 = !DILocation(line: 43, column: 14, scope: !48)
!50 = !DILocation(line: 43, column: 9, scope: !39)
!51 = !DILocation(line: 43, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 43, column: 23)
!53 = !DILocation(line: 44, column: 5, scope: !39)
!54 = !DILocation(line: 44, column: 13, scope: !39)
!55 = !DILocation(line: 45, column: 70, scope: !39)
!56 = !DILocation(line: 45, column: 5, scope: !39)
!57 = !DILocation(line: 46, column: 1, scope: !39)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_goodG2BSink", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !15, line: 52, type: !4)
!60 = !DILocation(line: 52, column: 82, scope: !58)
!61 = !DILocalVariable(name: "source", scope: !62, file: !15, line: 55, type: !22)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 54, column: 5)
!63 = !DILocation(line: 55, column: 14, scope: !62)
!64 = !DILocation(line: 56, column: 9, scope: !62)
!65 = !DILocation(line: 57, column: 9, scope: !62)
!66 = !DILocation(line: 57, column: 23, scope: !62)
!67 = !DILocation(line: 59, column: 17, scope: !62)
!68 = !DILocation(line: 59, column: 23, scope: !62)
!69 = !DILocation(line: 59, column: 9, scope: !62)
!70 = !DILocation(line: 60, column: 9, scope: !62)
!71 = !DILocation(line: 60, column: 21, scope: !62)
!72 = !DILocation(line: 61, column: 19, scope: !62)
!73 = !DILocation(line: 61, column: 9, scope: !62)
!74 = !DILocation(line: 62, column: 14, scope: !62)
!75 = !DILocation(line: 62, column: 9, scope: !62)
!76 = !DILocation(line: 64, column: 1, scope: !58)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_41_good", scope: !15, file: !15, line: 78, type: !40, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 80, column: 5, scope: !77)
!79 = !DILocation(line: 81, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !81, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 93, type: !83)
!86 = !DILocation(line: 93, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 93, type: !84)
!88 = !DILocation(line: 93, column: 27, scope: !80)
!89 = !DILocation(line: 96, column: 22, scope: !80)
!90 = !DILocation(line: 96, column: 12, scope: !80)
!91 = !DILocation(line: 96, column: 5, scope: !80)
!92 = !DILocation(line: 98, column: 5, scope: !80)
!93 = !DILocation(line: 99, column: 5, scope: !80)
!94 = !DILocation(line: 100, column: 5, scope: !80)
!95 = !DILocation(line: 103, column: 5, scope: !80)
!96 = !DILocation(line: 104, column: 5, scope: !80)
!97 = !DILocation(line: 105, column: 5, scope: !80)
!98 = !DILocation(line: 107, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !40, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 69, type: !4)
!101 = !DILocation(line: 69, column: 12, scope: !99)
!102 = !DILocation(line: 70, column: 10, scope: !99)
!103 = !DILocation(line: 72, column: 20, scope: !99)
!104 = !DILocation(line: 72, column: 10, scope: !99)
!105 = !DILocation(line: 73, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !15, line: 73, column: 9)
!107 = !DILocation(line: 73, column: 14, scope: !106)
!108 = !DILocation(line: 73, column: 9, scope: !99)
!109 = !DILocation(line: 73, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 73, column: 23)
!111 = !DILocation(line: 74, column: 5, scope: !99)
!112 = !DILocation(line: 74, column: 13, scope: !99)
!113 = !DILocation(line: 75, column: 74, scope: !99)
!114 = !DILocation(line: 75, column: 5, scope: !99)
!115 = !DILocation(line: 76, column: 1, scope: !99)
