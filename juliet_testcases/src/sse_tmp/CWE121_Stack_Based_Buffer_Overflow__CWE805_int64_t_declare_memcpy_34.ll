; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType* %myUnion, metadata !23, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i64* %arraydecay, i64** %data, align 8, !dbg !41
  %0 = load i64*, i64** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType* %myUnion to i64**, !dbg !43
  store i64* %0, i64** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType* %myUnion to i64**, !dbg !48
  %1 = load i64*, i64** %unionSecond, align 8, !dbg !48
  store i64* %1, i64** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !51
  %3 = load i64*, i64** %data1, align 8, !dbg !52
  %4 = bitcast i64* %3 to i8*, !dbg !53
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !53
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !53
  %6 = load i64*, i64** %data1, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !54
  %7 = load i64, i64* %arrayidx, align 8, !dbg !54
  call void @printLongLongLine(i64 %7), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType* %myUnion, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i64* %arraydecay, i64** %data, align 8, !dbg !91
  %0 = load i64*, i64** %data, align 8, !dbg !92
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType* %myUnion to i64**, !dbg !93
  store i64* %0, i64** %unionFirst, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType* %myUnion to i64**, !dbg !98
  %1 = load i64*, i64** %unionSecond, align 8, !dbg !98
  store i64* %1, i64** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !101
  %3 = load i64*, i64** %data1, align 8, !dbg !102
  %4 = bitcast i64* %3 to i8*, !dbg !103
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !103
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !103
  %6 = load i64*, i64** %data1, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !104
  %7 = load i64, i64* %arrayidx, align 8, !dbg !104
  call void @printLongLongLine(i64 %7), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 29, column: 15, scope: !11)
!23 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_unionType", file: !12, line: 23, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !26)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !25, file: !12, line: 21, baseType: !16, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !25, file: !12, line: 22, baseType: !16, size: 64)
!29 = !DILocation(line: 30, column: 84, scope: !11)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 32, column: 13, scope: !11)
!40 = !DILocation(line: 35, column: 12, scope: !11)
!41 = !DILocation(line: 35, column: 10, scope: !11)
!42 = !DILocation(line: 36, column: 26, scope: !11)
!43 = !DILocation(line: 36, column: 13, scope: !11)
!44 = !DILocation(line: 36, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 38, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 34, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 40, type: !36)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 39, column: 9)
!51 = !DILocation(line: 40, column: 21, scope: !50)
!52 = !DILocation(line: 42, column: 20, scope: !50)
!53 = !DILocation(line: 42, column: 13, scope: !50)
!54 = !DILocation(line: 43, column: 31, scope: !50)
!55 = !DILocation(line: 43, column: 13, scope: !50)
!56 = !DILocation(line: 46, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_34_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 75, column: 5, scope: !57)
!59 = !DILocation(line: 76, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !61, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 87, type: !63)
!68 = !DILocation(line: 87, column: 14, scope: !60)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 87, type: !64)
!70 = !DILocation(line: 87, column: 27, scope: !60)
!71 = !DILocation(line: 90, column: 22, scope: !60)
!72 = !DILocation(line: 90, column: 12, scope: !60)
!73 = !DILocation(line: 90, column: 5, scope: !60)
!74 = !DILocation(line: 92, column: 5, scope: !60)
!75 = !DILocation(line: 93, column: 5, scope: !60)
!76 = !DILocation(line: 94, column: 5, scope: !60)
!77 = !DILocation(line: 97, column: 5, scope: !60)
!78 = !DILocation(line: 98, column: 5, scope: !60)
!79 = !DILocation(line: 99, column: 5, scope: !60)
!80 = !DILocation(line: 101, column: 5, scope: !60)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 55, type: !16)
!83 = !DILocation(line: 55, column: 15, scope: !81)
!84 = !DILocalVariable(name: "myUnion", scope: !81, file: !12, line: 56, type: !24)
!85 = !DILocation(line: 56, column: 84, scope: !81)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 57, type: !31)
!87 = !DILocation(line: 57, column: 13, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 58, type: !36)
!89 = !DILocation(line: 58, column: 13, scope: !81)
!90 = !DILocation(line: 60, column: 12, scope: !81)
!91 = !DILocation(line: 60, column: 10, scope: !81)
!92 = !DILocation(line: 61, column: 26, scope: !81)
!93 = !DILocation(line: 61, column: 13, scope: !81)
!94 = !DILocation(line: 61, column: 24, scope: !81)
!95 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 63, type: !16)
!96 = distinct !DILexicalBlock(scope: !81, file: !12, line: 62, column: 5)
!97 = !DILocation(line: 63, column: 19, scope: !96)
!98 = !DILocation(line: 63, column: 34, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !12, line: 65, type: !36)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 64, column: 9)
!101 = !DILocation(line: 65, column: 21, scope: !100)
!102 = !DILocation(line: 67, column: 20, scope: !100)
!103 = !DILocation(line: 67, column: 13, scope: !100)
!104 = !DILocation(line: 68, column: 31, scope: !100)
!105 = !DILocation(line: 68, column: 13, scope: !100)
!106 = !DILocation(line: 71, column: 1, scope: !81)
