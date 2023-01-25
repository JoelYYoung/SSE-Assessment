; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType = type { i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %3, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType* %myUnion to i8**, !dbg !45
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %4, i8** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !52
  %6 = load i8*, i8** %data1, align 8, !dbg !53
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !54
  %7 = load i8*, i8** %data1, align 8, !dbg !55
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !56
  %8 = load i8*, i8** %data1, align 8, !dbg !57
  call void @printLine(i8* %8), !dbg !58
  %9 = load i8*, i8** %data1, align 8, !dbg !59
  call void @free(i8* %9) #7, !dbg !60
  ret void, !dbg !61
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType* %myUnion, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType* %myUnion to i8**, !dbg !102
  store i8* %3, i8** %unionFirst, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !104, metadata !DIExpression()), !dbg !106
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType* %myUnion to i8**, !dbg !107
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !107
  store i8* %4, i8** %data1, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !111
  %6 = load i8*, i8** %data1, align 8, !dbg !112
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !113
  %7 = load i8*, i8** %data1, align 8, !dbg !114
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %7) #7, !dbg !115
  %8 = load i8*, i8** %data1, align 8, !dbg !116
  call void @printLine(i8* %8), !dbg !117
  %9 = load i8*, i8** %data1, align 8, !dbg !118
  call void @free(i8* %9) #7, !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 38, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_unionType", file: !15, line: 31, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 27, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 29, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 30, baseType: !4, size: 64)
!26 = !DILocation(line: 38, column: 76, scope: !14)
!27 = !DILocation(line: 39, column: 20, scope: !14)
!28 = !DILocation(line: 39, column: 10, scope: !14)
!29 = !DILocation(line: 40, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 9)
!31 = !DILocation(line: 40, column: 14, scope: !30)
!32 = !DILocation(line: 40, column: 9, scope: !14)
!33 = !DILocation(line: 40, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 40, column: 23)
!35 = !DILocation(line: 42, column: 12, scope: !14)
!36 = !DILocation(line: 42, column: 5, scope: !14)
!37 = !DILocation(line: 43, column: 5, scope: !14)
!38 = !DILocation(line: 43, column: 17, scope: !14)
!39 = !DILocation(line: 44, column: 26, scope: !14)
!40 = !DILocation(line: 44, column: 13, scope: !14)
!41 = !DILocation(line: 44, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 46, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!44 = !DILocation(line: 46, column: 16, scope: !43)
!45 = !DILocation(line: 46, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !15, line: 48, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 47, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 48, column: 18, scope: !47)
!52 = !DILocation(line: 50, column: 22, scope: !47)
!53 = !DILocation(line: 50, column: 35, scope: !47)
!54 = !DILocation(line: 50, column: 28, scope: !47)
!55 = !DILocation(line: 50, column: 48, scope: !47)
!56 = !DILocation(line: 50, column: 13, scope: !47)
!57 = !DILocation(line: 51, column: 23, scope: !47)
!58 = !DILocation(line: 51, column: 13, scope: !47)
!59 = !DILocation(line: 52, column: 18, scope: !47)
!60 = !DILocation(line: 52, column: 13, scope: !47)
!61 = !DILocation(line: 55, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_34_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 86, column: 5, scope: !62)
!64 = !DILocation(line: 87, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !66, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 98, type: !68)
!71 = !DILocation(line: 98, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 98, type: !69)
!73 = !DILocation(line: 98, column: 27, scope: !65)
!74 = !DILocation(line: 101, column: 22, scope: !65)
!75 = !DILocation(line: 101, column: 12, scope: !65)
!76 = !DILocation(line: 101, column: 5, scope: !65)
!77 = !DILocation(line: 103, column: 5, scope: !65)
!78 = !DILocation(line: 104, column: 5, scope: !65)
!79 = !DILocation(line: 105, column: 5, scope: !65)
!80 = !DILocation(line: 108, column: 5, scope: !65)
!81 = !DILocation(line: 109, column: 5, scope: !65)
!82 = !DILocation(line: 110, column: 5, scope: !65)
!83 = !DILocation(line: 112, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 64, type: !4)
!86 = !DILocation(line: 64, column: 12, scope: !84)
!87 = !DILocalVariable(name: "myUnion", scope: !84, file: !15, line: 65, type: !21)
!88 = !DILocation(line: 65, column: 76, scope: !84)
!89 = !DILocation(line: 66, column: 20, scope: !84)
!90 = !DILocation(line: 66, column: 10, scope: !84)
!91 = !DILocation(line: 67, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !15, line: 67, column: 9)
!93 = !DILocation(line: 67, column: 14, scope: !92)
!94 = !DILocation(line: 67, column: 9, scope: !84)
!95 = !DILocation(line: 67, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 67, column: 23)
!97 = !DILocation(line: 69, column: 12, scope: !84)
!98 = !DILocation(line: 69, column: 5, scope: !84)
!99 = !DILocation(line: 70, column: 5, scope: !84)
!100 = !DILocation(line: 70, column: 16, scope: !84)
!101 = !DILocation(line: 71, column: 26, scope: !84)
!102 = !DILocation(line: 71, column: 13, scope: !84)
!103 = !DILocation(line: 71, column: 24, scope: !84)
!104 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 73, type: !4)
!105 = distinct !DILexicalBlock(scope: !84, file: !15, line: 72, column: 5)
!106 = !DILocation(line: 73, column: 16, scope: !105)
!107 = !DILocation(line: 73, column: 31, scope: !105)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !15, line: 75, type: !48)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 74, column: 9)
!110 = !DILocation(line: 75, column: 18, scope: !109)
!111 = !DILocation(line: 77, column: 22, scope: !109)
!112 = !DILocation(line: 77, column: 35, scope: !109)
!113 = !DILocation(line: 77, column: 28, scope: !109)
!114 = !DILocation(line: 77, column: 48, scope: !109)
!115 = !DILocation(line: 77, column: 13, scope: !109)
!116 = !DILocation(line: 78, column: 23, scope: !109)
!117 = !DILocation(line: 78, column: 13, scope: !109)
!118 = !DILocation(line: 79, column: 18, scope: !109)
!119 = !DILocation(line: 79, column: 13, scope: !109)
!120 = !DILocation(line: 82, column: 1, scope: !84)
