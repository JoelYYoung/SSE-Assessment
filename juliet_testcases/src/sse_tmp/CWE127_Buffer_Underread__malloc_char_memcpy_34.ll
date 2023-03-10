; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !31
  store i8* %call, i8** %dataBuffer, align 8, !dbg !30
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i8* %0, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !36
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
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType* %myUnion to i8**, !dbg !46
  store i8* %4, i8** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType* %myUnion to i8**, !dbg !51
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !51
  store i8* %5, i8** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx2, align 1, !dbg !60
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %6 = load i8*, i8** %data1, align 8, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %6, i64 100, i1 false), !dbg !61
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx4, align 1, !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @printLine(i8* %arraydecay5), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_34_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_34_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_34_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType* %myUnion, metadata !93, metadata !DIExpression()), !dbg !94
  store i8* null, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !99
  store i8* %call, i8** %dataBuffer, align 8, !dbg !98
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %cmp = icmp eq i8* %0, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !107
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %3, i8** %data, align 8, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType* %myUnion to i8**, !dbg !113
  store i8* %4, i8** %unionFirst, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !115, metadata !DIExpression()), !dbg !117
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType* %myUnion to i8**, !dbg !118
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !118
  store i8* %5, i8** %data1, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx2, align 1, !dbg !124
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  %6 = load i8*, i8** %data1, align 8, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %6, i64 100, i1 false), !dbg !125
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx4, align 1, !dbg !128
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @printLine(i8* %arraydecay5), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__malloc_char_memcpy_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 62, scope: !14)
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
!52 = !DILocalVariable(name: "dest", scope: !53, file: !15, line: 46, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 45, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 46, column: 18, scope: !53)
!58 = !DILocation(line: 47, column: 13, scope: !53)
!59 = !DILocation(line: 48, column: 13, scope: !53)
!60 = !DILocation(line: 48, column: 25, scope: !53)
!61 = !DILocation(line: 50, column: 13, scope: !53)
!62 = !DILocation(line: 50, column: 26, scope: !53)
!63 = !DILocation(line: 52, column: 13, scope: !53)
!64 = !DILocation(line: 52, column: 25, scope: !53)
!65 = !DILocation(line: 53, column: 23, scope: !53)
!66 = !DILocation(line: 53, column: 13, scope: !53)
!67 = !DILocation(line: 58, column: 1, scope: !14)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_34_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 98, column: 5, scope: !68)
!70 = !DILocation(line: 99, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !72, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 110, type: !74)
!77 = !DILocation(line: 110, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 110, type: !75)
!79 = !DILocation(line: 110, column: 27, scope: !71)
!80 = !DILocation(line: 113, column: 22, scope: !71)
!81 = !DILocation(line: 113, column: 12, scope: !71)
!82 = !DILocation(line: 113, column: 5, scope: !71)
!83 = !DILocation(line: 115, column: 5, scope: !71)
!84 = !DILocation(line: 116, column: 5, scope: !71)
!85 = !DILocation(line: 117, column: 5, scope: !71)
!86 = !DILocation(line: 120, column: 5, scope: !71)
!87 = !DILocation(line: 121, column: 5, scope: !71)
!88 = !DILocation(line: 122, column: 5, scope: !71)
!89 = !DILocation(line: 124, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 67, type: !4)
!92 = !DILocation(line: 67, column: 12, scope: !90)
!93 = !DILocalVariable(name: "myUnion", scope: !90, file: !15, line: 68, type: !21)
!94 = !DILocation(line: 68, column: 62, scope: !90)
!95 = !DILocation(line: 69, column: 10, scope: !90)
!96 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !15, line: 71, type: !4)
!97 = distinct !DILexicalBlock(scope: !90, file: !15, line: 70, column: 5)
!98 = !DILocation(line: 71, column: 16, scope: !97)
!99 = !DILocation(line: 71, column: 37, scope: !97)
!100 = !DILocation(line: 72, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 72, column: 13)
!102 = !DILocation(line: 72, column: 24, scope: !101)
!103 = !DILocation(line: 72, column: 13, scope: !97)
!104 = !DILocation(line: 72, column: 34, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 72, column: 33)
!106 = !DILocation(line: 73, column: 16, scope: !97)
!107 = !DILocation(line: 73, column: 9, scope: !97)
!108 = !DILocation(line: 74, column: 9, scope: !97)
!109 = !DILocation(line: 74, column: 27, scope: !97)
!110 = !DILocation(line: 76, column: 16, scope: !97)
!111 = !DILocation(line: 76, column: 14, scope: !97)
!112 = !DILocation(line: 78, column: 26, scope: !90)
!113 = !DILocation(line: 78, column: 13, scope: !90)
!114 = !DILocation(line: 78, column: 24, scope: !90)
!115 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 80, type: !4)
!116 = distinct !DILexicalBlock(scope: !90, file: !15, line: 79, column: 5)
!117 = !DILocation(line: 80, column: 16, scope: !116)
!118 = !DILocation(line: 80, column: 31, scope: !116)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !15, line: 82, type: !54)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 81, column: 9)
!121 = !DILocation(line: 82, column: 18, scope: !120)
!122 = !DILocation(line: 83, column: 13, scope: !120)
!123 = !DILocation(line: 84, column: 13, scope: !120)
!124 = !DILocation(line: 84, column: 25, scope: !120)
!125 = !DILocation(line: 86, column: 13, scope: !120)
!126 = !DILocation(line: 86, column: 26, scope: !120)
!127 = !DILocation(line: 88, column: 13, scope: !120)
!128 = !DILocation(line: 88, column: 25, scope: !120)
!129 = !DILocation(line: 89, column: 23, scope: !120)
!130 = !DILocation(line: 89, column: 13, scope: !120)
!131 = !DILocation(line: 94, column: 1, scope: !90)
