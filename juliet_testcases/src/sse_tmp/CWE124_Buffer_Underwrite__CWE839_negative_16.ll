; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_16.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %while.body, !dbg !19

while.body:                                       ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !20
  br label %while.end, !dbg !22

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !23

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !32
  %1 = load i32, i32* %data, align 4, !dbg !33
  %cmp = icmp slt i32 %1, 10, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !37
  %idxprom = sext i32 %2 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  store i32 1, i32* %arrayidx, align 4, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !44
  %cmp2 = icmp slt i32 %3, 10, !dbg !46
  br i1 %cmp2, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom3 = sext i32 %4 to i64, !dbg !50
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !50
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !50
  call void @printIntLine(i32 %5), !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %6, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !58

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !61

while.end5:                                       ; preds = %if.end
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_16_good() #0 !dbg !63 {
entry:
  call void @goodB2G(), !dbg !64
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__CWE839_negative_16_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__CWE839_negative_16_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  br label %while.body, !dbg !91

while.body:                                       ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !92
  br label %while.end, !dbg !94

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !95

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !101
  %1 = load i32, i32* %data, align 4, !dbg !102
  %cmp = icmp sge i32 %1, 0, !dbg !104
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !105

land.lhs.true:                                    ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !106
  %cmp2 = icmp slt i32 %2, 10, !dbg !107
  br i1 %cmp2, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !109
  %idxprom = sext i32 %3 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !111
  store i32 1, i32* %arrayidx, align 4, !dbg !112
  store i32 0, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !116
  %cmp3 = icmp slt i32 %4, 10, !dbg !118
  br i1 %cmp3, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !120
  %idxprom4 = sext i32 %5 to i64, !dbg !122
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !122
  %6 = load i32, i32* %arrayidx5, align 4, !dbg !122
  call void @printIntLine(i32 %6), !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !125
  %inc = add nsw i32 %7, 1, !dbg !125
  store i32 %inc, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !129

if.else:                                          ; preds = %land.lhs.true, %while.body1
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end6, !dbg !132

while.end6:                                       ; preds = %if.end
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !134 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 -1, i32* %data, align 4, !dbg !137
  br label %while.body, !dbg !138

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !139
  br label %while.end, !dbg !141

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !142

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !148
  %1 = load i32, i32* %data, align 4, !dbg !149
  %cmp = icmp slt i32 %1, 10, !dbg !151
  br i1 %cmp, label %if.then, label %if.else, !dbg !152

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !153
  %idxprom = sext i32 %2 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !155
  store i32 1, i32* %arrayidx, align 4, !dbg !156
  store i32 0, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !160
  %cmp2 = icmp slt i32 %3, 10, !dbg !162
  br i1 %cmp2, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !164
  %idxprom3 = sext i32 %4 to i64, !dbg !166
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !166
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !166
  call void @printIntLine(i32 %5), !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %6, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !173

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !174
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !176

