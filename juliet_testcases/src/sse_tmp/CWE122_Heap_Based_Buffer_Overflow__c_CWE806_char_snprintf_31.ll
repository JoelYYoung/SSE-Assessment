; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
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
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %3, i8** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !38
  store i8* %4, i8** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data1, align 8, !dbg !46
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !47
  %7 = load i8*, i8** %data1, align 8, !dbg !48
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !49
  %8 = load i8*, i8** %data1, align 8, !dbg !50
  call void @printLine(i8* %8), !dbg !51
  %9 = load i8*, i8** %data1, align 8, !dbg !52
  call void @free(i8* %9) #7, !dbg !53
  ret void, !dbg !54
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
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !80
  store i8* %call, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !92, metadata !DIExpression()), !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !95
  store i8* %3, i8** %dataCopy, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !97
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !98
  store i8* %4, i8** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %6 = load i8*, i8** %data1, align 8, !dbg !103
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !104
  %7 = load i8*, i8** %data1, align 8, !dbg !105
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !106
  %8 = load i8*, i8** %data1, align 8, !dbg !107
  call void @printLine(i8* %8), !dbg !108
  %9 = load i8*, i8** %data1, align 8, !dbg !109
  call void @free(i8* %9) #7, !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocation(line: 32, column: 20, scope: !14)
!21 = !DILocation(line: 32, column: 10, scope: !14)
!22 = !DILocation(line: 33, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 9)
!24 = !DILocation(line: 33, column: 14, scope: !23)
!25 = !DILocation(line: 33, column: 9, scope: !14)
!26 = !DILocation(line: 33, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 23)
!28 = !DILocation(line: 35, column: 12, scope: !14)
!29 = !DILocation(line: 35, column: 5, scope: !14)
!30 = !DILocation(line: 36, column: 5, scope: !14)
!31 = !DILocation(line: 36, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !15, line: 38, type: !4)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!34 = !DILocation(line: 38, column: 16, scope: !33)
!35 = !DILocation(line: 38, column: 27, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 39, type: !4)
!37 = !DILocation(line: 39, column: 16, scope: !33)
!38 = !DILocation(line: 39, column: 23, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !15, line: 40, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 41, column: 18, scope: !40)
!45 = !DILocation(line: 43, column: 22, scope: !40)
!46 = !DILocation(line: 43, column: 35, scope: !40)
!47 = !DILocation(line: 43, column: 28, scope: !40)
!48 = !DILocation(line: 43, column: 48, scope: !40)
!49 = !DILocation(line: 43, column: 13, scope: !40)
!50 = !DILocation(line: 44, column: 23, scope: !40)
!51 = !DILocation(line: 44, column: 13, scope: !40)
!52 = !DILocation(line: 45, column: 18, scope: !40)
!53 = !DILocation(line: 45, column: 13, scope: !40)
!54 = !DILocation(line: 48, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_31_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 78, column: 5, scope: !55)
!57 = !DILocation(line: 79, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 90, type: !59, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 90, type: !61)
!64 = !DILocation(line: 90, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 90, type: !62)
!66 = !DILocation(line: 90, column: 27, scope: !58)
!67 = !DILocation(line: 93, column: 22, scope: !58)
!68 = !DILocation(line: 93, column: 12, scope: !58)
!69 = !DILocation(line: 93, column: 5, scope: !58)
!70 = !DILocation(line: 95, column: 5, scope: !58)
!71 = !DILocation(line: 96, column: 5, scope: !58)
!72 = !DILocation(line: 97, column: 5, scope: !58)
!73 = !DILocation(line: 100, column: 5, scope: !58)
!74 = !DILocation(line: 101, column: 5, scope: !58)
!75 = !DILocation(line: 102, column: 5, scope: !58)
!76 = !DILocation(line: 104, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 57, type: !4)
!79 = !DILocation(line: 57, column: 12, scope: !77)
!80 = !DILocation(line: 58, column: 20, scope: !77)
!81 = !DILocation(line: 58, column: 10, scope: !77)
!82 = !DILocation(line: 59, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !15, line: 59, column: 9)
!84 = !DILocation(line: 59, column: 14, scope: !83)
!85 = !DILocation(line: 59, column: 9, scope: !77)
!86 = !DILocation(line: 59, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 59, column: 23)
!88 = !DILocation(line: 61, column: 12, scope: !77)
!89 = !DILocation(line: 61, column: 5, scope: !77)
!90 = !DILocation(line: 62, column: 5, scope: !77)
!91 = !DILocation(line: 62, column: 16, scope: !77)
!92 = !DILocalVariable(name: "dataCopy", scope: !93, file: !15, line: 64, type: !4)
!93 = distinct !DILexicalBlock(scope: !77, file: !15, line: 63, column: 5)
!94 = !DILocation(line: 64, column: 16, scope: !93)
!95 = !DILocation(line: 64, column: 27, scope: !93)
!96 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 65, type: !4)
!97 = !DILocation(line: 65, column: 16, scope: !93)
!98 = !DILocation(line: 65, column: 23, scope: !93)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !15, line: 67, type: !41)
!100 = distinct !DILexicalBlock(scope: !93, file: !15, line: 66, column: 9)
!101 = !DILocation(line: 67, column: 18, scope: !100)
!102 = !DILocation(line: 69, column: 22, scope: !100)
!103 = !DILocation(line: 69, column: 35, scope: !100)
!104 = !DILocation(line: 69, column: 28, scope: !100)
!105 = !DILocation(line: 69, column: 48, scope: !100)
!106 = !DILocation(line: 69, column: 13, scope: !100)
!107 = !DILocation(line: 70, column: 23, scope: !100)
!108 = !DILocation(line: 70, column: 13, scope: !100)
!109 = !DILocation(line: 71, column: 18, scope: !100)
!110 = !DILocation(line: 71, column: 13, scope: !100)
!111 = !DILocation(line: 74, column: 1, scope: !77)
