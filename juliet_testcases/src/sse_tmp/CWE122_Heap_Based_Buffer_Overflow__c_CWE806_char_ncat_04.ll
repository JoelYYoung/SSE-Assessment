; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
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
  %5 = load i8*, i8** %data, align 8, !dbg !42
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !43
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !44
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %6), !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* %7) #7, !dbg !50
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
declare dso_local i8* @strncat(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04_good() #0 !dbg !52 {
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
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04_bad(), !dbg !72
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
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !97
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !98
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !99
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !100
  store i8 0, i8* %arrayidx3, align 1, !dbg !101
  %6 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %6), !dbg !103
  %7 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* %7) #7, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !121
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !127
  %4 = load i8*, i8** %data, align 8, !dbg !128
  %5 = load i8*, i8** %data, align 8, !dbg !129
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !130
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !131
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !132
  store i8 0, i8* %arrayidx3, align 1, !dbg !133
  %6 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %6), !dbg !135
  %7 = load i8*, i8** %data, align 8, !dbg !136
  call void @free(i8* %7) #7, !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !4)
!19 = !DILocation(line: 32, column: 12, scope: !14)
!20 = !DILocation(line: 33, column: 20, scope: !14)
!21 = !DILocation(line: 33, column: 10, scope: !14)
!22 = !DILocation(line: 34, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!24 = !DILocation(line: 34, column: 14, scope: !23)
!25 = !DILocation(line: 34, column: 9, scope: !14)
!26 = !DILocation(line: 34, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 34, column: 23)
!28 = !DILocation(line: 38, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 36, column: 5)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 8)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 39, column: 9, scope: !29)
!33 = !DILocation(line: 39, column: 21, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 42, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 42, column: 14, scope: !35)
!40 = !DILocation(line: 44, column: 17, scope: !35)
!41 = !DILocation(line: 44, column: 23, scope: !35)
!42 = !DILocation(line: 44, column: 36, scope: !35)
!43 = !DILocation(line: 44, column: 29, scope: !35)
!44 = !DILocation(line: 44, column: 9, scope: !35)
!45 = !DILocation(line: 45, column: 9, scope: !35)
!46 = !DILocation(line: 45, column: 20, scope: !35)
!47 = !DILocation(line: 46, column: 19, scope: !35)
!48 = !DILocation(line: 46, column: 9, scope: !35)
!49 = !DILocation(line: 47, column: 14, scope: !35)
!50 = !DILocation(line: 47, column: 9, scope: !35)
!51 = !DILocation(line: 49, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_04_good", scope: !15, file: !15, line: 104, type: !16, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 106, column: 5, scope: !52)
!54 = !DILocation(line: 107, column: 5, scope: !52)
!55 = !DILocation(line: 108, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 120, type: !57, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 120, type: !59)
!62 = !DILocation(line: 120, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 120, type: !60)
!64 = !DILocation(line: 120, column: 27, scope: !56)
!65 = !DILocation(line: 123, column: 22, scope: !56)
!66 = !DILocation(line: 123, column: 12, scope: !56)
!67 = !DILocation(line: 123, column: 5, scope: !56)
!68 = !DILocation(line: 125, column: 5, scope: !56)
!69 = !DILocation(line: 126, column: 5, scope: !56)
!70 = !DILocation(line: 127, column: 5, scope: !56)
!71 = !DILocation(line: 130, column: 5, scope: !56)
!72 = !DILocation(line: 131, column: 5, scope: !56)
!73 = !DILocation(line: 132, column: 5, scope: !56)
!74 = !DILocation(line: 134, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 58, type: !4)
!77 = !DILocation(line: 58, column: 12, scope: !75)
!78 = !DILocation(line: 59, column: 20, scope: !75)
!79 = !DILocation(line: 59, column: 10, scope: !75)
!80 = !DILocation(line: 60, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 60, column: 9)
!82 = !DILocation(line: 60, column: 14, scope: !81)
!83 = !DILocation(line: 60, column: 9, scope: !75)
!84 = !DILocation(line: 60, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 60, column: 23)
!86 = !DILocation(line: 69, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !15, line: 67, column: 5)
!88 = distinct !DILexicalBlock(scope: !75, file: !15, line: 61, column: 8)
!89 = !DILocation(line: 69, column: 9, scope: !87)
!90 = !DILocation(line: 70, column: 9, scope: !87)
!91 = !DILocation(line: 70, column: 20, scope: !87)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !15, line: 73, type: !36)
!93 = distinct !DILexicalBlock(scope: !75, file: !15, line: 72, column: 5)
!94 = !DILocation(line: 73, column: 14, scope: !93)
!95 = !DILocation(line: 75, column: 17, scope: !93)
!96 = !DILocation(line: 75, column: 23, scope: !93)
!97 = !DILocation(line: 75, column: 36, scope: !93)
!98 = !DILocation(line: 75, column: 29, scope: !93)
!99 = !DILocation(line: 75, column: 9, scope: !93)
!100 = !DILocation(line: 76, column: 9, scope: !93)
!101 = !DILocation(line: 76, column: 20, scope: !93)
!102 = !DILocation(line: 77, column: 19, scope: !93)
!103 = !DILocation(line: 77, column: 9, scope: !93)
!104 = !DILocation(line: 78, column: 14, scope: !93)
!105 = !DILocation(line: 78, column: 9, scope: !93)
!106 = !DILocation(line: 80, column: 1, scope: !75)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 85, type: !4)
!109 = !DILocation(line: 85, column: 12, scope: !107)
!110 = !DILocation(line: 86, column: 20, scope: !107)
!111 = !DILocation(line: 86, column: 10, scope: !107)
!112 = !DILocation(line: 87, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !15, line: 87, column: 9)
!114 = !DILocation(line: 87, column: 14, scope: !113)
!115 = !DILocation(line: 87, column: 9, scope: !107)
!116 = !DILocation(line: 87, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 87, column: 23)
!118 = !DILocation(line: 91, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !15, line: 89, column: 5)
!120 = distinct !DILexicalBlock(scope: !107, file: !15, line: 88, column: 8)
!121 = !DILocation(line: 91, column: 9, scope: !119)
!122 = !DILocation(line: 92, column: 9, scope: !119)
!123 = !DILocation(line: 92, column: 20, scope: !119)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !15, line: 95, type: !36)
!125 = distinct !DILexicalBlock(scope: !107, file: !15, line: 94, column: 5)
!126 = !DILocation(line: 95, column: 14, scope: !125)
!127 = !DILocation(line: 97, column: 17, scope: !125)
!128 = !DILocation(line: 97, column: 23, scope: !125)
!129 = !DILocation(line: 97, column: 36, scope: !125)
!130 = !DILocation(line: 97, column: 29, scope: !125)
!131 = !DILocation(line: 97, column: 9, scope: !125)
!132 = !DILocation(line: 98, column: 9, scope: !125)
!133 = !DILocation(line: 98, column: 20, scope: !125)
!134 = !DILocation(line: 99, column: 19, scope: !125)
!135 = !DILocation(line: 99, column: 9, scope: !125)
!136 = !DILocation(line: 100, column: 14, scope: !125)
!137 = !DILocation(line: 100, column: 9, scope: !125)
!138 = !DILocation(line: 102, column: 1, scope: !107)
