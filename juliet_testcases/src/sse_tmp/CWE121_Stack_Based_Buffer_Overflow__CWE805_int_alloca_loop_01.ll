; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %6, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !50
  %8 = load i32, i32* %arrayidx, align 4, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !51
  %10 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !51
  store i32 %8, i32* %arrayidx1, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %11, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !60
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !60
  call void @printIntLine(i32 %13), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 200, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %2 = alloca i8, i64 400, align 16, !dbg !95
  %3 = bitcast i8* %2 to i32*, !dbg !96
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !94
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !97
  store i32* %4, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !108
  %cmp = icmp ult i64 %6, 100, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !114
  %8 = load i32, i32* %arrayidx, align 4, !dbg !114
  %9 = load i32*, i32** %data, align 8, !dbg !115
  %10 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !115
  store i32 %8, i32* %arrayidx1, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %11, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !123
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !123
  call void @printIntLine(i32 %13), !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 30, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 30, column: 13, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !30, file: !14, line: 31, column: 9)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 32, column: 20, scope: !36)
!41 = !DILocation(line: 34, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !14, line: 34, column: 13)
!43 = !DILocation(line: 34, column: 18, scope: !42)
!44 = !DILocation(line: 34, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !14, line: 34, column: 13)
!46 = !DILocation(line: 34, column: 27, scope: !45)
!47 = !DILocation(line: 34, column: 13, scope: !42)
!48 = !DILocation(line: 36, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !14, line: 35, column: 13)
!50 = !DILocation(line: 36, column: 27, scope: !49)
!51 = !DILocation(line: 36, column: 17, scope: !49)
!52 = !DILocation(line: 36, column: 22, scope: !49)
!53 = !DILocation(line: 36, column: 25, scope: !49)
!54 = !DILocation(line: 37, column: 13, scope: !49)
!55 = !DILocation(line: 34, column: 35, scope: !45)
!56 = !DILocation(line: 34, column: 13, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 37, column: 13, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 38, column: 26, scope: !36)
!61 = !DILocation(line: 38, column: 13, scope: !36)
!62 = !DILocation(line: 41, column: 1, scope: !13)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_01_good", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 71, column: 5, scope: !63)
!65 = !DILocation(line: 72, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 84, type: !67, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!5, !5, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !14, line: 84, type: !5)
!73 = !DILocation(line: 84, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !14, line: 84, type: !69)
!75 = !DILocation(line: 84, column: 27, scope: !66)
!76 = !DILocation(line: 87, column: 22, scope: !66)
!77 = !DILocation(line: 87, column: 12, scope: !66)
!78 = !DILocation(line: 87, column: 5, scope: !66)
!79 = !DILocation(line: 89, column: 5, scope: !66)
!80 = !DILocation(line: 90, column: 5, scope: !66)
!81 = !DILocation(line: 91, column: 5, scope: !66)
!82 = !DILocation(line: 94, column: 5, scope: !66)
!83 = !DILocation(line: 95, column: 5, scope: !66)
!84 = !DILocation(line: 96, column: 5, scope: !66)
!85 = !DILocation(line: 98, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 50, type: !4)
!88 = !DILocation(line: 50, column: 11, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !14, line: 51, type: !4)
!90 = !DILocation(line: 51, column: 11, scope: !86)
!91 = !DILocation(line: 51, column: 34, scope: !86)
!92 = !DILocation(line: 51, column: 27, scope: !86)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !14, line: 52, type: !4)
!94 = !DILocation(line: 52, column: 11, scope: !86)
!95 = !DILocation(line: 52, column: 35, scope: !86)
!96 = !DILocation(line: 52, column: 28, scope: !86)
!97 = !DILocation(line: 54, column: 12, scope: !86)
!98 = !DILocation(line: 54, column: 10, scope: !86)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 56, type: !31)
!100 = distinct !DILexicalBlock(scope: !86, file: !14, line: 55, column: 5)
!101 = !DILocation(line: 56, column: 13, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !14, line: 58, type: !37)
!103 = distinct !DILexicalBlock(scope: !100, file: !14, line: 57, column: 9)
!104 = !DILocation(line: 58, column: 20, scope: !103)
!105 = !DILocation(line: 60, column: 20, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !14, line: 60, column: 13)
!107 = !DILocation(line: 60, column: 18, scope: !106)
!108 = !DILocation(line: 60, column: 25, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !14, line: 60, column: 13)
!110 = !DILocation(line: 60, column: 27, scope: !109)
!111 = !DILocation(line: 60, column: 13, scope: !106)
!112 = !DILocation(line: 62, column: 34, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !14, line: 61, column: 13)
!114 = !DILocation(line: 62, column: 27, scope: !113)
!115 = !DILocation(line: 62, column: 17, scope: !113)
!116 = !DILocation(line: 62, column: 22, scope: !113)
!117 = !DILocation(line: 62, column: 25, scope: !113)
!118 = !DILocation(line: 63, column: 13, scope: !113)
!119 = !DILocation(line: 60, column: 35, scope: !109)
!120 = !DILocation(line: 60, column: 13, scope: !109)
!121 = distinct !{!121, !111, !122, !59}
!122 = !DILocation(line: 63, column: 13, scope: !106)
!123 = !DILocation(line: 64, column: 26, scope: !103)
!124 = !DILocation(line: 64, column: 13, scope: !103)
!125 = !DILocation(line: 67, column: 1, scope: !86)
