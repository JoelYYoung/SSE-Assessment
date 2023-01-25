; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void %1(i8* %2), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #6, !dbg !48
  %2 = load i8*, i8** %data.addr, align 8, !dbg !49
  call void @printLine(i8* %2), !dbg !50
  %3 = load i8*, i8** %data.addr, align 8, !dbg !51
  call void @free(i8* %3) #6, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !79, metadata !DIExpression()), !dbg !80
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  call void %1(i8* %2), !dbg !90
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !93 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !98
  %1 = load i8*, i8** %data.addr, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #6, !dbg !101
  %2 = load i8*, i8** %data.addr, align 8, !dbg !102
  call void @printLine(i8* %2), !dbg !103
  %3 = load i8*, i8** %data.addr, align 8, !dbg !104
  call void @free(i8* %3) #6, !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44_bad", scope: !15, file: !15, line: 39, type: !16, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 41, type: !4)
!19 = !DILocation(line: 41, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 43, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 43, column: 12, scope: !14)
!25 = !DILocation(line: 44, column: 10, scope: !14)
!26 = !DILocation(line: 46, column: 20, scope: !14)
!27 = !DILocation(line: 46, column: 10, scope: !14)
!28 = !DILocation(line: 47, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 47, column: 9)
!30 = !DILocation(line: 47, column: 14, scope: !29)
!31 = !DILocation(line: 47, column: 9, scope: !14)
!32 = !DILocation(line: 47, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 47, column: 23)
!34 = !DILocation(line: 49, column: 5, scope: !14)
!35 = !DILocation(line: 49, column: 13, scope: !14)
!36 = !DILocation(line: 50, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 28, type: !22, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !15, line: 28, type: !4)
!39 = !DILocation(line: 28, column: 28, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !15, line: 31, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 30, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 31, column: 14, scope: !41)
!46 = !DILocation(line: 33, column: 16, scope: !41)
!47 = !DILocation(line: 33, column: 22, scope: !41)
!48 = !DILocation(line: 33, column: 9, scope: !41)
!49 = !DILocation(line: 34, column: 19, scope: !41)
!50 = !DILocation(line: 34, column: 9, scope: !41)
!51 = !DILocation(line: 35, column: 14, scope: !41)
!52 = !DILocation(line: 35, column: 9, scope: !41)
!53 = !DILocation(line: 37, column: 1, scope: !37)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_44_good", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 81, column: 5, scope: !54)
!56 = !DILocation(line: 82, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !58, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 93, type: !60)
!63 = !DILocation(line: 93, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 93, type: !61)
!65 = !DILocation(line: 93, column: 27, scope: !57)
!66 = !DILocation(line: 96, column: 22, scope: !57)
!67 = !DILocation(line: 96, column: 12, scope: !57)
!68 = !DILocation(line: 96, column: 5, scope: !57)
!69 = !DILocation(line: 98, column: 5, scope: !57)
!70 = !DILocation(line: 99, column: 5, scope: !57)
!71 = !DILocation(line: 100, column: 5, scope: !57)
!72 = !DILocation(line: 103, column: 5, scope: !57)
!73 = !DILocation(line: 104, column: 5, scope: !57)
!74 = !DILocation(line: 105, column: 5, scope: !57)
!75 = !DILocation(line: 107, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 70, type: !4)
!78 = !DILocation(line: 70, column: 12, scope: !76)
!79 = !DILocalVariable(name: "funcPtr", scope: !76, file: !15, line: 71, type: !21)
!80 = !DILocation(line: 71, column: 12, scope: !76)
!81 = !DILocation(line: 72, column: 10, scope: !76)
!82 = !DILocation(line: 74, column: 20, scope: !76)
!83 = !DILocation(line: 74, column: 10, scope: !76)
!84 = !DILocation(line: 75, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !15, line: 75, column: 9)
!86 = !DILocation(line: 75, column: 14, scope: !85)
!87 = !DILocation(line: 75, column: 9, scope: !76)
!88 = !DILocation(line: 75, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 75, column: 23)
!90 = !DILocation(line: 76, column: 5, scope: !76)
!91 = !DILocation(line: 76, column: 13, scope: !76)
!92 = !DILocation(line: 77, column: 1, scope: !76)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 57, type: !22, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !15, line: 57, type: !4)
!95 = !DILocation(line: 57, column: 32, scope: !93)
!96 = !DILocalVariable(name: "source", scope: !97, file: !15, line: 60, type: !42)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 59, column: 5)
!98 = !DILocation(line: 60, column: 14, scope: !97)
!99 = !DILocation(line: 62, column: 16, scope: !97)
!100 = !DILocation(line: 62, column: 22, scope: !97)
!101 = !DILocation(line: 62, column: 9, scope: !97)
!102 = !DILocation(line: 63, column: 19, scope: !97)
!103 = !DILocation(line: 63, column: 9, scope: !97)
!104 = !DILocation(line: 64, column: 14, scope: !97)
!105 = !DILocation(line: 64, column: 9, scope: !97)
!106 = !DILocation(line: 66, column: 1, scope: !93)
