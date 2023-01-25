; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !34
  %call2 = call i8* @strcat(i8* %1, i8* %arraydecay1) #6, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %2), !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* %3) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !46
  store i8* %call, i8** %data.addr, align 8, !dbg !47
  %0 = load i8*, i8** %data.addr, align 8, !dbg !48
  %cmp = icmp eq i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !54
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  %2 = load i8*, i8** %data.addr, align 8, !dbg !56
  ret i8* %2, !dbg !57
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42_good() #0 !dbg !58 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %call = call i8* @goodG2BSource(i8* %0), !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  %call2 = call i8* @strcat(i8* %1, i8* %arraydecay1) #6, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* %2), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  call void @free(i8* %3) #6, !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !104
  store i8* %call, i8** %data.addr, align 8, !dbg !105
  %0 = load i8*, i8** %data.addr, align 8, !dbg !106
  %cmp = icmp eq i8* %0, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %2 = load i8*, i8** %data.addr, align 8, !dbg !114
  ret i8* %2, !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 34, type: !5)
!19 = !DILocation(line: 34, column: 12, scope: !14)
!20 = !DILocation(line: 35, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 22, scope: !14)
!22 = !DILocation(line: 36, column: 12, scope: !14)
!23 = !DILocation(line: 36, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 38, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 38, column: 14, scope: !25)
!30 = !DILocation(line: 39, column: 9, scope: !25)
!31 = !DILocation(line: 40, column: 9, scope: !25)
!32 = !DILocation(line: 40, column: 23, scope: !25)
!33 = !DILocation(line: 42, column: 16, scope: !25)
!34 = !DILocation(line: 42, column: 22, scope: !25)
!35 = !DILocation(line: 42, column: 9, scope: !25)
!36 = !DILocation(line: 43, column: 19, scope: !25)
!37 = !DILocation(line: 43, column: 9, scope: !25)
!38 = !DILocation(line: 44, column: 14, scope: !25)
!39 = !DILocation(line: 44, column: 9, scope: !25)
!40 = !DILocation(line: 46, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !42, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!5, !5}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !15, line: 23, type: !5)
!45 = !DILocation(line: 23, column: 32, scope: !41)
!46 = !DILocation(line: 26, column: 20, scope: !41)
!47 = !DILocation(line: 26, column: 10, scope: !41)
!48 = !DILocation(line: 27, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !15, line: 27, column: 9)
!50 = !DILocation(line: 27, column: 14, scope: !49)
!51 = !DILocation(line: 27, column: 9, scope: !41)
!52 = !DILocation(line: 27, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 27, column: 23)
!54 = !DILocation(line: 28, column: 5, scope: !41)
!55 = !DILocation(line: 28, column: 13, scope: !41)
!56 = !DILocation(line: 29, column: 12, scope: !41)
!57 = !DILocation(line: 29, column: 5, scope: !41)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_42_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 80, column: 5, scope: !58)
!60 = !DILocation(line: 81, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !62, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 93, type: !64)
!67 = !DILocation(line: 93, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 93, type: !65)
!69 = !DILocation(line: 93, column: 27, scope: !61)
!70 = !DILocation(line: 96, column: 22, scope: !61)
!71 = !DILocation(line: 96, column: 12, scope: !61)
!72 = !DILocation(line: 96, column: 5, scope: !61)
!73 = !DILocation(line: 98, column: 5, scope: !61)
!74 = !DILocation(line: 99, column: 5, scope: !61)
!75 = !DILocation(line: 100, column: 5, scope: !61)
!76 = !DILocation(line: 103, column: 5, scope: !61)
!77 = !DILocation(line: 104, column: 5, scope: !61)
!78 = !DILocation(line: 105, column: 5, scope: !61)
!79 = !DILocation(line: 107, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 64, type: !5)
!82 = !DILocation(line: 64, column: 12, scope: !80)
!83 = !DILocation(line: 65, column: 10, scope: !80)
!84 = !DILocation(line: 66, column: 26, scope: !80)
!85 = !DILocation(line: 66, column: 12, scope: !80)
!86 = !DILocation(line: 66, column: 10, scope: !80)
!87 = !DILocalVariable(name: "source", scope: !88, file: !15, line: 68, type: !26)
!88 = distinct !DILexicalBlock(scope: !80, file: !15, line: 67, column: 5)
!89 = !DILocation(line: 68, column: 14, scope: !88)
!90 = !DILocation(line: 69, column: 9, scope: !88)
!91 = !DILocation(line: 70, column: 9, scope: !88)
!92 = !DILocation(line: 70, column: 23, scope: !88)
!93 = !DILocation(line: 72, column: 16, scope: !88)
!94 = !DILocation(line: 72, column: 22, scope: !88)
!95 = !DILocation(line: 72, column: 9, scope: !88)
!96 = !DILocation(line: 73, column: 19, scope: !88)
!97 = !DILocation(line: 73, column: 9, scope: !88)
!98 = !DILocation(line: 74, column: 14, scope: !88)
!99 = !DILocation(line: 74, column: 9, scope: !88)
!100 = !DILocation(line: 76, column: 1, scope: !80)
!101 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 52, type: !42, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !15, line: 52, type: !5)
!103 = !DILocation(line: 52, column: 36, scope: !101)
!104 = !DILocation(line: 55, column: 20, scope: !101)
!105 = !DILocation(line: 55, column: 10, scope: !101)
!106 = !DILocation(line: 56, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !15, line: 56, column: 9)
!108 = !DILocation(line: 56, column: 14, scope: !107)
!109 = !DILocation(line: 56, column: 9, scope: !101)
!110 = !DILocation(line: 56, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 56, column: 23)
!112 = !DILocation(line: 57, column: 5, scope: !101)
!113 = !DILocation(line: 57, column: 13, scope: !101)
!114 = !DILocation(line: 58, column: 12, scope: !101)
!115 = !DILocation(line: 58, column: 5, scope: !101)
