; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !23, metadata !DIExpression()), !dbg !25
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !26, metadata !DIExpression()), !dbg !27
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %4 = load i64**, i64*** %dataPtr1, align 8, !dbg !39
  %5 = load i64*, i64** %4, align 8, !dbg !40
  store i64* %5, i64** %data1, align 8, !dbg !38
  %6 = load i64*, i64** %dataBadBuffer, align 8, !dbg !41
  store i64* %6, i64** %data1, align 8, !dbg !42
  %7 = load i64*, i64** %data1, align 8, !dbg !43
  %8 = load i64**, i64*** %dataPtr1, align 8, !dbg !44
  store i64* %7, i64** %8, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %9 = load i64**, i64*** %dataPtr2, align 8, !dbg !49
  %10 = load i64*, i64** %9, align 8, !dbg !50
  store i64* %10, i64** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %11 = bitcast [100 x i64]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 800, i1 false), !dbg !56
  %12 = load i64*, i64** %data2, align 8, !dbg !57
  %13 = bitcast i64* %12 to i8*, !dbg !58
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !58
  %14 = bitcast i64* %arraydecay to i8*, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %13, i8* align 16 %14, i64 800, i1 false), !dbg !58
  %15 = load i64*, i64** %data2, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i64, i64* %15, i64 0, !dbg !59
  %16 = load i64, i64* %arrayidx, align 8, !dbg !59
  call void @printLongLongLine(i64 %16), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_good() #0 !dbg !62 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !89, metadata !DIExpression()), !dbg !90
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !91, metadata !DIExpression()), !dbg !92
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 400, align 16, !dbg !95
  %1 = bitcast i8* %0 to i64*, !dbg !96
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = alloca i8, i64 800, align 16, !dbg !99
  %3 = bitcast i8* %2 to i64*, !dbg !100
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = load i64**, i64*** %dataPtr1, align 8, !dbg !104
  %5 = load i64*, i64** %4, align 8, !dbg !105
  store i64* %5, i64** %data1, align 8, !dbg !103
  %6 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !106
  store i64* %6, i64** %data1, align 8, !dbg !107
  %7 = load i64*, i64** %data1, align 8, !dbg !108
  %8 = load i64**, i64*** %dataPtr1, align 8, !dbg !109
  store i64* %7, i64** %8, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !111, metadata !DIExpression()), !dbg !113
  %9 = load i64**, i64*** %dataPtr2, align 8, !dbg !114
  %10 = load i64*, i64** %9, align 8, !dbg !115
  store i64* %10, i64** %data2, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %11 = bitcast [100 x i64]* %source to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 800, i1 false), !dbg !118
  %12 = load i64*, i64** %data2, align 8, !dbg !119
  %13 = bitcast i64* %12 to i8*, !dbg !120
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !120
  %14 = bitcast i64* %arraydecay to i8*, !dbg !120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %13, i8* align 16 %14, i64 800, i1 false), !dbg !120
  %15 = load i64*, i64** %data2, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i64, i64* %15, i64 0, !dbg !121
  %16 = load i64, i64* %arrayidx, align 8, !dbg !121
  call void @printLongLongLine(i64 %16), !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataPtr1", scope: !17, file: !18, line: 24, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!25 = !DILocation(line: 24, column: 16, scope: !17)
