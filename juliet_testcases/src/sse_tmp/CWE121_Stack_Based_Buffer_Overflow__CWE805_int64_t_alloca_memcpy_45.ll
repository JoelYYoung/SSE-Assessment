; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_goodG2BData = internal global i64* null, align 8, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !36
  store i64* %4, i64** %data, align 8, !dbg !37
  %5 = load i64*, i64** %data, align 8, !dbg !38
  store i64* %5, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #6, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #6, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_badData, align 8, !dbg !69
  store i64* %0, i64** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !70, metadata !DIExpression()), !dbg !75
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !75
  %2 = load i64*, i64** %data, align 8, !dbg !76
  %3 = bitcast i64* %2 to i8*, !dbg !77
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !77
  %4 = bitcast i64* %arraydecay to i8*, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !77
  %5 = load i64*, i64** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !78
  %6 = load i64, i64* %arrayidx, align 8, !dbg !78
  call void @printLongLongLine(i64 %6), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 400, align 16, !dbg !86
  %1 = bitcast i8* %0 to i64*, !dbg !87
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 800, align 16, !dbg !90
  %3 = bitcast i8* %2 to i64*, !dbg !91
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !92
  store i64* %4, i64** %data, align 8, !dbg !93
  %5 = load i64*, i64** %data, align 8, !dbg !94
  store i64* %5, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_goodG2BData, align 8, !dbg !95
  call void @goodG2BSink(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_goodG2BData, align 8, !dbg !101
  store i64* %0, i64** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !104
  %2 = load i64*, i64** %data, align 8, !dbg !105
  %3 = bitcast i64* %2 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !106
  %4 = bitcast i64* %arraydecay to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !106
  %5 = load i64*, i64** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !107
  %6 = load i64, i64* %arrayidx, align 8, !dbg !107
  call void @printLongLongLine(i64 %6), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_badData", scope: !2, file: !16, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_goodG2BData", scope: !2, file: !16, line: 20, type: !6, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45.c", directory: "/root/SSE-Assessment")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_bad", scope: !16, file: !16, line: 35, type: !24, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !16, line: 37, type: !6)
!27 = !DILocation(line: 37, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !16, line: 38, type: !6)
!29 = !DILocation(line: 38, column: 15, scope: !23)
!30 = !DILocation(line: 38, column: 42, scope: !23)
!31 = !DILocation(line: 38, column: 31, scope: !23)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !16, line: 39, type: !6)
!33 = !DILocation(line: 39, column: 15, scope: !23)
!34 = !DILocation(line: 39, column: 43, scope: !23)
!35 = !DILocation(line: 39, column: 32, scope: !23)
!36 = !DILocation(line: 42, column: 12, scope: !23)
!37 = !DILocation(line: 42, column: 10, scope: !23)
!38 = !DILocation(line: 43, column: 83, scope: !23)
!39 = !DILocation(line: 43, column: 81, scope: !23)
!40 = !DILocation(line: 44, column: 5, scope: !23)
!41 = !DILocation(line: 45, column: 1, scope: !23)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_45_good", scope: !16, file: !16, line: 74, type: !24, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 76, column: 5, scope: !42)
!44 = !DILocation(line: 77, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 88, type: !46, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !16, line: 88, type: !48)
!53 = !DILocation(line: 88, column: 14, scope: !45)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !16, line: 88, type: !49)
!55 = !DILocation(line: 88, column: 27, scope: !45)
!56 = !DILocation(line: 91, column: 22, scope: !45)
!57 = !DILocation(line: 91, column: 12, scope: !45)
!58 = !DILocation(line: 91, column: 5, scope: !45)
!59 = !DILocation(line: 93, column: 5, scope: !45)
!60 = !DILocation(line: 94, column: 5, scope: !45)
!61 = !DILocation(line: 95, column: 5, scope: !45)
!62 = !DILocation(line: 98, column: 5, scope: !45)
!63 = !DILocation(line: 99, column: 5, scope: !45)
!64 = !DILocation(line: 100, column: 5, scope: !45)
!65 = !DILocation(line: 102, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 24, type: !24, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !16, line: 26, type: !6)
!68 = !DILocation(line: 26, column: 15, scope: !66)
!69 = !DILocation(line: 26, column: 22, scope: !66)
!70 = !DILocalVariable(name: "source", scope: !71, file: !16, line: 28, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !16, line: 27, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 28, column: 17, scope: !71)
!76 = !DILocation(line: 30, column: 16, scope: !71)
!77 = !DILocation(line: 30, column: 9, scope: !71)
!78 = !DILocation(line: 31, column: 27, scope: !71)
!79 = !DILocation(line: 31, column: 9, scope: !71)
!80 = !DILocation(line: 33, column: 1, scope: !66)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 63, type: !24, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 65, type: !6)
!83 = !DILocation(line: 65, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !16, line: 66, type: !6)
!85 = !DILocation(line: 66, column: 15, scope: !81)
!86 = !DILocation(line: 66, column: 42, scope: !81)
!87 = !DILocation(line: 66, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !16, line: 67, type: !6)
!89 = !DILocation(line: 67, column: 15, scope: !81)
!90 = !DILocation(line: 67, column: 43, scope: !81)
!91 = !DILocation(line: 67, column: 32, scope: !81)
!92 = !DILocation(line: 69, column: 12, scope: !81)
!93 = !DILocation(line: 69, column: 10, scope: !81)
!94 = !DILocation(line: 70, column: 87, scope: !81)
!95 = !DILocation(line: 70, column: 85, scope: !81)
!96 = !DILocation(line: 71, column: 5, scope: !81)
!97 = !DILocation(line: 72, column: 1, scope: !81)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 52, type: !24, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 54, type: !6)
!100 = !DILocation(line: 54, column: 15, scope: !98)
!101 = !DILocation(line: 54, column: 22, scope: !98)
!102 = !DILocalVariable(name: "source", scope: !103, file: !16, line: 56, type: !72)
!103 = distinct !DILexicalBlock(scope: !98, file: !16, line: 55, column: 5)
!104 = !DILocation(line: 56, column: 17, scope: !103)
!105 = !DILocation(line: 58, column: 16, scope: !103)
!106 = !DILocation(line: 58, column: 9, scope: !103)
!107 = !DILocation(line: 59, column: 27, scope: !103)
!108 = !DILocation(line: 59, column: 9, scope: !103)
!109 = !DILocation(line: 61, column: 1, scope: !98)
