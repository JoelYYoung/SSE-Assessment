; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61b_badSource(i32 %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !26, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 40) #4, !dbg !28
  %1 = bitcast i8* %call1 to i32*, !dbg !29
  store i32* %1, i32** %buffer, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %2, 10, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !37
  %4 = load i32, i32* %i, align 4, !dbg !39
  %idxprom = sext i32 %4 to i64, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !47
  %cmp2 = icmp sge i32 %6, 0, !dbg !49
  br i1 %cmp2, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !51
  %8 = load i32, i32* %data, align 4, !dbg !53
  %idxprom3 = sext i32 %8 to i64, !dbg !51
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %idxprom3, !dbg !51
  store i32 1, i32* %arrayidx4, align 4, !dbg !54
  store i32 0, i32* %i, align 4, !dbg !55
  br label %for.cond5, !dbg !57

for.cond5:                                        ; preds = %for.inc10, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !58
  %cmp6 = icmp slt i32 %9, 10, !dbg !60
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !61

for.body7:                                        ; preds = %for.cond5
  %10 = load i32*, i32** %buffer, align 8, !dbg !62
  %11 = load i32, i32* %i, align 4, !dbg !64
  %idxprom8 = sext i32 %11 to i64, !dbg !62
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %idxprom8, !dbg !62
  %12 = load i32, i32* %arrayidx9, align 4, !dbg !62
  call void @printIntLine(i32 %12), !dbg !65
  br label %for.inc10, !dbg !66

for.inc10:                                        ; preds = %for.body7
  %13 = load i32, i32* %i, align 4, !dbg !67
  %inc11 = add nsw i32 %13, 1, !dbg !67
  store i32 %inc11, i32* %i, align 4, !dbg !67
  br label %for.cond5, !dbg !68, !llvm.loop !69

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !71

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !72
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  %14 = load i32*, i32** %buffer, align 8, !dbg !74
  %15 = bitcast i32* %14 to i8*, !dbg !74
  call void @free(i8* %15) #4, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61b_badSource(i32) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  call void @goodB2G(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #4, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #4, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %data, align 4, !dbg !104
  %0 = load i32, i32* %data, align 4, !dbg !105
  %call = call i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61b_goodG2BSource(i32 %0), !dbg !106
  store i32 %call, i32* %data, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %i, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !111, metadata !DIExpression()), !dbg !112
  %call1 = call noalias align 16 i8* @malloc(i64 40) #4, !dbg !113
  %1 = bitcast i8* %call1 to i32*, !dbg !114
  store i32* %1, i32** %buffer, align 8, !dbg !112
  store i32 0, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !118
  %cmp = icmp slt i32 %2, 10, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !122
  %4 = load i32, i32* %i, align 4, !dbg !124
  %idxprom = sext i32 %4 to i64, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !127
  %inc = add nsw i32 %5, 1, !dbg !127
  store i32 %inc, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !131
  %cmp2 = icmp sge i32 %6, 0, !dbg !133
  br i1 %cmp2, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !135
  %8 = load i32, i32* %data, align 4, !dbg !137
  %idxprom3 = sext i32 %8 to i64, !dbg !135
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %idxprom3, !dbg !135
  store i32 1, i32* %arrayidx4, align 4, !dbg !138
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond5, !dbg !141

for.cond5:                                        ; preds = %for.inc10, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !142
  %cmp6 = icmp slt i32 %9, 10, !dbg !144
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !145

for.body7:                                        ; preds = %for.cond5
  %10 = load i32*, i32** %buffer, align 8, !dbg !146
  %11 = load i32, i32* %i, align 4, !dbg !148
  %idxprom8 = sext i32 %11 to i64, !dbg !146
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %idxprom8, !dbg !146
  %12 = load i32, i32* %arrayidx9, align 4, !dbg !146
  call void @printIntLine(i32 %12), !dbg !149
  br label %for.inc10, !dbg !150

for.inc10:                                        ; preds = %for.body7
  %13 = load i32, i32* %i, align 4, !dbg !151
  %inc11 = add nsw i32 %13, 1, !dbg !151
  store i32 %inc11, i32* %i, align 4, !dbg !151
  br label %for.cond5, !dbg !152, !llvm.loop !153

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !155

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !156
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  %14 = load i32*, i32** %buffer, align 8, !dbg !158
  %15 = bitcast i32* %14 to i8*, !dbg !158
  call void @free(i8* %15) #4, !dbg !159
  ret void, !dbg !160
}

