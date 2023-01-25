; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42_bad() #0 !dbg !14 {
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
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !36
  store i8 0, i8* %arrayidx3, align 1, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* %3), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  call void @free(i8* %4) #6, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !48
  store i8* %call, i8** %data.addr, align 8, !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  %cmp = icmp eq i8* %0, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !56
  store i8 0, i8* %arrayidx, align 1, !dbg !57
  %2 = load i8*, i8** %data.addr, align 8, !dbg !58
  ret i8* %2, !dbg !59
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
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
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %call = call i8* @goodG2BSource(i8* %0), !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !92
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %3), !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @free(i8* %4) #6, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !105 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !108
  store i8* %call, i8** %data.addr, align 8, !dbg !109
  %0 = load i8*, i8** %data.addr, align 8, !dbg !110
  %cmp = icmp eq i8* %0, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %2 = load i8*, i8** %data.addr, align 8, !dbg !118
  ret i8* %2, !dbg !119
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 42, column: 17, scope: !25)
!34 = !DILocation(line: 42, column: 23, scope: !25)
!35 = !DILocation(line: 42, column: 9, scope: !25)
!36 = !DILocation(line: 43, column: 9, scope: !25)
!37 = !DILocation(line: 43, column: 21, scope: !25)
!38 = !DILocation(line: 44, column: 19, scope: !25)
!39 = !DILocation(line: 44, column: 9, scope: !25)
!40 = !DILocation(line: 45, column: 14, scope: !25)
!41 = !DILocation(line: 45, column: 9, scope: !25)
!42 = !DILocation(line: 47, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !44, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!5, !5}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !15, line: 23, type: !5)
!47 = !DILocation(line: 23, column: 32, scope: !43)
!48 = !DILocation(line: 26, column: 20, scope: !43)
!49 = !DILocation(line: 26, column: 10, scope: !43)
!50 = !DILocation(line: 27, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !15, line: 27, column: 9)
!52 = !DILocation(line: 27, column: 14, scope: !51)
!53 = !DILocation(line: 27, column: 9, scope: !43)
!54 = !DILocation(line: 27, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 27, column: 23)
!56 = !DILocation(line: 28, column: 5, scope: !43)
!57 = !DILocation(line: 28, column: 13, scope: !43)
!58 = !DILocation(line: 29, column: 12, scope: !43)
!59 = !DILocation(line: 29, column: 5, scope: !43)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_42_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 82, column: 5, scope: !60)
!62 = !DILocation(line: 83, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !64, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 95, type: !66)
!69 = !DILocation(line: 95, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 95, type: !67)
!71 = !DILocation(line: 95, column: 27, scope: !63)
!72 = !DILocation(line: 98, column: 22, scope: !63)
!73 = !DILocation(line: 98, column: 12, scope: !63)
!74 = !DILocation(line: 98, column: 5, scope: !63)
!75 = !DILocation(line: 100, column: 5, scope: !63)
!76 = !DILocation(line: 101, column: 5, scope: !63)
!77 = !DILocation(line: 102, column: 5, scope: !63)
!78 = !DILocation(line: 105, column: 5, scope: !63)
!79 = !DILocation(line: 106, column: 5, scope: !63)
!80 = !DILocation(line: 107, column: 5, scope: !63)
!81 = !DILocation(line: 109, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 65, type: !5)
!84 = !DILocation(line: 65, column: 12, scope: !82)
!85 = !DILocation(line: 66, column: 10, scope: !82)
!86 = !DILocation(line: 67, column: 26, scope: !82)
!87 = !DILocation(line: 67, column: 12, scope: !82)
!88 = !DILocation(line: 67, column: 10, scope: !82)
!89 = !DILocalVariable(name: "source", scope: !90, file: !15, line: 69, type: !26)
!90 = distinct !DILexicalBlock(scope: !82, file: !15, line: 68, column: 5)
!91 = !DILocation(line: 69, column: 14, scope: !90)
!92 = !DILocation(line: 70, column: 9, scope: !90)
!93 = !DILocation(line: 71, column: 9, scope: !90)
!94 = !DILocation(line: 71, column: 23, scope: !90)
!95 = !DILocation(line: 73, column: 17, scope: !90)
!96 = !DILocation(line: 73, column: 23, scope: !90)
!97 = !DILocation(line: 73, column: 9, scope: !90)
!98 = !DILocation(line: 74, column: 9, scope: !90)
!99 = !DILocation(line: 74, column: 21, scope: !90)
!100 = !DILocation(line: 75, column: 19, scope: !90)
!101 = !DILocation(line: 75, column: 9, scope: !90)
!102 = !DILocation(line: 76, column: 14, scope: !90)
!103 = !DILocation(line: 76, column: 9, scope: !90)
!104 = !DILocation(line: 78, column: 1, scope: !82)
!105 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 53, type: !44, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", arg: 1, scope: !105, file: !15, line: 53, type: !5)
!107 = !DILocation(line: 53, column: 36, scope: !105)
!108 = !DILocation(line: 56, column: 20, scope: !105)
!109 = !DILocation(line: 56, column: 10, scope: !105)
!110 = !DILocation(line: 57, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !15, line: 57, column: 9)
!112 = !DILocation(line: 57, column: 14, scope: !111)
!113 = !DILocation(line: 57, column: 9, scope: !105)
!114 = !DILocation(line: 57, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 57, column: 23)
!116 = !DILocation(line: 58, column: 5, scope: !105)
!117 = !DILocation(line: 58, column: 13, scope: !105)
!118 = !DILocation(line: 59, column: 12, scope: !105)
!119 = !DILocation(line: 59, column: 5, scope: !105)
