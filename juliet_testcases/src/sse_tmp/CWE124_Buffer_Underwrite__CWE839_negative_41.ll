; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_41_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 -5, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  call void @badSink(i32 %0), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !23 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !35
  %1 = load i32, i32* %data.addr, align 4, !dbg !36
  %cmp = icmp slt i32 %1, 10, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !40
  %idxprom = sext i32 %2 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  store i32 1, i32* %arrayidx, align 4, !dbg !43
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !47
  %cmp1 = icmp slt i32 %3, 10, !dbg !49
  br i1 %cmp1, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !51
  %idxprom2 = sext i32 %4 to i64, !dbg !53
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !53
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !53
  call void @printIntLine(i32 %5), !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %6, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !61

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !62
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_41_good() #0 !dbg !65 {
entry:
  call void @goodB2G(), !dbg !66
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__CWE839_negative_41_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__CWE839_negative_41_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !89 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 -1, i32* %data, align 4, !dbg !92
  store i32 -5, i32* %data, align 4, !dbg !93
  %0 = load i32, i32* %data, align 4, !dbg !94
  call void @goodB2GSink(i32 %0), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %i, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !104
  %1 = load i32, i32* %data.addr, align 4, !dbg !105
  %cmp = icmp sge i32 %1, 0, !dbg !107
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !108

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !109
  %cmp1 = icmp slt i32 %2, 10, !dbg !110
  br i1 %cmp1, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !112
  %idxprom = sext i32 %3 to i64, !dbg !114
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !114
  store i32 1, i32* %arrayidx, align 4, !dbg !115
  store i32 0, i32* %i, align 4, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !119
  %cmp2 = icmp slt i32 %4, 10, !dbg !121
  br i1 %cmp2, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !123
  %idxprom3 = sext i32 %5 to i64, !dbg !125
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !125
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !125
  call void @printIntLine(i32 %6), !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !128
  %inc = add nsw i32 %7, 1, !dbg !128
  store i32 %inc, i32* %i, align 4, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !132

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !137, metadata !DIExpression()), !dbg !138
  store i32 -1, i32* %data, align 4, !dbg !139
  store i32 7, i32* %data, align 4, !dbg !140
  %0 = load i32, i32* %data, align 4, !dbg !141
  call void @goodG2BSink(i32 %0), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !144 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !151
  %1 = load i32, i32* %data.addr, align 4, !dbg !152
  %cmp = icmp slt i32 %1, 10, !dbg !154
  br i1 %cmp, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !156
  %idxprom = sext i32 %2 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !158
  store i32 1, i32* %arrayidx, align 4, !dbg !159
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !163
  %cmp1 = icmp slt i32 %3, 10, !dbg !165
  br i1 %cmp1, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !167
  %idxprom2 = sext i32 %4 to i64, !dbg !169
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !169
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !169
  call void @printIntLine(i32 %5), !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %6, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !176

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_41_bad", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 47, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 47, column: 9, scope: !11)
!18 = !DILocation(line: 49, column: 10, scope: !11)
!19 = !DILocation(line: 51, column: 10, scope: !11)
!20 = !DILocation(line: 52, column: 13, scope: !11)
!21 = !DILocation(line: 52, column: 5, scope: !11)
!22 = !DILocation(line: 53, column: 1, scope: !11)
!23 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 22, type: !24, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !16}
!26 = !DILocalVariable(name: "data", arg: 1, scope: !23, file: !12, line: 22, type: !16)
!27 = !DILocation(line: 22, column: 25, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !29, file: !12, line: 25, type: !16)
!29 = distinct !DILexicalBlock(scope: !23, file: !12, line: 24, column: 5)
!30 = !DILocation(line: 25, column: 13, scope: !29)
!31 = !DILocalVariable(name: "buffer", scope: !29, file: !12, line: 26, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 26, column: 13, scope: !29)
!36 = !DILocation(line: 29, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !12, line: 29, column: 13)
!38 = !DILocation(line: 29, column: 18, scope: !37)
!39 = !DILocation(line: 29, column: 13, scope: !29)
!40 = !DILocation(line: 31, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 30, column: 9)
!42 = !DILocation(line: 31, column: 13, scope: !41)
!43 = !DILocation(line: 31, column: 26, scope: !41)
!44 = !DILocation(line: 33, column: 19, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 33, column: 13)
!46 = !DILocation(line: 33, column: 17, scope: !45)
!47 = !DILocation(line: 33, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 33, column: 13)
!49 = !DILocation(line: 33, column: 26, scope: !48)
!50 = !DILocation(line: 33, column: 13, scope: !45)
!51 = !DILocation(line: 35, column: 37, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 34, column: 13)
!53 = !DILocation(line: 35, column: 30, scope: !52)
!54 = !DILocation(line: 35, column: 17, scope: !52)
!55 = !DILocation(line: 36, column: 13, scope: !52)
!56 = !DILocation(line: 33, column: 33, scope: !48)
!57 = !DILocation(line: 33, column: 13, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 36, column: 13, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 37, column: 9, scope: !41)
!62 = !DILocation(line: 40, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !37, file: !12, line: 39, column: 9)
!64 = !DILocation(line: 43, column: 1, scope: !23)
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_41_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 129, column: 5, scope: !65)
!67 = !DILocation(line: 130, column: 5, scope: !65)
!68 = !DILocation(line: 131, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !70, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!16, !16, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 142, type: !16)
!76 = !DILocation(line: 142, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 142, type: !72)
!78 = !DILocation(line: 142, column: 27, scope: !69)
!79 = !DILocation(line: 145, column: 22, scope: !69)
!80 = !DILocation(line: 145, column: 12, scope: !69)
!81 = !DILocation(line: 145, column: 5, scope: !69)
!82 = !DILocation(line: 147, column: 5, scope: !69)
!83 = !DILocation(line: 148, column: 5, scope: !69)
!84 = !DILocation(line: 149, column: 5, scope: !69)
!85 = !DILocation(line: 152, column: 5, scope: !69)
!86 = !DILocation(line: 153, column: 5, scope: !69)
!87 = !DILocation(line: 154, column: 5, scope: !69)
!88 = !DILocation(line: 156, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 119, type: !16)
!91 = !DILocation(line: 119, column: 9, scope: !89)
!92 = !DILocation(line: 121, column: 10, scope: !89)
!93 = !DILocation(line: 123, column: 10, scope: !89)
!94 = !DILocation(line: 124, column: 17, scope: !89)
!95 = !DILocation(line: 124, column: 5, scope: !89)
!96 = !DILocation(line: 125, column: 1, scope: !89)
!97 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 95, type: !24, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !12, line: 95, type: !16)
!99 = !DILocation(line: 95, column: 29, scope: !97)
!100 = !DILocalVariable(name: "i", scope: !101, file: !12, line: 98, type: !16)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 97, column: 5)
!102 = !DILocation(line: 98, column: 13, scope: !101)
!103 = !DILocalVariable(name: "buffer", scope: !101, file: !12, line: 99, type: !32)
!104 = !DILocation(line: 99, column: 13, scope: !101)
!105 = !DILocation(line: 101, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !12, line: 101, column: 13)
!107 = !DILocation(line: 101, column: 18, scope: !106)
!108 = !DILocation(line: 101, column: 23, scope: !106)
!109 = !DILocation(line: 101, column: 26, scope: !106)
!110 = !DILocation(line: 101, column: 31, scope: !106)
!111 = !DILocation(line: 101, column: 13, scope: !101)
!112 = !DILocation(line: 103, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !12, line: 102, column: 9)
!114 = !DILocation(line: 103, column: 13, scope: !113)
!115 = !DILocation(line: 103, column: 26, scope: !113)
!116 = !DILocation(line: 105, column: 19, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 105, column: 13)
!118 = !DILocation(line: 105, column: 17, scope: !117)
!119 = !DILocation(line: 105, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 105, column: 13)
!121 = !DILocation(line: 105, column: 26, scope: !120)
!122 = !DILocation(line: 105, column: 13, scope: !117)
!123 = !DILocation(line: 107, column: 37, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 106, column: 13)
!125 = !DILocation(line: 107, column: 30, scope: !124)
!126 = !DILocation(line: 107, column: 17, scope: !124)
!127 = !DILocation(line: 108, column: 13, scope: !124)
!128 = !DILocation(line: 105, column: 33, scope: !120)
!129 = !DILocation(line: 105, column: 13, scope: !120)
!130 = distinct !{!130, !122, !131, !60}
!131 = !DILocation(line: 108, column: 13, scope: !117)
!132 = !DILocation(line: 109, column: 9, scope: !113)
!133 = !DILocation(line: 112, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !106, file: !12, line: 111, column: 9)
!135 = !DILocation(line: 115, column: 1, scope: !97)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 85, type: !16)
!138 = !DILocation(line: 85, column: 9, scope: !136)
!139 = !DILocation(line: 87, column: 10, scope: !136)
!140 = !DILocation(line: 90, column: 10, scope: !136)
!141 = !DILocation(line: 91, column: 17, scope: !136)
!142 = !DILocation(line: 91, column: 5, scope: !136)
!143 = !DILocation(line: 92, column: 1, scope: !136)
!144 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !24, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", arg: 1, scope: !144, file: !12, line: 60, type: !16)
!146 = !DILocation(line: 60, column: 29, scope: !144)
!147 = !DILocalVariable(name: "i", scope: !148, file: !12, line: 63, type: !16)
!148 = distinct !DILexicalBlock(scope: !144, file: !12, line: 62, column: 5)
!149 = !DILocation(line: 63, column: 13, scope: !148)
!150 = !DILocalVariable(name: "buffer", scope: !148, file: !12, line: 64, type: !32)
!151 = !DILocation(line: 64, column: 13, scope: !148)
!152 = !DILocation(line: 67, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 67, column: 13)
!154 = !DILocation(line: 67, column: 18, scope: !153)
!155 = !DILocation(line: 67, column: 13, scope: !148)
!156 = !DILocation(line: 69, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !12, line: 68, column: 9)
!158 = !DILocation(line: 69, column: 13, scope: !157)
!159 = !DILocation(line: 69, column: 26, scope: !157)
!160 = !DILocation(line: 71, column: 19, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 71, column: 13)
!162 = !DILocation(line: 71, column: 17, scope: !161)
!163 = !DILocation(line: 71, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 71, column: 13)
!165 = !DILocation(line: 71, column: 26, scope: !164)
!166 = !DILocation(line: 71, column: 13, scope: !161)
!167 = !DILocation(line: 73, column: 37, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 72, column: 13)
!169 = !DILocation(line: 73, column: 30, scope: !168)
!170 = !DILocation(line: 73, column: 17, scope: !168)
!171 = !DILocation(line: 74, column: 13, scope: !168)
!172 = !DILocation(line: 71, column: 33, scope: !164)
!173 = !DILocation(line: 71, column: 13, scope: !164)
!174 = distinct !{!174, !166, !175, !60}
!175 = !DILocation(line: 74, column: 13, scope: !161)
!176 = !DILocation(line: 75, column: 9, scope: !157)
!177 = !DILocation(line: 78, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !153, file: !12, line: 77, column: 9)
!179 = !DILocation(line: 81, column: 1, scope: !144)
