; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType* %myUnion, metadata !23, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to i64*, !dbg !33
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to i64*, !dbg !37
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !35
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !38
  store i64* %4, i64** %data, align 8, !dbg !39
  %5 = load i64*, i64** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType* %myUnion to i64**, !dbg !41
  store i64* %5, i64** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType* %myUnion to i64**, !dbg !46
  %6 = load i64*, i64** %unionSecond, align 8, !dbg !46
  store i64* %6, i64** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !52
  %8 = load i64*, i64** %data1, align 8, !dbg !53
  %9 = bitcast i64* %8 to i8*, !dbg !54
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !54
  %10 = bitcast i64* %arraydecay to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 16 %10, i64 800, i1 false), !dbg !54
  %11 = load i64*, i64** %data1, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i64, i64* %11, i64 0, !dbg !55
  %12 = load i64, i64* %arrayidx, align 8, !dbg !55
  call void @printLongLongLine(i64 %12), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to i64*, !dbg !90
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 800, align 16, !dbg !93
  %3 = bitcast i8* %2 to i64*, !dbg !94
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !92
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !95
  store i64* %4, i64** %data, align 8, !dbg !96
  %5 = load i64*, i64** %data, align 8, !dbg !97
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType* %myUnion to i64**, !dbg !98
  store i64* %5, i64** %unionFirst, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType* %myUnion to i64**, !dbg !103
  %6 = load i64*, i64** %unionSecond, align 8, !dbg !103
  store i64* %6, i64** %data1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !106
  %8 = load i64*, i64** %data1, align 8, !dbg !107
  %9 = bitcast i64* %8 to i8*, !dbg !108
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !108
  %10 = bitcast i64* %arraydecay to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 16 %10, i64 800, i1 false), !dbg !108
  %11 = load i64*, i64** %data1, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i64, i64* %11, i64 0, !dbg !109
  %12 = load i64, i64* %arrayidx, align 8, !dbg !109
  call void @printLongLongLine(i64 %12), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_bad", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 29, type: !4)
!22 = !DILocation(line: 29, column: 15, scope: !17)
!23 = !DILocalVariable(name: "myUnion", scope: !17, file: !18, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_unionType", file: !18, line: 23, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !18, line: 19, size: 64, elements: !26)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !25, file: !18, line: 21, baseType: !4, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !25, file: !18, line: 22, baseType: !4, size: 64)
!29 = !DILocation(line: 30, column: 83, scope: !17)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 31, type: !4)
!31 = !DILocation(line: 31, column: 15, scope: !17)
!32 = !DILocation(line: 31, column: 42, scope: !17)
!33 = !DILocation(line: 31, column: 31, scope: !17)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 32, type: !4)
!35 = !DILocation(line: 32, column: 15, scope: !17)
!36 = !DILocation(line: 32, column: 43, scope: !17)
!37 = !DILocation(line: 32, column: 32, scope: !17)
!38 = !DILocation(line: 35, column: 12, scope: !17)
!39 = !DILocation(line: 35, column: 10, scope: !17)
!40 = !DILocation(line: 36, column: 26, scope: !17)
!41 = !DILocation(line: 36, column: 13, scope: !17)
!42 = !DILocation(line: 36, column: 24, scope: !17)
!43 = !DILocalVariable(name: "data", scope: !44, file: !18, line: 38, type: !4)
!44 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 19, scope: !44)
!46 = !DILocation(line: 38, column: 34, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !18, line: 40, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !18, line: 39, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 40, column: 21, scope: !48)
!53 = !DILocation(line: 42, column: 20, scope: !48)
!54 = !DILocation(line: 42, column: 13, scope: !48)
!55 = !DILocation(line: 43, column: 31, scope: !48)
!56 = !DILocation(line: 43, column: 13, scope: !48)
!57 = !DILocation(line: 46, column: 1, scope: !17)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_34_good", scope: !18, file: !18, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 75, column: 5, scope: !58)
!60 = !DILocation(line: 76, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 87, type: !62, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !18, line: 87, type: !64)
!69 = !DILocation(line: 87, column: 14, scope: !61)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !18, line: 87, type: !65)
!71 = !DILocation(line: 87, column: 27, scope: !61)
!72 = !DILocation(line: 90, column: 22, scope: !61)
!73 = !DILocation(line: 90, column: 12, scope: !61)
!74 = !DILocation(line: 90, column: 5, scope: !61)
!75 = !DILocation(line: 92, column: 5, scope: !61)
!76 = !DILocation(line: 93, column: 5, scope: !61)
!77 = !DILocation(line: 94, column: 5, scope: !61)
!78 = !DILocation(line: 97, column: 5, scope: !61)
!79 = !DILocation(line: 98, column: 5, scope: !61)
!80 = !DILocation(line: 99, column: 5, scope: !61)
!81 = !DILocation(line: 101, column: 5, scope: !61)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !18, line: 55, type: !4)
!84 = !DILocation(line: 55, column: 15, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !18, line: 56, type: !24)
!86 = !DILocation(line: 56, column: 83, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !18, line: 57, type: !4)
!88 = !DILocation(line: 57, column: 15, scope: !82)
!89 = !DILocation(line: 57, column: 42, scope: !82)
!90 = !DILocation(line: 57, column: 31, scope: !82)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !18, line: 58, type: !4)
!92 = !DILocation(line: 58, column: 15, scope: !82)
!93 = !DILocation(line: 58, column: 43, scope: !82)
!94 = !DILocation(line: 58, column: 32, scope: !82)
!95 = !DILocation(line: 60, column: 12, scope: !82)
!96 = !DILocation(line: 60, column: 10, scope: !82)
!97 = !DILocation(line: 61, column: 26, scope: !82)
!98 = !DILocation(line: 61, column: 13, scope: !82)
!99 = !DILocation(line: 61, column: 24, scope: !82)
!100 = !DILocalVariable(name: "data", scope: !101, file: !18, line: 63, type: !4)
!101 = distinct !DILexicalBlock(scope: !82, file: !18, line: 62, column: 5)
!102 = !DILocation(line: 63, column: 19, scope: !101)
!103 = !DILocation(line: 63, column: 34, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !18, line: 65, type: !49)
!105 = distinct !DILexicalBlock(scope: !101, file: !18, line: 64, column: 9)
!106 = !DILocation(line: 65, column: 21, scope: !105)
!107 = !DILocation(line: 67, column: 20, scope: !105)
!108 = !DILocation(line: 67, column: 13, scope: !105)
!109 = !DILocation(line: 68, column: 31, scope: !105)
!110 = !DILocation(line: 68, column: 13, scope: !105)
!111 = !DILocation(line: 71, column: 1, scope: !82)
