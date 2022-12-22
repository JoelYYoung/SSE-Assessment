; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %4 = load i8*, i8** %data1, align 8, !dbg !41
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !42
  store i8* %4, i8** %5, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !47
  %7 = load i8*, i8** %6, align 8, !dbg !48
  store i8* %7, i8** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %8 = load i8*, i8** %data2, align 8, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %8, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !59
  %9 = load i8*, i8** %data2, align 8, !dbg !60
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  %10 = load i8*, i8** %data2, align 8, !dbg !62
  call void @printLine(i8* %10), !dbg !63
  %11 = load i8*, i8** %data2, align 8, !dbg !64
  call void @free(i8* %11) #7, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !94
  store i8* null, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !99
  %1 = load i8*, i8** %0, align 8, !dbg !100
  store i8* %1, i8** %data1, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !101
  store i8* %call, i8** %data1, align 8, !dbg !102
  %2 = load i8*, i8** %data1, align 8, !dbg !103
  %cmp = icmp eq i8* %2, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %4 = load i8*, i8** %data1, align 8, !dbg !111
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !112
  store i8* %4, i8** %5, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !117
  %7 = load i8*, i8** %6, align 8, !dbg !118
  store i8* %7, i8** %data2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx3, align 1, !dbg !124
  %8 = load i8*, i8** %data2, align 8, !dbg !125
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %8, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !126
  %9 = load i8*, i8** %data2, align 8, !dbg !127
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !127
  store i8 0, i8* %arrayidx5, align 1, !dbg !128
  %10 = load i8*, i8** %data2, align 8, !dbg !129
  call void @printLine(i8* %10), !dbg !130
  %11 = load i8*, i8** %data2, align 8, !dbg !131
  call void @free(i8* %11) #7, !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocation(line: 32, column: 24, scope: !27)
!32 = !DILocation(line: 32, column: 14, scope: !27)
!33 = !DILocation(line: 33, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 13)
!35 = !DILocation(line: 33, column: 18, scope: !34)
!36 = !DILocation(line: 33, column: 13, scope: !27)
!37 = !DILocation(line: 33, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 33, column: 27)
!39 = !DILocation(line: 34, column: 9, scope: !27)
!40 = !DILocation(line: 34, column: 17, scope: !27)
!41 = !DILocation(line: 35, column: 21, scope: !27)
!42 = !DILocation(line: 35, column: 10, scope: !27)
!43 = !DILocation(line: 35, column: 19, scope: !27)
!44 = !DILocalVariable(name: "data", scope: !45, file: !15, line: 38, type: !4)
!45 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 16, scope: !45)
!47 = !DILocation(line: 38, column: 24, scope: !45)
!48 = !DILocation(line: 38, column: 23, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !50, file: !15, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !45, file: !15, line: 39, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 40, column: 18, scope: !50)
!55 = !DILocation(line: 41, column: 13, scope: !50)
!56 = !DILocation(line: 42, column: 13, scope: !50)
!57 = !DILocation(line: 42, column: 27, scope: !50)
!58 = !DILocation(line: 44, column: 21, scope: !50)
!59 = !DILocation(line: 44, column: 13, scope: !50)
!60 = !DILocation(line: 45, column: 13, scope: !50)
!61 = !DILocation(line: 45, column: 25, scope: !50)
!62 = !DILocation(line: 46, column: 23, scope: !50)
!63 = !DILocation(line: 46, column: 13, scope: !50)
!64 = !DILocation(line: 47, column: 18, scope: !50)
!65 = !DILocation(line: 47, column: 13, scope: !50)
!66 = !DILocation(line: 50, column: 1, scope: !14)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_32_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 88, column: 5, scope: !67)
!69 = !DILocation(line: 89, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !71, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !21}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !15, line: 100, type: !73)
!75 = !DILocation(line: 100, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !15, line: 100, type: !21)
!77 = !DILocation(line: 100, column: 27, scope: !70)
!78 = !DILocation(line: 103, column: 22, scope: !70)
!79 = !DILocation(line: 103, column: 12, scope: !70)
!80 = !DILocation(line: 103, column: 5, scope: !70)
!81 = !DILocation(line: 105, column: 5, scope: !70)
!82 = !DILocation(line: 106, column: 5, scope: !70)
!83 = !DILocation(line: 107, column: 5, scope: !70)
!84 = !DILocation(line: 110, column: 5, scope: !70)
!85 = !DILocation(line: 111, column: 5, scope: !70)
!86 = !DILocation(line: 112, column: 5, scope: !70)
!87 = !DILocation(line: 114, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 59, type: !4)
!90 = !DILocation(line: 59, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !15, line: 60, type: !21)
!92 = !DILocation(line: 60, column: 13, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !15, line: 61, type: !21)
!94 = !DILocation(line: 61, column: 13, scope: !88)
!95 = !DILocation(line: 62, column: 10, scope: !88)
!96 = !DILocalVariable(name: "data", scope: !97, file: !15, line: 64, type: !4)
!97 = distinct !DILexicalBlock(scope: !88, file: !15, line: 63, column: 5)
!98 = !DILocation(line: 64, column: 16, scope: !97)
!99 = !DILocation(line: 64, column: 24, scope: !97)
!100 = !DILocation(line: 64, column: 23, scope: !97)
!101 = !DILocation(line: 66, column: 24, scope: !97)
!102 = !DILocation(line: 66, column: 14, scope: !97)
!103 = !DILocation(line: 67, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !15, line: 67, column: 13)
!105 = !DILocation(line: 67, column: 18, scope: !104)
!106 = !DILocation(line: 67, column: 13, scope: !97)
!107 = !DILocation(line: 67, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 67, column: 27)
!109 = !DILocation(line: 68, column: 9, scope: !97)
!110 = !DILocation(line: 68, column: 17, scope: !97)
!111 = !DILocation(line: 69, column: 21, scope: !97)
!112 = !DILocation(line: 69, column: 10, scope: !97)
!113 = !DILocation(line: 69, column: 19, scope: !97)
!114 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 72, type: !4)
!115 = distinct !DILexicalBlock(scope: !88, file: !15, line: 71, column: 5)
!116 = !DILocation(line: 72, column: 16, scope: !115)
!117 = !DILocation(line: 72, column: 24, scope: !115)
!118 = !DILocation(line: 72, column: 23, scope: !115)
!119 = !DILocalVariable(name: "source", scope: !120, file: !15, line: 74, type: !51)
!120 = distinct !DILexicalBlock(scope: !115, file: !15, line: 73, column: 9)
!121 = !DILocation(line: 74, column: 18, scope: !120)
!122 = !DILocation(line: 75, column: 13, scope: !120)
!123 = !DILocation(line: 76, column: 13, scope: !120)
!124 = !DILocation(line: 76, column: 27, scope: !120)
!125 = !DILocation(line: 78, column: 21, scope: !120)
!126 = !DILocation(line: 78, column: 13, scope: !120)
!127 = !DILocation(line: 79, column: 13, scope: !120)
!128 = !DILocation(line: 79, column: 25, scope: !120)
!129 = !DILocation(line: 80, column: 23, scope: !120)
!130 = !DILocation(line: 80, column: 13, scope: !120)
!131 = !DILocation(line: 81, column: 18, scope: !120)
!132 = !DILocation(line: 81, column: 13, scope: !120)
!133 = !DILocation(line: 84, column: 1, scope: !88)
