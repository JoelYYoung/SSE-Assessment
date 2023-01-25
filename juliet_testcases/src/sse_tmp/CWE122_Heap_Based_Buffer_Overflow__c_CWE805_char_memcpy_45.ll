; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_badData, align 8, !dbg !37
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_good() #0 !dbg !40 {
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
  %call = call i64 @time(i64* null) #7, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #7, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_bad(), !dbg !59
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
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_badData, align 8, !dbg !65
  store i8* %0, i8** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !66, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !72
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !76
  %2 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !77
  store i8 0, i8* %arrayidx2, align 1, !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* %3), !dbg !80
  %4 = load i8*, i8** %data, align 8, !dbg !81
  call void @free(i8* %4) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !88
  store i8* %call, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %cmp = icmp eq i8* %0, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_goodG2BData, align 8, !dbg !99
  call void @goodG2BSink(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_goodG2BData, align 8, !dbg !105
  store i8* %0, i8** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !109
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !114
  store i8 0, i8* %arrayidx2, align 1, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* %3), !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  call void @free(i8* %4) #7, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_bad", scope: !13, file: !13, line: 41, type: !21, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 43, type: !6)
!24 = !DILocation(line: 43, column: 12, scope: !20)
!25 = !DILocation(line: 44, column: 10, scope: !20)
!26 = !DILocation(line: 46, column: 20, scope: !20)
!27 = !DILocation(line: 46, column: 10, scope: !20)
!28 = !DILocation(line: 47, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 47, column: 9)
!30 = !DILocation(line: 47, column: 14, scope: !29)
!31 = !DILocation(line: 47, column: 9, scope: !20)
!32 = !DILocation(line: 47, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 47, column: 23)
!34 = !DILocation(line: 48, column: 5, scope: !20)
!35 = !DILocation(line: 48, column: 13, scope: !20)
!36 = !DILocation(line: 49, column: 74, scope: !20)
!37 = !DILocation(line: 49, column: 72, scope: !20)
!38 = !DILocation(line: 50, column: 5, scope: !20)
!39 = !DILocation(line: 51, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_45_good", scope: !13, file: !13, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 87, column: 5, scope: !40)
!42 = !DILocation(line: 88, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 99, type: !44, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !13, line: 99, type: !46)
!49 = !DILocation(line: 99, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !13, line: 99, type: !47)
!51 = !DILocation(line: 99, column: 27, scope: !43)
!52 = !DILocation(line: 102, column: 22, scope: !43)
!53 = !DILocation(line: 102, column: 12, scope: !43)
!54 = !DILocation(line: 102, column: 5, scope: !43)
!55 = !DILocation(line: 104, column: 5, scope: !43)
!56 = !DILocation(line: 105, column: 5, scope: !43)
!57 = !DILocation(line: 106, column: 5, scope: !43)
!58 = !DILocation(line: 109, column: 5, scope: !43)
!59 = !DILocation(line: 110, column: 5, scope: !43)
!60 = !DILocation(line: 111, column: 5, scope: !43)
!61 = !DILocation(line: 113, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "data", scope: !62, file: !13, line: 28, type: !6)
!64 = !DILocation(line: 28, column: 12, scope: !62)
!65 = !DILocation(line: 28, column: 19, scope: !62)
!66 = !DILocalVariable(name: "source", scope: !67, file: !13, line: 30, type: !68)
!67 = distinct !DILexicalBlock(scope: !62, file: !13, line: 29, column: 5)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 100)
!71 = !DILocation(line: 30, column: 14, scope: !67)
!72 = !DILocation(line: 31, column: 9, scope: !67)
!73 = !DILocation(line: 32, column: 9, scope: !67)
!74 = !DILocation(line: 32, column: 23, scope: !67)
!75 = !DILocation(line: 34, column: 16, scope: !67)
!76 = !DILocation(line: 34, column: 9, scope: !67)
!77 = !DILocation(line: 35, column: 9, scope: !67)
!78 = !DILocation(line: 35, column: 21, scope: !67)
!79 = !DILocation(line: 36, column: 19, scope: !67)
!80 = !DILocation(line: 36, column: 9, scope: !67)
!81 = !DILocation(line: 37, column: 14, scope: !67)
!82 = !DILocation(line: 37, column: 9, scope: !67)
!83 = !DILocation(line: 39, column: 1, scope: !62)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 73, type: !21, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !13, line: 75, type: !6)
!86 = !DILocation(line: 75, column: 12, scope: !84)
!87 = !DILocation(line: 76, column: 10, scope: !84)
!88 = !DILocation(line: 78, column: 20, scope: !84)
!89 = !DILocation(line: 78, column: 10, scope: !84)
!90 = !DILocation(line: 79, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !13, line: 79, column: 9)
!92 = !DILocation(line: 79, column: 14, scope: !91)
!93 = !DILocation(line: 79, column: 9, scope: !84)
!94 = !DILocation(line: 79, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !13, line: 79, column: 23)
!96 = !DILocation(line: 80, column: 5, scope: !84)
!97 = !DILocation(line: 80, column: 13, scope: !84)
!98 = !DILocation(line: 81, column: 78, scope: !84)
!99 = !DILocation(line: 81, column: 76, scope: !84)
!100 = !DILocation(line: 82, column: 5, scope: !84)
!101 = !DILocation(line: 83, column: 1, scope: !84)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !13, line: 60, type: !6)
!104 = !DILocation(line: 60, column: 12, scope: !102)
!105 = !DILocation(line: 60, column: 19, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !13, line: 62, type: !68)
!107 = distinct !DILexicalBlock(scope: !102, file: !13, line: 61, column: 5)
!108 = !DILocation(line: 62, column: 14, scope: !107)
!109 = !DILocation(line: 63, column: 9, scope: !107)
!110 = !DILocation(line: 64, column: 9, scope: !107)
!111 = !DILocation(line: 64, column: 23, scope: !107)
!112 = !DILocation(line: 66, column: 16, scope: !107)
!113 = !DILocation(line: 66, column: 9, scope: !107)
!114 = !DILocation(line: 67, column: 9, scope: !107)
!115 = !DILocation(line: 67, column: 21, scope: !107)
!116 = !DILocation(line: 68, column: 19, scope: !107)
!117 = !DILocation(line: 68, column: 9, scope: !107)
!118 = !DILocation(line: 69, column: 14, scope: !107)
!119 = !DILocation(line: 69, column: 9, scope: !107)
!120 = !DILocation(line: 71, column: 1, scope: !102)
