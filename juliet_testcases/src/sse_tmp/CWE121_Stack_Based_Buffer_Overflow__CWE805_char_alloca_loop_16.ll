; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  br label %while.end, !dbg !31

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx1, align 1, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %while.end
  %4 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %4, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !55
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !55
  %7 = load i8*, i8** %data, align 8, !dbg !56
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !56
  store i8 %6, i8* %arrayidx3, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %9, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !65
  store i8 0, i8* %arrayidx4, align 1, !dbg !66
  %11 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %11), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16_good() #0 !dbg !70 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 50, align 16, !dbg !97
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = alloca i8, i64 100, align 16, !dbg !100
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !99
  br label %while.body, !dbg !101

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  store i8* %2, i8** %data, align 8, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  br label %while.end, !dbg !107

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !113
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx1, align 1, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %while.end
  %4 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %4, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !125
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !125
  %7 = load i8*, i8** %data, align 8, !dbg !126
  %8 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !126
  store i8 %6, i8* %arrayidx3, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %9, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !134
  store i8 0, i8* %arrayidx4, align 1, !dbg !135
  %11 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %11), !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 5, scope: !13)
!26 = !DILocation(line: 32, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!28 = !DILocation(line: 32, column: 14, scope: !27)
!29 = !DILocation(line: 33, column: 9, scope: !27)
!30 = !DILocation(line: 33, column: 17, scope: !27)
!31 = !DILocation(line: 34, column: 9, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !14, line: 37, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 37, column: 16, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 38, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 38, column: 14, scope: !33)
!43 = !DILocation(line: 39, column: 9, scope: !33)
!44 = !DILocation(line: 40, column: 9, scope: !33)
!45 = !DILocation(line: 40, column: 23, scope: !33)
!46 = !DILocation(line: 42, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !14, line: 42, column: 9)
!48 = !DILocation(line: 42, column: 14, scope: !47)
!49 = !DILocation(line: 42, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 42, column: 9)
!51 = !DILocation(line: 42, column: 23, scope: !50)
!52 = !DILocation(line: 42, column: 9, scope: !47)
!53 = !DILocation(line: 44, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !14, line: 43, column: 9)
!55 = !DILocation(line: 44, column: 23, scope: !54)
!56 = !DILocation(line: 44, column: 13, scope: !54)
!57 = !DILocation(line: 44, column: 18, scope: !54)
!58 = !DILocation(line: 44, column: 21, scope: !54)
!59 = !DILocation(line: 45, column: 9, scope: !54)
!60 = !DILocation(line: 42, column: 31, scope: !50)
!61 = !DILocation(line: 42, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 45, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 46, column: 9, scope: !33)
!66 = !DILocation(line: 46, column: 21, scope: !33)
!67 = !DILocation(line: 47, column: 19, scope: !33)
!68 = !DILocation(line: 47, column: 9, scope: !33)
!69 = !DILocation(line: 49, column: 1, scope: !13)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_16_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 85, column: 5, scope: !70)
!72 = !DILocation(line: 86, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 98, type: !74, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 98, type: !76)
!79 = !DILocation(line: 98, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 98, type: !77)
!81 = !DILocation(line: 98, column: 27, scope: !73)
!82 = !DILocation(line: 101, column: 22, scope: !73)
!83 = !DILocation(line: 101, column: 12, scope: !73)
!84 = !DILocation(line: 101, column: 5, scope: !73)
!85 = !DILocation(line: 103, column: 5, scope: !73)
!86 = !DILocation(line: 104, column: 5, scope: !73)
!87 = !DILocation(line: 105, column: 5, scope: !73)
!88 = !DILocation(line: 108, column: 5, scope: !73)
!89 = !DILocation(line: 109, column: 5, scope: !73)
!90 = !DILocation(line: 110, column: 5, scope: !73)
!91 = !DILocation(line: 112, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 58, type: !4)
!94 = !DILocation(line: 58, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !14, line: 59, type: !4)
!96 = !DILocation(line: 59, column: 12, scope: !92)
!97 = !DILocation(line: 59, column: 36, scope: !92)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !14, line: 60, type: !4)
!99 = !DILocation(line: 60, column: 12, scope: !92)
!100 = !DILocation(line: 60, column: 37, scope: !92)
!101 = !DILocation(line: 61, column: 5, scope: !92)
!102 = !DILocation(line: 64, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !92, file: !14, line: 62, column: 5)
!104 = !DILocation(line: 64, column: 14, scope: !103)
!105 = !DILocation(line: 65, column: 9, scope: !103)
!106 = !DILocation(line: 65, column: 17, scope: !103)
!107 = !DILocation(line: 66, column: 9, scope: !103)
!108 = !DILocalVariable(name: "i", scope: !109, file: !14, line: 69, type: !34)
!109 = distinct !DILexicalBlock(scope: !92, file: !14, line: 68, column: 5)
!110 = !DILocation(line: 69, column: 16, scope: !109)
!111 = !DILocalVariable(name: "source", scope: !109, file: !14, line: 70, type: !39)
!112 = !DILocation(line: 70, column: 14, scope: !109)
!113 = !DILocation(line: 71, column: 9, scope: !109)
!114 = !DILocation(line: 72, column: 9, scope: !109)
!115 = !DILocation(line: 72, column: 23, scope: !109)
!116 = !DILocation(line: 74, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !14, line: 74, column: 9)
!118 = !DILocation(line: 74, column: 14, scope: !117)
!119 = !DILocation(line: 74, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !14, line: 74, column: 9)
!121 = !DILocation(line: 74, column: 23, scope: !120)
!122 = !DILocation(line: 74, column: 9, scope: !117)
!123 = !DILocation(line: 76, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !14, line: 75, column: 9)
!125 = !DILocation(line: 76, column: 23, scope: !124)
!126 = !DILocation(line: 76, column: 13, scope: !124)
!127 = !DILocation(line: 76, column: 18, scope: !124)
!128 = !DILocation(line: 76, column: 21, scope: !124)
!129 = !DILocation(line: 77, column: 9, scope: !124)
!130 = !DILocation(line: 74, column: 31, scope: !120)
!131 = !DILocation(line: 74, column: 9, scope: !120)
!132 = distinct !{!132, !122, !133, !64}
!133 = !DILocation(line: 77, column: 9, scope: !117)
!134 = !DILocation(line: 78, column: 9, scope: !109)
!135 = !DILocation(line: 78, column: 21, scope: !109)
!136 = !DILocation(line: 79, column: 19, scope: !109)
!137 = !DILocation(line: 79, column: 9, scope: !109)
!138 = !DILocation(line: 81, column: 1, scope: !92)
