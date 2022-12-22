; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 10, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  %cmp = icmp sge i32 %1, 0, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !32
  %idxprom = sext i32 %2 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  store i32 1, i32* %arrayidx, align 4, !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !39
  %cmp1 = icmp slt i32 %3, 10, !dbg !41
  br i1 %cmp1, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !43
  %idxprom2 = sext i32 %4 to i64, !dbg !45
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !45
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !45
  call void @printIntLine(i32 %5), !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %6, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !53

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !54
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  call void @goodB2G(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  store i32 7, i32* %data, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %i, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !90
  %1 = load i32, i32* %data, align 4, !dbg !91
  %cmp = icmp sge i32 %1, 0, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !95
  %idxprom = sext i32 %2 to i64, !dbg !97
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !97
  store i32 1, i32* %arrayidx, align 4, !dbg !98
  store i32 0, i32* %i, align 4, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !102
  %cmp1 = icmp slt i32 %3, 10, !dbg !104
  br i1 %cmp1, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !106
  %idxprom2 = sext i32 %4 to i64, !dbg !108
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !108
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !108
  call void @printIntLine(i32 %5), !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !111
  %inc = add nsw i32 %6, 1, !dbg !111
  store i32 %inc, i32* %i, align 4, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !119 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 -1, i32* %data, align 4, !dbg !122
  store i32 10, i32* %data, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !128
  %1 = load i32, i32* %data, align 4, !dbg !129
  %cmp = icmp sge i32 %1, 0, !dbg !131
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !132

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !133
  %cmp1 = icmp slt i32 %2, 10, !dbg !134
  br i1 %cmp1, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !136
  %idxprom = sext i32 %3 to i64, !dbg !138
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !138
  store i32 1, i32* %arrayidx, align 4, !dbg !139
  store i32 0, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !143
  %cmp2 = icmp slt i32 %4, 10, !dbg !145
  br i1 %cmp2, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !147
  %idxprom3 = sext i32 %5 to i64, !dbg !149
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !149
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !149
  call void @printIntLine(i32 %6), !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !152
  %inc = add nsw i32 %7, 1, !dbg !152
  store i32 %inc, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !156

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !157
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 28, column: 10, scope: !11)
!20 = !DILocalVariable(name: "i", scope: !21, file: !12, line: 30, type: !16)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!22 = !DILocation(line: 30, column: 13, scope: !21)
!23 = !DILocalVariable(name: "buffer", scope: !21, file: !12, line: 31, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 31, column: 13, scope: !21)
!28 = !DILocation(line: 34, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !12, line: 34, column: 13)
!30 = !DILocation(line: 34, column: 18, scope: !29)
!31 = !DILocation(line: 34, column: 13, scope: !21)
!32 = !DILocation(line: 36, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 35, column: 9)
!34 = !DILocation(line: 36, column: 13, scope: !33)
!35 = !DILocation(line: 36, column: 26, scope: !33)
!36 = !DILocation(line: 38, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 38, column: 13)
!38 = !DILocation(line: 38, column: 17, scope: !37)
!39 = !DILocation(line: 38, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 38, column: 13)
!41 = !DILocation(line: 38, column: 26, scope: !40)
!42 = !DILocation(line: 38, column: 13, scope: !37)
!43 = !DILocation(line: 40, column: 37, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 39, column: 13)
!45 = !DILocation(line: 40, column: 30, scope: !44)
!46 = !DILocation(line: 40, column: 17, scope: !44)
!47 = !DILocation(line: 41, column: 13, scope: !44)
!48 = !DILocation(line: 38, column: 33, scope: !40)
!49 = !DILocation(line: 38, column: 13, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 41, column: 13, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 42, column: 9, scope: !33)
!54 = !DILocation(line: 45, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !29, file: !12, line: 44, column: 9)
!56 = !DILocation(line: 48, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 114, column: 5, scope: !57)
!59 = !DILocation(line: 115, column: 5, scope: !57)
!60 = !DILocation(line: 116, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !62, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!16, !16, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 127, type: !16)
!68 = !DILocation(line: 127, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 127, type: !64)
!70 = !DILocation(line: 127, column: 27, scope: !61)
!71 = !DILocation(line: 130, column: 22, scope: !61)
!72 = !DILocation(line: 130, column: 12, scope: !61)
!73 = !DILocation(line: 130, column: 5, scope: !61)
!74 = !DILocation(line: 132, column: 5, scope: !61)
!75 = !DILocation(line: 133, column: 5, scope: !61)
!76 = !DILocation(line: 134, column: 5, scope: !61)
!77 = !DILocation(line: 137, column: 5, scope: !61)
!78 = !DILocation(line: 138, column: 5, scope: !61)
!79 = !DILocation(line: 139, column: 5, scope: !61)
!80 = !DILocation(line: 141, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 57, type: !16)
!83 = !DILocation(line: 57, column: 9, scope: !81)
!84 = !DILocation(line: 59, column: 10, scope: !81)
!85 = !DILocation(line: 62, column: 10, scope: !81)
!86 = !DILocalVariable(name: "i", scope: !87, file: !12, line: 64, type: !16)
!87 = distinct !DILexicalBlock(scope: !81, file: !12, line: 63, column: 5)
!88 = !DILocation(line: 64, column: 13, scope: !87)
!89 = !DILocalVariable(name: "buffer", scope: !87, file: !12, line: 65, type: !24)
!90 = !DILocation(line: 65, column: 13, scope: !87)
!91 = !DILocation(line: 68, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !12, line: 68, column: 13)
!93 = !DILocation(line: 68, column: 18, scope: !92)
!94 = !DILocation(line: 68, column: 13, scope: !87)
!95 = !DILocation(line: 70, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 69, column: 9)
!97 = !DILocation(line: 70, column: 13, scope: !96)
!98 = !DILocation(line: 70, column: 26, scope: !96)
!99 = !DILocation(line: 72, column: 19, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 72, column: 13)
!101 = !DILocation(line: 72, column: 17, scope: !100)
!102 = !DILocation(line: 72, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !12, line: 72, column: 13)
!104 = !DILocation(line: 72, column: 26, scope: !103)
!105 = !DILocation(line: 72, column: 13, scope: !100)
!106 = !DILocation(line: 74, column: 37, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !12, line: 73, column: 13)
!108 = !DILocation(line: 74, column: 30, scope: !107)
!109 = !DILocation(line: 74, column: 17, scope: !107)
!110 = !DILocation(line: 75, column: 13, scope: !107)
!111 = !DILocation(line: 72, column: 33, scope: !103)
!112 = !DILocation(line: 72, column: 13, scope: !103)
!113 = distinct !{!113, !105, !114, !52}
!114 = !DILocation(line: 75, column: 13, scope: !100)
!115 = !DILocation(line: 76, column: 9, scope: !96)
!116 = !DILocation(line: 79, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !92, file: !12, line: 78, column: 9)
!118 = !DILocation(line: 82, column: 1, scope: !81)
!119 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 87, type: !16)
!121 = !DILocation(line: 87, column: 9, scope: !119)
!122 = !DILocation(line: 89, column: 10, scope: !119)
!123 = !DILocation(line: 91, column: 10, scope: !119)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 93, type: !16)
!125 = distinct !DILexicalBlock(scope: !119, file: !12, line: 92, column: 5)
!126 = !DILocation(line: 93, column: 13, scope: !125)
!127 = !DILocalVariable(name: "buffer", scope: !125, file: !12, line: 94, type: !24)
!128 = !DILocation(line: 94, column: 13, scope: !125)
!129 = !DILocation(line: 96, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 96, column: 13)
!131 = !DILocation(line: 96, column: 18, scope: !130)
!132 = !DILocation(line: 96, column: 23, scope: !130)
!133 = !DILocation(line: 96, column: 26, scope: !130)
!134 = !DILocation(line: 96, column: 31, scope: !130)
!135 = !DILocation(line: 96, column: 13, scope: !125)
!136 = !DILocation(line: 98, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !12, line: 97, column: 9)
!138 = !DILocation(line: 98, column: 13, scope: !137)
!139 = !DILocation(line: 98, column: 26, scope: !137)
!140 = !DILocation(line: 100, column: 19, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !12, line: 100, column: 13)
!142 = !DILocation(line: 100, column: 17, scope: !141)
!143 = !DILocation(line: 100, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !12, line: 100, column: 13)
!145 = !DILocation(line: 100, column: 26, scope: !144)
!146 = !DILocation(line: 100, column: 13, scope: !141)
!147 = !DILocation(line: 102, column: 37, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !12, line: 101, column: 13)
!149 = !DILocation(line: 102, column: 30, scope: !148)
!150 = !DILocation(line: 102, column: 17, scope: !148)
!151 = !DILocation(line: 103, column: 13, scope: !148)
!152 = !DILocation(line: 100, column: 33, scope: !144)
!153 = !DILocation(line: 100, column: 13, scope: !144)
!154 = distinct !{!154, !146, !155, !52}
!155 = !DILocation(line: 103, column: 13, scope: !141)
!156 = !DILocation(line: 104, column: 9, scope: !137)
!157 = !DILocation(line: 107, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !130, file: !12, line: 106, column: 9)
!159 = !DILocation(line: 110, column: 1, scope: !119)
