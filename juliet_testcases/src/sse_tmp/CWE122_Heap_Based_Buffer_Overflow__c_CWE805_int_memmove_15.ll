; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %cmp = icmp eq i32* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %4 = bitcast i32* %3 to i8*, !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %5 = bitcast i32* %arraydecay to i8*, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !38
  %7 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %7), !dbg !39
  %8 = load i32*, i32** %data, align 8, !dbg !40
  %9 = bitcast i32* %8 to i8*, !dbg !40
  call void @free(i8* %9) #7, !dbg !41
  ret void, !dbg !42
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

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %data, align 8, !dbg !73
  %1 = load i32*, i32** %data, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !82
  %3 = load i32*, i32** %data, align 8, !dbg !83
  %4 = bitcast i32* %3 to i8*, !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !84
  %5 = bitcast i32* %arraydecay to i8*, !dbg !84
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !84
  %6 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !85
  %7 = load i32, i32* %arrayidx, align 4, !dbg !85
  call void @printIntLine(i32 %7), !dbg !86
  %8 = load i32*, i32** %data, align 8, !dbg !87
  %9 = bitcast i32* %8 to i8*, !dbg !87
  call void @free(i8* %9) #7, !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !94
  %0 = bitcast i8* %call to i32*, !dbg !95
  store i32* %0, i32** %data, align 8, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %cmp = icmp eq i32* %1, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %4 = bitcast i32* %3 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %5 = bitcast i32* %arraydecay to i8*, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !107
  %6 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !108
  %7 = load i32, i32* %arrayidx, align 4, !dbg !108
  call void @printIntLine(i32 %7), !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  %9 = bitcast i32* %8 to i8*, !dbg !110
  call void @free(i8* %9) #7, !dbg !111
  ret void, !dbg !112
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 29, column: 23, scope: !14)
!22 = !DILocation(line: 29, column: 16, scope: !14)
!23 = !DILocation(line: 29, column: 14, scope: !14)
!24 = !DILocation(line: 30, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 13)
!26 = !DILocation(line: 30, column: 18, scope: !25)
!27 = !DILocation(line: 30, column: 13, scope: !14)
!28 = !DILocation(line: 30, column: 28, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 30, column: 27)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 38, column: 13, scope: !31)
!36 = !DILocation(line: 40, column: 17, scope: !31)
!37 = !DILocation(line: 40, column: 9, scope: !31)
!38 = !DILocation(line: 41, column: 22, scope: !31)
!39 = !DILocation(line: 41, column: 9, scope: !31)
!40 = !DILocation(line: 42, column: 14, scope: !31)
!41 = !DILocation(line: 42, column: 9, scope: !31)
!42 = !DILocation(line: 44, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_15_good", scope: !15, file: !15, line: 102, type: !16, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 104, column: 5, scope: !43)
!45 = !DILocation(line: 105, column: 5, scope: !43)
!46 = !DILocation(line: 106, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 118, type: !48, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!5, !5, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 118, type: !5)
!54 = !DILocation(line: 118, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 118, type: !50)
!56 = !DILocation(line: 118, column: 27, scope: !47)
!57 = !DILocation(line: 121, column: 22, scope: !47)
!58 = !DILocation(line: 121, column: 12, scope: !47)
!59 = !DILocation(line: 121, column: 5, scope: !47)
!60 = !DILocation(line: 123, column: 5, scope: !47)
!61 = !DILocation(line: 124, column: 5, scope: !47)
!62 = !DILocation(line: 125, column: 5, scope: !47)
!63 = !DILocation(line: 128, column: 5, scope: !47)
!64 = !DILocation(line: 129, column: 5, scope: !47)
!65 = !DILocation(line: 130, column: 5, scope: !47)
!66 = !DILocation(line: 132, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 53, type: !4)
!69 = !DILocation(line: 53, column: 11, scope: !67)
!70 = !DILocation(line: 54, column: 10, scope: !67)
!71 = !DILocation(line: 63, column: 23, scope: !67)
!72 = !DILocation(line: 63, column: 16, scope: !67)
!73 = !DILocation(line: 63, column: 14, scope: !67)
!74 = !DILocation(line: 64, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !67, file: !15, line: 64, column: 13)
!76 = !DILocation(line: 64, column: 18, scope: !75)
!77 = !DILocation(line: 64, column: 13, scope: !67)
!78 = !DILocation(line: 64, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 64, column: 27)
!80 = !DILocalVariable(name: "source", scope: !81, file: !15, line: 68, type: !32)
!81 = distinct !DILexicalBlock(scope: !67, file: !15, line: 67, column: 5)
!82 = !DILocation(line: 68, column: 13, scope: !81)
!83 = !DILocation(line: 70, column: 17, scope: !81)
!84 = !DILocation(line: 70, column: 9, scope: !81)
!85 = !DILocation(line: 71, column: 22, scope: !81)
!86 = !DILocation(line: 71, column: 9, scope: !81)
!87 = !DILocation(line: 72, column: 14, scope: !81)
!88 = !DILocation(line: 72, column: 9, scope: !81)
!89 = !DILocation(line: 74, column: 1, scope: !67)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 79, type: !4)
!92 = !DILocation(line: 79, column: 11, scope: !90)
!93 = !DILocation(line: 80, column: 10, scope: !90)
!94 = !DILocation(line: 85, column: 23, scope: !90)
!95 = !DILocation(line: 85, column: 16, scope: !90)
!96 = !DILocation(line: 85, column: 14, scope: !90)
!97 = !DILocation(line: 86, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !90, file: !15, line: 86, column: 13)
!99 = !DILocation(line: 86, column: 18, scope: !98)
!100 = !DILocation(line: 86, column: 13, scope: !90)
!101 = !DILocation(line: 86, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 86, column: 27)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 94, type: !32)
!104 = distinct !DILexicalBlock(scope: !90, file: !15, line: 93, column: 5)
!105 = !DILocation(line: 94, column: 13, scope: !104)
!106 = !DILocation(line: 96, column: 17, scope: !104)
!107 = !DILocation(line: 96, column: 9, scope: !104)
!108 = !DILocation(line: 97, column: 22, scope: !104)
!109 = !DILocation(line: 97, column: 9, scope: !104)
!110 = !DILocation(line: 98, column: 14, scope: !104)
!111 = !DILocation(line: 98, column: 9, scope: !104)
!112 = !DILocation(line: 100, column: 1, scope: !90)
