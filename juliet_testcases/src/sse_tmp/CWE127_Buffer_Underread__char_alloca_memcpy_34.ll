; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memcpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %0, i8** %dataBuffer, align 8, !dbg !27
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !30
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !34
  store i8* %add.ptr, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %4, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !42
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %5, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx2, align 1, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %6 = load i8*, i8** %data1, align 8, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %6, i64 100, i1 false), !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx4, align 1, !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay5), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memcpy_34_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_alloca_memcpy_34_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__char_alloca_memcpy_34_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType* %myUnion, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 100, align 16, !dbg !88
  store i8* %0, i8** %dataBuffer, align 8, !dbg !87
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !90
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !94
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !96
  store i8* %4, i8** %unionFirst, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType* %myUnion to i8**, !dbg !101
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !101
  store i8* %5, i8** %data1, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx2, align 1, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %6 = load i8*, i8** %data1, align 8, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %6, i64 100, i1 false), !dbg !108
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx4, align 1, !dbg !111
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @printLine(i8* %arraydecay5), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memcpy_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__char_alloca_memcpy_34_unionType", file: !14, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 24, baseType: !4, size: 64)
!25 = !DILocation(line: 32, column: 62, scope: !13)
!26 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 33, scope: !13)
!29 = !DILocation(line: 34, column: 12, scope: !13)
!30 = !DILocation(line: 34, column: 5, scope: !13)
!31 = !DILocation(line: 35, column: 5, scope: !13)
!32 = !DILocation(line: 35, column: 23, scope: !13)
!33 = !DILocation(line: 37, column: 12, scope: !13)
!34 = !DILocation(line: 37, column: 23, scope: !13)
!35 = !DILocation(line: 37, column: 10, scope: !13)
!36 = !DILocation(line: 38, column: 26, scope: !13)
!37 = !DILocation(line: 38, column: 13, scope: !13)
!38 = !DILocation(line: 38, column: 24, scope: !13)
!39 = !DILocalVariable(name: "data", scope: !40, file: !14, line: 40, type: !4)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!41 = !DILocation(line: 40, column: 16, scope: !40)
!42 = !DILocation(line: 40, column: 31, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !14, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 41, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 42, column: 18, scope: !44)
!49 = !DILocation(line: 43, column: 13, scope: !44)
!50 = !DILocation(line: 44, column: 13, scope: !44)
!51 = !DILocation(line: 44, column: 25, scope: !44)
!52 = !DILocation(line: 46, column: 13, scope: !44)
!53 = !DILocation(line: 46, column: 26, scope: !44)
!54 = !DILocation(line: 48, column: 13, scope: !44)
!55 = !DILocation(line: 48, column: 25, scope: !44)
!56 = !DILocation(line: 49, column: 23, scope: !44)
!57 = !DILocation(line: 49, column: 13, scope: !44)
!58 = !DILocation(line: 52, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memcpy_34_good", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 86, column: 5, scope: !59)
!61 = !DILocation(line: 87, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 98, type: !63, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 98, type: !65)
!68 = !DILocation(line: 98, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 98, type: !66)
!70 = !DILocation(line: 98, column: 27, scope: !62)
!71 = !DILocation(line: 101, column: 22, scope: !62)
!72 = !DILocation(line: 101, column: 12, scope: !62)
!73 = !DILocation(line: 101, column: 5, scope: !62)
!74 = !DILocation(line: 103, column: 5, scope: !62)
!75 = !DILocation(line: 104, column: 5, scope: !62)
!76 = !DILocation(line: 105, column: 5, scope: !62)
!77 = !DILocation(line: 108, column: 5, scope: !62)
!78 = !DILocation(line: 109, column: 5, scope: !62)
!79 = !DILocation(line: 110, column: 5, scope: !62)
!80 = !DILocation(line: 112, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !14, line: 61, type: !4)
!83 = !DILocation(line: 61, column: 12, scope: !81)
!84 = !DILocalVariable(name: "myUnion", scope: !81, file: !14, line: 62, type: !20)
!85 = !DILocation(line: 62, column: 62, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !14, line: 63, type: !4)
!87 = !DILocation(line: 63, column: 12, scope: !81)
!88 = !DILocation(line: 63, column: 33, scope: !81)
!89 = !DILocation(line: 64, column: 12, scope: !81)
!90 = !DILocation(line: 64, column: 5, scope: !81)
!91 = !DILocation(line: 65, column: 5, scope: !81)
!92 = !DILocation(line: 65, column: 23, scope: !81)
!93 = !DILocation(line: 67, column: 12, scope: !81)
!94 = !DILocation(line: 67, column: 10, scope: !81)
!95 = !DILocation(line: 68, column: 26, scope: !81)
!96 = !DILocation(line: 68, column: 13, scope: !81)
!97 = !DILocation(line: 68, column: 24, scope: !81)
!98 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 70, type: !4)
!99 = distinct !DILexicalBlock(scope: !81, file: !14, line: 69, column: 5)
!100 = !DILocation(line: 70, column: 16, scope: !99)
!101 = !DILocation(line: 70, column: 31, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !14, line: 72, type: !45)
!103 = distinct !DILexicalBlock(scope: !99, file: !14, line: 71, column: 9)
!104 = !DILocation(line: 72, column: 18, scope: !103)
!105 = !DILocation(line: 73, column: 13, scope: !103)
!106 = !DILocation(line: 74, column: 13, scope: !103)
!107 = !DILocation(line: 74, column: 25, scope: !103)
!108 = !DILocation(line: 76, column: 13, scope: !103)
!109 = !DILocation(line: 76, column: 26, scope: !103)
!110 = !DILocation(line: 78, column: 13, scope: !103)
!111 = !DILocation(line: 78, column: 25, scope: !103)
!112 = !DILocation(line: 79, column: 23, scope: !103)
!113 = !DILocation(line: 79, column: 13, scope: !103)
!114 = !DILocation(line: 82, column: 1, scope: !81)
