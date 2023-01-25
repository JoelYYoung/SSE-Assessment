; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11_bad() #0 !dbg !14 {
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
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call1, 0, !dbg !28
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !30

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %call4 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %5), !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %6) #6, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrue(...) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !77
  store i8* %call, i8** %data, align 8, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %cmp = icmp eq i8* %0, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call1, 0, !dbg !85
  br i1 %tobool, label %if.then2, label %if.else, !dbg !87

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end3, !dbg !90

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  %call4 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %5), !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* %6) #6, !dbg !105
  ret void, !dbg !106
}

declare dso_local i32 @globalReturnsFalse(...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !118
  %tobool = icmp ne i32 %call1, 0, !dbg !118
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !120

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !123
  %2 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end3, !dbg !126

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !130
  %4 = load i8*, i8** %data, align 8, !dbg !131
  %call4 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !132
  %5 = load i8*, i8** %data, align 8, !dbg !133
  call void @printLine(i8* %5), !dbg !134
  %6 = load i8*, i8** %data, align 8, !dbg !135
  call void @free(i8* %6) #6, !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 8, scope: !14)
!31 = !DILocation(line: 31, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 14, scope: !38)
!43 = !DILocation(line: 37, column: 16, scope: !38)
!44 = !DILocation(line: 37, column: 22, scope: !38)
!45 = !DILocation(line: 37, column: 9, scope: !38)
!46 = !DILocation(line: 38, column: 19, scope: !38)
!47 = !DILocation(line: 38, column: 9, scope: !38)
!48 = !DILocation(line: 39, column: 14, scope: !38)
!49 = !DILocation(line: 39, column: 9, scope: !38)
!50 = !DILocation(line: 41, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_11_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 96, column: 5, scope: !51)
!53 = !DILocation(line: 97, column: 5, scope: !51)
!54 = !DILocation(line: 98, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !56, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 110, type: !58)
!61 = !DILocation(line: 110, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 110, type: !59)
!63 = !DILocation(line: 110, column: 27, scope: !55)
!64 = !DILocation(line: 113, column: 22, scope: !55)
!65 = !DILocation(line: 113, column: 12, scope: !55)
!66 = !DILocation(line: 113, column: 5, scope: !55)
!67 = !DILocation(line: 115, column: 5, scope: !55)
!68 = !DILocation(line: 116, column: 5, scope: !55)
!69 = !DILocation(line: 117, column: 5, scope: !55)
!70 = !DILocation(line: 120, column: 5, scope: !55)
!71 = !DILocation(line: 121, column: 5, scope: !55)
!72 = !DILocation(line: 122, column: 5, scope: !55)
!73 = !DILocation(line: 124, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 50, type: !4)
!76 = !DILocation(line: 50, column: 12, scope: !74)
!77 = !DILocation(line: 51, column: 20, scope: !74)
!78 = !DILocation(line: 51, column: 10, scope: !74)
!79 = !DILocation(line: 52, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !15, line: 52, column: 9)
!81 = !DILocation(line: 52, column: 14, scope: !80)
!82 = !DILocation(line: 52, column: 9, scope: !74)
!83 = !DILocation(line: 52, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 52, column: 23)
!85 = !DILocation(line: 53, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !74, file: !15, line: 53, column: 8)
!87 = !DILocation(line: 53, column: 8, scope: !74)
!88 = !DILocation(line: 56, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 54, column: 5)
!90 = !DILocation(line: 57, column: 5, scope: !89)
!91 = !DILocation(line: 61, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !15, line: 59, column: 5)
!93 = !DILocation(line: 61, column: 9, scope: !92)
!94 = !DILocation(line: 62, column: 9, scope: !92)
!95 = !DILocation(line: 62, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !15, line: 65, type: !39)
!97 = distinct !DILexicalBlock(scope: !74, file: !15, line: 64, column: 5)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocation(line: 67, column: 16, scope: !97)
!100 = !DILocation(line: 67, column: 22, scope: !97)
!101 = !DILocation(line: 67, column: 9, scope: !97)
!102 = !DILocation(line: 68, column: 19, scope: !97)
!103 = !DILocation(line: 68, column: 9, scope: !97)
!104 = !DILocation(line: 69, column: 14, scope: !97)
!105 = !DILocation(line: 69, column: 9, scope: !97)
!106 = !DILocation(line: 71, column: 1, scope: !74)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 76, type: !4)
!109 = !DILocation(line: 76, column: 12, scope: !107)
!110 = !DILocation(line: 77, column: 20, scope: !107)
!111 = !DILocation(line: 77, column: 10, scope: !107)
!112 = !DILocation(line: 78, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !15, line: 78, column: 9)
!114 = !DILocation(line: 78, column: 14, scope: !113)
!115 = !DILocation(line: 78, column: 9, scope: !107)
!116 = !DILocation(line: 78, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 78, column: 23)
!118 = !DILocation(line: 79, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !15, line: 79, column: 8)
!120 = !DILocation(line: 79, column: 8, scope: !107)
!121 = !DILocation(line: 82, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !15, line: 80, column: 5)
!123 = !DILocation(line: 82, column: 9, scope: !122)
!124 = !DILocation(line: 83, column: 9, scope: !122)
!125 = !DILocation(line: 83, column: 20, scope: !122)
!126 = !DILocation(line: 84, column: 5, scope: !122)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !15, line: 86, type: !39)
!128 = distinct !DILexicalBlock(scope: !107, file: !15, line: 85, column: 5)
!129 = !DILocation(line: 86, column: 14, scope: !128)
!130 = !DILocation(line: 88, column: 16, scope: !128)
!131 = !DILocation(line: 88, column: 22, scope: !128)
!132 = !DILocation(line: 88, column: 9, scope: !128)
!133 = !DILocation(line: 89, column: 19, scope: !128)
!134 = !DILocation(line: 89, column: 9, scope: !128)
!135 = !DILocation(line: 90, column: 14, scope: !128)
!136 = !DILocation(line: 90, column: 9, scope: !128)
!137 = !DILocation(line: 92, column: 1, scope: !107)
