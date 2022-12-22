; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !29
  %1 = load i32*, i32** %0, align 8, !dbg !30
  store i32* %1, i32** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !31
  %2 = bitcast i8* %call to i32*, !dbg !32
  store i32* %2, i32** %data1, align 8, !dbg !33
  %3 = load i32*, i32** %data1, align 8, !dbg !34
  %cmp = icmp eq i32* %3, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !40
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !41
  store i32* %4, i32** %5, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !46
  %7 = load i32*, i32** %6, align 8, !dbg !47
  store i32* %7, i32** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %8 = bitcast [100 x i32]* %source to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 400, i1 false), !dbg !53
  %9 = load i32*, i32** %data2, align 8, !dbg !54
  %10 = bitcast i32* %9 to i8*, !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %11 = bitcast i32* %arraydecay to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 400, i1 false), !dbg !55
  %12 = load i32*, i32** %data2, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !56
  %13 = load i32, i32* %arrayidx, align 4, !dbg !56
  call void @printIntLine(i32 %13), !dbg !57
  %14 = load i32*, i32** %data2, align 8, !dbg !58
  %15 = bitcast i32* %14 to i8*, !dbg !58
  call void @free(i8* %15) #7, !dbg !59
  ret void, !dbg !60
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !95
  %1 = load i32*, i32** %0, align 8, !dbg !96
  store i32* %1, i32** %data1, align 8, !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !97
  %2 = bitcast i8* %call to i32*, !dbg !98
  store i32* %2, i32** %data1, align 8, !dbg !99
  %3 = load i32*, i32** %data1, align 8, !dbg !100
  %cmp = icmp eq i32* %3, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !106
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !107
  store i32* %4, i32** %5, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !109, metadata !DIExpression()), !dbg !111
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !112
  %7 = load i32*, i32** %6, align 8, !dbg !113
  store i32* %7, i32** %data2, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %8 = bitcast [100 x i32]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 400, i1 false), !dbg !116
  %9 = load i32*, i32** %data2, align 8, !dbg !117
  %10 = bitcast i32* %9 to i8*, !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %11 = bitcast i32* %arraydecay to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 400, i1 false), !dbg !118
  %12 = load i32*, i32** %data2, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !119
  %13 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 %13), !dbg !120
  %14 = load i32*, i32** %data2, align 8, !dbg !121
  %15 = bitcast i32* %14 to i8*, !dbg !121
  call void @free(i8* %15) #7, !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 24, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 24, column: 12, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 25, type: !21)
!24 = !DILocation(line: 25, column: 12, scope: !14)
!25 = !DILocation(line: 26, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 28, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!28 = !DILocation(line: 28, column: 15, scope: !27)
!29 = !DILocation(line: 28, column: 23, scope: !27)
!30 = !DILocation(line: 28, column: 22, scope: !27)
!31 = !DILocation(line: 30, column: 23, scope: !27)
!32 = !DILocation(line: 30, column: 16, scope: !27)
!33 = !DILocation(line: 30, column: 14, scope: !27)
!34 = !DILocation(line: 31, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 13)
!36 = !DILocation(line: 31, column: 18, scope: !35)
!37 = !DILocation(line: 31, column: 13, scope: !27)
!38 = !DILocation(line: 31, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 31, column: 27)
!40 = !DILocation(line: 32, column: 21, scope: !27)
!41 = !DILocation(line: 32, column: 10, scope: !27)
!42 = !DILocation(line: 32, column: 19, scope: !27)
!43 = !DILocalVariable(name: "data", scope: !44, file: !15, line: 35, type: !4)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!45 = !DILocation(line: 35, column: 15, scope: !44)
!46 = !DILocation(line: 35, column: 23, scope: !44)
!47 = !DILocation(line: 35, column: 22, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !49, file: !15, line: 37, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !15, line: 36, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 37, column: 17, scope: !49)
!54 = !DILocation(line: 39, column: 20, scope: !49)
!55 = !DILocation(line: 39, column: 13, scope: !49)
!56 = !DILocation(line: 40, column: 26, scope: !49)
!57 = !DILocation(line: 40, column: 13, scope: !49)
!58 = !DILocation(line: 41, column: 18, scope: !49)
!59 = !DILocation(line: 41, column: 13, scope: !49)
!60 = !DILocation(line: 44, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_32_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 78, column: 5, scope: !61)
!63 = !DILocation(line: 79, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 90, type: !65, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!5, !5, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 90, type: !5)
!71 = !DILocation(line: 90, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 90, type: !67)
!73 = !DILocation(line: 90, column: 27, scope: !64)
!74 = !DILocation(line: 93, column: 22, scope: !64)
!75 = !DILocation(line: 93, column: 12, scope: !64)
!76 = !DILocation(line: 93, column: 5, scope: !64)
!77 = !DILocation(line: 95, column: 5, scope: !64)
!78 = !DILocation(line: 96, column: 5, scope: !64)
!79 = !DILocation(line: 97, column: 5, scope: !64)
!80 = !DILocation(line: 100, column: 5, scope: !64)
!81 = !DILocation(line: 101, column: 5, scope: !64)
!82 = !DILocation(line: 102, column: 5, scope: !64)
!83 = !DILocation(line: 104, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 53, type: !4)
!86 = !DILocation(line: 53, column: 11, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !15, line: 54, type: !21)
!88 = !DILocation(line: 54, column: 12, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !15, line: 55, type: !21)
!90 = !DILocation(line: 55, column: 12, scope: !84)
!91 = !DILocation(line: 56, column: 10, scope: !84)
!92 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 58, type: !4)
!93 = distinct !DILexicalBlock(scope: !84, file: !15, line: 57, column: 5)
!94 = !DILocation(line: 58, column: 15, scope: !93)
!95 = !DILocation(line: 58, column: 23, scope: !93)
!96 = !DILocation(line: 58, column: 22, scope: !93)
!97 = !DILocation(line: 60, column: 23, scope: !93)
!98 = !DILocation(line: 60, column: 16, scope: !93)
!99 = !DILocation(line: 60, column: 14, scope: !93)
!100 = !DILocation(line: 61, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !15, line: 61, column: 13)
!102 = !DILocation(line: 61, column: 18, scope: !101)
!103 = !DILocation(line: 61, column: 13, scope: !93)
!104 = !DILocation(line: 61, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 61, column: 27)
!106 = !DILocation(line: 62, column: 21, scope: !93)
!107 = !DILocation(line: 62, column: 10, scope: !93)
!108 = !DILocation(line: 62, column: 19, scope: !93)
!109 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 65, type: !4)
!110 = distinct !DILexicalBlock(scope: !84, file: !15, line: 64, column: 5)
!111 = !DILocation(line: 65, column: 15, scope: !110)
!112 = !DILocation(line: 65, column: 23, scope: !110)
!113 = !DILocation(line: 65, column: 22, scope: !110)
!114 = !DILocalVariable(name: "source", scope: !115, file: !15, line: 67, type: !50)
!115 = distinct !DILexicalBlock(scope: !110, file: !15, line: 66, column: 9)
!116 = !DILocation(line: 67, column: 17, scope: !115)
!117 = !DILocation(line: 69, column: 20, scope: !115)
!118 = !DILocation(line: 69, column: 13, scope: !115)
!119 = !DILocation(line: 70, column: 26, scope: !115)
!120 = !DILocation(line: 70, column: 13, scope: !115)
!121 = !DILocation(line: 71, column: 18, scope: !115)
!122 = !DILocation(line: 71, column: 13, scope: !115)
!123 = !DILocation(line: 74, column: 1, scope: !84)
