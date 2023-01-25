; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %4) #6, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %5), !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* %6) #6, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !72
  store i8* %call, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %cmp = icmp eq i8* %0, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !86
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %4) #6, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* %5), !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  call void @free(i8* %6) #6, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !98
  store i8* %call, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %cmp = icmp eq i8* %0, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %4) #6, !dbg !115
  %5 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* %5), !dbg !117
  %6 = load i8*, i8** %data, align 8, !dbg !118
  call void @free(i8* %6) #6, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 32, column: 16, scope: !14)
!29 = !DILocation(line: 32, column: 9, scope: !14)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 33, column: 21, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 41, column: 14, scope: !33)
!38 = !DILocation(line: 43, column: 16, scope: !33)
!39 = !DILocation(line: 43, column: 22, scope: !33)
!40 = !DILocation(line: 43, column: 9, scope: !33)
!41 = !DILocation(line: 44, column: 19, scope: !33)
!42 = !DILocation(line: 44, column: 9, scope: !33)
!43 = !DILocation(line: 45, column: 14, scope: !33)
!44 = !DILocation(line: 45, column: 9, scope: !33)
!45 = !DILocation(line: 47, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_15_good", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 109, column: 5, scope: !46)
!48 = !DILocation(line: 110, column: 5, scope: !46)
!49 = !DILocation(line: 111, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 123, type: !51, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !15, line: 123, type: !53)
!56 = !DILocation(line: 123, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !15, line: 123, type: !54)
!58 = !DILocation(line: 123, column: 27, scope: !50)
!59 = !DILocation(line: 126, column: 22, scope: !50)
!60 = !DILocation(line: 126, column: 12, scope: !50)
!61 = !DILocation(line: 126, column: 5, scope: !50)
!62 = !DILocation(line: 128, column: 5, scope: !50)
!63 = !DILocation(line: 129, column: 5, scope: !50)
!64 = !DILocation(line: 130, column: 5, scope: !50)
!65 = !DILocation(line: 133, column: 5, scope: !50)
!66 = !DILocation(line: 134, column: 5, scope: !50)
!67 = !DILocation(line: 135, column: 5, scope: !50)
!68 = !DILocation(line: 137, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 56, type: !4)
!71 = !DILocation(line: 56, column: 12, scope: !69)
!72 = !DILocation(line: 57, column: 20, scope: !69)
!73 = !DILocation(line: 57, column: 10, scope: !69)
!74 = !DILocation(line: 58, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !15, line: 58, column: 9)
!76 = !DILocation(line: 58, column: 14, scope: !75)
!77 = !DILocation(line: 58, column: 9, scope: !69)
!78 = !DILocation(line: 58, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 58, column: 23)
!80 = !DILocation(line: 67, column: 16, scope: !69)
!81 = !DILocation(line: 67, column: 9, scope: !69)
!82 = !DILocation(line: 68, column: 9, scope: !69)
!83 = !DILocation(line: 68, column: 20, scope: !69)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !15, line: 72, type: !34)
!85 = distinct !DILexicalBlock(scope: !69, file: !15, line: 71, column: 5)
!86 = !DILocation(line: 72, column: 14, scope: !85)
!87 = !DILocation(line: 74, column: 16, scope: !85)
!88 = !DILocation(line: 74, column: 22, scope: !85)
!89 = !DILocation(line: 74, column: 9, scope: !85)
!90 = !DILocation(line: 75, column: 19, scope: !85)
!91 = !DILocation(line: 75, column: 9, scope: !85)
!92 = !DILocation(line: 76, column: 14, scope: !85)
!93 = !DILocation(line: 76, column: 9, scope: !85)
!94 = !DILocation(line: 78, column: 1, scope: !69)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 83, type: !4)
!97 = !DILocation(line: 83, column: 12, scope: !95)
!98 = !DILocation(line: 84, column: 20, scope: !95)
!99 = !DILocation(line: 84, column: 10, scope: !95)
!100 = !DILocation(line: 85, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !15, line: 85, column: 9)
!102 = !DILocation(line: 85, column: 14, scope: !101)
!103 = !DILocation(line: 85, column: 9, scope: !95)
!104 = !DILocation(line: 85, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 85, column: 23)
!106 = !DILocation(line: 90, column: 16, scope: !95)
!107 = !DILocation(line: 90, column: 9, scope: !95)
!108 = !DILocation(line: 91, column: 9, scope: !95)
!109 = !DILocation(line: 91, column: 20, scope: !95)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !15, line: 99, type: !34)
!111 = distinct !DILexicalBlock(scope: !95, file: !15, line: 98, column: 5)
!112 = !DILocation(line: 99, column: 14, scope: !111)
!113 = !DILocation(line: 101, column: 16, scope: !111)
!114 = !DILocation(line: 101, column: 22, scope: !111)
!115 = !DILocation(line: 101, column: 9, scope: !111)
!116 = !DILocation(line: 102, column: 19, scope: !111)
!117 = !DILocation(line: 102, column: 9, scope: !111)
!118 = !DILocation(line: 103, column: 14, scope: !111)
!119 = !DILocation(line: 103, column: 9, scope: !111)
!120 = !DILocation(line: 105, column: 1, scope: !95)
