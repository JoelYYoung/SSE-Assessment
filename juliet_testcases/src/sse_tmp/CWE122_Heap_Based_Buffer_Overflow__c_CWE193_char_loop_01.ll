; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !43
  store i64 %call1, i64* %sourceLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !48
  %3 = load i64, i64* %sourceLen, align 8, !dbg !50
  %add = add i64 %3, 1, !dbg !51
  %cmp2 = icmp ult i64 %2, %add, !dbg !52
  br i1 %cmp2, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !56
  %5 = load i8, i8* %arrayidx, align 1, !dbg !56
  %6 = load i8*, i8** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !57
  store i8 %5, i8* %arrayidx3, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %8, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %9), !dbg !67
  %10 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* %10) #7, !dbg !69
  ret void, !dbg !70
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !113
  store i64 %call1, i64* %sourceLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !118
  %3 = load i64, i64* %sourceLen, align 8, !dbg !120
  %add = add i64 %3, 1, !dbg !121
  %cmp2 = icmp ult i64 %2, %add, !dbg !122
  br i1 %cmp2, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !126
  %5 = load i8, i8* %arrayidx, align 1, !dbg !126
  %6 = load i8*, i8** %data, align 8, !dbg !127
  %7 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !127
  store i8 %5, i8* %arrayidx3, align 1, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %8, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* %9), !dbg !136
  %10 = load i8*, i8** %data, align 8, !dbg !137
  call void @free(i8* %10) #7, !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 20, scope: !14)
!22 = !DILocation(line: 33, column: 10, scope: !14)
!23 = !DILocation(line: 34, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!25 = !DILocation(line: 34, column: 14, scope: !24)
!26 = !DILocation(line: 34, column: 9, scope: !14)
!27 = !DILocation(line: 34, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 34, column: 23)
!29 = !DILocalVariable(name: "source", scope: !30, file: !15, line: 36, type: !31)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 36, column: 14, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !30, file: !15, line: 37, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 37, column: 16, scope: !30)
!40 = !DILocalVariable(name: "sourceLen", scope: !30, file: !15, line: 37, type: !36)
!41 = !DILocation(line: 37, column: 19, scope: !30)
!42 = !DILocation(line: 38, column: 28, scope: !30)
!43 = !DILocation(line: 38, column: 21, scope: !30)
!44 = !DILocation(line: 38, column: 19, scope: !30)
!45 = !DILocation(line: 41, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !30, file: !15, line: 41, column: 9)
!47 = !DILocation(line: 41, column: 14, scope: !46)
!48 = !DILocation(line: 41, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 41, column: 9)
!50 = !DILocation(line: 41, column: 25, scope: !49)
!51 = !DILocation(line: 41, column: 35, scope: !49)
!52 = !DILocation(line: 41, column: 23, scope: !49)
!53 = !DILocation(line: 41, column: 9, scope: !46)
!54 = !DILocation(line: 43, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !15, line: 42, column: 9)
!56 = !DILocation(line: 43, column: 23, scope: !55)
!57 = !DILocation(line: 43, column: 13, scope: !55)
!58 = !DILocation(line: 43, column: 18, scope: !55)
!59 = !DILocation(line: 43, column: 21, scope: !55)
!60 = !DILocation(line: 44, column: 9, scope: !55)
!61 = !DILocation(line: 41, column: 41, scope: !49)
!62 = !DILocation(line: 41, column: 9, scope: !49)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 44, column: 9, scope: !46)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 45, column: 19, scope: !30)
!67 = !DILocation(line: 45, column: 9, scope: !30)
!68 = !DILocation(line: 46, column: 14, scope: !30)
!69 = !DILocation(line: 46, column: 9, scope: !30)
!70 = !DILocation(line: 48, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_01_good", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 79, column: 5, scope: !71)
!73 = !DILocation(line: 80, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !75, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 92, type: !77)
!80 = !DILocation(line: 92, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 92, type: !78)
!82 = !DILocation(line: 92, column: 27, scope: !74)
!83 = !DILocation(line: 95, column: 22, scope: !74)
!84 = !DILocation(line: 95, column: 12, scope: !74)
!85 = !DILocation(line: 95, column: 5, scope: !74)
!86 = !DILocation(line: 97, column: 5, scope: !74)
!87 = !DILocation(line: 98, column: 5, scope: !74)
!88 = !DILocation(line: 99, column: 5, scope: !74)
!89 = !DILocation(line: 102, column: 5, scope: !74)
!90 = !DILocation(line: 103, column: 5, scope: !74)
!91 = !DILocation(line: 104, column: 5, scope: !74)
!92 = !DILocation(line: 106, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 57, type: !4)
!95 = !DILocation(line: 57, column: 12, scope: !93)
!96 = !DILocation(line: 58, column: 10, scope: !93)
!97 = !DILocation(line: 60, column: 20, scope: !93)
!98 = !DILocation(line: 60, column: 10, scope: !93)
!99 = !DILocation(line: 61, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !15, line: 61, column: 9)
!101 = !DILocation(line: 61, column: 14, scope: !100)
!102 = !DILocation(line: 61, column: 9, scope: !93)
!103 = !DILocation(line: 61, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 61, column: 23)
!105 = !DILocalVariable(name: "source", scope: !106, file: !15, line: 63, type: !31)
!106 = distinct !DILexicalBlock(scope: !93, file: !15, line: 62, column: 5)
!107 = !DILocation(line: 63, column: 14, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !15, line: 64, type: !36)
!109 = !DILocation(line: 64, column: 16, scope: !106)
!110 = !DILocalVariable(name: "sourceLen", scope: !106, file: !15, line: 64, type: !36)
!111 = !DILocation(line: 64, column: 19, scope: !106)
!112 = !DILocation(line: 65, column: 28, scope: !106)
!113 = !DILocation(line: 65, column: 21, scope: !106)
!114 = !DILocation(line: 65, column: 19, scope: !106)
!115 = !DILocation(line: 68, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !15, line: 68, column: 9)
!117 = !DILocation(line: 68, column: 14, scope: !116)
!118 = !DILocation(line: 68, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 68, column: 9)
!120 = !DILocation(line: 68, column: 25, scope: !119)
!121 = !DILocation(line: 68, column: 35, scope: !119)
!122 = !DILocation(line: 68, column: 23, scope: !119)
!123 = !DILocation(line: 68, column: 9, scope: !116)
!124 = !DILocation(line: 70, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !15, line: 69, column: 9)
!126 = !DILocation(line: 70, column: 23, scope: !125)
!127 = !DILocation(line: 70, column: 13, scope: !125)
!128 = !DILocation(line: 70, column: 18, scope: !125)
!129 = !DILocation(line: 70, column: 21, scope: !125)
!130 = !DILocation(line: 71, column: 9, scope: !125)
!131 = !DILocation(line: 68, column: 41, scope: !119)
!132 = !DILocation(line: 68, column: 9, scope: !119)
!133 = distinct !{!133, !123, !134, !65}
!134 = !DILocation(line: 71, column: 9, scope: !116)
!135 = !DILocation(line: 72, column: 19, scope: !106)
!136 = !DILocation(line: 72, column: 9, scope: !106)
!137 = !DILocation(line: 73, column: 14, scope: !106)
!138 = !DILocation(line: 73, column: 9, scope: !106)
!139 = !DILocation(line: 75, column: 1, scope: !93)
