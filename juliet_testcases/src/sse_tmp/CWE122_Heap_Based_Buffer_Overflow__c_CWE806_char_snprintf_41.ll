; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !25
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !26
  %1 = load i8*, i8** %data.addr, align 8, !dbg !27
  %call = call i64 @strlen(i8* %1) #7, !dbg !28
  %2 = load i8*, i8** %data.addr, align 8, !dbg !29
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #8, !dbg !30
  %3 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @printLine(i8* %3), !dbg !32
  %4 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @free(i8* %4) #8, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !41
  store i8* %call, i8** %data, align 8, !dbg !42
  %0 = load i8*, i8** %data, align 8, !dbg !43
  %cmp = icmp eq i8* %0, null, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !50
  %2 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %3 = load i8*, i8** %data, align 8, !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_badSink(i8* %3), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_goodG2BSink(i8* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !59, metadata !DIExpression()), !dbg !61
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !61
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !62
  %1 = load i8*, i8** %data.addr, align 8, !dbg !63
  %call = call i64 @strlen(i8* %1) #7, !dbg !64
  %2 = load i8*, i8** %data.addr, align 8, !dbg !65
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #8, !dbg !66
  %3 = load i8*, i8** %data.addr, align 8, !dbg !67
  call void @printLine(i8* %3), !dbg !68
  %4 = load i8*, i8** %data.addr, align 8, !dbg !69
  call void @free(i8* %4) #8, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #8, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #8, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_goodG2BSink(i8* %3), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_badSink", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 29, type: !4)
!19 = !DILocation(line: 29, column: 82, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 32, column: 14, scope: !21)
!26 = !DILocation(line: 34, column: 18, scope: !21)
!27 = !DILocation(line: 34, column: 31, scope: !21)
!28 = !DILocation(line: 34, column: 24, scope: !21)
!29 = !DILocation(line: 34, column: 44, scope: !21)
!30 = !DILocation(line: 34, column: 9, scope: !21)
!31 = !DILocation(line: 35, column: 19, scope: !21)
!32 = !DILocation(line: 35, column: 9, scope: !21)
!33 = !DILocation(line: 36, column: 14, scope: !21)
!34 = !DILocation(line: 36, column: 9, scope: !21)
!35 = !DILocation(line: 38, column: 1, scope: !14)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_bad", scope: !15, file: !15, line: 40, type: !37, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !15, line: 42, type: !4)
!40 = !DILocation(line: 42, column: 12, scope: !36)
!41 = !DILocation(line: 43, column: 20, scope: !36)
!42 = !DILocation(line: 43, column: 10, scope: !36)
!43 = !DILocation(line: 44, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !15, line: 44, column: 9)
!45 = !DILocation(line: 44, column: 14, scope: !44)
!46 = !DILocation(line: 44, column: 9, scope: !36)
!47 = !DILocation(line: 44, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !15, line: 44, column: 23)
!49 = !DILocation(line: 46, column: 12, scope: !36)
!50 = !DILocation(line: 46, column: 5, scope: !36)
!51 = !DILocation(line: 47, column: 5, scope: !36)
!52 = !DILocation(line: 47, column: 17, scope: !36)
!53 = !DILocation(line: 48, column: 74, scope: !36)
!54 = !DILocation(line: 48, column: 5, scope: !36)
!55 = !DILocation(line: 49, column: 1, scope: !36)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_goodG2BSink", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !15, line: 55, type: !4)
!58 = !DILocation(line: 55, column: 86, scope: !56)
!59 = !DILocalVariable(name: "dest", scope: !60, file: !15, line: 58, type: !22)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 57, column: 5)
!61 = !DILocation(line: 58, column: 14, scope: !60)
!62 = !DILocation(line: 60, column: 18, scope: !60)
!63 = !DILocation(line: 60, column: 31, scope: !60)
!64 = !DILocation(line: 60, column: 24, scope: !60)
!65 = !DILocation(line: 60, column: 44, scope: !60)
!66 = !DILocation(line: 60, column: 9, scope: !60)
!67 = !DILocation(line: 61, column: 19, scope: !60)
!68 = !DILocation(line: 61, column: 9, scope: !60)
!69 = !DILocation(line: 62, column: 14, scope: !60)
!70 = !DILocation(line: 62, column: 9, scope: !60)
!71 = !DILocation(line: 64, column: 1, scope: !56)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_41_good", scope: !15, file: !15, line: 78, type: !37, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 80, column: 5, scope: !72)
!74 = !DILocation(line: 81, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !76, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 93, type: !78)
!81 = !DILocation(line: 93, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 93, type: !79)
!83 = !DILocation(line: 93, column: 27, scope: !75)
!84 = !DILocation(line: 96, column: 22, scope: !75)
!85 = !DILocation(line: 96, column: 12, scope: !75)
!86 = !DILocation(line: 96, column: 5, scope: !75)
!87 = !DILocation(line: 98, column: 5, scope: !75)
!88 = !DILocation(line: 99, column: 5, scope: !75)
!89 = !DILocation(line: 100, column: 5, scope: !75)
!90 = !DILocation(line: 103, column: 5, scope: !75)
!91 = !DILocation(line: 104, column: 5, scope: !75)
!92 = !DILocation(line: 105, column: 5, scope: !75)
!93 = !DILocation(line: 107, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !37, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 69, type: !4)
!96 = !DILocation(line: 69, column: 12, scope: !94)
!97 = !DILocation(line: 70, column: 20, scope: !94)
!98 = !DILocation(line: 70, column: 10, scope: !94)
!99 = !DILocation(line: 71, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !15, line: 71, column: 9)
!101 = !DILocation(line: 71, column: 14, scope: !100)
!102 = !DILocation(line: 71, column: 9, scope: !94)
!103 = !DILocation(line: 71, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 71, column: 23)
!105 = !DILocation(line: 73, column: 12, scope: !94)
!106 = !DILocation(line: 73, column: 5, scope: !94)
!107 = !DILocation(line: 74, column: 5, scope: !94)
!108 = !DILocation(line: 74, column: 16, scope: !94)
!109 = !DILocation(line: 75, column: 78, scope: !94)
!110 = !DILocation(line: 75, column: 5, scope: !94)
!111 = !DILocation(line: 76, column: 1, scope: !94)
