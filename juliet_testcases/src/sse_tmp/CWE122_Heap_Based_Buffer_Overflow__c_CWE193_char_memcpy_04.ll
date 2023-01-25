; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !39
  %call2 = call i64 @strlen(i8* %arraydecay1) #9, !dbg !40
  %add = add i64 %call2, 1, !dbg !41
  %mul = mul i64 %add, 1, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %3), !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @free(i8* %4) #7, !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !75
  store i8* %call, i8** %data, align 8, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %cmp = icmp eq i8* %0, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !89
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !90
  %call2 = call i64 @strlen(i8* %arraydecay1) #9, !dbg !91
  %add = add i64 %call2, 1, !dbg !92
  %mul = mul i64 %add, 1, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %3), !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* %4) #7, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %cmp = icmp eq i8* %0, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %call2 = call i64 @strlen(i8* %arraydecay1) #9, !dbg !119
  %add = add i64 %call2, 1, !dbg !120
  %mul = mul i64 %add, 1, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %3), !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  call void @free(i8* %4) #7, !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 12, scope: !14)
!20 = !DILocation(line: 38, column: 10, scope: !14)
!21 = !DILocation(line: 42, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 40, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 8)
!24 = !DILocation(line: 42, column: 14, scope: !22)
!25 = !DILocation(line: 43, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 43, column: 13)
!27 = !DILocation(line: 43, column: 18, scope: !26)
!28 = !DILocation(line: 43, column: 13, scope: !22)
!29 = !DILocation(line: 43, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 43, column: 27)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 46, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DILocation(line: 46, column: 14, scope: !32)
!37 = !DILocation(line: 49, column: 16, scope: !32)
!38 = !DILocation(line: 49, column: 9, scope: !32)
!39 = !DILocation(line: 49, column: 38, scope: !32)
!40 = !DILocation(line: 49, column: 31, scope: !32)
!41 = !DILocation(line: 49, column: 46, scope: !32)
!42 = !DILocation(line: 49, column: 51, scope: !32)
!43 = !DILocation(line: 50, column: 19, scope: !32)
!44 = !DILocation(line: 50, column: 9, scope: !32)
!45 = !DILocation(line: 51, column: 14, scope: !32)
!46 = !DILocation(line: 51, column: 9, scope: !32)
!47 = !DILocation(line: 53, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_04_good", scope: !15, file: !15, line: 106, type: !16, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 108, column: 5, scope: !48)
!50 = !DILocation(line: 109, column: 5, scope: !48)
!51 = !DILocation(line: 110, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 122, type: !53, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 122, type: !55)
!58 = !DILocation(line: 122, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 122, type: !56)
!60 = !DILocation(line: 122, column: 27, scope: !52)
!61 = !DILocation(line: 125, column: 22, scope: !52)
!62 = !DILocation(line: 125, column: 12, scope: !52)
!63 = !DILocation(line: 125, column: 5, scope: !52)
!64 = !DILocation(line: 127, column: 5, scope: !52)
!65 = !DILocation(line: 128, column: 5, scope: !52)
!66 = !DILocation(line: 129, column: 5, scope: !52)
!67 = !DILocation(line: 132, column: 5, scope: !52)
!68 = !DILocation(line: 133, column: 5, scope: !52)
!69 = !DILocation(line: 134, column: 5, scope: !52)
!70 = !DILocation(line: 136, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !15, line: 62, type: !4)
!73 = !DILocation(line: 62, column: 12, scope: !71)
!74 = !DILocation(line: 63, column: 10, scope: !71)
!75 = !DILocation(line: 72, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !15, line: 70, column: 5)
!77 = distinct !DILexicalBlock(scope: !71, file: !15, line: 64, column: 8)
!78 = !DILocation(line: 72, column: 14, scope: !76)
!79 = !DILocation(line: 73, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 73, column: 13)
!81 = !DILocation(line: 73, column: 18, scope: !80)
!82 = !DILocation(line: 73, column: 13, scope: !76)
!83 = !DILocation(line: 73, column: 28, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 73, column: 27)
!85 = !DILocalVariable(name: "source", scope: !86, file: !15, line: 76, type: !33)
!86 = distinct !DILexicalBlock(scope: !71, file: !15, line: 75, column: 5)
!87 = !DILocation(line: 76, column: 14, scope: !86)
!88 = !DILocation(line: 79, column: 16, scope: !86)
!89 = !DILocation(line: 79, column: 9, scope: !86)
!90 = !DILocation(line: 79, column: 38, scope: !86)
!91 = !DILocation(line: 79, column: 31, scope: !86)
!92 = !DILocation(line: 79, column: 46, scope: !86)
!93 = !DILocation(line: 79, column: 51, scope: !86)
!94 = !DILocation(line: 80, column: 19, scope: !86)
!95 = !DILocation(line: 80, column: 9, scope: !86)
!96 = !DILocation(line: 81, column: 14, scope: !86)
!97 = !DILocation(line: 81, column: 9, scope: !86)
!98 = !DILocation(line: 83, column: 1, scope: !71)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 88, type: !4)
!101 = !DILocation(line: 88, column: 12, scope: !99)
!102 = !DILocation(line: 89, column: 10, scope: !99)
!103 = !DILocation(line: 93, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !15, line: 91, column: 5)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 90, column: 8)
!106 = !DILocation(line: 93, column: 14, scope: !104)
!107 = !DILocation(line: 94, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 94, column: 13)
!109 = !DILocation(line: 94, column: 18, scope: !108)
!110 = !DILocation(line: 94, column: 13, scope: !104)
!111 = !DILocation(line: 94, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 94, column: 27)
!113 = !DILocalVariable(name: "source", scope: !114, file: !15, line: 97, type: !33)
!114 = distinct !DILexicalBlock(scope: !99, file: !15, line: 96, column: 5)
!115 = !DILocation(line: 97, column: 14, scope: !114)
!116 = !DILocation(line: 100, column: 16, scope: !114)
!117 = !DILocation(line: 100, column: 9, scope: !114)
!118 = !DILocation(line: 100, column: 38, scope: !114)
!119 = !DILocation(line: 100, column: 31, scope: !114)
!120 = !DILocation(line: 100, column: 46, scope: !114)
!121 = !DILocation(line: 100, column: 51, scope: !114)
!122 = !DILocation(line: 101, column: 19, scope: !114)
!123 = !DILocation(line: 101, column: 9, scope: !114)
!124 = !DILocation(line: 102, column: 14, scope: !114)
!125 = !DILocation(line: 102, column: 9, scope: !114)
!126 = !DILocation(line: 104, column: 1, scope: !99)