while.end5:                                       ; preds = %if.end
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 5, scope: !11)
!20 = !DILocation(line: 30, column: 14, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!22 = !DILocation(line: 31, column: 9, scope: !21)
!23 = !DILocation(line: 33, column: 5, scope: !11)
!24 = !DILocalVariable(name: "i", scope: !25, file: !12, line: 36, type: !16)
!25 = distinct !DILexicalBlock(scope: !26, file: !12, line: 35, column: 9)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!27 = !DILocation(line: 36, column: 17, scope: !25)
!28 = !DILocalVariable(name: "buffer", scope: !25, file: !12, line: 37, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 37, column: 17, scope: !25)
!33 = !DILocation(line: 40, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !12, line: 40, column: 17)
!35 = !DILocation(line: 40, column: 22, scope: !34)
!36 = !DILocation(line: 40, column: 17, scope: !25)
!37 = !DILocation(line: 42, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 41, column: 13)
!39 = !DILocation(line: 42, column: 17, scope: !38)
!40 = !DILocation(line: 42, column: 30, scope: !38)
!41 = !DILocation(line: 44, column: 23, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 44, column: 17)
!43 = !DILocation(line: 44, column: 21, scope: !42)
!44 = !DILocation(line: 44, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 44, column: 17)
!46 = !DILocation(line: 44, column: 30, scope: !45)
!47 = !DILocation(line: 44, column: 17, scope: !42)
!48 = !DILocation(line: 46, column: 41, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 45, column: 17)
!50 = !DILocation(line: 46, column: 34, scope: !49)
!51 = !DILocation(line: 46, column: 21, scope: !49)
!52 = !DILocation(line: 47, column: 17, scope: !49)
!53 = !DILocation(line: 44, column: 37, scope: !45)
!54 = !DILocation(line: 44, column: 17, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 47, column: 17, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 48, column: 13, scope: !38)
!59 = !DILocation(line: 51, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !34, file: !12, line: 50, column: 13)
!61 = !DILocation(line: 54, column: 9, scope: !26)
!62 = !DILocation(line: 56, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_16_good", scope: !12, file: !12, line: 136, type: !13, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 138, column: 5, scope: !63)
!65 = !DILocation(line: 139, column: 5, scope: !63)
!66 = !DILocation(line: 140, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 151, type: !68, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16, !16, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 151, type: !16)
!74 = !DILocation(line: 151, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 151, type: !70)
!76 = !DILocation(line: 151, column: 27, scope: !67)
!77 = !DILocation(line: 154, column: 22, scope: !67)
!78 = !DILocation(line: 154, column: 12, scope: !67)
!79 = !DILocation(line: 154, column: 5, scope: !67)
!80 = !DILocation(line: 156, column: 5, scope: !67)
!81 = !DILocation(line: 157, column: 5, scope: !67)
!82 = !DILocation(line: 158, column: 5, scope: !67)
!83 = !DILocation(line: 161, column: 5, scope: !67)
!84 = !DILocation(line: 162, column: 5, scope: !67)
!85 = !DILocation(line: 163, column: 5, scope: !67)
!86 = !DILocation(line: 165, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 65, type: !16)
!89 = !DILocation(line: 65, column: 9, scope: !87)
!90 = !DILocation(line: 67, column: 10, scope: !87)
!91 = !DILocation(line: 68, column: 5, scope: !87)
!92 = !DILocation(line: 71, column: 14, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !12, line: 69, column: 5)
!94 = !DILocation(line: 72, column: 9, scope: !93)
!95 = !DILocation(line: 74, column: 5, scope: !87)
!96 = !DILocalVariable(name: "i", scope: !97, file: !12, line: 77, type: !16)
!97 = distinct !DILexicalBlock(scope: !98, file: !12, line: 76, column: 9)
!98 = distinct !DILexicalBlock(scope: !87, file: !12, line: 75, column: 5)
!99 = !DILocation(line: 77, column: 17, scope: !97)
!100 = !DILocalVariable(name: "buffer", scope: !97, file: !12, line: 78, type: !29)
!101 = !DILocation(line: 78, column: 17, scope: !97)
!102 = !DILocation(line: 80, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !12, line: 80, column: 17)
!104 = !DILocation(line: 80, column: 22, scope: !103)
!105 = !DILocation(line: 80, column: 27, scope: !103)
!106 = !DILocation(line: 80, column: 30, scope: !103)
!107 = !DILocation(line: 80, column: 35, scope: !103)
!108 = !DILocation(line: 80, column: 17, scope: !97)
!109 = !DILocation(line: 82, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !12, line: 81, column: 13)
!111 = !DILocation(line: 82, column: 17, scope: !110)
!112 = !DILocation(line: 82, column: 30, scope: !110)
!113 = !DILocation(line: 84, column: 23, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 84, column: 17)
!115 = !DILocation(line: 84, column: 21, scope: !114)
!116 = !DILocation(line: 84, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 84, column: 17)
!118 = !DILocation(line: 84, column: 30, scope: !117)
!119 = !DILocation(line: 84, column: 17, scope: !114)
!120 = !DILocation(line: 86, column: 41, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 85, column: 17)
!122 = !DILocation(line: 86, column: 34, scope: !121)
!123 = !DILocation(line: 86, column: 21, scope: !121)
!124 = !DILocation(line: 87, column: 17, scope: !121)
!125 = !DILocation(line: 84, column: 37, scope: !117)
!126 = !DILocation(line: 84, column: 17, scope: !117)
!127 = distinct !{!127, !119, !128, !57}
!128 = !DILocation(line: 87, column: 17, scope: !114)
!129 = !DILocation(line: 88, column: 13, scope: !110)
!130 = !DILocation(line: 91, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !103, file: !12, line: 90, column: 13)
!132 = !DILocation(line: 94, column: 9, scope: !98)
!133 = !DILocation(line: 96, column: 1, scope: !87)
!134 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 101, type: !16)
!136 = !DILocation(line: 101, column: 9, scope: !134)
!137 = !DILocation(line: 103, column: 10, scope: !134)
!138 = !DILocation(line: 104, column: 5, scope: !134)
!139 = !DILocation(line: 108, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !12, line: 105, column: 5)
!141 = !DILocation(line: 109, column: 9, scope: !140)
!142 = !DILocation(line: 111, column: 5, scope: !134)
!143 = !DILocalVariable(name: "i", scope: !144, file: !12, line: 114, type: !16)
!144 = distinct !DILexicalBlock(scope: !145, file: !12, line: 113, column: 9)
!145 = distinct !DILexicalBlock(scope: !134, file: !12, line: 112, column: 5)
!146 = !DILocation(line: 114, column: 17, scope: !144)
!147 = !DILocalVariable(name: "buffer", scope: !144, file: !12, line: 115, type: !29)
!148 = !DILocation(line: 115, column: 17, scope: !144)
!149 = !DILocation(line: 118, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !12, line: 118, column: 17)
!151 = !DILocation(line: 118, column: 22, scope: !150)
!152 = !DILocation(line: 118, column: 17, scope: !144)
!153 = !DILocation(line: 120, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 119, column: 13)
!155 = !DILocation(line: 120, column: 17, scope: !154)
!156 = !DILocation(line: 120, column: 30, scope: !154)
!157 = !DILocation(line: 122, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !12, line: 122, column: 17)
!159 = !DILocation(line: 122, column: 21, scope: !158)
!160 = !DILocation(line: 122, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 122, column: 17)
!162 = !DILocation(line: 122, column: 30, scope: !161)
!163 = !DILocation(line: 122, column: 17, scope: !158)
!164 = !DILocation(line: 124, column: 41, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 123, column: 17)
!166 = !DILocation(line: 124, column: 34, scope: !165)
!167 = !DILocation(line: 124, column: 21, scope: !165)
!168 = !DILocation(line: 125, column: 17, scope: !165)
!169 = !DILocation(line: 122, column: 37, scope: !161)
!170 = !DILocation(line: 122, column: 17, scope: !161)
!171 = distinct !{!171, !163, !172, !57}
!172 = !DILocation(line: 125, column: 17, scope: !158)
!173 = !DILocation(line: 126, column: 13, scope: !154)
!174 = !DILocation(line: 129, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !150, file: !12, line: 128, column: 13)
!176 = !DILocation(line: 132, column: 9, scope: !145)
!177 = !DILocation(line: 134, column: 1, scope: !134)
