; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
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
  store i64* %4, i64** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %6, 100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !54
  %8 = load i64, i64* %arrayidx, align 8, !dbg !54
  %9 = load i64*, i64** %data, align 8, !dbg !55
  %10 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !55
  store i64 %8, i64* %arrayidx1, align 8, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %11, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !64
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !64
  call void @printLongLongLine(i64 %13), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 400, align 16, !dbg !96
  %1 = bitcast i8* %0 to i64*, !dbg !97
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %2 = alloca i8, i64 800, align 16, !dbg !100
  %3 = bitcast i8* %2 to i64*, !dbg !101
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !99
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !102
  store i64* %4, i64** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %6, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !119
  %8 = load i64, i64* %arrayidx, align 8, !dbg !119
  %9 = load i64*, i64** %data, align 8, !dbg !120
  %10 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !120
  store i64 %8, i64* %arrayidx1, align 8, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %11, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !128
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !128
  call void @printLongLongLine(i64 %13), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 15, scope: !17)
!25 = !DILocation(line: 24, column: 42, scope: !17)
!26 = !DILocation(line: 24, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 15, scope: !17)
!29 = !DILocation(line: 25, column: 43, scope: !17)
!30 = !DILocation(line: 25, column: 32, scope: !17)
!31 = !DILocation(line: 28, column: 12, scope: !17)
!32 = !DILocation(line: 28, column: 10, scope: !17)
!33 = !DILocalVariable(name: "source", scope: !34, file: !18, line: 30, type: !35)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 30, column: 17, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !18, line: 32, type: !41)
!40 = distinct !DILexicalBlock(scope: !34, file: !18, line: 31, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 32, column: 20, scope: !40)
!45 = !DILocation(line: 34, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !18, line: 34, column: 13)
!47 = !DILocation(line: 34, column: 18, scope: !46)
!48 = !DILocation(line: 34, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !18, line: 34, column: 13)
!50 = !DILocation(line: 34, column: 27, scope: !49)
!51 = !DILocation(line: 34, column: 13, scope: !46)
!52 = !DILocation(line: 36, column: 34, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !18, line: 35, column: 13)
!54 = !DILocation(line: 36, column: 27, scope: !53)
!55 = !DILocation(line: 36, column: 17, scope: !53)
!56 = !DILocation(line: 36, column: 22, scope: !53)
!57 = !DILocation(line: 36, column: 25, scope: !53)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 34, column: 35, scope: !49)
!60 = !DILocation(line: 34, column: 13, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 37, column: 13, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 38, column: 31, scope: !40)
!65 = !DILocation(line: 38, column: 13, scope: !40)
!66 = !DILocation(line: 41, column: 1, scope: !17)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_01_good", scope: !18, file: !18, line: 69, type: !19, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 71, column: 5, scope: !67)
!69 = !DILocation(line: 72, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 84, type: !71, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !74}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !18, line: 84, type: !73)
!78 = !DILocation(line: 84, column: 14, scope: !70)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !18, line: 84, type: !74)
!80 = !DILocation(line: 84, column: 27, scope: !70)
!81 = !DILocation(line: 87, column: 22, scope: !70)
!82 = !DILocation(line: 87, column: 12, scope: !70)
!83 = !DILocation(line: 87, column: 5, scope: !70)
!84 = !DILocation(line: 89, column: 5, scope: !70)
!85 = !DILocation(line: 90, column: 5, scope: !70)
!86 = !DILocation(line: 91, column: 5, scope: !70)
!87 = !DILocation(line: 94, column: 5, scope: !70)
!88 = !DILocation(line: 95, column: 5, scope: !70)
!89 = !DILocation(line: 96, column: 5, scope: !70)
!90 = !DILocation(line: 98, column: 5, scope: !70)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !18, line: 50, type: !4)
!93 = !DILocation(line: 50, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !18, line: 51, type: !4)
!95 = !DILocation(line: 51, column: 15, scope: !91)
!96 = !DILocation(line: 51, column: 42, scope: !91)
!97 = !DILocation(line: 51, column: 31, scope: !91)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !18, line: 52, type: !4)
!99 = !DILocation(line: 52, column: 15, scope: !91)
!100 = !DILocation(line: 52, column: 43, scope: !91)
!101 = !DILocation(line: 52, column: 32, scope: !91)
!102 = !DILocation(line: 54, column: 12, scope: !91)
!103 = !DILocation(line: 54, column: 10, scope: !91)
!104 = !DILocalVariable(name: "source", scope: !105, file: !18, line: 56, type: !35)
!105 = distinct !DILexicalBlock(scope: !91, file: !18, line: 55, column: 5)
!106 = !DILocation(line: 56, column: 17, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !108, file: !18, line: 58, type: !41)
!108 = distinct !DILexicalBlock(scope: !105, file: !18, line: 57, column: 9)
!109 = !DILocation(line: 58, column: 20, scope: !108)
!110 = !DILocation(line: 60, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !18, line: 60, column: 13)
!112 = !DILocation(line: 60, column: 18, scope: !111)
!113 = !DILocation(line: 60, column: 25, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !18, line: 60, column: 13)
!115 = !DILocation(line: 60, column: 27, scope: !114)
!116 = !DILocation(line: 60, column: 13, scope: !111)
!117 = !DILocation(line: 62, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !18, line: 61, column: 13)
!119 = !DILocation(line: 62, column: 27, scope: !118)
!120 = !DILocation(line: 62, column: 17, scope: !118)
!121 = !DILocation(line: 62, column: 22, scope: !118)
!122 = !DILocation(line: 62, column: 25, scope: !118)
!123 = !DILocation(line: 63, column: 13, scope: !118)
!124 = !DILocation(line: 60, column: 35, scope: !114)
!125 = !DILocation(line: 60, column: 13, scope: !114)
!126 = distinct !{!126, !116, !127, !63}
!127 = !DILocation(line: 63, column: 13, scope: !111)
!128 = !DILocation(line: 64, column: 31, scope: !108)
!129 = !DILocation(line: 64, column: 13, scope: !108)
!130 = !DILocation(line: 67, column: 1, scope: !91)
