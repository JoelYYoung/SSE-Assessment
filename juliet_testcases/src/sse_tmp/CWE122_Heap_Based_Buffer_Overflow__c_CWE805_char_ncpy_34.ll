; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType* %myUnion to i8**, !dbg !39
  store i8* %2, i8** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType* %myUnion to i8**, !dbg !44
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !44
  store i8* %3, i8** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  %4 = load i8*, i8** %data1, align 8, !dbg !54
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !56
  %5 = load i8*, i8** %data1, align 8, !dbg !57
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !57
  store i8 0, i8* %arrayidx5, align 1, !dbg !58
  %6 = load i8*, i8** %data1, align 8, !dbg !59
  call void @printLine(i8* %6), !dbg !60
  %7 = load i8*, i8** %data1, align 8, !dbg !61
  call void @free(i8* %7) #6, !dbg !62
  ret void, !dbg !63
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType* %myUnion, metadata !89, metadata !DIExpression()), !dbg !90
  store i8* null, i8** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %cmp = icmp eq i8* %0, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType* %myUnion to i8**, !dbg !103
  store i8* %2, i8** %unionFirst, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType* %myUnion to i8**, !dbg !108
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !108
  store i8* %3, i8** %data1, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx2, align 1, !dbg !114
  %4 = load i8*, i8** %data1, align 8, !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !117
  %5 = load i8*, i8** %data1, align 8, !dbg !118
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !118
  store i8 0, i8* %arrayidx5, align 1, !dbg !119
  %6 = load i8*, i8** %data1, align 8, !dbg !120
  call void @printLine(i8* %6), !dbg !121
  %7 = load i8*, i8** %data1, align 8, !dbg !122
  call void @free(i8* %7) #6, !dbg !123
  ret void, !dbg !124
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 72, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocation(line: 35, column: 20, scope: !14)
!29 = !DILocation(line: 35, column: 10, scope: !14)
!30 = !DILocation(line: 36, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!32 = !DILocation(line: 36, column: 14, scope: !31)
!33 = !DILocation(line: 36, column: 9, scope: !14)
!34 = !DILocation(line: 36, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 36, column: 23)
!36 = !DILocation(line: 37, column: 5, scope: !14)
!37 = !DILocation(line: 37, column: 13, scope: !14)
!38 = !DILocation(line: 38, column: 26, scope: !14)
!39 = !DILocation(line: 38, column: 13, scope: !14)
!40 = !DILocation(line: 38, column: 24, scope: !14)
!41 = !DILocalVariable(name: "data", scope: !42, file: !15, line: 40, type: !4)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!43 = !DILocation(line: 40, column: 16, scope: !42)
!44 = !DILocation(line: 40, column: 31, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 41, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 42, column: 18, scope: !46)
!51 = !DILocation(line: 43, column: 13, scope: !46)
!52 = !DILocation(line: 44, column: 13, scope: !46)
!53 = !DILocation(line: 44, column: 27, scope: !46)
!54 = !DILocation(line: 46, column: 21, scope: !46)
!55 = !DILocation(line: 46, column: 27, scope: !46)
!56 = !DILocation(line: 46, column: 13, scope: !46)
!57 = !DILocation(line: 47, column: 13, scope: !46)
!58 = !DILocation(line: 47, column: 25, scope: !46)
!59 = !DILocation(line: 48, column: 23, scope: !46)
!60 = !DILocation(line: 48, column: 13, scope: !46)
!61 = !DILocation(line: 49, column: 18, scope: !46)
!62 = !DILocation(line: 49, column: 13, scope: !46)
!63 = !DILocation(line: 52, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_34_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 86, column: 5, scope: !64)
!66 = !DILocation(line: 87, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !68, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 98, type: !70)
!73 = !DILocation(line: 98, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 98, type: !71)
!75 = !DILocation(line: 98, column: 27, scope: !67)
!76 = !DILocation(line: 101, column: 22, scope: !67)
!77 = !DILocation(line: 101, column: 12, scope: !67)
!78 = !DILocation(line: 101, column: 5, scope: !67)
!79 = !DILocation(line: 103, column: 5, scope: !67)
!80 = !DILocation(line: 104, column: 5, scope: !67)
!81 = !DILocation(line: 105, column: 5, scope: !67)
!82 = !DILocation(line: 108, column: 5, scope: !67)
!83 = !DILocation(line: 109, column: 5, scope: !67)
!84 = !DILocation(line: 110, column: 5, scope: !67)
!85 = !DILocation(line: 112, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 61, type: !4)
!88 = !DILocation(line: 61, column: 12, scope: !86)
!89 = !DILocalVariable(name: "myUnion", scope: !86, file: !15, line: 62, type: !21)
!90 = !DILocation(line: 62, column: 72, scope: !86)
!91 = !DILocation(line: 63, column: 10, scope: !86)
!92 = !DILocation(line: 65, column: 20, scope: !86)
!93 = !DILocation(line: 65, column: 10, scope: !86)
!94 = !DILocation(line: 66, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !15, line: 66, column: 9)
!96 = !DILocation(line: 66, column: 14, scope: !95)
!97 = !DILocation(line: 66, column: 9, scope: !86)
!98 = !DILocation(line: 66, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 66, column: 23)
!100 = !DILocation(line: 67, column: 5, scope: !86)
!101 = !DILocation(line: 67, column: 13, scope: !86)
!102 = !DILocation(line: 68, column: 26, scope: !86)
!103 = !DILocation(line: 68, column: 13, scope: !86)
!104 = !DILocation(line: 68, column: 24, scope: !86)
!105 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 70, type: !4)
!106 = distinct !DILexicalBlock(scope: !86, file: !15, line: 69, column: 5)
!107 = !DILocation(line: 70, column: 16, scope: !106)
!108 = !DILocation(line: 70, column: 31, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !15, line: 72, type: !47)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 71, column: 9)
!111 = !DILocation(line: 72, column: 18, scope: !110)
!112 = !DILocation(line: 73, column: 13, scope: !110)
!113 = !DILocation(line: 74, column: 13, scope: !110)
!114 = !DILocation(line: 74, column: 27, scope: !110)
!115 = !DILocation(line: 76, column: 21, scope: !110)
!116 = !DILocation(line: 76, column: 27, scope: !110)
!117 = !DILocation(line: 76, column: 13, scope: !110)
!118 = !DILocation(line: 77, column: 13, scope: !110)
!119 = !DILocation(line: 77, column: 25, scope: !110)
!120 = !DILocation(line: 78, column: 23, scope: !110)
!121 = !DILocation(line: 78, column: 13, scope: !110)
!122 = !DILocation(line: 79, column: 18, scope: !110)
!123 = !DILocation(line: 79, column: 13, scope: !110)
!124 = !DILocation(line: 82, column: 1, scope: !86)
