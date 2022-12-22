; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  store i32 0, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !25
  %cmp = icmp slt i32 %0, 1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %1 = alloca i8, i64 10, align 16, !dbg !29
  %2 = bitcast i8* %1 to i32*, !dbg !31
  store i32* %2, i32** %data, align 8, !dbg !32
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !34
  %inc = add nsw i32 %3, 1, !dbg !34
  store i32 %inc, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !45, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i1, align 8, !dbg !50
  br label %for.cond2, !dbg !52

for.cond2:                                        ; preds = %for.inc6, %for.end
  %5 = load i64, i64* %i1, align 8, !dbg !53
  %cmp3 = icmp ult i64 %5, 10, !dbg !55
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !56

for.body4:                                        ; preds = %for.cond2
  %6 = load i64, i64* %i1, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !59
  %7 = load i32, i32* %arrayidx, align 4, !dbg !59
  %8 = load i32*, i32** %data, align 8, !dbg !60
  %9 = load i64, i64* %i1, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !60
  store i32 %7, i32* %arrayidx5, align 4, !dbg !62
  br label %for.inc6, !dbg !63

for.inc6:                                         ; preds = %for.body4
  %10 = load i64, i64* %i1, align 8, !dbg !64
  %inc7 = add i64 %10, 1, !dbg !64
  store i64 %inc7, i64* %i1, align 8, !dbg !64
  br label %for.cond2, !dbg !65, !llvm.loop !66

for.end8:                                         ; preds = %for.cond2
  %11 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx9 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !68
  %12 = load i32, i32* %arrayidx9, align 4, !dbg !68
  call void @printIntLine(i32 %12), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* null, i32** %data, align 8, !dbg !99
  store i32 0, i32* %h, align 4, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !103
  %cmp = icmp slt i32 %0, 1, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %1 = alloca i8, i64 40, align 16, !dbg !107
  %2 = bitcast i8* %1 to i32*, !dbg !109
  store i32* %2, i32** %data, align 8, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %h, align 4, !dbg !112
  %inc = add nsw i32 %3, 1, !dbg !112
  store i32 %inc, i32* %h, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond1, !dbg !123

for.cond1:                                        ; preds = %for.inc5, %for.end
  %5 = load i64, i64* %i, align 8, !dbg !124
  %cmp2 = icmp ult i64 %5, 10, !dbg !126
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !127

for.body3:                                        ; preds = %for.cond1
  %6 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !130
  %7 = load i32, i32* %arrayidx, align 4, !dbg !130
  %8 = load i32*, i32** %data, align 8, !dbg !131
  %9 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !131
  store i32 %7, i32* %arrayidx4, align 4, !dbg !133
  br label %for.inc5, !dbg !134

for.inc5:                                         ; preds = %for.body3
  %10 = load i64, i64* %i, align 8, !dbg !135
  %inc6 = add i64 %10, 1, !dbg !135
  store i64 %inc6, i64* %i, align 8, !dbg !135
  br label %for.cond1, !dbg !136, !llvm.loop !137

