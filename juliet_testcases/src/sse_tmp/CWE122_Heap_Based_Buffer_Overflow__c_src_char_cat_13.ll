; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13_bad() #0 !dbg !14 {
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
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp1 = icmp eq i32 %1, 5, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !31

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call4 = call i8* @strcat(i8* %arraydecay, i8* %5) #6, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %6), !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* %7) #6, !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !86
  %cmp1 = icmp ne i32 %1, 5, !dbg !88
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !89

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end3, !dbg !92

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %call4 = call i8* @strcat(i8* %arraydecay, i8* %5) #6, !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %6), !dbg !105
  %7 = load i8*, i8** %data, align 8, !dbg !106
  call void @free(i8* %7) #6, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !112
  store i8* %call, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !120
  %cmp1 = icmp eq i32 %1, 5, !dbg !122
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !123

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !132
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !133
  %5 = load i8*, i8** %data, align 8, !dbg !134
  %call4 = call i8* @strcat(i8* %arraydecay, i8* %5) #6, !dbg !135
  %6 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %6), !dbg !137
  %7 = load i8*, i8** %data, align 8, !dbg !138
  call void @free(i8* %7) #6, !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13.c", directory: "/root/SSE-Assessment")
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
!30 = !DILocation(line: 28, column: 25, scope: !29)
!31 = !DILocation(line: 28, column: 8, scope: !14)
!32 = !DILocation(line: 31, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 9, scope: !33)
!36 = !DILocation(line: 32, column: 21, scope: !33)
!37 = !DILocation(line: 33, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 14, scope: !39)
!44 = !DILocation(line: 37, column: 16, scope: !39)
!45 = !DILocation(line: 37, column: 22, scope: !39)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 38, column: 19, scope: !39)
!48 = !DILocation(line: 38, column: 9, scope: !39)
!49 = !DILocation(line: 39, column: 14, scope: !39)
!50 = !DILocation(line: 39, column: 9, scope: !39)
!51 = !DILocation(line: 41, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_13_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 96, column: 5, scope: !52)
!54 = !DILocation(line: 97, column: 5, scope: !52)
!55 = !DILocation(line: 98, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !57, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 110, type: !59)
!62 = !DILocation(line: 110, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 110, type: !60)
!64 = !DILocation(line: 110, column: 27, scope: !56)
!65 = !DILocation(line: 113, column: 22, scope: !56)
!66 = !DILocation(line: 113, column: 12, scope: !56)
!67 = !DILocation(line: 113, column: 5, scope: !56)
!68 = !DILocation(line: 115, column: 5, scope: !56)
!69 = !DILocation(line: 116, column: 5, scope: !56)
!70 = !DILocation(line: 117, column: 5, scope: !56)
!71 = !DILocation(line: 120, column: 5, scope: !56)
!72 = !DILocation(line: 121, column: 5, scope: !56)
!73 = !DILocation(line: 122, column: 5, scope: !56)
!74 = !DILocation(line: 124, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 50, type: !4)
!77 = !DILocation(line: 50, column: 12, scope: !75)
!78 = !DILocation(line: 51, column: 20, scope: !75)
!79 = !DILocation(line: 51, column: 10, scope: !75)
!80 = !DILocation(line: 52, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 52, column: 9)
!82 = !DILocation(line: 52, column: 14, scope: !81)
!83 = !DILocation(line: 52, column: 9, scope: !75)
!84 = !DILocation(line: 52, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 52, column: 23)
!86 = !DILocation(line: 53, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !15, line: 53, column: 8)
!88 = !DILocation(line: 53, column: 25, scope: !87)
!89 = !DILocation(line: 53, column: 8, scope: !75)
!90 = !DILocation(line: 56, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 54, column: 5)
!92 = !DILocation(line: 57, column: 5, scope: !91)
!93 = !DILocation(line: 61, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 59, column: 5)
!95 = !DILocation(line: 61, column: 9, scope: !94)
!96 = !DILocation(line: 62, column: 9, scope: !94)
!97 = !DILocation(line: 62, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !15, line: 65, type: !40)
!99 = distinct !DILexicalBlock(scope: !75, file: !15, line: 64, column: 5)
!100 = !DILocation(line: 65, column: 14, scope: !99)
!101 = !DILocation(line: 67, column: 16, scope: !99)
!102 = !DILocation(line: 67, column: 22, scope: !99)
!103 = !DILocation(line: 67, column: 9, scope: !99)
!104 = !DILocation(line: 68, column: 19, scope: !99)
!105 = !DILocation(line: 68, column: 9, scope: !99)
!106 = !DILocation(line: 69, column: 14, scope: !99)
!107 = !DILocation(line: 69, column: 9, scope: !99)
!108 = !DILocation(line: 71, column: 1, scope: !75)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 76, type: !4)
!111 = !DILocation(line: 76, column: 12, scope: !109)
!112 = !DILocation(line: 77, column: 20, scope: !109)
!113 = !DILocation(line: 77, column: 10, scope: !109)
!114 = !DILocation(line: 78, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !15, line: 78, column: 9)
!116 = !DILocation(line: 78, column: 14, scope: !115)
!117 = !DILocation(line: 78, column: 9, scope: !109)
!118 = !DILocation(line: 78, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 78, column: 23)
!120 = !DILocation(line: 79, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !15, line: 79, column: 8)
!122 = !DILocation(line: 79, column: 25, scope: !121)
!123 = !DILocation(line: 79, column: 8, scope: !109)
!124 = !DILocation(line: 82, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 80, column: 5)
!126 = !DILocation(line: 82, column: 9, scope: !125)
!127 = !DILocation(line: 83, column: 9, scope: !125)
!128 = !DILocation(line: 83, column: 20, scope: !125)
!129 = !DILocation(line: 84, column: 5, scope: !125)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !15, line: 86, type: !40)
!131 = distinct !DILexicalBlock(scope: !109, file: !15, line: 85, column: 5)
!132 = !DILocation(line: 86, column: 14, scope: !131)
!133 = !DILocation(line: 88, column: 16, scope: !131)
!134 = !DILocation(line: 88, column: 22, scope: !131)
!135 = !DILocation(line: 88, column: 9, scope: !131)
!136 = !DILocation(line: 89, column: 19, scope: !131)
!137 = !DILocation(line: 89, column: 9, scope: !131)
!138 = !DILocation(line: 90, column: 14, scope: !131)
!139 = !DILocation(line: 90, column: 9, scope: !131)
!140 = !DILocation(line: 92, column: 1, scope: !109)