!26 = !DILocalVariable(name: "dataPtr2", scope: !17, file: !18, line: 25, type: !24)
!27 = !DILocation(line: 25, column: 16, scope: !17)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !4)
!29 = !DILocation(line: 26, column: 15, scope: !17)
!30 = !DILocation(line: 26, column: 42, scope: !17)
!31 = !DILocation(line: 26, column: 31, scope: !17)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !4)
!33 = !DILocation(line: 27, column: 15, scope: !17)
!34 = !DILocation(line: 27, column: 43, scope: !17)
!35 = !DILocation(line: 27, column: 32, scope: !17)
!36 = !DILocalVariable(name: "data", scope: !37, file: !18, line: 29, type: !4)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 5)
!38 = !DILocation(line: 29, column: 19, scope: !37)
!39 = !DILocation(line: 29, column: 27, scope: !37)
!40 = !DILocation(line: 29, column: 26, scope: !37)
!41 = !DILocation(line: 32, column: 16, scope: !37)
!42 = !DILocation(line: 32, column: 14, scope: !37)
!43 = !DILocation(line: 33, column: 21, scope: !37)
!44 = !DILocation(line: 33, column: 10, scope: !37)
!45 = !DILocation(line: 33, column: 19, scope: !37)
!46 = !DILocalVariable(name: "data", scope: !47, file: !18, line: 36, type: !4)
!47 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!48 = !DILocation(line: 36, column: 19, scope: !47)
!49 = !DILocation(line: 36, column: 27, scope: !47)
!50 = !DILocation(line: 36, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !18, line: 38, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !18, line: 37, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 38, column: 21, scope: !52)
!57 = !DILocation(line: 40, column: 21, scope: !52)
!58 = !DILocation(line: 40, column: 13, scope: !52)
!59 = !DILocation(line: 41, column: 31, scope: !52)
!60 = !DILocation(line: 41, column: 13, scope: !52)
!61 = !DILocation(line: 44, column: 1, scope: !17)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_32_good", scope: !18, file: !18, line: 75, type: !19, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 77, column: 5, scope: !62)
!64 = !DILocation(line: 78, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 89, type: !66, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !18, line: 89, type: !68)
!73 = !DILocation(line: 89, column: 14, scope: !65)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !18, line: 89, type: !69)
!75 = !DILocation(line: 89, column: 27, scope: !65)
!76 = !DILocation(line: 92, column: 22, scope: !65)
!77 = !DILocation(line: 92, column: 12, scope: !65)
!78 = !DILocation(line: 92, column: 5, scope: !65)
!79 = !DILocation(line: 94, column: 5, scope: !65)
!80 = !DILocation(line: 95, column: 5, scope: !65)
!81 = !DILocation(line: 96, column: 5, scope: !65)
!82 = !DILocation(line: 99, column: 5, scope: !65)
!83 = !DILocation(line: 100, column: 5, scope: !65)
!84 = !DILocation(line: 101, column: 5, scope: !65)
!85 = !DILocation(line: 103, column: 5, scope: !65)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !18, line: 53, type: !4)
!88 = !DILocation(line: 53, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataPtr1", scope: !86, file: !18, line: 54, type: !24)
!90 = !DILocation(line: 54, column: 16, scope: !86)
!91 = !DILocalVariable(name: "dataPtr2", scope: !86, file: !18, line: 55, type: !24)
!92 = !DILocation(line: 55, column: 16, scope: !86)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !18, line: 56, type: !4)
!94 = !DILocation(line: 56, column: 15, scope: !86)
!95 = !DILocation(line: 56, column: 42, scope: !86)
!96 = !DILocation(line: 56, column: 31, scope: !86)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !18, line: 57, type: !4)
!98 = !DILocation(line: 57, column: 15, scope: !86)
!99 = !DILocation(line: 57, column: 43, scope: !86)
!100 = !DILocation(line: 57, column: 32, scope: !86)
!101 = !DILocalVariable(name: "data", scope: !102, file: !18, line: 59, type: !4)
!102 = distinct !DILexicalBlock(scope: !86, file: !18, line: 58, column: 5)
!103 = !DILocation(line: 59, column: 19, scope: !102)
!104 = !DILocation(line: 59, column: 27, scope: !102)
!105 = !DILocation(line: 59, column: 26, scope: !102)
!106 = !DILocation(line: 61, column: 16, scope: !102)
!107 = !DILocation(line: 61, column: 14, scope: !102)
!108 = !DILocation(line: 62, column: 21, scope: !102)
!109 = !DILocation(line: 62, column: 10, scope: !102)
!110 = !DILocation(line: 62, column: 19, scope: !102)
!111 = !DILocalVariable(name: "data", scope: !112, file: !18, line: 65, type: !4)
!112 = distinct !DILexicalBlock(scope: !86, file: !18, line: 64, column: 5)
!113 = !DILocation(line: 65, column: 19, scope: !112)
!114 = !DILocation(line: 65, column: 27, scope: !112)
!115 = !DILocation(line: 65, column: 26, scope: !112)
!116 = !DILocalVariable(name: "source", scope: !117, file: !18, line: 67, type: !53)
!117 = distinct !DILexicalBlock(scope: !112, file: !18, line: 66, column: 9)
!118 = !DILocation(line: 67, column: 21, scope: !117)
!119 = !DILocation(line: 69, column: 21, scope: !117)
!120 = !DILocation(line: 69, column: 13, scope: !117)
!121 = !DILocation(line: 70, column: 31, scope: !117)
!122 = !DILocation(line: 70, column: 13, scope: !117)
!123 = !DILocation(line: 73, column: 1, scope: !86)
