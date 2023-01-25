; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #6, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #6, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_badData, align 8, !dbg !65
  store i8* %0, i8** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !66, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !72
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !76
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay1) #6, !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %2), !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* %3) #6, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_goodG2BData, align 8, !dbg !98
  call void @goodG2BSink(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_goodG2BData, align 8, !dbg !104
  store i8* %0, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay1) #6, !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %2), !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  call void @free(i8* %3) #6, !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_badData", scope: !2, file: !13, line: 27, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_goodG2BData", scope: !2, file: !13, line: 28, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_bad", scope: !13, file: !13, line: 46, type: !21, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 48, type: !6)
!24 = !DILocation(line: 48, column: 12, scope: !20)
!25 = !DILocation(line: 49, column: 10, scope: !20)
!26 = !DILocation(line: 51, column: 20, scope: !20)
!27 = !DILocation(line: 51, column: 10, scope: !20)
!28 = !DILocation(line: 52, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 52, column: 9)
!30 = !DILocation(line: 52, column: 14, scope: !29)
!31 = !DILocation(line: 52, column: 9, scope: !20)
!32 = !DILocation(line: 52, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 52, column: 23)
!34 = !DILocation(line: 53, column: 5, scope: !20)
!35 = !DILocation(line: 53, column: 13, scope: !20)
!36 = !DILocation(line: 54, column: 76, scope: !20)
!37 = !DILocation(line: 54, column: 74, scope: !20)
!38 = !DILocation(line: 55, column: 5, scope: !20)
!39 = !DILocation(line: 56, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_45_good", scope: !13, file: !13, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 91, column: 5, scope: !40)
!42 = !DILocation(line: 92, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 103, type: !44, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !13, line: 103, type: !46)
!49 = !DILocation(line: 103, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !13, line: 103, type: !47)
!51 = !DILocation(line: 103, column: 27, scope: !43)
!52 = !DILocation(line: 106, column: 22, scope: !43)
!53 = !DILocation(line: 106, column: 12, scope: !43)
!54 = !DILocation(line: 106, column: 5, scope: !43)
!55 = !DILocation(line: 108, column: 5, scope: !43)
!56 = !DILocation(line: 109, column: 5, scope: !43)
!57 = !DILocation(line: 110, column: 5, scope: !43)
!58 = !DILocation(line: 113, column: 5, scope: !43)
!59 = !DILocation(line: 114, column: 5, scope: !43)
!60 = !DILocation(line: 115, column: 5, scope: !43)
!61 = !DILocation(line: 117, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 32, type: !21, scopeLine: 33, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "data", scope: !62, file: !13, line: 34, type: !6)
!64 = !DILocation(line: 34, column: 12, scope: !62)
!65 = !DILocation(line: 34, column: 19, scope: !62)
!66 = !DILocalVariable(name: "source", scope: !67, file: !13, line: 36, type: !68)
!67 = distinct !DILexicalBlock(scope: !62, file: !13, line: 35, column: 5)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 100)
!71 = !DILocation(line: 36, column: 14, scope: !67)
!72 = !DILocation(line: 37, column: 9, scope: !67)
!73 = !DILocation(line: 38, column: 9, scope: !67)
!74 = !DILocation(line: 38, column: 23, scope: !67)
!75 = !DILocation(line: 40, column: 18, scope: !67)
!76 = !DILocation(line: 40, column: 35, scope: !67)
!77 = !DILocation(line: 40, column: 9, scope: !67)
!78 = !DILocation(line: 41, column: 19, scope: !67)
!79 = !DILocation(line: 41, column: 9, scope: !67)
!80 = !DILocation(line: 42, column: 14, scope: !67)
!81 = !DILocation(line: 42, column: 9, scope: !67)
!82 = !DILocation(line: 44, column: 1, scope: !62)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 77, type: !21, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !13, line: 79, type: !6)
!85 = !DILocation(line: 79, column: 12, scope: !83)
!86 = !DILocation(line: 80, column: 10, scope: !83)
!87 = !DILocation(line: 82, column: 20, scope: !83)
!88 = !DILocation(line: 82, column: 10, scope: !83)
!89 = !DILocation(line: 83, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !13, line: 83, column: 9)
!91 = !DILocation(line: 83, column: 14, scope: !90)
!92 = !DILocation(line: 83, column: 9, scope: !83)
!93 = !DILocation(line: 83, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !13, line: 83, column: 23)
!95 = !DILocation(line: 84, column: 5, scope: !83)
!96 = !DILocation(line: 84, column: 13, scope: !83)
!97 = !DILocation(line: 85, column: 80, scope: !83)
!98 = !DILocation(line: 85, column: 78, scope: !83)
!99 = !DILocation(line: 86, column: 5, scope: !83)
!100 = !DILocation(line: 87, column: 1, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 63, type: !21, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !13, line: 65, type: !6)
!103 = !DILocation(line: 65, column: 12, scope: !101)
!104 = !DILocation(line: 65, column: 19, scope: !101)
!105 = !DILocalVariable(name: "source", scope: !106, file: !13, line: 67, type: !68)
!106 = distinct !DILexicalBlock(scope: !101, file: !13, line: 66, column: 5)
!107 = !DILocation(line: 67, column: 14, scope: !106)
!108 = !DILocation(line: 68, column: 9, scope: !106)
!109 = !DILocation(line: 69, column: 9, scope: !106)
!110 = !DILocation(line: 69, column: 23, scope: !106)
!111 = !DILocation(line: 71, column: 18, scope: !106)
!112 = !DILocation(line: 71, column: 35, scope: !106)
!113 = !DILocation(line: 71, column: 9, scope: !106)
!114 = !DILocation(line: 72, column: 19, scope: !106)
!115 = !DILocation(line: 72, column: 9, scope: !106)
!116 = !DILocation(line: 73, column: 14, scope: !106)
!117 = !DILocation(line: 73, column: 9, scope: !106)
!118 = !DILocation(line: 75, column: 1, scope: !101)
