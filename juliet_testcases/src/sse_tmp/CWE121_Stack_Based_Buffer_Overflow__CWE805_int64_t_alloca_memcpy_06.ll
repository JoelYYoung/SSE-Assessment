; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !31
  store i64* %4, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !40
  %6 = load i64*, i64** %data, align 8, !dbg !41
  %7 = bitcast i64* %6 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !42
  %8 = bitcast i64* %arraydecay to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !42
  %9 = load i64*, i64** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !43
  %10 = load i64, i64* %arrayidx, align 8, !dbg !43
  call void @printLongLongLine(i64 %10), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 400, align 16, !dbg !76
  %1 = bitcast i8* %0 to i64*, !dbg !77
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = alloca i8, i64 800, align 16, !dbg !80
  %3 = bitcast i8* %2 to i64*, !dbg !81
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !79
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !82
  store i64* %4, i64** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !88
  %6 = load i64*, i64** %data, align 8, !dbg !89
  %7 = bitcast i64* %6 to i8*, !dbg !90
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !90
  %8 = bitcast i64* %arraydecay to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !90
  %9 = load i64*, i64** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !91
  %10 = load i64, i64* %arrayidx, align 8, !dbg !91
  call void @printLongLongLine(i64 %10), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i64*, !dbg !100
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 800, align 16, !dbg !103
  %3 = bitcast i8* %2 to i64*, !dbg !104
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !102
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !105
  store i64* %4, i64** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !111
  %6 = load i64*, i64** %data, align 8, !dbg !112
  %7 = bitcast i64* %6 to i8*, !dbg !113
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !113
  %8 = bitcast i64* %arraydecay to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !113
  %9 = load i64*, i64** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !114
  %10 = load i64, i64* %arrayidx, align 8, !dbg !114
  call void @printLongLongLine(i64 %10), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06_bad", scope: !18, file: !18, line: 25, type: !19, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 27, type: !4)
!22 = !DILocation(line: 27, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 28, type: !4)
!24 = !DILocation(line: 28, column: 15, scope: !17)
!25 = !DILocation(line: 28, column: 42, scope: !17)
!26 = !DILocation(line: 28, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 15, scope: !17)
!29 = !DILocation(line: 29, column: 43, scope: !17)
!30 = !DILocation(line: 29, column: 32, scope: !17)
!31 = !DILocation(line: 34, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !18, line: 31, column: 5)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 30, column: 8)
!34 = !DILocation(line: 34, column: 14, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !18, line: 37, type: !37)
!36 = distinct !DILexicalBlock(scope: !17, file: !18, line: 36, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 37, column: 17, scope: !36)
!41 = !DILocation(line: 39, column: 16, scope: !36)
!42 = !DILocation(line: 39, column: 9, scope: !36)
!43 = !DILocation(line: 40, column: 27, scope: !36)
!44 = !DILocation(line: 40, column: 9, scope: !36)
!45 = !DILocation(line: 42, column: 1, scope: !17)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_06_good", scope: !18, file: !18, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 93, column: 5, scope: !46)
!48 = !DILocation(line: 94, column: 5, scope: !46)
!49 = !DILocation(line: 95, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 107, type: !51, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !18, line: 107, type: !53)
!58 = !DILocation(line: 107, column: 14, scope: !50)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !18, line: 107, type: !54)
!60 = !DILocation(line: 107, column: 27, scope: !50)
!61 = !DILocation(line: 110, column: 22, scope: !50)
!62 = !DILocation(line: 110, column: 12, scope: !50)
!63 = !DILocation(line: 110, column: 5, scope: !50)
!64 = !DILocation(line: 112, column: 5, scope: !50)
!65 = !DILocation(line: 113, column: 5, scope: !50)
!66 = !DILocation(line: 114, column: 5, scope: !50)
!67 = !DILocation(line: 117, column: 5, scope: !50)
!68 = !DILocation(line: 118, column: 5, scope: !50)
!69 = !DILocation(line: 119, column: 5, scope: !50)
!70 = !DILocation(line: 121, column: 5, scope: !50)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 49, type: !19, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !18, line: 51, type: !4)
!73 = !DILocation(line: 51, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !18, line: 52, type: !4)
!75 = !DILocation(line: 52, column: 15, scope: !71)
!76 = !DILocation(line: 52, column: 42, scope: !71)
!77 = !DILocation(line: 52, column: 31, scope: !71)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !18, line: 53, type: !4)
!79 = !DILocation(line: 53, column: 15, scope: !71)
!80 = !DILocation(line: 53, column: 43, scope: !71)
!81 = !DILocation(line: 53, column: 32, scope: !71)
!82 = !DILocation(line: 62, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !18, line: 60, column: 5)
!84 = distinct !DILexicalBlock(scope: !71, file: !18, line: 54, column: 8)
!85 = !DILocation(line: 62, column: 14, scope: !83)
!86 = !DILocalVariable(name: "source", scope: !87, file: !18, line: 65, type: !37)
!87 = distinct !DILexicalBlock(scope: !71, file: !18, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 17, scope: !87)
!89 = !DILocation(line: 67, column: 16, scope: !87)
!90 = !DILocation(line: 67, column: 9, scope: !87)
!91 = !DILocation(line: 68, column: 27, scope: !87)
!92 = !DILocation(line: 68, column: 9, scope: !87)
!93 = !DILocation(line: 70, column: 1, scope: !71)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !18, line: 75, type: !4)
!96 = !DILocation(line: 75, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !18, line: 76, type: !4)
!98 = !DILocation(line: 76, column: 15, scope: !94)
!99 = !DILocation(line: 76, column: 42, scope: !94)
!100 = !DILocation(line: 76, column: 31, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !18, line: 77, type: !4)
!102 = !DILocation(line: 77, column: 15, scope: !94)
!103 = !DILocation(line: 77, column: 43, scope: !94)
!104 = !DILocation(line: 77, column: 32, scope: !94)
!105 = !DILocation(line: 81, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !18, line: 79, column: 5)
!107 = distinct !DILexicalBlock(scope: !94, file: !18, line: 78, column: 8)
!108 = !DILocation(line: 81, column: 14, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !18, line: 84, type: !37)
!110 = distinct !DILexicalBlock(scope: !94, file: !18, line: 83, column: 5)
!111 = !DILocation(line: 84, column: 17, scope: !110)
!112 = !DILocation(line: 86, column: 16, scope: !110)
!113 = !DILocation(line: 86, column: 9, scope: !110)
!114 = !DILocation(line: 87, column: 27, scope: !110)
!115 = !DILocation(line: 87, column: 9, scope: !110)
!116 = !DILocation(line: 89, column: 1, scope: !94)
