; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02_bad() #0 !dbg !14 {
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
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %5), !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  call void @free(i8* %6) #6, !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02_good() #0 !dbg !48 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02_bad(), !dbg !68
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
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %5), !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* %6) #6, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !102
  store i8* %call, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #6, !dbg !121
  %5 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %5), !dbg !123
  %6 = load i8*, i8** %data, align 8, !dbg !124
  call void @free(i8* %6) #6, !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02.c", directory: "/root/SSE-Assessment")
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
!28 = !DILocation(line: 31, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 5)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!31 = !DILocation(line: 31, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 9, scope: !29)
!33 = !DILocation(line: 32, column: 21, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 16, scope: !35)
!41 = !DILocation(line: 37, column: 22, scope: !35)
!42 = !DILocation(line: 37, column: 9, scope: !35)
!43 = !DILocation(line: 38, column: 19, scope: !35)
!44 = !DILocation(line: 38, column: 9, scope: !35)
!45 = !DILocation(line: 39, column: 14, scope: !35)
!46 = !DILocation(line: 39, column: 9, scope: !35)
!47 = !DILocation(line: 41, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_02_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 96, column: 5, scope: !48)
!50 = !DILocation(line: 97, column: 5, scope: !48)
!51 = !DILocation(line: 98, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !53, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 110, type: !55)
!58 = !DILocation(line: 110, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 110, type: !56)
!60 = !DILocation(line: 110, column: 27, scope: !52)
!61 = !DILocation(line: 113, column: 22, scope: !52)
!62 = !DILocation(line: 113, column: 12, scope: !52)
!63 = !DILocation(line: 113, column: 5, scope: !52)
!64 = !DILocation(line: 115, column: 5, scope: !52)
!65 = !DILocation(line: 116, column: 5, scope: !52)
!66 = !DILocation(line: 117, column: 5, scope: !52)
!67 = !DILocation(line: 120, column: 5, scope: !52)
!68 = !DILocation(line: 121, column: 5, scope: !52)
!69 = !DILocation(line: 122, column: 5, scope: !52)
!70 = !DILocation(line: 124, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !15, line: 50, type: !4)
!73 = !DILocation(line: 50, column: 12, scope: !71)
!74 = !DILocation(line: 51, column: 20, scope: !71)
!75 = !DILocation(line: 51, column: 10, scope: !71)
!76 = !DILocation(line: 52, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !15, line: 52, column: 9)
!78 = !DILocation(line: 52, column: 14, scope: !77)
!79 = !DILocation(line: 52, column: 9, scope: !71)
!80 = !DILocation(line: 52, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 52, column: 23)
!82 = !DILocation(line: 61, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !15, line: 59, column: 5)
!84 = distinct !DILexicalBlock(scope: !71, file: !15, line: 53, column: 8)
!85 = !DILocation(line: 61, column: 9, scope: !83)
!86 = !DILocation(line: 62, column: 9, scope: !83)
!87 = !DILocation(line: 62, column: 20, scope: !83)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !15, line: 65, type: !36)
!89 = distinct !DILexicalBlock(scope: !71, file: !15, line: 64, column: 5)
!90 = !DILocation(line: 65, column: 14, scope: !89)
!91 = !DILocation(line: 67, column: 16, scope: !89)
!92 = !DILocation(line: 67, column: 22, scope: !89)
!93 = !DILocation(line: 67, column: 9, scope: !89)
!94 = !DILocation(line: 68, column: 19, scope: !89)
!95 = !DILocation(line: 68, column: 9, scope: !89)
!96 = !DILocation(line: 69, column: 14, scope: !89)
!97 = !DILocation(line: 69, column: 9, scope: !89)
!98 = !DILocation(line: 71, column: 1, scope: !71)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 76, type: !4)
!101 = !DILocation(line: 76, column: 12, scope: !99)
!102 = !DILocation(line: 77, column: 20, scope: !99)
!103 = !DILocation(line: 77, column: 10, scope: !99)
!104 = !DILocation(line: 78, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 78, column: 9)
!106 = !DILocation(line: 78, column: 14, scope: !105)
!107 = !DILocation(line: 78, column: 9, scope: !99)
!108 = !DILocation(line: 78, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 78, column: 23)
!110 = !DILocation(line: 82, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !15, line: 80, column: 5)
!112 = distinct !DILexicalBlock(scope: !99, file: !15, line: 79, column: 8)
!113 = !DILocation(line: 82, column: 9, scope: !111)
!114 = !DILocation(line: 83, column: 9, scope: !111)
!115 = !DILocation(line: 83, column: 20, scope: !111)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !15, line: 86, type: !36)
!117 = distinct !DILexicalBlock(scope: !99, file: !15, line: 85, column: 5)
!118 = !DILocation(line: 86, column: 14, scope: !117)
!119 = !DILocation(line: 88, column: 16, scope: !117)
!120 = !DILocation(line: 88, column: 22, scope: !117)
!121 = !DILocation(line: 88, column: 9, scope: !117)
!122 = !DILocation(line: 89, column: 19, scope: !117)
!123 = !DILocation(line: 89, column: 9, scope: !117)
!124 = !DILocation(line: 90, column: 14, scope: !117)
!125 = !DILocation(line: 90, column: 9, scope: !117)
!126 = !DILocation(line: 92, column: 1, scope: !99)
