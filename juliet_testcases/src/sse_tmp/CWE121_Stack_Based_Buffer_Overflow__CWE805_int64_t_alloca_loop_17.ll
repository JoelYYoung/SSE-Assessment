; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17_bad() #0 !dbg !17 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i64*, !dbg !29
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 800, align 16, !dbg !32
  %3 = bitcast i8* %2 to i64*, !dbg !33
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !37
  %cmp = icmp slt i32 %4, 1, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !41
  store i64* %5, i64** %data, align 8, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %6, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !56, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond2, !dbg !64

for.cond2:                                        ; preds = %for.inc6, %for.end
  %8 = load i64, i64* %i1, align 8, !dbg !65
  %cmp3 = icmp ult i64 %8, 100, !dbg !67
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !68

for.body4:                                        ; preds = %for.cond2
  %9 = load i64, i64* %i1, align 8, !dbg !69
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %9, !dbg !71
  %10 = load i64, i64* %arrayidx, align 8, !dbg !71
  %11 = load i64*, i64** %data, align 8, !dbg !72
  %12 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds i64, i64* %11, i64 %12, !dbg !72
  store i64 %10, i64* %arrayidx5, align 8, !dbg !74
  br label %for.inc6, !dbg !75

for.inc6:                                         ; preds = %for.body4
  %13 = load i64, i64* %i1, align 8, !dbg !76
  %inc7 = add i64 %13, 1, !dbg !76
  store i64 %inc7, i64* %i1, align 8, !dbg !76
  br label %for.cond2, !dbg !77, !llvm.loop !78

for.end8:                                         ; preds = %for.cond2
  %14 = load i64*, i64** %data, align 8, !dbg !80
  %arrayidx9 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !80
  %15 = load i64, i64* %arrayidx9, align 8, !dbg !80
  call void @printLongLongLine(i64 %15), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #5, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #5, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 400, align 16, !dbg !113
  %1 = bitcast i8* %0 to i64*, !dbg !114
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 800, align 16, !dbg !117
  %3 = bitcast i8* %2 to i64*, !dbg !118
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !116
  store i32 0, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !122
  %cmp = icmp slt i32 %4, 1, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !126
  store i64* %5, i64** %data, align 8, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !130
  %inc = add nsw i32 %6, 1, !dbg !130
  store i32 %inc, i32* %h, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond1, !dbg !142

for.cond1:                                        ; preds = %for.inc5, %for.end
  %8 = load i64, i64* %i, align 8, !dbg !143
  %cmp2 = icmp ult i64 %8, 100, !dbg !145
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !146

for.body3:                                        ; preds = %for.cond1
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %9, !dbg !149
  %10 = load i64, i64* %arrayidx, align 8, !dbg !149
  %11 = load i64*, i64** %data, align 8, !dbg !150
  %12 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx4 = getelementptr inbounds i64, i64* %11, i64 %12, !dbg !150
  store i64 %10, i64* %arrayidx4, align 8, !dbg !152
  br label %for.inc5, !dbg !153

for.inc5:                                         ; preds = %for.body3
  %13 = load i64, i64* %i, align 8, !dbg !154
  %inc6 = add i64 %13, 1, !dbg !154
  store i64 %inc6, i64* %i, align 8, !dbg !154
  br label %for.cond1, !dbg !155, !llvm.loop !156

for.end7:                                         ; preds = %for.cond1
  %14 = load i64*, i64** %data, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !158
  %15 = load i64, i64* %arrayidx8, align 8, !dbg !158
  call void @printLongLongLine(i64 %15), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "i", scope: !17, file: !18, line: 23, type: !22)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 23, column: 9, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 24, type: !4)
