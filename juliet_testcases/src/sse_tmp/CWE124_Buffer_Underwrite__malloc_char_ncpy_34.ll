; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !31
  store i8* %call, i8** %dataBuffer, align 8, !dbg !30
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i8* %0, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !39
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !43
  store i8* %add.ptr, i8** %data, align 8, !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType* %myUnion to i8**, !dbg !46
  store i8* %4, i8** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType* %myUnion to i8**, !dbg !51
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !51
  store i8* %5, i8** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx2, align 1, !dbg !60
  %6 = load i8*, i8** %data1, align 8, !dbg !61
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !62
  %call4 = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #6, !dbg !63
  %7 = load i8*, i8** %data1, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !64
  store i8 0, i8* %arrayidx5, align 1, !dbg !65
  %8 = load i8*, i8** %data1, align 8, !dbg !66
  call void @printLine(i8* %8), !dbg !67
  ret void, !dbg !68
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_34_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_34_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_34_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType* %myUnion, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !100
  store i8* %call, i8** %dataBuffer, align 8, !dbg !99
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  %cmp = icmp eq i8* %0, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !108
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  store i8* %3, i8** %data, align 8, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType* %myUnion to i8**, !dbg !114
  store i8* %4, i8** %unionFirst, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !116, metadata !DIExpression()), !dbg !118
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType* %myUnion to i8**, !dbg !119
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !119
  store i8* %5, i8** %data1, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx2, align 1, !dbg !125
  %6 = load i8*, i8** %data1, align 8, !dbg !126
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  %call4 = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #6, !dbg !128
  %7 = load i8*, i8** %data1, align 8, !dbg !129
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !129
  store i8 0, i8* %arrayidx5, align 1, !dbg !130
  %8 = load i8*, i8** %data1, align 8, !dbg !131
  call void @printLine(i8* %8), !dbg !132
  ret void, !dbg !133
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 61, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !15, line: 35, type: !4)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!30 = !DILocation(line: 35, column: 16, scope: !29)
!31 = !DILocation(line: 35, column: 37, scope: !29)
!32 = !DILocation(line: 36, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 13)
!34 = !DILocation(line: 36, column: 24, scope: !33)
!35 = !DILocation(line: 36, column: 13, scope: !29)
!36 = !DILocation(line: 36, column: 34, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 36, column: 33)
!38 = !DILocation(line: 37, column: 16, scope: !29)
!39 = !DILocation(line: 37, column: 9, scope: !29)
!40 = !DILocation(line: 38, column: 9, scope: !29)
!41 = !DILocation(line: 38, column: 27, scope: !29)
!42 = !DILocation(line: 40, column: 16, scope: !29)
!43 = !DILocation(line: 40, column: 27, scope: !29)
!44 = !DILocation(line: 40, column: 14, scope: !29)
!45 = !DILocation(line: 42, column: 26, scope: !14)
!46 = !DILocation(line: 42, column: 13, scope: !14)
!47 = !DILocation(line: 42, column: 24, scope: !14)
!48 = !DILocalVariable(name: "data", scope: !49, file: !15, line: 44, type: !4)
!49 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!50 = !DILocation(line: 44, column: 16, scope: !49)
!51 = !DILocation(line: 44, column: 31, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !15, line: 46, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 45, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 46, column: 18, scope: !53)
!58 = !DILocation(line: 47, column: 13, scope: !53)
!59 = !DILocation(line: 48, column: 13, scope: !53)
!60 = !DILocation(line: 48, column: 27, scope: !53)
!61 = !DILocation(line: 50, column: 21, scope: !53)
!62 = !DILocation(line: 50, column: 27, scope: !53)
!63 = !DILocation(line: 50, column: 13, scope: !53)
!64 = !DILocation(line: 52, column: 13, scope: !53)
!65 = !DILocation(line: 52, column: 25, scope: !53)
!66 = !DILocation(line: 53, column: 23, scope: !53)
!67 = !DILocation(line: 53, column: 13, scope: !53)
!68 = !DILocation(line: 58, column: 1, scope: !14)
!69 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_34_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 98, column: 5, scope: !69)
!71 = !DILocation(line: 99, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !73, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !15, line: 110, type: !75)
!78 = !DILocation(line: 110, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !15, line: 110, type: !76)
!80 = !DILocation(line: 110, column: 27, scope: !72)
!81 = !DILocation(line: 113, column: 22, scope: !72)
!82 = !DILocation(line: 113, column: 12, scope: !72)
!83 = !DILocation(line: 113, column: 5, scope: !72)
!84 = !DILocation(line: 115, column: 5, scope: !72)
!85 = !DILocation(line: 116, column: 5, scope: !72)
!86 = !DILocation(line: 117, column: 5, scope: !72)
!87 = !DILocation(line: 120, column: 5, scope: !72)
!88 = !DILocation(line: 121, column: 5, scope: !72)
!89 = !DILocation(line: 122, column: 5, scope: !72)
!90 = !DILocation(line: 124, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 67, type: !4)
!93 = !DILocation(line: 67, column: 12, scope: !91)
!94 = !DILocalVariable(name: "myUnion", scope: !91, file: !15, line: 68, type: !21)
!95 = !DILocation(line: 68, column: 61, scope: !91)
!96 = !DILocation(line: 69, column: 10, scope: !91)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !15, line: 71, type: !4)
!98 = distinct !DILexicalBlock(scope: !91, file: !15, line: 70, column: 5)
!99 = !DILocation(line: 71, column: 16, scope: !98)
!100 = !DILocation(line: 71, column: 37, scope: !98)
!101 = !DILocation(line: 72, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 72, column: 13)
!103 = !DILocation(line: 72, column: 24, scope: !102)
!104 = !DILocation(line: 72, column: 13, scope: !98)
!105 = !DILocation(line: 72, column: 34, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 72, column: 33)
!107 = !DILocation(line: 73, column: 16, scope: !98)
!108 = !DILocation(line: 73, column: 9, scope: !98)
!109 = !DILocation(line: 74, column: 9, scope: !98)
!110 = !DILocation(line: 74, column: 27, scope: !98)
!111 = !DILocation(line: 76, column: 16, scope: !98)
!112 = !DILocation(line: 76, column: 14, scope: !98)
!113 = !DILocation(line: 78, column: 26, scope: !91)
!114 = !DILocation(line: 78, column: 13, scope: !91)
!115 = !DILocation(line: 78, column: 24, scope: !91)
!116 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 80, type: !4)
!117 = distinct !DILexicalBlock(scope: !91, file: !15, line: 79, column: 5)
!118 = !DILocation(line: 80, column: 16, scope: !117)
!119 = !DILocation(line: 80, column: 31, scope: !117)
!120 = !DILocalVariable(name: "source", scope: !121, file: !15, line: 82, type: !54)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 81, column: 9)
!122 = !DILocation(line: 82, column: 18, scope: !121)
!123 = !DILocation(line: 83, column: 13, scope: !121)
!124 = !DILocation(line: 84, column: 13, scope: !121)
!125 = !DILocation(line: 84, column: 27, scope: !121)
!126 = !DILocation(line: 86, column: 21, scope: !121)
!127 = !DILocation(line: 86, column: 27, scope: !121)
!128 = !DILocation(line: 86, column: 13, scope: !121)
!129 = !DILocation(line: 88, column: 13, scope: !121)
!130 = !DILocation(line: 88, column: 25, scope: !121)
!131 = !DILocation(line: 89, column: 23, scope: !121)
!132 = !DILocation(line: 89, column: 13, scope: !121)
!133 = !DILocation(line: 94, column: 1, scope: !91)
