; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %4, i32** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !29, metadata !DIExpression()), !dbg !31
  %5 = load i32*, i32** %data, align 8, !dbg !32
  store i32* %5, i32** %dataCopy, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !33, metadata !DIExpression()), !dbg !34
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !35
  store i32* %6, i32** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %8, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !57
  %10 = load i32, i32* %arrayidx, align 4, !dbg !57
  %11 = load i32*, i32** %data1, align 8, !dbg !58
  %12 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !58
  store i32 %10, i32* %arrayidx2, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %13, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data1, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %14, i64 0, !dbg !67
  %15 = load i32, i32* %arrayidx3, align 4, !dbg !67
  call void @printIntLine(i32 %15), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 200, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %2 = alloca i8, i64 400, align 16, !dbg !102
  %3 = bitcast i8* %2 to i32*, !dbg !103
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !101
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !104
  store i32* %4, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  store i32* %5, i32** %dataCopy, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !110, metadata !DIExpression()), !dbg !111
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !112
  store i32* %6, i32** %data1, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %8, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !128
  %10 = load i32, i32* %arrayidx, align 4, !dbg !128
  %11 = load i32*, i32** %data1, align 8, !dbg !129
  %12 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !129
  store i32 %10, i32* %arrayidx2, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %13, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data1, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i32, i32* %14, i64 0, !dbg !137
  %15 = load i32, i32* %arrayidx3, align 4, !dbg !137
  call void @printIntLine(i32 %15), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 28, column: 12, scope: !13)
!28 = !DILocation(line: 28, column: 10, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 30, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!31 = !DILocation(line: 30, column: 15, scope: !30)
!32 = !DILocation(line: 30, column: 26, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 31, type: !4)
!34 = !DILocation(line: 31, column: 15, scope: !30)
!35 = !DILocation(line: 31, column: 22, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 32, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !14, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !14, line: 34, column: 13)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 35, column: 24, scope: !43)
!48 = !DILocation(line: 37, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !14, line: 37, column: 17)
!50 = !DILocation(line: 37, column: 22, scope: !49)
!51 = !DILocation(line: 37, column: 29, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 37, column: 17)
!53 = !DILocation(line: 37, column: 31, scope: !52)
!54 = !DILocation(line: 37, column: 17, scope: !49)
!55 = !DILocation(line: 39, column: 38, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 38, column: 17)
!57 = !DILocation(line: 39, column: 31, scope: !56)
!58 = !DILocation(line: 39, column: 21, scope: !56)
!59 = !DILocation(line: 39, column: 26, scope: !56)
!60 = !DILocation(line: 39, column: 29, scope: !56)
!61 = !DILocation(line: 40, column: 17, scope: !56)
!62 = !DILocation(line: 37, column: 39, scope: !52)
!63 = !DILocation(line: 37, column: 17, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 40, column: 17, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 41, column: 30, scope: !43)
!68 = !DILocation(line: 41, column: 17, scope: !43)
!69 = !DILocation(line: 45, column: 1, scope: !13)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_31_good", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 79, column: 5, scope: !70)
!72 = !DILocation(line: 80, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !74, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!5, !5, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 91, type: !5)
!80 = !DILocation(line: 91, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 91, type: !76)
!82 = !DILocation(line: 91, column: 27, scope: !73)
!83 = !DILocation(line: 94, column: 22, scope: !73)
!84 = !DILocation(line: 94, column: 12, scope: !73)
!85 = !DILocation(line: 94, column: 5, scope: !73)
!86 = !DILocation(line: 96, column: 5, scope: !73)
!87 = !DILocation(line: 97, column: 5, scope: !73)
!88 = !DILocation(line: 98, column: 5, scope: !73)
!89 = !DILocation(line: 101, column: 5, scope: !73)
!90 = !DILocation(line: 102, column: 5, scope: !73)
!91 = !DILocation(line: 103, column: 5, scope: !73)
!92 = !DILocation(line: 105, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 54, type: !4)
!95 = !DILocation(line: 54, column: 11, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 55, type: !4)
!97 = !DILocation(line: 55, column: 11, scope: !93)
!98 = !DILocation(line: 55, column: 34, scope: !93)
!99 = !DILocation(line: 55, column: 27, scope: !93)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 56, type: !4)
!101 = !DILocation(line: 56, column: 11, scope: !93)
!102 = !DILocation(line: 56, column: 35, scope: !93)
!103 = !DILocation(line: 56, column: 28, scope: !93)
!104 = !DILocation(line: 58, column: 12, scope: !93)
!105 = !DILocation(line: 58, column: 10, scope: !93)
!106 = !DILocalVariable(name: "dataCopy", scope: !107, file: !14, line: 60, type: !4)
!107 = distinct !DILexicalBlock(scope: !93, file: !14, line: 59, column: 5)
!108 = !DILocation(line: 60, column: 15, scope: !107)
!109 = !DILocation(line: 60, column: 26, scope: !107)
!110 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 61, type: !4)
!111 = !DILocation(line: 61, column: 15, scope: !107)
!112 = !DILocation(line: 61, column: 22, scope: !107)
!113 = !DILocalVariable(name: "source", scope: !114, file: !14, line: 63, type: !38)
!114 = distinct !DILexicalBlock(scope: !107, file: !14, line: 62, column: 9)
!115 = !DILocation(line: 63, column: 17, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !14, line: 65, type: !44)
!117 = distinct !DILexicalBlock(scope: !114, file: !14, line: 64, column: 13)
!118 = !DILocation(line: 65, column: 24, scope: !117)
!119 = !DILocation(line: 67, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !14, line: 67, column: 17)
!121 = !DILocation(line: 67, column: 22, scope: !120)
!122 = !DILocation(line: 67, column: 29, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 67, column: 17)
!124 = !DILocation(line: 67, column: 31, scope: !123)
!125 = !DILocation(line: 67, column: 17, scope: !120)
!126 = !DILocation(line: 69, column: 38, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !14, line: 68, column: 17)
!128 = !DILocation(line: 69, column: 31, scope: !127)
!129 = !DILocation(line: 69, column: 21, scope: !127)
!130 = !DILocation(line: 69, column: 26, scope: !127)
!131 = !DILocation(line: 69, column: 29, scope: !127)
!132 = !DILocation(line: 70, column: 17, scope: !127)
!133 = !DILocation(line: 67, column: 39, scope: !123)
!134 = !DILocation(line: 67, column: 17, scope: !123)
!135 = distinct !{!135, !125, !136, !66}
!136 = !DILocation(line: 70, column: 17, scope: !120)
!137 = !DILocation(line: 71, column: 30, scope: !117)
!138 = !DILocation(line: 71, column: 17, scope: !117)
!139 = !DILocation(line: 75, column: 1, scope: !93)