!25 = !DILocation(line: 24, column: 15, scope: !17)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 25, type: !4)
!27 = !DILocation(line: 25, column: 15, scope: !17)
!28 = !DILocation(line: 25, column: 42, scope: !17)
!29 = !DILocation(line: 25, column: 31, scope: !17)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 26, type: !4)
!31 = !DILocation(line: 26, column: 15, scope: !17)
!32 = !DILocation(line: 26, column: 43, scope: !17)
!33 = !DILocation(line: 26, column: 32, scope: !17)
!34 = !DILocation(line: 27, column: 11, scope: !35)
!35 = distinct !DILexicalBlock(scope: !17, file: !18, line: 27, column: 5)
!36 = !DILocation(line: 27, column: 9, scope: !35)
!37 = !DILocation(line: 27, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !18, line: 27, column: 5)
!39 = !DILocation(line: 27, column: 18, scope: !38)
!40 = !DILocation(line: 27, column: 5, scope: !35)
!41 = !DILocation(line: 31, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !18, line: 28, column: 5)
!43 = !DILocation(line: 31, column: 14, scope: !42)
!44 = !DILocation(line: 32, column: 5, scope: !42)
!45 = !DILocation(line: 27, column: 24, scope: !38)
!46 = !DILocation(line: 27, column: 5, scope: !38)
!47 = distinct !{!47, !40, !48, !49}
!48 = !DILocation(line: 32, column: 5, scope: !35)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !18, line: 34, type: !52)
!51 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 34, column: 17, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !57, file: !18, line: 36, type: !58)
!57 = distinct !DILexicalBlock(scope: !51, file: !18, line: 35, column: 9)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 46, baseType: !60)
!59 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 36, column: 20, scope: !57)
!62 = !DILocation(line: 38, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !18, line: 38, column: 13)
!64 = !DILocation(line: 38, column: 18, scope: !63)
!65 = !DILocation(line: 38, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !18, line: 38, column: 13)
!67 = !DILocation(line: 38, column: 27, scope: !66)
!68 = !DILocation(line: 38, column: 13, scope: !63)
!69 = !DILocation(line: 40, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !18, line: 39, column: 13)
!71 = !DILocation(line: 40, column: 27, scope: !70)
!72 = !DILocation(line: 40, column: 17, scope: !70)
!73 = !DILocation(line: 40, column: 22, scope: !70)
!74 = !DILocation(line: 40, column: 25, scope: !70)
!75 = !DILocation(line: 41, column: 13, scope: !70)
!76 = !DILocation(line: 38, column: 35, scope: !66)
!77 = !DILocation(line: 38, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !49}
!79 = !DILocation(line: 41, column: 13, scope: !63)
!80 = !DILocation(line: 42, column: 31, scope: !57)
!81 = !DILocation(line: 42, column: 13, scope: !57)
!82 = !DILocation(line: 45, column: 1, scope: !17)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_17_good", scope: !18, file: !18, line: 77, type: !19, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 79, column: 5, scope: !83)
!85 = !DILocation(line: 80, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 92, type: !87, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!22, !22, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !18, line: 92, type: !22)
!93 = !DILocation(line: 92, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !18, line: 92, type: !89)
!95 = !DILocation(line: 92, column: 27, scope: !86)
!96 = !DILocation(line: 95, column: 22, scope: !86)
!97 = !DILocation(line: 95, column: 12, scope: !86)
!98 = !DILocation(line: 95, column: 5, scope: !86)
!99 = !DILocation(line: 97, column: 5, scope: !86)
!100 = !DILocation(line: 98, column: 5, scope: !86)
!101 = !DILocation(line: 99, column: 5, scope: !86)
!102 = !DILocation(line: 102, column: 5, scope: !86)
!103 = !DILocation(line: 103, column: 5, scope: !86)
!104 = !DILocation(line: 104, column: 5, scope: !86)
!105 = !DILocation(line: 106, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "h", scope: !106, file: !18, line: 54, type: !22)
!108 = !DILocation(line: 54, column: 9, scope: !106)
!109 = !DILocalVariable(name: "data", scope: !106, file: !18, line: 55, type: !4)
!110 = !DILocation(line: 55, column: 15, scope: !106)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !18, line: 56, type: !4)
!112 = !DILocation(line: 56, column: 15, scope: !106)
!113 = !DILocation(line: 56, column: 42, scope: !106)
!114 = !DILocation(line: 56, column: 31, scope: !106)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !18, line: 57, type: !4)
!116 = !DILocation(line: 57, column: 15, scope: !106)
!117 = !DILocation(line: 57, column: 43, scope: !106)
!118 = !DILocation(line: 57, column: 32, scope: !106)
!119 = !DILocation(line: 58, column: 11, scope: !120)
!120 = distinct !DILexicalBlock(scope: !106, file: !18, line: 58, column: 5)
!121 = !DILocation(line: 58, column: 9, scope: !120)
!122 = !DILocation(line: 58, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !18, line: 58, column: 5)
!124 = !DILocation(line: 58, column: 18, scope: !123)
!125 = !DILocation(line: 58, column: 5, scope: !120)
!126 = !DILocation(line: 61, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !18, line: 59, column: 5)
!128 = !DILocation(line: 61, column: 14, scope: !127)
!129 = !DILocation(line: 62, column: 5, scope: !127)
!130 = !DILocation(line: 58, column: 24, scope: !123)
!131 = !DILocation(line: 58, column: 5, scope: !123)
!132 = distinct !{!132, !125, !133, !49}
!133 = !DILocation(line: 62, column: 5, scope: !120)
!134 = !DILocalVariable(name: "source", scope: !135, file: !18, line: 64, type: !52)
!135 = distinct !DILexicalBlock(scope: !106, file: !18, line: 63, column: 5)
!136 = !DILocation(line: 64, column: 17, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !18, line: 66, type: !58)
!138 = distinct !DILexicalBlock(scope: !135, file: !18, line: 65, column: 9)
!139 = !DILocation(line: 66, column: 20, scope: !138)
!140 = !DILocation(line: 68, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !18, line: 68, column: 13)
!142 = !DILocation(line: 68, column: 18, scope: !141)
!143 = !DILocation(line: 68, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !18, line: 68, column: 13)
!145 = !DILocation(line: 68, column: 27, scope: !144)
!146 = !DILocation(line: 68, column: 13, scope: !141)
!147 = !DILocation(line: 70, column: 34, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !18, line: 69, column: 13)
!149 = !DILocation(line: 70, column: 27, scope: !148)
!150 = !DILocation(line: 70, column: 17, scope: !148)
!151 = !DILocation(line: 70, column: 22, scope: !148)
!152 = !DILocation(line: 70, column: 25, scope: !148)
!153 = !DILocation(line: 71, column: 13, scope: !148)
!154 = !DILocation(line: 68, column: 35, scope: !144)
!155 = !DILocation(line: 68, column: 13, scope: !144)
!156 = distinct !{!156, !146, !157, !49}
!157 = !DILocation(line: 71, column: 13, scope: !141)
!158 = !DILocation(line: 72, column: 31, scope: !138)
!159 = !DILocation(line: 72, column: 13, scope: !138)
!160 = !DILocation(line: 75, column: 1, scope: !106)