declare dso_local i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61b_goodG2BSource(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !161 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 -1, i32* %data, align 4, !dbg !164
  %0 = load i32, i32* %data, align 4, !dbg !165
  %call = call i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61b_goodB2GSource(i32 %0), !dbg !166
  store i32 %call, i32* %data, align 4, !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !171, metadata !DIExpression()), !dbg !172
  %call1 = call noalias align 16 i8* @malloc(i64 40) #4, !dbg !173
  %1 = bitcast i8* %call1 to i32*, !dbg !174
  store i32* %1, i32** %buffer, align 8, !dbg !172
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !178
  %cmp = icmp slt i32 %2, 10, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !182
  %4 = load i32, i32* %i, align 4, !dbg !184
  %idxprom = sext i32 %4 to i64, !dbg !182
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !182
  store i32 0, i32* %arrayidx, align 4, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !187
  %inc = add nsw i32 %5, 1, !dbg !187
  store i32 %inc, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !191
  %cmp2 = icmp sge i32 %6, 0, !dbg !193
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !194

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !195
  %cmp3 = icmp slt i32 %7, 10, !dbg !196
  br i1 %cmp3, label %if.then, label %if.else, !dbg !197

if.then:                                          ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !198
  %9 = load i32, i32* %data, align 4, !dbg !200
  %idxprom4 = sext i32 %9 to i64, !dbg !198
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !198
  store i32 1, i32* %arrayidx5, align 4, !dbg !201
  store i32 0, i32* %i, align 4, !dbg !202
  br label %for.cond6, !dbg !204

for.cond6:                                        ; preds = %for.inc11, %if.then
  %10 = load i32, i32* %i, align 4, !dbg !205
  %cmp7 = icmp slt i32 %10, 10, !dbg !207
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !208

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !209
  %12 = load i32, i32* %i, align 4, !dbg !211
  %idxprom9 = sext i32 %12 to i64, !dbg !209
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !209
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !209
  call void @printIntLine(i32 %13), !dbg !212
  br label %for.inc11, !dbg !213

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !214
  %inc12 = add nsw i32 %14, 1, !dbg !214
  store i32 %inc12, i32* %i, align 4, !dbg !214
  br label %for.cond6, !dbg !215, !llvm.loop !216

for.end13:                                        ; preds = %for.cond6
  br label %if.end, !dbg !218

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !219
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !221
  %16 = bitcast i32* %15 to i8*, !dbg !221
  call void @free(i8* %16) #4, !dbg !222
  ret void, !dbg !223
}

