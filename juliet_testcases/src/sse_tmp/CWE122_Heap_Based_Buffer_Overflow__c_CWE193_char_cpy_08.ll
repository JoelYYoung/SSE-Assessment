; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %call4 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %3), !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @free(i8* %4) #6, !dbg !46
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

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_good() #0 !dbg !48 {
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
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !71 {
entry:
  ret i32 1, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %call = call i32 @staticReturnsFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end3, !dbg !84

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !85
  store i8* %call1, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then2, label %if.end, !dbg !91

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !98
  %call4 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %3), !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @free(i8* %4) #6, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !105 {
entry:
  ret i32 0, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %call = call i32 @staticReturnsTrue(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.end3, !dbg !113

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !114
  store i8* %call1, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !123

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %call4 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !129
  %3 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %3), !dbg !131
  %4 = load i8*, i8** %data, align 8, !dbg !132
  call void @free(i8* %4) #6, !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_bad", scope: !15, file: !15, line: 42, type: !16, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 44, type: !4)
!19 = !DILocation(line: 44, column: 12, scope: !14)
!20 = !DILocation(line: 45, column: 10, scope: !14)
!21 = !DILocation(line: 46, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 8)
!23 = !DILocation(line: 46, column: 8, scope: !14)
!24 = !DILocation(line: 49, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 5)
!26 = !DILocation(line: 49, column: 14, scope: !25)
!27 = !DILocation(line: 50, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 50, column: 13)
!29 = !DILocation(line: 50, column: 18, scope: !28)
!30 = !DILocation(line: 50, column: 13, scope: !25)
!31 = !DILocation(line: 50, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 50, column: 27)
!33 = !DILocation(line: 51, column: 5, scope: !25)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 53, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 52, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 53, column: 14, scope: !35)
!40 = !DILocation(line: 55, column: 16, scope: !35)
!41 = !DILocation(line: 55, column: 22, scope: !35)
!42 = !DILocation(line: 55, column: 9, scope: !35)
!43 = !DILocation(line: 56, column: 19, scope: !35)
!44 = !DILocation(line: 56, column: 9, scope: !35)
!45 = !DILocation(line: 57, column: 14, scope: !35)
!46 = !DILocation(line: 57, column: 9, scope: !35)
!47 = !DILocation(line: 59, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_08_good", scope: !15, file: !15, line: 110, type: !16, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 112, column: 5, scope: !48)
!50 = !DILocation(line: 113, column: 5, scope: !48)
!51 = !DILocation(line: 114, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 126, type: !53, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 126, type: !55)
!58 = !DILocation(line: 126, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 126, type: !56)
!60 = !DILocation(line: 126, column: 27, scope: !52)
!61 = !DILocation(line: 129, column: 22, scope: !52)
!62 = !DILocation(line: 129, column: 12, scope: !52)
!63 = !DILocation(line: 129, column: 5, scope: !52)
!64 = !DILocation(line: 131, column: 5, scope: !52)
!65 = !DILocation(line: 132, column: 5, scope: !52)
!66 = !DILocation(line: 133, column: 5, scope: !52)
!67 = !DILocation(line: 136, column: 5, scope: !52)
!68 = !DILocation(line: 137, column: 5, scope: !52)
!69 = !DILocation(line: 138, column: 5, scope: !52)
!70 = !DILocation(line: 140, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 30, type: !72, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!55}
!74 = !DILocation(line: 32, column: 5, scope: !71)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 68, type: !4)
!77 = !DILocation(line: 68, column: 12, scope: !75)
!78 = !DILocation(line: 69, column: 10, scope: !75)
!79 = !DILocation(line: 70, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !15, line: 70, column: 8)
!81 = !DILocation(line: 70, column: 8, scope: !75)
!82 = !DILocation(line: 73, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !15, line: 71, column: 5)
!84 = !DILocation(line: 74, column: 5, scope: !83)
!85 = !DILocation(line: 78, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !15, line: 76, column: 5)
!87 = !DILocation(line: 78, column: 14, scope: !86)
!88 = !DILocation(line: 79, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 79, column: 13)
!90 = !DILocation(line: 79, column: 18, scope: !89)
!91 = !DILocation(line: 79, column: 13, scope: !86)
!92 = !DILocation(line: 79, column: 28, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 79, column: 27)
!94 = !DILocalVariable(name: "source", scope: !95, file: !15, line: 82, type: !36)
!95 = distinct !DILexicalBlock(scope: !75, file: !15, line: 81, column: 5)
!96 = !DILocation(line: 82, column: 14, scope: !95)
!97 = !DILocation(line: 84, column: 16, scope: !95)
!98 = !DILocation(line: 84, column: 22, scope: !95)
!99 = !DILocation(line: 84, column: 9, scope: !95)
!100 = !DILocation(line: 85, column: 19, scope: !95)
!101 = !DILocation(line: 85, column: 9, scope: !95)
!102 = !DILocation(line: 86, column: 14, scope: !95)
!103 = !DILocation(line: 86, column: 9, scope: !95)
!104 = !DILocation(line: 88, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 35, type: !72, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 37, column: 5, scope: !105)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !16, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 93, type: !4)
!109 = !DILocation(line: 93, column: 12, scope: !107)
!110 = !DILocation(line: 94, column: 10, scope: !107)
!111 = !DILocation(line: 95, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 95, column: 8)
!113 = !DILocation(line: 95, column: 8, scope: !107)
!114 = !DILocation(line: 98, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 96, column: 5)
!116 = !DILocation(line: 98, column: 14, scope: !115)
!117 = !DILocation(line: 99, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !15, line: 99, column: 13)
!119 = !DILocation(line: 99, column: 18, scope: !118)
!120 = !DILocation(line: 99, column: 13, scope: !115)
!121 = !DILocation(line: 99, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 99, column: 27)
!123 = !DILocation(line: 100, column: 5, scope: !115)
!124 = !DILocalVariable(name: "source", scope: !125, file: !15, line: 102, type: !36)
!125 = distinct !DILexicalBlock(scope: !107, file: !15, line: 101, column: 5)
!126 = !DILocation(line: 102, column: 14, scope: !125)
!127 = !DILocation(line: 104, column: 16, scope: !125)
!128 = !DILocation(line: 104, column: 22, scope: !125)
!129 = !DILocation(line: 104, column: 9, scope: !125)
!130 = !DILocation(line: 105, column: 19, scope: !125)
!131 = !DILocation(line: 105, column: 9, scope: !125)
!132 = !DILocation(line: 106, column: 14, scope: !125)
!133 = !DILocation(line: 106, column: 9, scope: !125)
!134 = !DILocation(line: 108, column: 1, scope: !107)
