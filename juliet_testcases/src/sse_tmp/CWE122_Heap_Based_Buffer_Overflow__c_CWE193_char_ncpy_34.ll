; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType = type { i8* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %1, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType* %myUnion to i8**, !dbg !42
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %2, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  %4 = load i8*, i8** %data1, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !51
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !52
  %add = add i64 %call3, 1, !dbg !53
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay, i64 %add) #7, !dbg !54
  %5 = load i8*, i8** %data1, align 8, !dbg !55
  call void @printLine(i8* %5), !dbg !56
  %6 = load i8*, i8** %data1, align 8, !dbg !57
  call void @free(i8* %6) #7, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !88
  store i8* %call, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %cmp = icmp eq i8* %0, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType* %myUnion to i8**, !dbg !97
  store i8* %1, i8** %unionFirst, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !99, metadata !DIExpression()), !dbg !101
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType* %myUnion to i8**, !dbg !102
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !102
  store i8* %2, i8** %data1, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !105
  %4 = load i8*, i8** %data1, align 8, !dbg !106
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !107
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !108
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !109
  %add = add i64 %call3, 1, !dbg !110
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay, i64 %add) #7, !dbg !111
  %5 = load i8*, i8** %data1, align 8, !dbg !112
  call void @printLine(i8* %5), !dbg !113
  %6 = load i8*, i8** %data1, align 8, !dbg !114
  call void @free(i8* %6) #7, !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 36, type: !4)
!19 = !DILocation(line: 36, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 37, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_unionType", file: !15, line: 30, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 26, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 28, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 29, baseType: !4, size: 64)
!26 = !DILocation(line: 37, column: 72, scope: !14)
!27 = !DILocation(line: 38, column: 10, scope: !14)
!28 = !DILocation(line: 40, column: 20, scope: !14)
!29 = !DILocation(line: 40, column: 10, scope: !14)
!30 = !DILocation(line: 41, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 41, column: 9, scope: !14)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 41, column: 23)
!36 = !DILocation(line: 42, column: 26, scope: !14)
!37 = !DILocation(line: 42, column: 13, scope: !14)
!38 = !DILocation(line: 42, column: 24, scope: !14)
!39 = !DILocalVariable(name: "data", scope: !40, file: !15, line: 44, type: !4)
!40 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!41 = !DILocation(line: 44, column: 16, scope: !40)
!42 = !DILocation(line: 44, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 46, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 45, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 46, column: 18, scope: !44)
!49 = !DILocation(line: 49, column: 21, scope: !44)
!50 = !DILocation(line: 49, column: 27, scope: !44)
!51 = !DILocation(line: 49, column: 42, scope: !44)
!52 = !DILocation(line: 49, column: 35, scope: !44)
!53 = !DILocation(line: 49, column: 50, scope: !44)
!54 = !DILocation(line: 49, column: 13, scope: !44)
!55 = !DILocation(line: 50, column: 23, scope: !44)
!56 = !DILocation(line: 50, column: 13, scope: !44)
!57 = !DILocation(line: 51, column: 18, scope: !44)
!58 = !DILocation(line: 51, column: 13, scope: !44)
!59 = !DILocation(line: 54, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_34_good", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 85, column: 5, scope: !60)
!62 = !DILocation(line: 86, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !64, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 97, type: !66)
!69 = !DILocation(line: 97, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 97, type: !67)
!71 = !DILocation(line: 97, column: 27, scope: !63)
!72 = !DILocation(line: 100, column: 22, scope: !63)
!73 = !DILocation(line: 100, column: 12, scope: !63)
!74 = !DILocation(line: 100, column: 5, scope: !63)
!75 = !DILocation(line: 102, column: 5, scope: !63)
!76 = !DILocation(line: 103, column: 5, scope: !63)
!77 = !DILocation(line: 104, column: 5, scope: !63)
!78 = !DILocation(line: 107, column: 5, scope: !63)
!79 = !DILocation(line: 108, column: 5, scope: !63)
!80 = !DILocation(line: 109, column: 5, scope: !63)
!81 = !DILocation(line: 111, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 63, type: !4)
!84 = !DILocation(line: 63, column: 12, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !15, line: 64, type: !21)
!86 = !DILocation(line: 64, column: 72, scope: !82)
!87 = !DILocation(line: 65, column: 10, scope: !82)
!88 = !DILocation(line: 67, column: 20, scope: !82)
!89 = !DILocation(line: 67, column: 10, scope: !82)
!90 = !DILocation(line: 68, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !82, file: !15, line: 68, column: 9)
!92 = !DILocation(line: 68, column: 14, scope: !91)
!93 = !DILocation(line: 68, column: 9, scope: !82)
!94 = !DILocation(line: 68, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 68, column: 23)
!96 = !DILocation(line: 69, column: 26, scope: !82)
!97 = !DILocation(line: 69, column: 13, scope: !82)
!98 = !DILocation(line: 69, column: 24, scope: !82)
!99 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 71, type: !4)
!100 = distinct !DILexicalBlock(scope: !82, file: !15, line: 70, column: 5)
!101 = !DILocation(line: 71, column: 16, scope: !100)
!102 = !DILocation(line: 71, column: 31, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 73, type: !45)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 72, column: 9)
!105 = !DILocation(line: 73, column: 18, scope: !104)
!106 = !DILocation(line: 76, column: 21, scope: !104)
!107 = !DILocation(line: 76, column: 27, scope: !104)
!108 = !DILocation(line: 76, column: 42, scope: !104)
!109 = !DILocation(line: 76, column: 35, scope: !104)
!110 = !DILocation(line: 76, column: 50, scope: !104)
!111 = !DILocation(line: 76, column: 13, scope: !104)
!112 = !DILocation(line: 77, column: 23, scope: !104)
!113 = !DILocation(line: 77, column: 13, scope: !104)
!114 = !DILocation(line: 78, column: 18, scope: !104)
!115 = !DILocation(line: 78, column: 13, scope: !104)
!116 = !DILocation(line: 81, column: 1, scope: !82)
