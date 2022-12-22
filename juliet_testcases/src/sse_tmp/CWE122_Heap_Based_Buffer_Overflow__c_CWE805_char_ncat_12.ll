; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end8, !dbg !35

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !36
  store i8* %call3, i8** %data, align 8, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %cmp4 = icmp eq i8* %2, null, !dbg !41
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !42

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end6:                                          ; preds = %if.else
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 0, !dbg !45
  store i8 0, i8* %arrayidx7, align 1, !dbg !46
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx9, align 1, !dbg !55
  %4 = load i8*, i8** %data, align 8, !dbg !56
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !57
  %call11 = call i8* @strncat(i8* %4, i8* %arraydecay10, i64 100) #6, !dbg !58
  %5 = load i8*, i8** %data, align 8, !dbg !59
  call void @printLine(i8* %5), !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %6) #6, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !93
  store i8* %call1, i8** %data, align 8, !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  %cmp = icmp eq i8* %0, null, !dbg !98
  br i1 %cmp, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  br label %if.end8, !dbg !104

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !105
  store i8* %call3, i8** %data, align 8, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  %cmp4 = icmp eq i8* %2, null, !dbg !110
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !111

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end6:                                          ; preds = %if.else
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 0, !dbg !114
  store i8 0, i8* %arrayidx7, align 1, !dbg !115
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx9, align 1, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  %call11 = call i8* @strncat(i8* %4, i8* %arraydecay10, i64 100) #6, !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %5), !dbg !126
  %6 = load i8*, i8** %data, align 8, !dbg !127
  call void @free(i8* %6) #6, !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 9, scope: !25)
!34 = !DILocation(line: 32, column: 17, scope: !25)
!35 = !DILocation(line: 33, column: 5, scope: !25)
!36 = !DILocation(line: 37, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 5)
!38 = !DILocation(line: 37, column: 14, scope: !37)
!39 = !DILocation(line: 38, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 38, column: 13)
!41 = !DILocation(line: 38, column: 18, scope: !40)
!42 = !DILocation(line: 38, column: 13, scope: !37)
!43 = !DILocation(line: 38, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 38, column: 27)
!45 = !DILocation(line: 39, column: 9, scope: !37)
!46 = !DILocation(line: 39, column: 17, scope: !37)
!47 = !DILocalVariable(name: "source", scope: !48, file: !15, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 42, column: 14, scope: !48)
!53 = !DILocation(line: 43, column: 9, scope: !48)
!54 = !DILocation(line: 44, column: 9, scope: !48)
!55 = !DILocation(line: 44, column: 23, scope: !48)
!56 = !DILocation(line: 46, column: 17, scope: !48)
!57 = !DILocation(line: 46, column: 23, scope: !48)
!58 = !DILocation(line: 46, column: 9, scope: !48)
!59 = !DILocation(line: 47, column: 19, scope: !48)
!60 = !DILocation(line: 47, column: 9, scope: !48)
!61 = !DILocation(line: 48, column: 14, scope: !48)
!62 = !DILocation(line: 48, column: 9, scope: !48)
!63 = !DILocation(line: 50, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncat_12_good", scope: !15, file: !15, line: 87, type: !16, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 89, column: 5, scope: !64)
!66 = !DILocation(line: 90, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 102, type: !68, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 102, type: !70)
!73 = !DILocation(line: 102, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 102, type: !71)
!75 = !DILocation(line: 102, column: 27, scope: !67)
!76 = !DILocation(line: 105, column: 22, scope: !67)
!77 = !DILocation(line: 105, column: 12, scope: !67)
!78 = !DILocation(line: 105, column: 5, scope: !67)
!79 = !DILocation(line: 107, column: 5, scope: !67)
!80 = !DILocation(line: 108, column: 5, scope: !67)
!81 = !DILocation(line: 109, column: 5, scope: !67)
!82 = !DILocation(line: 112, column: 5, scope: !67)
!83 = !DILocation(line: 113, column: 5, scope: !67)
!84 = !DILocation(line: 114, column: 5, scope: !67)
!85 = !DILocation(line: 116, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 60, type: !4)
!88 = !DILocation(line: 60, column: 12, scope: !86)
!89 = !DILocation(line: 61, column: 10, scope: !86)
!90 = !DILocation(line: 62, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !15, line: 62, column: 8)
!92 = !DILocation(line: 62, column: 8, scope: !86)
!93 = !DILocation(line: 65, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 63, column: 5)
!95 = !DILocation(line: 65, column: 14, scope: !94)
!96 = !DILocation(line: 66, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !15, line: 66, column: 13)
!98 = !DILocation(line: 66, column: 18, scope: !97)
!99 = !DILocation(line: 66, column: 13, scope: !94)
!100 = !DILocation(line: 66, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 66, column: 27)
!102 = !DILocation(line: 67, column: 9, scope: !94)
!103 = !DILocation(line: 67, column: 17, scope: !94)
!104 = !DILocation(line: 68, column: 5, scope: !94)
!105 = !DILocation(line: 72, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !91, file: !15, line: 70, column: 5)
!107 = !DILocation(line: 72, column: 14, scope: !106)
!108 = !DILocation(line: 73, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !15, line: 73, column: 13)
!110 = !DILocation(line: 73, column: 18, scope: !109)
!111 = !DILocation(line: 73, column: 13, scope: !106)
!112 = !DILocation(line: 73, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 73, column: 27)
!114 = !DILocation(line: 74, column: 9, scope: !106)
!115 = !DILocation(line: 74, column: 17, scope: !106)
!116 = !DILocalVariable(name: "source", scope: !117, file: !15, line: 77, type: !49)
!117 = distinct !DILexicalBlock(scope: !86, file: !15, line: 76, column: 5)
!118 = !DILocation(line: 77, column: 14, scope: !117)
!119 = !DILocation(line: 78, column: 9, scope: !117)
!120 = !DILocation(line: 79, column: 9, scope: !117)
!121 = !DILocation(line: 79, column: 23, scope: !117)
!122 = !DILocation(line: 81, column: 17, scope: !117)
!123 = !DILocation(line: 81, column: 23, scope: !117)
!124 = !DILocation(line: 81, column: 9, scope: !117)
!125 = !DILocation(line: 82, column: 19, scope: !117)
!126 = !DILocation(line: 82, column: 9, scope: !117)
!127 = !DILocation(line: 83, column: 14, scope: !117)
!128 = !DILocation(line: 83, column: 9, scope: !117)
!129 = !DILocation(line: 85, column: 1, scope: !86)
