; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
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
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType* %myUnion to i8**, !dbg !39
  store i8* %2, i8** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType* %myUnion to i8**, !dbg !44
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !44
  store i8* %3, i8** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  %4 = load i8*, i8** %data1, align 8, !dbg !54
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  %call4 = call i8* @strcat(i8* %4, i8* %arraydecay3) #6, !dbg !56
  %5 = load i8*, i8** %data1, align 8, !dbg !57
  call void @printLine(i8* %5), !dbg !58
  %6 = load i8*, i8** %data1, align 8, !dbg !59
  call void @free(i8* %6) #6, !dbg !60
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
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_good() #0 !dbg !62 {
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
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
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
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType* %myUnion, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !90
  store i8* %call, i8** %data, align 8, !dbg !91
  %0 = load i8*, i8** %data, align 8, !dbg !92
  %cmp = icmp eq i8* %0, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType* %myUnion to i8**, !dbg !101
  store i8* %2, i8** %unionFirst, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType* %myUnion to i8**, !dbg !106
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !106
  store i8* %3, i8** %data1, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !110
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx2, align 1, !dbg !112
  %4 = load i8*, i8** %data1, align 8, !dbg !113
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  %call4 = call i8* @strcat(i8* %4, i8* %arraydecay3) #6, !dbg !115
  %5 = load i8*, i8** %data1, align 8, !dbg !116
  call void @printLine(i8* %5), !dbg !117
  %6 = load i8*, i8** %data1, align 8, !dbg !118
  call void @free(i8* %6) #6, !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 69, scope: !14)
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
!54 = !DILocation(line: 46, column: 20, scope: !46)
!55 = !DILocation(line: 46, column: 26, scope: !46)
!56 = !DILocation(line: 46, column: 13, scope: !46)
!57 = !DILocation(line: 47, column: 23, scope: !46)
!58 = !DILocation(line: 47, column: 13, scope: !46)
!59 = !DILocation(line: 48, column: 18, scope: !46)
!60 = !DILocation(line: 48, column: 13, scope: !46)
!61 = !DILocation(line: 51, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_34_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 84, column: 5, scope: !62)
!64 = !DILocation(line: 85, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !66, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 96, type: !68)
!71 = !DILocation(line: 96, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 96, type: !69)
!73 = !DILocation(line: 96, column: 27, scope: !65)
!74 = !DILocation(line: 99, column: 22, scope: !65)
!75 = !DILocation(line: 99, column: 12, scope: !65)
!76 = !DILocation(line: 99, column: 5, scope: !65)
!77 = !DILocation(line: 101, column: 5, scope: !65)
!78 = !DILocation(line: 102, column: 5, scope: !65)
!79 = !DILocation(line: 103, column: 5, scope: !65)
!80 = !DILocation(line: 106, column: 5, scope: !65)
!81 = !DILocation(line: 107, column: 5, scope: !65)
!82 = !DILocation(line: 108, column: 5, scope: !65)
!83 = !DILocation(line: 110, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 60, type: !4)
!86 = !DILocation(line: 60, column: 12, scope: !84)
!87 = !DILocalVariable(name: "myUnion", scope: !84, file: !15, line: 61, type: !21)
!88 = !DILocation(line: 61, column: 69, scope: !84)
!89 = !DILocation(line: 62, column: 10, scope: !84)
!90 = !DILocation(line: 64, column: 20, scope: !84)
!91 = !DILocation(line: 64, column: 10, scope: !84)
!92 = !DILocation(line: 65, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !84, file: !15, line: 65, column: 9)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocation(line: 65, column: 9, scope: !84)
!96 = !DILocation(line: 65, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 65, column: 23)
!98 = !DILocation(line: 66, column: 5, scope: !84)
!99 = !DILocation(line: 66, column: 13, scope: !84)
!100 = !DILocation(line: 67, column: 26, scope: !84)
!101 = !DILocation(line: 67, column: 13, scope: !84)
!102 = !DILocation(line: 67, column: 24, scope: !84)
!103 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 69, type: !4)
!104 = distinct !DILexicalBlock(scope: !84, file: !15, line: 68, column: 5)
!105 = !DILocation(line: 69, column: 16, scope: !104)
!106 = !DILocation(line: 69, column: 31, scope: !104)
!107 = !DILocalVariable(name: "source", scope: !108, file: !15, line: 71, type: !47)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 70, column: 9)
!109 = !DILocation(line: 71, column: 18, scope: !108)
!110 = !DILocation(line: 72, column: 13, scope: !108)
!111 = !DILocation(line: 73, column: 13, scope: !108)
!112 = !DILocation(line: 73, column: 27, scope: !108)
!113 = !DILocation(line: 75, column: 20, scope: !108)
!114 = !DILocation(line: 75, column: 26, scope: !108)
!115 = !DILocation(line: 75, column: 13, scope: !108)
!116 = !DILocation(line: 76, column: 23, scope: !108)
!117 = !DILocation(line: 76, column: 13, scope: !108)
!118 = !DILocation(line: 77, column: 18, scope: !108)
!119 = !DILocation(line: 77, column: 13, scope: !108)
!120 = !DILocation(line: 80, column: 1, scope: !84)
