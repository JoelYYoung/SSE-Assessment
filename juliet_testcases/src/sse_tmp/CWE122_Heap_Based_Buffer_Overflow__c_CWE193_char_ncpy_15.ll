; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call2 = call i64 @strlen(i8* %arraydecay1) #9, !dbg !38
  %add = add i64 %call2, 1, !dbg !39
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %3), !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* %4) #7, !dbg !44
  ret void, !dbg !45
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_good() #0 !dbg !46 {
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
  %call = call i64 @time(i64* null) #7, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #7, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_bad(), !dbg !66
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
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i8* null, i8** %data, align 8, !dbg !72
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !73
  store i8* %call, i8** %data, align 8, !dbg !74
  %0 = load i8*, i8** %data, align 8, !dbg !75
  %cmp = icmp eq i8* %0, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !85
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !86
  %call2 = call i64 @strlen(i8* %arraydecay1) #9, !dbg !87
  %add = add i64 %call2, 1, !dbg !88
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* %3), !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  call void @free(i8* %4) #7, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i8* null, i8** %data, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !99
  store i8* %call, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %cmp = icmp eq i8* %0, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %call2 = call i64 @strlen(i8* %arraydecay1) #9, !dbg !113
  %add = add i64 %call2, 1, !dbg !114
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 24, scope: !14)
!22 = !DILocation(line: 36, column: 14, scope: !14)
!23 = !DILocation(line: 37, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 13)
!25 = !DILocation(line: 37, column: 18, scope: !24)
!26 = !DILocation(line: 37, column: 13, scope: !14)
!27 = !DILocation(line: 37, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 37, column: 27)
!29 = !DILocalVariable(name: "source", scope: !30, file: !15, line: 45, type: !31)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 45, column: 14, scope: !30)
!35 = !DILocation(line: 48, column: 17, scope: !30)
!36 = !DILocation(line: 48, column: 23, scope: !30)
!37 = !DILocation(line: 48, column: 38, scope: !30)
!38 = !DILocation(line: 48, column: 31, scope: !30)
!39 = !DILocation(line: 48, column: 46, scope: !30)
!40 = !DILocation(line: 48, column: 9, scope: !30)
!41 = !DILocation(line: 49, column: 19, scope: !30)
!42 = !DILocation(line: 49, column: 9, scope: !30)
!43 = !DILocation(line: 50, column: 14, scope: !30)
!44 = !DILocation(line: 50, column: 9, scope: !30)
!45 = !DILocation(line: 52, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_15_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 114, column: 5, scope: !46)
!48 = !DILocation(line: 115, column: 5, scope: !46)
!49 = !DILocation(line: 116, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 128, type: !51, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !15, line: 128, type: !53)
!56 = !DILocation(line: 128, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !15, line: 128, type: !54)
!58 = !DILocation(line: 128, column: 27, scope: !50)
!59 = !DILocation(line: 131, column: 22, scope: !50)
!60 = !DILocation(line: 131, column: 12, scope: !50)
!61 = !DILocation(line: 131, column: 5, scope: !50)
!62 = !DILocation(line: 133, column: 5, scope: !50)
!63 = !DILocation(line: 134, column: 5, scope: !50)
!64 = !DILocation(line: 135, column: 5, scope: !50)
!65 = !DILocation(line: 138, column: 5, scope: !50)
!66 = !DILocation(line: 139, column: 5, scope: !50)
!67 = !DILocation(line: 140, column: 5, scope: !50)
!68 = !DILocation(line: 142, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 61, type: !4)
!71 = !DILocation(line: 61, column: 12, scope: !69)
!72 = !DILocation(line: 62, column: 10, scope: !69)
!73 = !DILocation(line: 71, column: 24, scope: !69)
!74 = !DILocation(line: 71, column: 14, scope: !69)
!75 = !DILocation(line: 72, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !15, line: 72, column: 13)
!77 = !DILocation(line: 72, column: 18, scope: !76)
!78 = !DILocation(line: 72, column: 13, scope: !69)
!79 = !DILocation(line: 72, column: 28, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 72, column: 27)
!81 = !DILocalVariable(name: "source", scope: !82, file: !15, line: 76, type: !31)
!82 = distinct !DILexicalBlock(scope: !69, file: !15, line: 75, column: 5)
!83 = !DILocation(line: 76, column: 14, scope: !82)
!84 = !DILocation(line: 79, column: 17, scope: !82)
!85 = !DILocation(line: 79, column: 23, scope: !82)
!86 = !DILocation(line: 79, column: 38, scope: !82)
!87 = !DILocation(line: 79, column: 31, scope: !82)
!88 = !DILocation(line: 79, column: 46, scope: !82)
!89 = !DILocation(line: 79, column: 9, scope: !82)
!90 = !DILocation(line: 80, column: 19, scope: !82)
!91 = !DILocation(line: 80, column: 9, scope: !82)
!92 = !DILocation(line: 81, column: 14, scope: !82)
!93 = !DILocation(line: 81, column: 9, scope: !82)
!94 = !DILocation(line: 83, column: 1, scope: !69)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 88, type: !4)
!97 = !DILocation(line: 88, column: 12, scope: !95)
!98 = !DILocation(line: 89, column: 10, scope: !95)
!99 = !DILocation(line: 94, column: 24, scope: !95)
!100 = !DILocation(line: 94, column: 14, scope: !95)
!101 = !DILocation(line: 95, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !15, line: 95, column: 13)
!103 = !DILocation(line: 95, column: 18, scope: !102)
!104 = !DILocation(line: 95, column: 13, scope: !95)
!105 = !DILocation(line: 95, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 95, column: 27)
!107 = !DILocalVariable(name: "source", scope: !108, file: !15, line: 103, type: !31)
!108 = distinct !DILexicalBlock(scope: !95, file: !15, line: 102, column: 5)
!109 = !DILocation(line: 103, column: 14, scope: !108)
!110 = !DILocation(line: 106, column: 17, scope: !108)
!111 = !DILocation(line: 106, column: 23, scope: !108)
!112 = !DILocation(line: 106, column: 38, scope: !108)
!113 = !DILocation(line: 106, column: 31, scope: !108)
!114 = !DILocation(line: 106, column: 46, scope: !108)
!115 = !DILocation(line: 106, column: 9, scope: !108)
!116 = !DILocation(line: 107, column: 19, scope: !108)
!117 = !DILocation(line: 107, column: 9, scope: !108)
!118 = !DILocation(line: 108, column: 14, scope: !108)
!119 = !DILocation(line: 108, column: 9, scope: !108)
!120 = !DILocation(line: 110, column: 1, scope: !95)
