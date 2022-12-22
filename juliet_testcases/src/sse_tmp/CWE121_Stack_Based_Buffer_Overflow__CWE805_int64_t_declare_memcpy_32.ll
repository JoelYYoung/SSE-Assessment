; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !23, metadata !DIExpression()), !dbg !25
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !26, metadata !DIExpression()), !dbg !27
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !41
  %1 = load i64*, i64** %0, align 8, !dbg !42
  store i64* %1, i64** %data1, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i64* %arraydecay, i64** %data1, align 8, !dbg !44
  %2 = load i64*, i64** %data1, align 8, !dbg !45
  %3 = load i64**, i64*** %dataPtr1, align 8, !dbg !46
  store i64* %2, i64** %3, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %4 = load i64**, i64*** %dataPtr2, align 8, !dbg !51
  %5 = load i64*, i64** %4, align 8, !dbg !52
  store i64* %5, i64** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !55
  %7 = load i64*, i64** %data2, align 8, !dbg !56
  %8 = bitcast i64* %7 to i8*, !dbg !57
  %arraydecay3 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !57
  %9 = bitcast i64* %arraydecay3 to i8*, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !57
  %10 = load i64*, i64** %data2, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !58
  %11 = load i64, i64* %arrayidx, align 8, !dbg !58
  call void @printLongLongLine(i64 %11), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !99
  %1 = load i64*, i64** %0, align 8, !dbg !100
  store i64* %1, i64** %data1, align 8, !dbg !98
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i64* %arraydecay, i64** %data1, align 8, !dbg !102
  %2 = load i64*, i64** %data1, align 8, !dbg !103
  %3 = load i64**, i64*** %dataPtr1, align 8, !dbg !104
  store i64* %2, i64** %3, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !106, metadata !DIExpression()), !dbg !108
  %4 = load i64**, i64*** %dataPtr2, align 8, !dbg !109
  %5 = load i64*, i64** %4, align 8, !dbg !110
  store i64* %5, i64** %data2, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !113
  %7 = load i64*, i64** %data2, align 8, !dbg !114
  %8 = bitcast i64* %7 to i8*, !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !115
  %9 = bitcast i64* %arraydecay3 to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %9, i64 800, i1 false), !dbg !115
  %10 = load i64*, i64** %data2, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 0, !dbg !116
  %11 = load i64, i64* %arrayidx, align 8, !dbg !116
  call void @printLongLongLine(i64 %11), !dbg !117
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!25 = !DILocation(line: 24, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !24)
!27 = !DILocation(line: 25, column: 16, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 26, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 27, column: 13, scope: !11)
!38 = !DILocalVariable(name: "data", scope: !39, file: !12, line: 29, type: !16)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!40 = !DILocation(line: 29, column: 19, scope: !39)
!41 = !DILocation(line: 29, column: 27, scope: !39)
!42 = !DILocation(line: 29, column: 26, scope: !39)
!43 = !DILocation(line: 32, column: 16, scope: !39)
!44 = !DILocation(line: 32, column: 14, scope: !39)
!45 = !DILocation(line: 33, column: 21, scope: !39)
!46 = !DILocation(line: 33, column: 10, scope: !39)
!47 = !DILocation(line: 33, column: 19, scope: !39)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 36, type: !16)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!50 = !DILocation(line: 36, column: 19, scope: !49)
!51 = !DILocation(line: 36, column: 27, scope: !49)
!52 = !DILocation(line: 36, column: 26, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 38, type: !34)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 37, column: 9)
!55 = !DILocation(line: 38, column: 21, scope: !54)
!56 = !DILocation(line: 40, column: 20, scope: !54)
!57 = !DILocation(line: 40, column: 13, scope: !54)
!58 = !DILocation(line: 41, column: 31, scope: !54)
!59 = !DILocation(line: 41, column: 13, scope: !54)
!60 = !DILocation(line: 44, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_32_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 77, column: 5, scope: !61)
!63 = !DILocation(line: 78, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !65, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 89, type: !67)
!72 = !DILocation(line: 89, column: 14, scope: !64)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 89, type: !68)
!74 = !DILocation(line: 89, column: 27, scope: !64)
!75 = !DILocation(line: 92, column: 22, scope: !64)
!76 = !DILocation(line: 92, column: 12, scope: !64)
!77 = !DILocation(line: 92, column: 5, scope: !64)
!78 = !DILocation(line: 94, column: 5, scope: !64)
!79 = !DILocation(line: 95, column: 5, scope: !64)
!80 = !DILocation(line: 96, column: 5, scope: !64)
!81 = !DILocation(line: 99, column: 5, scope: !64)
!82 = !DILocation(line: 100, column: 5, scope: !64)
!83 = !DILocation(line: 101, column: 5, scope: !64)
!84 = !DILocation(line: 103, column: 5, scope: !64)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 53, type: !16)
!87 = !DILocation(line: 53, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !12, line: 54, type: !24)
!89 = !DILocation(line: 54, column: 16, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !12, line: 55, type: !24)
!91 = !DILocation(line: 55, column: 16, scope: !85)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 56, type: !29)
!93 = !DILocation(line: 56, column: 13, scope: !85)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 57, type: !34)
!95 = !DILocation(line: 57, column: 13, scope: !85)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 59, type: !16)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 58, column: 5)
!98 = !DILocation(line: 59, column: 19, scope: !97)
!99 = !DILocation(line: 59, column: 27, scope: !97)
!100 = !DILocation(line: 59, column: 26, scope: !97)
!101 = !DILocation(line: 61, column: 16, scope: !97)
!102 = !DILocation(line: 61, column: 14, scope: !97)
!103 = !DILocation(line: 62, column: 21, scope: !97)
!104 = !DILocation(line: 62, column: 10, scope: !97)
!105 = !DILocation(line: 62, column: 19, scope: !97)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 65, type: !16)
!107 = distinct !DILexicalBlock(scope: !85, file: !12, line: 64, column: 5)
!108 = !DILocation(line: 65, column: 19, scope: !107)
!109 = !DILocation(line: 65, column: 27, scope: !107)
!110 = !DILocation(line: 65, column: 26, scope: !107)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 67, type: !34)
!112 = distinct !DILexicalBlock(scope: !107, file: !12, line: 66, column: 9)
!113 = !DILocation(line: 67, column: 21, scope: !112)
!114 = !DILocation(line: 69, column: 20, scope: !112)
!115 = !DILocation(line: 69, column: 13, scope: !112)
!116 = !DILocation(line: 70, column: 31, scope: !112)
!117 = !DILocation(line: 70, column: 13, scope: !112)
!118 = !DILocation(line: 73, column: 1, scope: !85)
