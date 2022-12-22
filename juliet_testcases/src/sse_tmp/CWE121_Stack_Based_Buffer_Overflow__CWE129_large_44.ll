; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !18, metadata !DIExpression()), !dbg !22
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 10, i32* %data, align 4, !dbg !24
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !25
  %1 = load i32, i32* %data, align 4, !dbg !26
  call void %0(i32 %1), !dbg !25
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !28 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !38
  %1 = load i32, i32* %data.addr, align 4, !dbg !39
  %cmp = icmp sge i32 %1, 0, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !43
  %idxprom = sext i32 %2 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  store i32 1, i32* %arrayidx, align 4, !dbg !46
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !50
  %cmp1 = icmp slt i32 %3, 10, !dbg !52
  br i1 %cmp1, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !54
  %idxprom2 = sext i32 %4 to i64, !dbg !56
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !56
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !56
  call void @printIntLine(i32 %5), !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %6, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !64

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !65
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  call void @goodB2G(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
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
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !95, metadata !DIExpression()), !dbg !96
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !96
  store i32 -1, i32* %data, align 4, !dbg !97
  store i32 7, i32* %data, align 4, !dbg !98
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !99
  %1 = load i32, i32* %data, align 4, !dbg !100
  call void %0(i32 %1), !dbg !99
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !102 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !109
  %1 = load i32, i32* %data.addr, align 4, !dbg !110
  %cmp = icmp sge i32 %1, 0, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !114
  %idxprom = sext i32 %2 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !116
  store i32 1, i32* %arrayidx, align 4, !dbg !117
  store i32 0, i32* %i, align 4, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !121
  %cmp1 = icmp slt i32 %3, 10, !dbg !123
  br i1 %cmp1, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !125
  %idxprom2 = sext i32 %4 to i64, !dbg !127
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !127
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !127
  call void @printIntLine(i32 %5), !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !130
  %inc = add nsw i32 %6, 1, !dbg !130
  store i32 %inc, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !138 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !141, metadata !DIExpression()), !dbg !142
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !142
  store i32 -1, i32* %data, align 4, !dbg !143
  store i32 10, i32* %data, align 4, !dbg !144
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !145
  %1 = load i32, i32* %data, align 4, !dbg !146
  call void %0(i32 %1), !dbg !145
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !148 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %i, metadata !151, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !155
  %1 = load i32, i32* %data.addr, align 4, !dbg !156
  %cmp = icmp sge i32 %1, 0, !dbg !158
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !159

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !160
  %cmp1 = icmp slt i32 %2, 10, !dbg !161
  br i1 %cmp1, label %if.then, label %if.else, !dbg !162

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !163
  %idxprom = sext i32 %3 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !165
  store i32 1, i32* %arrayidx, align 4, !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !170
  %cmp2 = icmp slt i32 %4, 10, !dbg !172
  br i1 %cmp2, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !174
  %idxprom3 = sext i32 %5 to i64, !dbg !176
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !176
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !176
  call void @printIntLine(i32 %6), !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !179
  %inc = add nsw i32 %7, 1, !dbg !179
  store i32 %inc, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !183

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !184
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !186
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44_bad", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 47, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 47, column: 9, scope: !11)
!18 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 49, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !16}
!22 = !DILocation(line: 49, column: 12, scope: !11)
!23 = !DILocation(line: 51, column: 10, scope: !11)
!24 = !DILocation(line: 53, column: 10, scope: !11)
!25 = !DILocation(line: 55, column: 5, scope: !11)
!26 = !DILocation(line: 55, column: 13, scope: !11)
!27 = !DILocation(line: 56, column: 1, scope: !11)
!28 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 22, type: !20, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "data", arg: 1, scope: !28, file: !12, line: 22, type: !16)
!30 = !DILocation(line: 22, column: 25, scope: !28)
!31 = !DILocalVariable(name: "i", scope: !32, file: !12, line: 25, type: !16)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 24, column: 5)
!33 = !DILocation(line: 25, column: 13, scope: !32)
!34 = !DILocalVariable(name: "buffer", scope: !32, file: !12, line: 26, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 26, column: 13, scope: !32)
!39 = !DILocation(line: 29, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 13)
!41 = !DILocation(line: 29, column: 18, scope: !40)
!42 = !DILocation(line: 29, column: 13, scope: !32)
!43 = !DILocation(line: 31, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 30, column: 9)
!45 = !DILocation(line: 31, column: 13, scope: !44)
!46 = !DILocation(line: 31, column: 26, scope: !44)
!47 = !DILocation(line: 33, column: 19, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 33, column: 13)
!49 = !DILocation(line: 33, column: 17, scope: !48)
!50 = !DILocation(line: 33, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 33, column: 13)
!52 = !DILocation(line: 33, column: 26, scope: !51)
!53 = !DILocation(line: 33, column: 13, scope: !48)
!54 = !DILocation(line: 35, column: 37, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 34, column: 13)
!56 = !DILocation(line: 35, column: 30, scope: !55)
!57 = !DILocation(line: 35, column: 17, scope: !55)
!58 = !DILocation(line: 36, column: 13, scope: !55)
!59 = !DILocation(line: 33, column: 33, scope: !51)
!60 = !DILocation(line: 33, column: 13, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 36, column: 13, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 37, column: 9, scope: !44)
!65 = !DILocation(line: 40, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !40, file: !12, line: 39, column: 9)
!67 = !DILocation(line: 43, column: 1, scope: !28)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_44_good", scope: !12, file: !12, line: 132, type: !13, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 134, column: 5, scope: !68)
!70 = !DILocation(line: 135, column: 5, scope: !68)
!71 = !DILocation(line: 136, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 146, type: !73, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!16, !16, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 146, type: !16)
!79 = !DILocation(line: 146, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 146, type: !75)
!81 = !DILocation(line: 146, column: 27, scope: !72)
!82 = !DILocation(line: 149, column: 22, scope: !72)
!83 = !DILocation(line: 149, column: 12, scope: !72)
!84 = !DILocation(line: 149, column: 5, scope: !72)
!85 = !DILocation(line: 151, column: 5, scope: !72)
!86 = !DILocation(line: 152, column: 5, scope: !72)
!87 = !DILocation(line: 153, column: 5, scope: !72)
!88 = !DILocation(line: 156, column: 5, scope: !72)
!89 = !DILocation(line: 157, column: 5, scope: !72)
!90 = !DILocation(line: 158, column: 5, scope: !72)
!91 = !DILocation(line: 160, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 88, type: !16)
!94 = !DILocation(line: 88, column: 9, scope: !92)
!95 = !DILocalVariable(name: "funcPtr", scope: !92, file: !12, line: 89, type: !19)
!96 = !DILocation(line: 89, column: 12, scope: !92)
!97 = !DILocation(line: 91, column: 10, scope: !92)
!98 = !DILocation(line: 94, column: 10, scope: !92)
!99 = !DILocation(line: 95, column: 5, scope: !92)
!100 = !DILocation(line: 95, column: 13, scope: !92)
!101 = !DILocation(line: 96, column: 1, scope: !92)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 63, type: !20, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", arg: 1, scope: !102, file: !12, line: 63, type: !16)
!104 = !DILocation(line: 63, column: 29, scope: !102)
!105 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 66, type: !16)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 65, column: 5)
!107 = !DILocation(line: 66, column: 13, scope: !106)
!108 = !DILocalVariable(name: "buffer", scope: !106, file: !12, line: 67, type: !35)
!109 = !DILocation(line: 67, column: 13, scope: !106)
!110 = !DILocation(line: 70, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !12, line: 70, column: 13)
!112 = !DILocation(line: 70, column: 18, scope: !111)
!113 = !DILocation(line: 70, column: 13, scope: !106)
!114 = !DILocation(line: 72, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 71, column: 9)
!116 = !DILocation(line: 72, column: 13, scope: !115)
!117 = !DILocation(line: 72, column: 26, scope: !115)
!118 = !DILocation(line: 74, column: 19, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 74, column: 13)
!120 = !DILocation(line: 74, column: 17, scope: !119)
!121 = !DILocation(line: 74, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 74, column: 13)
!123 = !DILocation(line: 74, column: 26, scope: !122)
!124 = !DILocation(line: 74, column: 13, scope: !119)
!125 = !DILocation(line: 76, column: 37, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 75, column: 13)
!127 = !DILocation(line: 76, column: 30, scope: !126)
!128 = !DILocation(line: 76, column: 17, scope: !126)
!129 = !DILocation(line: 77, column: 13, scope: !126)
!130 = !DILocation(line: 74, column: 33, scope: !122)
!131 = !DILocation(line: 74, column: 13, scope: !122)
!132 = distinct !{!132, !124, !133, !63}
!133 = !DILocation(line: 77, column: 13, scope: !119)
!134 = !DILocation(line: 78, column: 9, scope: !115)
!135 = !DILocation(line: 81, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !111, file: !12, line: 80, column: 9)
!137 = !DILocation(line: 84, column: 1, scope: !102)
!138 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 121, type: !13, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 123, type: !16)
!140 = !DILocation(line: 123, column: 9, scope: !138)
!141 = !DILocalVariable(name: "funcPtr", scope: !138, file: !12, line: 124, type: !19)
!142 = !DILocation(line: 124, column: 12, scope: !138)
!143 = !DILocation(line: 126, column: 10, scope: !138)
!144 = !DILocation(line: 128, column: 10, scope: !138)
!145 = !DILocation(line: 129, column: 5, scope: !138)
!146 = !DILocation(line: 129, column: 13, scope: !138)
!147 = !DILocation(line: 130, column: 1, scope: !138)
!148 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 99, type: !20, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", arg: 1, scope: !148, file: !12, line: 99, type: !16)
!150 = !DILocation(line: 99, column: 29, scope: !148)
!151 = !DILocalVariable(name: "i", scope: !152, file: !12, line: 102, type: !16)
!152 = distinct !DILexicalBlock(scope: !148, file: !12, line: 101, column: 5)
!153 = !DILocation(line: 102, column: 13, scope: !152)
!154 = !DILocalVariable(name: "buffer", scope: !152, file: !12, line: 103, type: !35)
!155 = !DILocation(line: 103, column: 13, scope: !152)
!156 = !DILocation(line: 105, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 105, column: 13)
!158 = !DILocation(line: 105, column: 18, scope: !157)
!159 = !DILocation(line: 105, column: 23, scope: !157)
!160 = !DILocation(line: 105, column: 26, scope: !157)
!161 = !DILocation(line: 105, column: 31, scope: !157)
!162 = !DILocation(line: 105, column: 13, scope: !152)
!163 = !DILocation(line: 107, column: 20, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !12, line: 106, column: 9)
!165 = !DILocation(line: 107, column: 13, scope: !164)
!166 = !DILocation(line: 107, column: 26, scope: !164)
!167 = !DILocation(line: 109, column: 19, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 109, column: 13)
!169 = !DILocation(line: 109, column: 17, scope: !168)
!170 = !DILocation(line: 109, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 109, column: 13)
!172 = !DILocation(line: 109, column: 26, scope: !171)
!173 = !DILocation(line: 109, column: 13, scope: !168)
!174 = !DILocation(line: 111, column: 37, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !12, line: 110, column: 13)
!176 = !DILocation(line: 111, column: 30, scope: !175)
!177 = !DILocation(line: 111, column: 17, scope: !175)
!178 = !DILocation(line: 112, column: 13, scope: !175)
!179 = !DILocation(line: 109, column: 33, scope: !171)
!180 = !DILocation(line: 109, column: 13, scope: !171)
!181 = distinct !{!181, !173, !182, !63}
!182 = !DILocation(line: 112, column: 13, scope: !168)
!183 = !DILocation(line: 113, column: 9, scope: !164)
!184 = !DILocation(line: 116, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !157, file: !12, line: 115, column: 9)
!186 = !DILocation(line: 119, column: 1, scope: !148)
