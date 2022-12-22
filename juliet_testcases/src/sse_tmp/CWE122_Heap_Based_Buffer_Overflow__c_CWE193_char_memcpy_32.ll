; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %3, i8** %4, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %6 = load i8*, i8** %5, align 8, !dbg !46
  store i8* %6, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %8 = load i8*, i8** %data2, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !56
  %add = add i64 %call4, 1, !dbg !57
  %mul = mul i64 %add, 1, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !54
  %9 = load i8*, i8** %data2, align 8, !dbg !59
  call void @printLine(i8* %9), !dbg !60
  %10 = load i8*, i8** %data2, align 8, !dbg !61
  call void @free(i8* %10) #7, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_good() #0 !dbg !64 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !96
  %1 = load i8*, i8** %0, align 8, !dbg !97
  store i8* %1, i8** %data1, align 8, !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !98
  store i8* %call, i8** %data1, align 8, !dbg !99
  %2 = load i8*, i8** %data1, align 8, !dbg !100
  %cmp = icmp eq i8* %2, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !106
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !107
  store i8* %3, i8** %4, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !109, metadata !DIExpression()), !dbg !111
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !112
  %6 = load i8*, i8** %5, align 8, !dbg !113
  store i8* %6, i8** %data2, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !116
  %8 = load i8*, i8** %data2, align 8, !dbg !117
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !119
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !120
  %add = add i64 %call4, 1, !dbg !121
  %mul = mul i64 %add, 1, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !118
  %9 = load i8*, i8** %data2, align 8, !dbg !123
  call void @printLine(i8* %9), !dbg !124
  %10 = load i8*, i8** %data2, align 8, !dbg !125
  call void @free(i8* %10) #7, !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !14)
!25 = !DILocation(line: 33, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 35, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 24, scope: !27)
!30 = !DILocation(line: 35, column: 23, scope: !27)
!31 = !DILocation(line: 37, column: 24, scope: !27)
!32 = !DILocation(line: 37, column: 14, scope: !27)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !27)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 21, scope: !27)
!40 = !DILocation(line: 39, column: 10, scope: !27)
!41 = !DILocation(line: 39, column: 19, scope: !27)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 42, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!44 = !DILocation(line: 42, column: 16, scope: !43)
!45 = !DILocation(line: 42, column: 24, scope: !43)
!46 = !DILocation(line: 42, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !15, line: 44, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !15, line: 43, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 44, column: 18, scope: !48)
!53 = !DILocation(line: 47, column: 20, scope: !48)
!54 = !DILocation(line: 47, column: 13, scope: !48)
!55 = !DILocation(line: 47, column: 42, scope: !48)
!56 = !DILocation(line: 47, column: 35, scope: !48)
!57 = !DILocation(line: 47, column: 50, scope: !48)
!58 = !DILocation(line: 47, column: 55, scope: !48)
!59 = !DILocation(line: 48, column: 23, scope: !48)
!60 = !DILocation(line: 48, column: 13, scope: !48)
!61 = !DILocation(line: 49, column: 18, scope: !48)
!62 = !DILocation(line: 49, column: 13, scope: !48)
!63 = !DILocation(line: 52, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_good", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 87, column: 5, scope: !64)
!66 = !DILocation(line: 88, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !21}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 99, type: !70)
!72 = !DILocation(line: 99, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 99, type: !21)
!74 = !DILocation(line: 99, column: 27, scope: !67)
!75 = !DILocation(line: 102, column: 22, scope: !67)
!76 = !DILocation(line: 102, column: 12, scope: !67)
!77 = !DILocation(line: 102, column: 5, scope: !67)
!78 = !DILocation(line: 104, column: 5, scope: !67)
!79 = !DILocation(line: 105, column: 5, scope: !67)
!80 = !DILocation(line: 106, column: 5, scope: !67)
!81 = !DILocation(line: 109, column: 5, scope: !67)
!82 = !DILocation(line: 110, column: 5, scope: !67)
!83 = !DILocation(line: 111, column: 5, scope: !67)
!84 = !DILocation(line: 113, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 61, type: !4)
!87 = !DILocation(line: 61, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !15, line: 62, type: !21)
!89 = !DILocation(line: 62, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !15, line: 63, type: !21)
!91 = !DILocation(line: 63, column: 13, scope: !85)
!92 = !DILocation(line: 64, column: 10, scope: !85)
!93 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 66, type: !4)
!94 = distinct !DILexicalBlock(scope: !85, file: !15, line: 65, column: 5)
!95 = !DILocation(line: 66, column: 16, scope: !94)
!96 = !DILocation(line: 66, column: 24, scope: !94)
!97 = !DILocation(line: 66, column: 23, scope: !94)
!98 = !DILocation(line: 68, column: 24, scope: !94)
!99 = !DILocation(line: 68, column: 14, scope: !94)
!100 = !DILocation(line: 69, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !15, line: 69, column: 13)
!102 = !DILocation(line: 69, column: 18, scope: !101)
!103 = !DILocation(line: 69, column: 13, scope: !94)
!104 = !DILocation(line: 69, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 69, column: 27)
!106 = !DILocation(line: 70, column: 21, scope: !94)
!107 = !DILocation(line: 70, column: 10, scope: !94)
!108 = !DILocation(line: 70, column: 19, scope: !94)
!109 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 73, type: !4)
!110 = distinct !DILexicalBlock(scope: !85, file: !15, line: 72, column: 5)
!111 = !DILocation(line: 73, column: 16, scope: !110)
!112 = !DILocation(line: 73, column: 24, scope: !110)
!113 = !DILocation(line: 73, column: 23, scope: !110)
!114 = !DILocalVariable(name: "source", scope: !115, file: !15, line: 75, type: !49)
!115 = distinct !DILexicalBlock(scope: !110, file: !15, line: 74, column: 9)
!116 = !DILocation(line: 75, column: 18, scope: !115)
!117 = !DILocation(line: 78, column: 20, scope: !115)
!118 = !DILocation(line: 78, column: 13, scope: !115)
!119 = !DILocation(line: 78, column: 42, scope: !115)
!120 = !DILocation(line: 78, column: 35, scope: !115)
!121 = !DILocation(line: 78, column: 50, scope: !115)
!122 = !DILocation(line: 78, column: 55, scope: !115)
!123 = !DILocation(line: 79, column: 23, scope: !115)
!124 = !DILocation(line: 79, column: 13, scope: !115)
!125 = !DILocation(line: 80, column: 18, scope: !115)
!126 = !DILocation(line: 80, column: 13, scope: !115)
!127 = !DILocation(line: 83, column: 1, scope: !85)
