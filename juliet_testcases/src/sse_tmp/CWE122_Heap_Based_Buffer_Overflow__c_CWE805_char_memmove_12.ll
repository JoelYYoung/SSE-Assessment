; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end8, !dbg !35

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !36
  store i8* %call3, i8** %data, align 8, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %cmp4 = icmp eq i8* %2, null, !dbg !41
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !42

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !43
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay10, i64 100, i1 false), !dbg !57
  %5 = load i8*, i8** %data, align 8, !dbg !58
  %arrayidx11 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !58
  store i8 0, i8* %arrayidx11, align 1, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  call void @printLine(i8* %6), !dbg !61
  %7 = load i8*, i8** %data, align 8, !dbg !62
  call void @free(i8* %7) #7, !dbg !63
  ret void, !dbg !64
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !94
  store i8* %call1, i8** %data, align 8, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %cmp = icmp eq i8* %0, null, !dbg !99
  br i1 %cmp, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  br label %if.end8, !dbg !105

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !106
  store i8* %call3, i8** %data, align 8, !dbg !108
  %2 = load i8*, i8** %data, align 8, !dbg !109
  %cmp4 = icmp eq i8* %2, null, !dbg !111
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !112

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end6:                                          ; preds = %if.else
  %3 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 0, !dbg !115
  store i8 0, i8* %arrayidx7, align 1, !dbg !116
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx9, align 1, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay10, i64 100, i1 false), !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx11 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !125
  store i8 0, i8* %arrayidx11, align 1, !dbg !126
  %6 = load i8*, i8** %data, align 8, !dbg !127
  call void @printLine(i8* %6), !dbg !128
  %7 = load i8*, i8** %data, align 8, !dbg !129
  call void @free(i8* %7) #7, !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12.c", directory: "/root/SSE-Assessment")
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
!57 = !DILocation(line: 46, column: 9, scope: !48)
!58 = !DILocation(line: 47, column: 9, scope: !48)
!59 = !DILocation(line: 47, column: 21, scope: !48)
!60 = !DILocation(line: 48, column: 19, scope: !48)
!61 = !DILocation(line: 48, column: 9, scope: !48)
!62 = !DILocation(line: 49, column: 14, scope: !48)
!63 = !DILocation(line: 49, column: 9, scope: !48)
!64 = !DILocation(line: 51, column: 1, scope: !14)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_12_good", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 91, column: 5, scope: !65)
!67 = !DILocation(line: 92, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !69, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !15, line: 104, type: !71)
!74 = !DILocation(line: 104, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !15, line: 104, type: !72)
!76 = !DILocation(line: 104, column: 27, scope: !68)
!77 = !DILocation(line: 107, column: 22, scope: !68)
!78 = !DILocation(line: 107, column: 12, scope: !68)
!79 = !DILocation(line: 107, column: 5, scope: !68)
!80 = !DILocation(line: 109, column: 5, scope: !68)
!81 = !DILocation(line: 110, column: 5, scope: !68)
!82 = !DILocation(line: 111, column: 5, scope: !68)
!83 = !DILocation(line: 114, column: 5, scope: !68)
!84 = !DILocation(line: 115, column: 5, scope: !68)
!85 = !DILocation(line: 116, column: 5, scope: !68)
!86 = !DILocation(line: 118, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 61, type: !4)
!89 = !DILocation(line: 61, column: 12, scope: !87)
!90 = !DILocation(line: 62, column: 10, scope: !87)
!91 = !DILocation(line: 63, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !15, line: 63, column: 8)
!93 = !DILocation(line: 63, column: 8, scope: !87)
!94 = !DILocation(line: 66, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 64, column: 5)
!96 = !DILocation(line: 66, column: 14, scope: !95)
!97 = !DILocation(line: 67, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !15, line: 67, column: 13)
!99 = !DILocation(line: 67, column: 18, scope: !98)
!100 = !DILocation(line: 67, column: 13, scope: !95)
!101 = !DILocation(line: 67, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 67, column: 27)
!103 = !DILocation(line: 68, column: 9, scope: !95)
!104 = !DILocation(line: 68, column: 17, scope: !95)
!105 = !DILocation(line: 69, column: 5, scope: !95)
!106 = !DILocation(line: 73, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !92, file: !15, line: 71, column: 5)
!108 = !DILocation(line: 73, column: 14, scope: !107)
!109 = !DILocation(line: 74, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !15, line: 74, column: 13)
!111 = !DILocation(line: 74, column: 18, scope: !110)
!112 = !DILocation(line: 74, column: 13, scope: !107)
!113 = !DILocation(line: 74, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 74, column: 27)
!115 = !DILocation(line: 75, column: 9, scope: !107)
!116 = !DILocation(line: 75, column: 17, scope: !107)
!117 = !DILocalVariable(name: "source", scope: !118, file: !15, line: 78, type: !49)
!118 = distinct !DILexicalBlock(scope: !87, file: !15, line: 77, column: 5)
!119 = !DILocation(line: 78, column: 14, scope: !118)
!120 = !DILocation(line: 79, column: 9, scope: !118)
!121 = !DILocation(line: 80, column: 9, scope: !118)
!122 = !DILocation(line: 80, column: 23, scope: !118)
!123 = !DILocation(line: 82, column: 17, scope: !118)
!124 = !DILocation(line: 82, column: 9, scope: !118)
!125 = !DILocation(line: 83, column: 9, scope: !118)
!126 = !DILocation(line: 83, column: 21, scope: !118)
!127 = !DILocation(line: 84, column: 19, scope: !118)
!128 = !DILocation(line: 84, column: 9, scope: !118)
!129 = !DILocation(line: 85, column: 14, scope: !118)
!130 = !DILocation(line: 85, column: 9, scope: !118)
!131 = !DILocation(line: 87, column: 1, scope: !87)