declare dso_local i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61b_goodB2GSource(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61_bad", scope: !14, file: !14, line: 25, type: !15, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 27, type: !5)
!18 = !DILocation(line: 27, column: 9, scope: !13)
!19 = !DILocation(line: 29, column: 10, scope: !13)
!20 = !DILocation(line: 30, column: 77, scope: !13)
!21 = !DILocation(line: 30, column: 12, scope: !13)
!22 = !DILocation(line: 30, column: 10, scope: !13)
!23 = !DILocalVariable(name: "i", scope: !24, file: !14, line: 32, type: !5)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!25 = !DILocation(line: 32, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 15, scope: !24)
!28 = !DILocation(line: 33, column: 31, scope: !24)
!29 = !DILocation(line: 33, column: 24, scope: !24)
!30 = !DILocation(line: 35, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !14, line: 35, column: 9)
!32 = !DILocation(line: 35, column: 14, scope: !31)
!33 = !DILocation(line: 35, column: 21, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !14, line: 35, column: 9)
!35 = !DILocation(line: 35, column: 23, scope: !34)
!36 = !DILocation(line: 35, column: 9, scope: !31)
!37 = !DILocation(line: 37, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 36, column: 9)
!39 = !DILocation(line: 37, column: 20, scope: !38)
!40 = !DILocation(line: 37, column: 23, scope: !38)
!41 = !DILocation(line: 38, column: 9, scope: !38)
!42 = !DILocation(line: 35, column: 30, scope: !34)
!43 = !DILocation(line: 35, column: 9, scope: !34)
!44 = distinct !{!44, !36, !45, !46}
!45 = !DILocation(line: 38, column: 9, scope: !31)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocation(line: 41, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !24, file: !14, line: 41, column: 13)
!49 = !DILocation(line: 41, column: 18, scope: !48)
!50 = !DILocation(line: 41, column: 13, scope: !24)
!51 = !DILocation(line: 43, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !14, line: 42, column: 9)
!53 = !DILocation(line: 43, column: 20, scope: !52)
!54 = !DILocation(line: 43, column: 26, scope: !52)
!55 = !DILocation(line: 45, column: 19, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 45, column: 13)
!57 = !DILocation(line: 45, column: 17, scope: !56)
!58 = !DILocation(line: 45, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 45, column: 13)
!60 = !DILocation(line: 45, column: 26, scope: !59)
!61 = !DILocation(line: 45, column: 13, scope: !56)
!62 = !DILocation(line: 47, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !14, line: 46, column: 13)
!64 = !DILocation(line: 47, column: 37, scope: !63)
!65 = !DILocation(line: 47, column: 17, scope: !63)
!66 = !DILocation(line: 48, column: 13, scope: !63)
!67 = !DILocation(line: 45, column: 33, scope: !59)
!68 = !DILocation(line: 45, column: 13, scope: !59)
!69 = distinct !{!69, !61, !70, !46}
!70 = !DILocation(line: 48, column: 13, scope: !56)
!71 = !DILocation(line: 49, column: 9, scope: !52)
!72 = !DILocation(line: 52, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !48, file: !14, line: 51, column: 9)
!74 = !DILocation(line: 54, column: 14, scope: !24)
!75 = !DILocation(line: 54, column: 9, scope: !24)
!76 = !DILocation(line: 56, column: 1, scope: !13)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_61_good", scope: !14, file: !14, line: 133, type: !15, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 135, column: 5, scope: !77)
!79 = !DILocation(line: 136, column: 5, scope: !77)
!80 = !DILocation(line: 137, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 148, type: !82, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!5, !5, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !14, line: 148, type: !5)
!88 = !DILocation(line: 148, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !14, line: 148, type: !84)
!90 = !DILocation(line: 148, column: 27, scope: !81)
!91 = !DILocation(line: 151, column: 22, scope: !81)
!92 = !DILocation(line: 151, column: 12, scope: !81)
!93 = !DILocation(line: 151, column: 5, scope: !81)
!94 = !DILocation(line: 153, column: 5, scope: !81)
!95 = !DILocation(line: 154, column: 5, scope: !81)
!96 = !DILocation(line: 155, column: 5, scope: !81)
!97 = !DILocation(line: 158, column: 5, scope: !81)
!98 = !DILocation(line: 159, column: 5, scope: !81)
!99 = !DILocation(line: 160, column: 5, scope: !81)
!100 = !DILocation(line: 162, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 67, type: !5)
!103 = !DILocation(line: 67, column: 9, scope: !101)
!104 = !DILocation(line: 69, column: 10, scope: !101)
!105 = !DILocation(line: 70, column: 81, scope: !101)
!106 = !DILocation(line: 70, column: 12, scope: !101)
!107 = !DILocation(line: 70, column: 10, scope: !101)
!108 = !DILocalVariable(name: "i", scope: !109, file: !14, line: 72, type: !5)
!109 = distinct !DILexicalBlock(scope: !101, file: !14, line: 71, column: 5)
!110 = !DILocation(line: 72, column: 13, scope: !109)
!111 = !DILocalVariable(name: "buffer", scope: !109, file: !14, line: 73, type: !4)
!112 = !DILocation(line: 73, column: 15, scope: !109)
!113 = !DILocation(line: 73, column: 31, scope: !109)
!114 = !DILocation(line: 73, column: 24, scope: !109)
!115 = !DILocation(line: 75, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !14, line: 75, column: 9)
!117 = !DILocation(line: 75, column: 14, scope: !116)
!118 = !DILocation(line: 75, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 75, column: 9)
!120 = !DILocation(line: 75, column: 23, scope: !119)
!121 = !DILocation(line: 75, column: 9, scope: !116)
!122 = !DILocation(line: 77, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !14, line: 76, column: 9)
!124 = !DILocation(line: 77, column: 20, scope: !123)
!125 = !DILocation(line: 77, column: 23, scope: !123)
!126 = !DILocation(line: 78, column: 9, scope: !123)
!127 = !DILocation(line: 75, column: 30, scope: !119)
!128 = !DILocation(line: 75, column: 9, scope: !119)
!129 = distinct !{!129, !121, !130, !46}
!130 = !DILocation(line: 78, column: 9, scope: !116)
!131 = !DILocation(line: 81, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !109, file: !14, line: 81, column: 13)
!133 = !DILocation(line: 81, column: 18, scope: !132)
!134 = !DILocation(line: 81, column: 13, scope: !109)
!135 = !DILocation(line: 83, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !14, line: 82, column: 9)
!137 = !DILocation(line: 83, column: 20, scope: !136)
!138 = !DILocation(line: 83, column: 26, scope: !136)
!139 = !DILocation(line: 85, column: 19, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !14, line: 85, column: 13)
!141 = !DILocation(line: 85, column: 17, scope: !140)
!142 = !DILocation(line: 85, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !14, line: 85, column: 13)
!144 = !DILocation(line: 85, column: 26, scope: !143)
!145 = !DILocation(line: 85, column: 13, scope: !140)
!146 = !DILocation(line: 87, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !14, line: 86, column: 13)
!148 = !DILocation(line: 87, column: 37, scope: !147)
!149 = !DILocation(line: 87, column: 17, scope: !147)
!150 = !DILocation(line: 88, column: 13, scope: !147)
!151 = !DILocation(line: 85, column: 33, scope: !143)
!152 = !DILocation(line: 85, column: 13, scope: !143)
!153 = distinct !{!153, !145, !154, !46}
!154 = !DILocation(line: 88, column: 13, scope: !140)
!155 = !DILocation(line: 89, column: 9, scope: !136)
!156 = !DILocation(line: 92, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !132, file: !14, line: 91, column: 9)
!158 = !DILocation(line: 94, column: 14, scope: !109)
!159 = !DILocation(line: 94, column: 9, scope: !109)
!160 = !DILocation(line: 96, column: 1, scope: !101)
!161 = distinct !DISubprogram(name: "goodB2G", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !14, line: 103, type: !5)
!163 = !DILocation(line: 103, column: 9, scope: !161)
!164 = !DILocation(line: 105, column: 10, scope: !161)
!165 = !DILocation(line: 106, column: 81, scope: !161)
!166 = !DILocation(line: 106, column: 12, scope: !161)
!167 = !DILocation(line: 106, column: 10, scope: !161)
!168 = !DILocalVariable(name: "i", scope: !169, file: !14, line: 108, type: !5)
!169 = distinct !DILexicalBlock(scope: !161, file: !14, line: 107, column: 5)
!170 = !DILocation(line: 108, column: 13, scope: !169)
!171 = !DILocalVariable(name: "buffer", scope: !169, file: !14, line: 109, type: !4)
!172 = !DILocation(line: 109, column: 15, scope: !169)
!173 = !DILocation(line: 109, column: 31, scope: !169)
!174 = !DILocation(line: 109, column: 24, scope: !169)
!175 = !DILocation(line: 111, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !14, line: 111, column: 9)
!177 = !DILocation(line: 111, column: 14, scope: !176)
!178 = !DILocation(line: 111, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !14, line: 111, column: 9)
!180 = !DILocation(line: 111, column: 23, scope: !179)
!181 = !DILocation(line: 111, column: 9, scope: !176)
!182 = !DILocation(line: 113, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !14, line: 112, column: 9)
!184 = !DILocation(line: 113, column: 20, scope: !183)
!185 = !DILocation(line: 113, column: 23, scope: !183)
!186 = !DILocation(line: 114, column: 9, scope: !183)
!187 = !DILocation(line: 111, column: 30, scope: !179)
!188 = !DILocation(line: 111, column: 9, scope: !179)
!189 = distinct !{!189, !181, !190, !46}
!190 = !DILocation(line: 114, column: 9, scope: !176)
!191 = !DILocation(line: 116, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !169, file: !14, line: 116, column: 13)
!193 = !DILocation(line: 116, column: 18, scope: !192)
!194 = !DILocation(line: 116, column: 23, scope: !192)
!195 = !DILocation(line: 116, column: 26, scope: !192)
!196 = !DILocation(line: 116, column: 31, scope: !192)
!197 = !DILocation(line: 116, column: 13, scope: !169)
!198 = !DILocation(line: 118, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !192, file: !14, line: 117, column: 9)
!200 = !DILocation(line: 118, column: 20, scope: !199)
!201 = !DILocation(line: 118, column: 26, scope: !199)
!202 = !DILocation(line: 120, column: 19, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !14, line: 120, column: 13)
!204 = !DILocation(line: 120, column: 17, scope: !203)
!205 = !DILocation(line: 120, column: 24, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !14, line: 120, column: 13)
!207 = !DILocation(line: 120, column: 26, scope: !206)
!208 = !DILocation(line: 120, column: 13, scope: !203)
!209 = !DILocation(line: 122, column: 30, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !14, line: 121, column: 13)
!211 = !DILocation(line: 122, column: 37, scope: !210)
!212 = !DILocation(line: 122, column: 17, scope: !210)
!213 = !DILocation(line: 123, column: 13, scope: !210)
!214 = !DILocation(line: 120, column: 33, scope: !206)
!215 = !DILocation(line: 120, column: 13, scope: !206)
!216 = distinct !{!216, !208, !217, !46}
!217 = !DILocation(line: 123, column: 13, scope: !203)
!218 = !DILocation(line: 124, column: 9, scope: !199)
!219 = !DILocation(line: 127, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !192, file: !14, line: 126, column: 9)
!221 = !DILocation(line: 129, column: 14, scope: !169)
!222 = !DILocation(line: 129, column: 9, scope: !169)
!223 = !DILocation(line: 131, column: 1, scope: !161)
