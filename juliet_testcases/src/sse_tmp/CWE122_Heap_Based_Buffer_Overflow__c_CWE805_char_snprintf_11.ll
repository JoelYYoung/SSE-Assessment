; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

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
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx4, align 1, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #6, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %3), !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %4) #6, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  %call = call i32 (...) @globalReturnsFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !83
  br label %if.end3, !dbg !85

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !86
  store i8* %call1, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then2, label %if.end, !dbg !92

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx4, align 1, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #6, !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %3), !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %4) #6, !dbg !109
  ret void, !dbg !110
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* null, i8** %data, align 8, !dbg !114
  %call = call i32 (...) @globalReturnsTrue(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end3, !dbg !117

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !118
  store i8* %call1, i8** %data, align 8, !dbg !120
  %0 = load i8*, i8** %data, align 8, !dbg !121
  %cmp = icmp eq i8* %0, null, !dbg !123
  br i1 %cmp, label %if.then2, label %if.end, !dbg !124

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx4, align 1, !dbg !135
  %2 = load i8*, i8** %data, align 8, !dbg !136
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !137
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #6, !dbg !138
  %3 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %3), !dbg !140
  %4 = load i8*, i8** %data, align 8, !dbg !141
  call void @free(i8* %4) #6, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocation(line: 32, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 8)
!23 = !DILocation(line: 33, column: 8, scope: !14)
!24 = !DILocation(line: 36, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 5)
!26 = !DILocation(line: 36, column: 14, scope: !25)
!27 = !DILocation(line: 37, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 37, column: 13)
!29 = !DILocation(line: 37, column: 18, scope: !28)
!30 = !DILocation(line: 37, column: 13, scope: !25)
!31 = !DILocation(line: 37, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 37, column: 27)
!33 = !DILocation(line: 38, column: 9, scope: !25)
!34 = !DILocation(line: 38, column: 17, scope: !25)
!35 = !DILocation(line: 39, column: 5, scope: !25)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 41, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 41, column: 14, scope: !37)
!42 = !DILocation(line: 42, column: 9, scope: !37)
!43 = !DILocation(line: 43, column: 9, scope: !37)
!44 = !DILocation(line: 43, column: 23, scope: !37)
!45 = !DILocation(line: 45, column: 18, scope: !37)
!46 = !DILocation(line: 45, column: 35, scope: !37)
!47 = !DILocation(line: 45, column: 9, scope: !37)
!48 = !DILocation(line: 46, column: 19, scope: !37)
!49 = !DILocation(line: 46, column: 9, scope: !37)
!50 = !DILocation(line: 47, column: 14, scope: !37)
!51 = !DILocation(line: 47, column: 9, scope: !37)
!52 = !DILocation(line: 49, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_11_good", scope: !15, file: !15, line: 106, type: !16, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 108, column: 5, scope: !53)
!55 = !DILocation(line: 109, column: 5, scope: !53)
!56 = !DILocation(line: 110, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 122, type: !58, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 122, type: !60)
!63 = !DILocation(line: 122, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 122, type: !61)
!65 = !DILocation(line: 122, column: 27, scope: !57)
!66 = !DILocation(line: 125, column: 22, scope: !57)
!67 = !DILocation(line: 125, column: 12, scope: !57)
!68 = !DILocation(line: 125, column: 5, scope: !57)
!69 = !DILocation(line: 127, column: 5, scope: !57)
!70 = !DILocation(line: 128, column: 5, scope: !57)
!71 = !DILocation(line: 129, column: 5, scope: !57)
!72 = !DILocation(line: 132, column: 5, scope: !57)
!73 = !DILocation(line: 133, column: 5, scope: !57)
!74 = !DILocation(line: 134, column: 5, scope: !57)
!75 = !DILocation(line: 136, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 58, type: !4)
!78 = !DILocation(line: 58, column: 12, scope: !76)
!79 = !DILocation(line: 59, column: 10, scope: !76)
!80 = !DILocation(line: 60, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !15, line: 60, column: 8)
!82 = !DILocation(line: 60, column: 8, scope: !76)
!83 = !DILocation(line: 63, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 61, column: 5)
!85 = !DILocation(line: 64, column: 5, scope: !84)
!86 = !DILocation(line: 68, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !15, line: 66, column: 5)
!88 = !DILocation(line: 68, column: 14, scope: !87)
!89 = !DILocation(line: 69, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 69, column: 13)
!91 = !DILocation(line: 69, column: 18, scope: !90)
!92 = !DILocation(line: 69, column: 13, scope: !87)
!93 = !DILocation(line: 69, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 69, column: 27)
!95 = !DILocation(line: 70, column: 9, scope: !87)
!96 = !DILocation(line: 70, column: 17, scope: !87)
!97 = !DILocalVariable(name: "source", scope: !98, file: !15, line: 73, type: !38)
!98 = distinct !DILexicalBlock(scope: !76, file: !15, line: 72, column: 5)
!99 = !DILocation(line: 73, column: 14, scope: !98)
!100 = !DILocation(line: 74, column: 9, scope: !98)
!101 = !DILocation(line: 75, column: 9, scope: !98)
!102 = !DILocation(line: 75, column: 23, scope: !98)
!103 = !DILocation(line: 77, column: 18, scope: !98)
!104 = !DILocation(line: 77, column: 35, scope: !98)
!105 = !DILocation(line: 77, column: 9, scope: !98)
!106 = !DILocation(line: 78, column: 19, scope: !98)
!107 = !DILocation(line: 78, column: 9, scope: !98)
!108 = !DILocation(line: 79, column: 14, scope: !98)
!109 = !DILocation(line: 79, column: 9, scope: !98)
!110 = !DILocation(line: 81, column: 1, scope: !76)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 86, type: !4)
!113 = !DILocation(line: 86, column: 12, scope: !111)
!114 = !DILocation(line: 87, column: 10, scope: !111)
!115 = !DILocation(line: 88, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !15, line: 88, column: 8)
!117 = !DILocation(line: 88, column: 8, scope: !111)
!118 = !DILocation(line: 91, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 89, column: 5)
!120 = !DILocation(line: 91, column: 14, scope: !119)
!121 = !DILocation(line: 92, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !15, line: 92, column: 13)
!123 = !DILocation(line: 92, column: 18, scope: !122)
!124 = !DILocation(line: 92, column: 13, scope: !119)
!125 = !DILocation(line: 92, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 92, column: 27)
!127 = !DILocation(line: 93, column: 9, scope: !119)
!128 = !DILocation(line: 93, column: 17, scope: !119)
!129 = !DILocation(line: 94, column: 5, scope: !119)
!130 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 96, type: !38)
!131 = distinct !DILexicalBlock(scope: !111, file: !15, line: 95, column: 5)
!132 = !DILocation(line: 96, column: 14, scope: !131)
!133 = !DILocation(line: 97, column: 9, scope: !131)
!134 = !DILocation(line: 98, column: 9, scope: !131)
!135 = !DILocation(line: 98, column: 23, scope: !131)
!136 = !DILocation(line: 100, column: 18, scope: !131)
!137 = !DILocation(line: 100, column: 35, scope: !131)
!138 = !DILocation(line: 100, column: 9, scope: !131)
!139 = !DILocation(line: 101, column: 19, scope: !131)
!140 = !DILocation(line: 101, column: 9, scope: !131)
!141 = !DILocation(line: 102, column: 14, scope: !131)
!142 = !DILocation(line: 102, column: 9, scope: !131)
!143 = !DILocation(line: 104, column: 1, scope: !111)
