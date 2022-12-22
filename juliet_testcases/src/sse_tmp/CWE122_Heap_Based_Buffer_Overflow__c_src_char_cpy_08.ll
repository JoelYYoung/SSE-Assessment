; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08_bad() #0 !dbg !14 {
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !28
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
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* %4) #6, !dbg !45
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08_good() #0 !dbg !51 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call1, 0, !dbg !89
  br i1 %tobool, label %if.then2, label %if.else, !dbg !91

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end3, !dbg !94

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %4 = load i8*, i8** %data, align 8, !dbg !104
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* %4) #6, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %5), !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %6) #6, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !111 {
entry:
  ret i32 0, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !116
  store i8* %call, i8** %data, align 8, !dbg !117
  %0 = load i8*, i8** %data, align 8, !dbg !118
  %cmp = icmp eq i8* %0, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !124
  %tobool = icmp ne i32 %call1, 0, !dbg !124
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !126

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !129
  %2 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  br label %if.end3, !dbg !132

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !135
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !136
  %4 = load i8*, i8** %data, align 8, !dbg !137
  %call4 = call i8* @strcpy(i8* %arraydecay, i8* %4) #6, !dbg !138
  %5 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %5), !dbg !140
  %6 = load i8*, i8** %data, align 8, !dbg !141
  call void @free(i8* %6) #6, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 20, scope: !14)
!21 = !DILocation(line: 40, column: 10, scope: !14)
!22 = !DILocation(line: 41, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!24 = !DILocation(line: 41, column: 14, scope: !23)
!25 = !DILocation(line: 41, column: 9, scope: !14)
!26 = !DILocation(line: 41, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 41, column: 23)
!28 = !DILocation(line: 42, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!30 = !DILocation(line: 42, column: 8, scope: !14)
!31 = !DILocation(line: 45, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 43, column: 5)
!33 = !DILocation(line: 45, column: 9, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !32)
!35 = !DILocation(line: 46, column: 21, scope: !32)
!36 = !DILocation(line: 47, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 14, scope: !38)
!43 = !DILocation(line: 51, column: 16, scope: !38)
!44 = !DILocation(line: 51, column: 22, scope: !38)
!45 = !DILocation(line: 51, column: 9, scope: !38)
!46 = !DILocation(line: 52, column: 19, scope: !38)
!47 = !DILocation(line: 52, column: 9, scope: !38)
!48 = !DILocation(line: 53, column: 14, scope: !38)
!49 = !DILocation(line: 53, column: 9, scope: !38)
!50 = !DILocation(line: 55, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_08_good", scope: !15, file: !15, line: 108, type: !16, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 110, column: 5, scope: !51)
!53 = !DILocation(line: 111, column: 5, scope: !51)
!54 = !DILocation(line: 112, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 124, type: !56, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 124, type: !58)
!61 = !DILocation(line: 124, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 124, type: !59)
!63 = !DILocation(line: 124, column: 27, scope: !55)
!64 = !DILocation(line: 127, column: 22, scope: !55)
!65 = !DILocation(line: 127, column: 12, scope: !55)
!66 = !DILocation(line: 127, column: 5, scope: !55)
!67 = !DILocation(line: 129, column: 5, scope: !55)
!68 = !DILocation(line: 130, column: 5, scope: !55)
!69 = !DILocation(line: 131, column: 5, scope: !55)
!70 = !DILocation(line: 134, column: 5, scope: !55)
!71 = !DILocation(line: 135, column: 5, scope: !55)
!72 = !DILocation(line: 136, column: 5, scope: !55)
!73 = !DILocation(line: 138, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !75, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!58}
!77 = !DILocation(line: 27, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 64, type: !4)
!80 = !DILocation(line: 64, column: 12, scope: !78)
!81 = !DILocation(line: 65, column: 20, scope: !78)
!82 = !DILocation(line: 65, column: 10, scope: !78)
!83 = !DILocation(line: 66, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !15, line: 66, column: 9)
!85 = !DILocation(line: 66, column: 14, scope: !84)
!86 = !DILocation(line: 66, column: 9, scope: !78)
!87 = !DILocation(line: 66, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 66, column: 23)
!89 = !DILocation(line: 67, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !15, line: 67, column: 8)
!91 = !DILocation(line: 67, column: 8, scope: !78)
!92 = !DILocation(line: 70, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 68, column: 5)
!94 = !DILocation(line: 71, column: 5, scope: !93)
!95 = !DILocation(line: 75, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !15, line: 73, column: 5)
!97 = !DILocation(line: 75, column: 9, scope: !96)
!98 = !DILocation(line: 76, column: 9, scope: !96)
!99 = !DILocation(line: 76, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !15, line: 79, type: !39)
!101 = distinct !DILexicalBlock(scope: !78, file: !15, line: 78, column: 5)
!102 = !DILocation(line: 79, column: 14, scope: !101)
!103 = !DILocation(line: 81, column: 16, scope: !101)
!104 = !DILocation(line: 81, column: 22, scope: !101)
!105 = !DILocation(line: 81, column: 9, scope: !101)
!106 = !DILocation(line: 82, column: 19, scope: !101)
!107 = !DILocation(line: 82, column: 9, scope: !101)
!108 = !DILocation(line: 83, column: 14, scope: !101)
!109 = !DILocation(line: 83, column: 9, scope: !101)
!110 = !DILocation(line: 85, column: 1, scope: !78)
!111 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 32, column: 5, scope: !111)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 90, type: !4)
!115 = !DILocation(line: 90, column: 12, scope: !113)
!116 = !DILocation(line: 91, column: 20, scope: !113)
!117 = !DILocation(line: 91, column: 10, scope: !113)
!118 = !DILocation(line: 92, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !15, line: 92, column: 9)
!120 = !DILocation(line: 92, column: 14, scope: !119)
!121 = !DILocation(line: 92, column: 9, scope: !113)
!122 = !DILocation(line: 92, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 92, column: 23)
!124 = !DILocation(line: 93, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !15, line: 93, column: 8)
!126 = !DILocation(line: 93, column: 8, scope: !113)
!127 = !DILocation(line: 96, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !15, line: 94, column: 5)
!129 = !DILocation(line: 96, column: 9, scope: !128)
!130 = !DILocation(line: 97, column: 9, scope: !128)
!131 = !DILocation(line: 97, column: 20, scope: !128)
!132 = !DILocation(line: 98, column: 5, scope: !128)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !15, line: 100, type: !39)
!134 = distinct !DILexicalBlock(scope: !113, file: !15, line: 99, column: 5)
!135 = !DILocation(line: 100, column: 14, scope: !134)
!136 = !DILocation(line: 102, column: 16, scope: !134)
!137 = !DILocation(line: 102, column: 22, scope: !134)
!138 = !DILocation(line: 102, column: 9, scope: !134)
!139 = !DILocation(line: 103, column: 19, scope: !134)
!140 = !DILocation(line: 103, column: 9, scope: !134)
!141 = !DILocation(line: 104, column: 14, scope: !134)
!142 = !DILocation(line: 104, column: 9, scope: !134)
!143 = !DILocation(line: 106, column: 1, scope: !113)