for.end7:                                         ; preds = %for.cond1
  %11 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !139
  %12 = load i32, i32* %arrayidx8, align 4, !dbg !139
  call void @printIntLine(i32 %12), !dbg !140
  ret void, !dbg !141
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 23, type: !5)
!18 = !DILocation(line: 23, column: 9, scope: !13)
!19 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 25, column: 10, scope: !13)
!22 = !DILocation(line: 26, column: 11, scope: !23)
!23 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 5)
!24 = !DILocation(line: 26, column: 9, scope: !23)
!25 = !DILocation(line: 26, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !14, line: 26, column: 5)
!27 = !DILocation(line: 26, column: 18, scope: !26)
!28 = !DILocation(line: 26, column: 5, scope: !23)
!29 = !DILocation(line: 29, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 27, column: 5)
!31 = !DILocation(line: 29, column: 16, scope: !30)
!32 = !DILocation(line: 29, column: 14, scope: !30)
!33 = !DILocation(line: 30, column: 5, scope: !30)
!34 = !DILocation(line: 26, column: 24, scope: !26)
!35 = !DILocation(line: 26, column: 5, scope: !26)
!36 = distinct !{!36, !28, !37, !38}
!37 = !DILocation(line: 30, column: 5, scope: !23)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocalVariable(name: "source", scope: !40, file: !14, line: 32, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 10)
!44 = !DILocation(line: 32, column: 13, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !14, line: 33, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 33, column: 16, scope: !40)
!50 = !DILocation(line: 35, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !14, line: 35, column: 9)
!52 = !DILocation(line: 35, column: 14, scope: !51)
!53 = !DILocation(line: 35, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 35, column: 9)
!55 = !DILocation(line: 35, column: 23, scope: !54)
!56 = !DILocation(line: 35, column: 9, scope: !51)
!57 = !DILocation(line: 37, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 36, column: 9)
!59 = !DILocation(line: 37, column: 23, scope: !58)
!60 = !DILocation(line: 37, column: 13, scope: !58)
!61 = !DILocation(line: 37, column: 18, scope: !58)
!62 = !DILocation(line: 37, column: 21, scope: !58)
!63 = !DILocation(line: 38, column: 9, scope: !58)
!64 = !DILocation(line: 35, column: 30, scope: !54)
!65 = !DILocation(line: 35, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !38}
!67 = !DILocation(line: 38, column: 9, scope: !51)
!68 = !DILocation(line: 39, column: 22, scope: !40)
!69 = !DILocation(line: 39, column: 9, scope: !40)
!70 = !DILocation(line: 41, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_17_good", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 72, column: 5, scope: !71)
!73 = !DILocation(line: 73, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 85, type: !75, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!5, !5, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !14, line: 85, type: !5)
!81 = !DILocation(line: 85, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !14, line: 85, type: !77)
!83 = !DILocation(line: 85, column: 27, scope: !74)
!84 = !DILocation(line: 88, column: 22, scope: !74)
!85 = !DILocation(line: 88, column: 12, scope: !74)
!86 = !DILocation(line: 88, column: 5, scope: !74)
!87 = !DILocation(line: 90, column: 5, scope: !74)
!88 = !DILocation(line: 91, column: 5, scope: !74)
!89 = !DILocation(line: 92, column: 5, scope: !74)
!90 = !DILocation(line: 95, column: 5, scope: !74)
!91 = !DILocation(line: 96, column: 5, scope: !74)
!92 = !DILocation(line: 97, column: 5, scope: !74)
!93 = !DILocation(line: 99, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "h", scope: !94, file: !14, line: 50, type: !5)
!96 = !DILocation(line: 50, column: 9, scope: !94)
!97 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 51, type: !4)
!98 = !DILocation(line: 51, column: 11, scope: !94)
!99 = !DILocation(line: 52, column: 10, scope: !94)
!100 = !DILocation(line: 53, column: 11, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !14, line: 53, column: 5)
!102 = !DILocation(line: 53, column: 9, scope: !101)
!103 = !DILocation(line: 53, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !14, line: 53, column: 5)
!105 = !DILocation(line: 53, column: 18, scope: !104)
!106 = !DILocation(line: 53, column: 5, scope: !101)
!107 = !DILocation(line: 56, column: 23, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !14, line: 54, column: 5)
!109 = !DILocation(line: 56, column: 16, scope: !108)
!110 = !DILocation(line: 56, column: 14, scope: !108)
!111 = !DILocation(line: 57, column: 5, scope: !108)
!112 = !DILocation(line: 53, column: 24, scope: !104)
!113 = !DILocation(line: 53, column: 5, scope: !104)
!114 = distinct !{!114, !106, !115, !38}
!115 = !DILocation(line: 57, column: 5, scope: !101)
!116 = !DILocalVariable(name: "source", scope: !117, file: !14, line: 59, type: !41)
!117 = distinct !DILexicalBlock(scope: !94, file: !14, line: 58, column: 5)
!118 = !DILocation(line: 59, column: 13, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !117, file: !14, line: 60, type: !46)
!120 = !DILocation(line: 60, column: 16, scope: !117)
!121 = !DILocation(line: 62, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !14, line: 62, column: 9)
!123 = !DILocation(line: 62, column: 14, scope: !122)
!124 = !DILocation(line: 62, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 62, column: 9)
!126 = !DILocation(line: 62, column: 23, scope: !125)
!127 = !DILocation(line: 62, column: 9, scope: !122)
!128 = !DILocation(line: 64, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !14, line: 63, column: 9)
!130 = !DILocation(line: 64, column: 23, scope: !129)
!131 = !DILocation(line: 64, column: 13, scope: !129)
!132 = !DILocation(line: 64, column: 18, scope: !129)
!133 = !DILocation(line: 64, column: 21, scope: !129)
!134 = !DILocation(line: 65, column: 9, scope: !129)
!135 = !DILocation(line: 62, column: 30, scope: !125)
!136 = !DILocation(line: 62, column: 9, scope: !125)
!137 = distinct !{!137, !127, !138, !38}
!138 = !DILocation(line: 65, column: 9, scope: !122)
!139 = !DILocation(line: 66, column: 22, scope: !117)
!140 = !DILocation(line: 66, column: 9, scope: !117)
!141 = !DILocation(line: 68, column: 1, scope: !94)
