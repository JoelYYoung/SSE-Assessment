; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_bad() #0 !dbg !14 {
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
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
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
  %call5 = call i8* @strcat(i8* %8, i8* %arraydecay4) #6, !dbg !60
  %9 = load i8*, i8** %data2, align 8, !dbg !61
  call void @printLine(i8* %9), !dbg !62
  %10 = load i8*, i8** %data2, align 8, !dbg !63
  call void @free(i8* %10) #6, !dbg !64
  ret void, !dbg !65
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
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !93
  store i8* null, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !98
  %1 = load i8*, i8** %0, align 8, !dbg !99
  store i8* %1, i8** %data1, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !100
  store i8* %call, i8** %data1, align 8, !dbg !101
  %2 = load i8*, i8** %data1, align 8, !dbg !102
  %cmp = icmp eq i8* %2, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %4 = load i8*, i8** %data1, align 8, !dbg !110
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !111
  store i8* %4, i8** %5, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !113, metadata !DIExpression()), !dbg !115
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !116
  %7 = load i8*, i8** %6, align 8, !dbg !117
  store i8* %7, i8** %data2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx3, align 1, !dbg !123
  %8 = load i8*, i8** %data2, align 8, !dbg !124
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  %call5 = call i8* @strcat(i8* %8, i8* %arraydecay4) #6, !dbg !126
  %9 = load i8*, i8** %data2, align 8, !dbg !127
  call void @printLine(i8* %9), !dbg !128
  %10 = load i8*, i8** %data2, align 8, !dbg !129
  call void @free(i8* %10) #6, !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!58 = !DILocation(line: 44, column: 20, scope: !50)
!59 = !DILocation(line: 44, column: 26, scope: !50)
!60 = !DILocation(line: 44, column: 13, scope: !50)
!61 = !DILocation(line: 45, column: 23, scope: !50)
!62 = !DILocation(line: 45, column: 13, scope: !50)
!63 = !DILocation(line: 46, column: 18, scope: !50)
!64 = !DILocation(line: 46, column: 13, scope: !50)
!65 = !DILocation(line: 49, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 86, column: 5, scope: !66)
!68 = !DILocation(line: 87, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !70, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !21}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !15, line: 98, type: !72)
!74 = !DILocation(line: 98, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !15, line: 98, type: !21)
!76 = !DILocation(line: 98, column: 27, scope: !69)
!77 = !DILocation(line: 101, column: 22, scope: !69)
!78 = !DILocation(line: 101, column: 12, scope: !69)
!79 = !DILocation(line: 101, column: 5, scope: !69)
!80 = !DILocation(line: 103, column: 5, scope: !69)
!81 = !DILocation(line: 104, column: 5, scope: !69)
!82 = !DILocation(line: 105, column: 5, scope: !69)
!83 = !DILocation(line: 108, column: 5, scope: !69)
!84 = !DILocation(line: 109, column: 5, scope: !69)
!85 = !DILocation(line: 110, column: 5, scope: !69)
!86 = !DILocation(line: 112, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 58, type: !4)
!89 = !DILocation(line: 58, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataPtr1", scope: !87, file: !15, line: 59, type: !21)
!91 = !DILocation(line: 59, column: 13, scope: !87)
!92 = !DILocalVariable(name: "dataPtr2", scope: !87, file: !15, line: 60, type: !21)
!93 = !DILocation(line: 60, column: 13, scope: !87)
!94 = !DILocation(line: 61, column: 10, scope: !87)
!95 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 63, type: !4)
!96 = distinct !DILexicalBlock(scope: !87, file: !15, line: 62, column: 5)
!97 = !DILocation(line: 63, column: 16, scope: !96)
!98 = !DILocation(line: 63, column: 24, scope: !96)
!99 = !DILocation(line: 63, column: 23, scope: !96)
!100 = !DILocation(line: 65, column: 24, scope: !96)
!101 = !DILocation(line: 65, column: 14, scope: !96)
!102 = !DILocation(line: 66, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 13)
!104 = !DILocation(line: 66, column: 18, scope: !103)
!105 = !DILocation(line: 66, column: 13, scope: !96)
!106 = !DILocation(line: 66, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 66, column: 27)
!108 = !DILocation(line: 67, column: 9, scope: !96)
!109 = !DILocation(line: 67, column: 17, scope: !96)
!110 = !DILocation(line: 68, column: 21, scope: !96)
!111 = !DILocation(line: 68, column: 10, scope: !96)
!112 = !DILocation(line: 68, column: 19, scope: !96)
!113 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 71, type: !4)
!114 = distinct !DILexicalBlock(scope: !87, file: !15, line: 70, column: 5)
!115 = !DILocation(line: 71, column: 16, scope: !114)
!116 = !DILocation(line: 71, column: 24, scope: !114)
!117 = !DILocation(line: 71, column: 23, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !15, line: 73, type: !51)
!119 = distinct !DILexicalBlock(scope: !114, file: !15, line: 72, column: 9)
!120 = !DILocation(line: 73, column: 18, scope: !119)
!121 = !DILocation(line: 74, column: 13, scope: !119)
!122 = !DILocation(line: 75, column: 13, scope: !119)
!123 = !DILocation(line: 75, column: 27, scope: !119)
!124 = !DILocation(line: 77, column: 20, scope: !119)
!125 = !DILocation(line: 77, column: 26, scope: !119)
!126 = !DILocation(line: 77, column: 13, scope: !119)
!127 = !DILocation(line: 78, column: 23, scope: !119)
!128 = !DILocation(line: 78, column: 13, scope: !119)
!129 = !DILocation(line: 79, column: 18, scope: !119)
!130 = !DILocation(line: 79, column: 13, scope: !119)
!131 = !DILocation(line: 82, column: 1, scope: !87)
