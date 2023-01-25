; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14_bad() #0 !dbg !14 {
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
  %1 = load i32, i32* @globalFive, align 4, !dbg !28
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
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %call4 = call i64 @strlen(i8* %6) #9, !dbg !47
  %call5 = call i8* @strncat(i8* %arraydecay, i8* %5, i64 %call4) #7, !dbg !48
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx6, align 1, !dbg !50
  %7 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %7), !dbg !52
  %8 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %8) #7, !dbg !54
  ret void, !dbg !55
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !90
  %cmp1 = icmp ne i32 %1, 5, !dbg !92
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  %call4 = call i64 @strlen(i8* %6) #9, !dbg !108
  %call5 = call i8* @strncat(i8* %arraydecay, i8* %5, i64 %call4) #7, !dbg !109
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !110
  store i8 0, i8* %arrayidx6, align 1, !dbg !111
  %7 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* %7), !dbg !113
  %8 = load i8*, i8** %data, align 8, !dbg !114
  call void @free(i8* %8) #7, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !120
  store i8* %call, i8** %data, align 8, !dbg !121
  %0 = load i8*, i8** %data, align 8, !dbg !122
  %cmp = icmp eq i8* %0, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !128
  %cmp1 = icmp eq i32 %1, 5, !dbg !130
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !131

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !134
  %3 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  br label %if.end3, !dbg !137

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !140
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !141
  %5 = load i8*, i8** %data, align 8, !dbg !142
  %6 = load i8*, i8** %data, align 8, !dbg !143
  %call4 = call i64 @strlen(i8* %6) #9, !dbg !144
  %call5 = call i8* @strncat(i8* %arraydecay, i8* %5, i64 %call4) #7, !dbg !145
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !146
  store i8 0, i8* %arrayidx6, align 1, !dbg !147
  %7 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %7), !dbg !149
  %8 = load i8*, i8** %data, align 8, !dbg !150
  call void @free(i8* %8) #7, !dbg !151
  ret void, !dbg !152
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 28, column: 18, scope: !29)
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
!44 = !DILocation(line: 37, column: 17, scope: !39)
!45 = !DILocation(line: 37, column: 23, scope: !39)
!46 = !DILocation(line: 37, column: 36, scope: !39)
!47 = !DILocation(line: 37, column: 29, scope: !39)
!48 = !DILocation(line: 37, column: 9, scope: !39)
!49 = !DILocation(line: 38, column: 9, scope: !39)
!50 = !DILocation(line: 38, column: 20, scope: !39)
!51 = !DILocation(line: 39, column: 19, scope: !39)
!52 = !DILocation(line: 39, column: 9, scope: !39)
!53 = !DILocation(line: 40, column: 14, scope: !39)
!54 = !DILocation(line: 40, column: 9, scope: !39)
!55 = !DILocation(line: 42, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_14_good", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 99, column: 5, scope: !56)
!58 = !DILocation(line: 100, column: 5, scope: !56)
!59 = !DILocation(line: 101, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !61, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 113, type: !63)
!66 = !DILocation(line: 113, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 113, type: !64)
!68 = !DILocation(line: 113, column: 27, scope: !60)
!69 = !DILocation(line: 116, column: 22, scope: !60)
!70 = !DILocation(line: 116, column: 12, scope: !60)
!71 = !DILocation(line: 116, column: 5, scope: !60)
!72 = !DILocation(line: 118, column: 5, scope: !60)
!73 = !DILocation(line: 119, column: 5, scope: !60)
!74 = !DILocation(line: 120, column: 5, scope: !60)
!75 = !DILocation(line: 123, column: 5, scope: !60)
!76 = !DILocation(line: 124, column: 5, scope: !60)
!77 = !DILocation(line: 125, column: 5, scope: !60)
!78 = !DILocation(line: 127, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 51, type: !4)
!81 = !DILocation(line: 51, column: 12, scope: !79)
!82 = !DILocation(line: 52, column: 20, scope: !79)
!83 = !DILocation(line: 52, column: 10, scope: !79)
!84 = !DILocation(line: 53, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !15, line: 53, column: 9)
!86 = !DILocation(line: 53, column: 14, scope: !85)
!87 = !DILocation(line: 53, column: 9, scope: !79)
!88 = !DILocation(line: 53, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 53, column: 23)
!90 = !DILocation(line: 54, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !15, line: 54, column: 8)
!92 = !DILocation(line: 54, column: 18, scope: !91)
!93 = !DILocation(line: 54, column: 8, scope: !79)
!94 = !DILocation(line: 57, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 55, column: 5)
!96 = !DILocation(line: 58, column: 5, scope: !95)
!97 = !DILocation(line: 62, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !15, line: 60, column: 5)
!99 = !DILocation(line: 62, column: 9, scope: !98)
!100 = !DILocation(line: 63, column: 9, scope: !98)
!101 = !DILocation(line: 63, column: 20, scope: !98)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !15, line: 66, type: !40)
!103 = distinct !DILexicalBlock(scope: !79, file: !15, line: 65, column: 5)
!104 = !DILocation(line: 66, column: 14, scope: !103)
!105 = !DILocation(line: 68, column: 17, scope: !103)
!106 = !DILocation(line: 68, column: 23, scope: !103)
!107 = !DILocation(line: 68, column: 36, scope: !103)
!108 = !DILocation(line: 68, column: 29, scope: !103)
!109 = !DILocation(line: 68, column: 9, scope: !103)
!110 = !DILocation(line: 69, column: 9, scope: !103)
!111 = !DILocation(line: 69, column: 20, scope: !103)
!112 = !DILocation(line: 70, column: 19, scope: !103)
!113 = !DILocation(line: 70, column: 9, scope: !103)
!114 = !DILocation(line: 71, column: 14, scope: !103)
!115 = !DILocation(line: 71, column: 9, scope: !103)
!116 = !DILocation(line: 73, column: 1, scope: !79)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 78, type: !4)
!119 = !DILocation(line: 78, column: 12, scope: !117)
!120 = !DILocation(line: 79, column: 20, scope: !117)
!121 = !DILocation(line: 79, column: 10, scope: !117)
!122 = !DILocation(line: 80, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !15, line: 80, column: 9)
!124 = !DILocation(line: 80, column: 14, scope: !123)
!125 = !DILocation(line: 80, column: 9, scope: !117)
!126 = !DILocation(line: 80, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 80, column: 23)
!128 = !DILocation(line: 81, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !15, line: 81, column: 8)
!130 = !DILocation(line: 81, column: 18, scope: !129)
!131 = !DILocation(line: 81, column: 8, scope: !117)
!132 = !DILocation(line: 84, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 82, column: 5)
!134 = !DILocation(line: 84, column: 9, scope: !133)
!135 = !DILocation(line: 85, column: 9, scope: !133)
!136 = !DILocation(line: 85, column: 20, scope: !133)
!137 = !DILocation(line: 86, column: 5, scope: !133)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !15, line: 88, type: !40)
!139 = distinct !DILexicalBlock(scope: !117, file: !15, line: 87, column: 5)
!140 = !DILocation(line: 88, column: 14, scope: !139)
!141 = !DILocation(line: 90, column: 17, scope: !139)
!142 = !DILocation(line: 90, column: 23, scope: !139)
!143 = !DILocation(line: 90, column: 36, scope: !139)
!144 = !DILocation(line: 90, column: 29, scope: !139)
!145 = !DILocation(line: 90, column: 9, scope: !139)
!146 = !DILocation(line: 91, column: 9, scope: !139)
!147 = !DILocation(line: 91, column: 20, scope: !139)
!148 = !DILocation(line: 92, column: 19, scope: !139)
!149 = !DILocation(line: 92, column: 9, scope: !139)
!150 = !DILocation(line: 93, column: 14, scope: !139)
!151 = !DILocation(line: 93, column: 9, scope: !139)
!152 = !DILocation(line: 95, column: 1, scope: !117)
