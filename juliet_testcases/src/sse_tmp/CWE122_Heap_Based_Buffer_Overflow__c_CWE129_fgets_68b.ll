; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68_badData = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68_goodG2BData = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68_goodB2GData = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b_badSink() #0 !dbg !13 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68_badData, align 4, !dbg !19
  store i32 %0, i32* %data, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !25
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %buffer, align 8, !dbg !24
  %2 = load i32*, i32** %buffer, align 8, !dbg !27
  %cmp = icmp eq i32* %2, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !36
  %cmp1 = icmp slt i32 %3, 10, !dbg !38
  br i1 %cmp1, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !40
  %5 = load i32, i32* %i, align 4, !dbg !42
  %idxprom = sext i32 %5 to i64, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %6, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !50
  %cmp2 = icmp sge i32 %7, 0, !dbg !52
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !53

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !54
  %9 = load i32, i32* %data, align 4, !dbg !56
  %idxprom4 = sext i32 %9 to i64, !dbg !54
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !54
  store i32 1, i32* %arrayidx5, align 4, !dbg !57
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond6, !dbg !60

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !61
  %cmp7 = icmp slt i32 %10, 10, !dbg !63
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !64

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !65
  %12 = load i32, i32* %i, align 4, !dbg !67
  %idxprom9 = sext i32 %12 to i64, !dbg !65
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !65
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !65
  call void @printIntLine(i32 %13), !dbg !68
  br label %for.inc11, !dbg !69

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !70
  %inc12 = add nsw i32 %14, 1, !dbg !70
  store i32 %inc12, i32* %i, align 4, !dbg !70
  br label %for.cond6, !dbg !71, !llvm.loop !72

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !74

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !75
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !77
  %16 = bitcast i32* %15 to i8*, !dbg !77
  call void @free(i8* %16) #5, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b_goodG2BSink() #0 !dbg !80 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68_goodG2BData, align 4, !dbg !83
  store i32 %0, i32* %data, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %i, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !89
  %1 = bitcast i8* %call to i32*, !dbg !90
  store i32* %1, i32** %buffer, align 8, !dbg !88
  %2 = load i32*, i32** %buffer, align 8, !dbg !91
  %cmp = icmp eq i32* %2, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !100
  %cmp1 = icmp slt i32 %3, 10, !dbg !102
  br i1 %cmp1, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !104
  %5 = load i32, i32* %i, align 4, !dbg !106
  %idxprom = sext i32 %5 to i64, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !109
  %inc = add nsw i32 %6, 1, !dbg !109
  store i32 %inc, i32* %i, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !113
  %cmp2 = icmp sge i32 %7, 0, !dbg !115
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !116

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !117
  %9 = load i32, i32* %data, align 4, !dbg !119
  %idxprom4 = sext i32 %9 to i64, !dbg !117
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !117
  store i32 1, i32* %arrayidx5, align 4, !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %for.cond6, !dbg !123

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !124
  %cmp7 = icmp slt i32 %10, 10, !dbg !126
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !127

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !128
  %12 = load i32, i32* %i, align 4, !dbg !130
  %idxprom9 = sext i32 %12 to i64, !dbg !128
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !128
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !128
  call void @printIntLine(i32 %13), !dbg !131
  br label %for.inc11, !dbg !132

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !133
  %inc12 = add nsw i32 %14, 1, !dbg !133
  store i32 %inc12, i32* %i, align 4, !dbg !133
  br label %for.cond6, !dbg !134, !llvm.loop !135

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !137

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !138
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !140
  %16 = bitcast i32* %15 to i8*, !dbg !140
  call void @free(i8* %16) #5, !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b_goodB2GSink() #0 !dbg !143 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68_goodB2GData, align 4, !dbg !146
  store i32 %0, i32* %data, align 4, !dbg !145
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !150, metadata !DIExpression()), !dbg !151
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !152
  %1 = bitcast i8* %call to i32*, !dbg !153
  store i32* %1, i32** %buffer, align 8, !dbg !151
  %2 = load i32*, i32** %buffer, align 8, !dbg !154
  %cmp = icmp eq i32* %2, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !163
  %cmp1 = icmp slt i32 %3, 10, !dbg !165
  br i1 %cmp1, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !167
  %5 = load i32, i32* %i, align 4, !dbg !169
  %idxprom = sext i32 %5 to i64, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %6, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !176
  %cmp2 = icmp sge i32 %7, 0, !dbg !178
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !179

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !180
  %cmp3 = icmp slt i32 %8, 10, !dbg !181
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !182

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !183
  %10 = load i32, i32* %data, align 4, !dbg !185
  %idxprom5 = sext i32 %10 to i64, !dbg !183
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !183
  store i32 1, i32* %arrayidx6, align 4, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond7, !dbg !189

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !190
  %cmp8 = icmp slt i32 %11, 10, !dbg !192
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !193

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !194
  %13 = load i32, i32* %i, align 4, !dbg !196
  %idxprom10 = sext i32 %13 to i64, !dbg !194
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !194
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !194
  call void @printIntLine(i32 %14), !dbg !197
  br label %for.inc12, !dbg !198

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !199
  %inc13 = add nsw i32 %15, 1, !dbg !199
  store i32 %inc13, i32* %i, align 4, !dbg !199
  br label %for.cond7, !dbg !200, !llvm.loop !201

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !203

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !204
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !206
  %17 = bitcast i32* %16 to i8*, !dbg !206
  call void @free(i8* %17) #5, !dbg !207
  ret void, !dbg !208
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !5)
!18 = !DILocation(line: 30, column: 9, scope: !13)
!19 = !DILocation(line: 30, column: 16, scope: !13)
!20 = !DILocalVariable(name: "i", scope: !21, file: !14, line: 32, type: !5)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!22 = !DILocation(line: 32, column: 13, scope: !21)
!23 = !DILocalVariable(name: "buffer", scope: !21, file: !14, line: 33, type: !4)
!24 = !DILocation(line: 33, column: 15, scope: !21)
!25 = !DILocation(line: 33, column: 31, scope: !21)
!26 = !DILocation(line: 33, column: 24, scope: !21)
!27 = !DILocation(line: 34, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !14, line: 34, column: 13)
!29 = !DILocation(line: 34, column: 20, scope: !28)
!30 = !DILocation(line: 34, column: 13, scope: !21)
!31 = !DILocation(line: 34, column: 30, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !14, line: 34, column: 29)
!33 = !DILocation(line: 36, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !21, file: !14, line: 36, column: 9)
!35 = !DILocation(line: 36, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 36, column: 9)
!38 = !DILocation(line: 36, column: 23, scope: !37)
!39 = !DILocation(line: 36, column: 9, scope: !34)
!40 = !DILocation(line: 38, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 37, column: 9)
!42 = !DILocation(line: 38, column: 20, scope: !41)
!43 = !DILocation(line: 38, column: 23, scope: !41)
!44 = !DILocation(line: 39, column: 9, scope: !41)
!45 = !DILocation(line: 36, column: 30, scope: !37)
!46 = !DILocation(line: 36, column: 9, scope: !37)
!47 = distinct !{!47, !39, !48, !49}
!48 = !DILocation(line: 39, column: 9, scope: !34)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 42, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !21, file: !14, line: 42, column: 13)
!52 = !DILocation(line: 42, column: 18, scope: !51)
!53 = !DILocation(line: 42, column: 13, scope: !21)
!54 = !DILocation(line: 44, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !14, line: 43, column: 9)
!56 = !DILocation(line: 44, column: 20, scope: !55)
!57 = !DILocation(line: 44, column: 26, scope: !55)
!58 = !DILocation(line: 46, column: 19, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !14, line: 46, column: 13)
!60 = !DILocation(line: 46, column: 17, scope: !59)
!61 = !DILocation(line: 46, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !14, line: 46, column: 13)
!63 = !DILocation(line: 46, column: 26, scope: !62)
!64 = !DILocation(line: 46, column: 13, scope: !59)
!65 = !DILocation(line: 48, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !14, line: 47, column: 13)
!67 = !DILocation(line: 48, column: 37, scope: !66)
!68 = !DILocation(line: 48, column: 17, scope: !66)
!69 = !DILocation(line: 49, column: 13, scope: !66)
!70 = !DILocation(line: 46, column: 33, scope: !62)
!71 = !DILocation(line: 46, column: 13, scope: !62)
!72 = distinct !{!72, !64, !73, !49}
!73 = !DILocation(line: 49, column: 13, scope: !59)
!74 = !DILocation(line: 50, column: 9, scope: !55)
!75 = !DILocation(line: 53, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !51, file: !14, line: 52, column: 9)
!77 = !DILocation(line: 55, column: 14, scope: !21)
!78 = !DILocation(line: 55, column: 9, scope: !21)
!79 = !DILocation(line: 57, column: 1, scope: !13)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b_goodG2BSink", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !14, line: 66, type: !5)
!82 = !DILocation(line: 66, column: 9, scope: !80)
!83 = !DILocation(line: 66, column: 16, scope: !80)
!84 = !DILocalVariable(name: "i", scope: !85, file: !14, line: 68, type: !5)
!85 = distinct !DILexicalBlock(scope: !80, file: !14, line: 67, column: 5)
!86 = !DILocation(line: 68, column: 13, scope: !85)
!87 = !DILocalVariable(name: "buffer", scope: !85, file: !14, line: 69, type: !4)
!88 = !DILocation(line: 69, column: 15, scope: !85)
!89 = !DILocation(line: 69, column: 31, scope: !85)
!90 = !DILocation(line: 69, column: 24, scope: !85)
!91 = !DILocation(line: 70, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !14, line: 70, column: 13)
!93 = !DILocation(line: 70, column: 20, scope: !92)
!94 = !DILocation(line: 70, column: 13, scope: !85)
!95 = !DILocation(line: 70, column: 30, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !14, line: 70, column: 29)
!97 = !DILocation(line: 72, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !14, line: 72, column: 9)
!99 = !DILocation(line: 72, column: 14, scope: !98)
!100 = !DILocation(line: 72, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !14, line: 72, column: 9)
!102 = !DILocation(line: 72, column: 23, scope: !101)
!103 = !DILocation(line: 72, column: 9, scope: !98)
!104 = !DILocation(line: 74, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !14, line: 73, column: 9)
!106 = !DILocation(line: 74, column: 20, scope: !105)
!107 = !DILocation(line: 74, column: 23, scope: !105)
!108 = !DILocation(line: 75, column: 9, scope: !105)
!109 = !DILocation(line: 72, column: 30, scope: !101)
!110 = !DILocation(line: 72, column: 9, scope: !101)
!111 = distinct !{!111, !103, !112, !49}
!112 = !DILocation(line: 75, column: 9, scope: !98)
!113 = !DILocation(line: 78, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !85, file: !14, line: 78, column: 13)
!115 = !DILocation(line: 78, column: 18, scope: !114)
!116 = !DILocation(line: 78, column: 13, scope: !85)
!117 = !DILocation(line: 80, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !14, line: 79, column: 9)
!119 = !DILocation(line: 80, column: 20, scope: !118)
!120 = !DILocation(line: 80, column: 26, scope: !118)
!121 = !DILocation(line: 82, column: 19, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !14, line: 82, column: 13)
!123 = !DILocation(line: 82, column: 17, scope: !122)
!124 = !DILocation(line: 82, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 82, column: 13)
!126 = !DILocation(line: 82, column: 26, scope: !125)
!127 = !DILocation(line: 82, column: 13, scope: !122)
!128 = !DILocation(line: 84, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !14, line: 83, column: 13)
!130 = !DILocation(line: 84, column: 37, scope: !129)
!131 = !DILocation(line: 84, column: 17, scope: !129)
!132 = !DILocation(line: 85, column: 13, scope: !129)
!133 = !DILocation(line: 82, column: 33, scope: !125)
!134 = !DILocation(line: 82, column: 13, scope: !125)
!135 = distinct !{!135, !127, !136, !49}
!136 = !DILocation(line: 85, column: 13, scope: !122)
!137 = !DILocation(line: 86, column: 9, scope: !118)
!138 = !DILocation(line: 89, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !114, file: !14, line: 88, column: 9)
!140 = !DILocation(line: 91, column: 14, scope: !85)
!141 = !DILocation(line: 91, column: 9, scope: !85)
!142 = !DILocation(line: 93, column: 1, scope: !80)
!143 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_68b_goodB2GSink", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !14, line: 98, type: !5)
!145 = !DILocation(line: 98, column: 9, scope: !143)
!146 = !DILocation(line: 98, column: 16, scope: !143)
!147 = !DILocalVariable(name: "i", scope: !148, file: !14, line: 100, type: !5)
!148 = distinct !DILexicalBlock(scope: !143, file: !14, line: 99, column: 5)
!149 = !DILocation(line: 100, column: 13, scope: !148)
!150 = !DILocalVariable(name: "buffer", scope: !148, file: !14, line: 101, type: !4)
!151 = !DILocation(line: 101, column: 15, scope: !148)
!152 = !DILocation(line: 101, column: 31, scope: !148)
!153 = !DILocation(line: 101, column: 24, scope: !148)
!154 = !DILocation(line: 102, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !14, line: 102, column: 13)
!156 = !DILocation(line: 102, column: 20, scope: !155)
!157 = !DILocation(line: 102, column: 13, scope: !148)
!158 = !DILocation(line: 102, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !14, line: 102, column: 29)
!160 = !DILocation(line: 104, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !148, file: !14, line: 104, column: 9)
!162 = !DILocation(line: 104, column: 14, scope: !161)
!163 = !DILocation(line: 104, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !14, line: 104, column: 9)
!165 = !DILocation(line: 104, column: 23, scope: !164)
!166 = !DILocation(line: 104, column: 9, scope: !161)
!167 = !DILocation(line: 106, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !14, line: 105, column: 9)
!169 = !DILocation(line: 106, column: 20, scope: !168)
!170 = !DILocation(line: 106, column: 23, scope: !168)
!171 = !DILocation(line: 107, column: 9, scope: !168)
!172 = !DILocation(line: 104, column: 30, scope: !164)
!173 = !DILocation(line: 104, column: 9, scope: !164)
!174 = distinct !{!174, !166, !175, !49}
!175 = !DILocation(line: 107, column: 9, scope: !161)
!176 = !DILocation(line: 109, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !148, file: !14, line: 109, column: 13)
!178 = !DILocation(line: 109, column: 18, scope: !177)
!179 = !DILocation(line: 109, column: 23, scope: !177)
!180 = !DILocation(line: 109, column: 26, scope: !177)
!181 = !DILocation(line: 109, column: 31, scope: !177)
!182 = !DILocation(line: 109, column: 13, scope: !148)
!183 = !DILocation(line: 111, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !14, line: 110, column: 9)
!185 = !DILocation(line: 111, column: 20, scope: !184)
!186 = !DILocation(line: 111, column: 26, scope: !184)
!187 = !DILocation(line: 113, column: 19, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !14, line: 113, column: 13)
!189 = !DILocation(line: 113, column: 17, scope: !188)
!190 = !DILocation(line: 113, column: 24, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !14, line: 113, column: 13)
!192 = !DILocation(line: 113, column: 26, scope: !191)
!193 = !DILocation(line: 113, column: 13, scope: !188)
!194 = !DILocation(line: 115, column: 30, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !14, line: 114, column: 13)
!196 = !DILocation(line: 115, column: 37, scope: !195)
!197 = !DILocation(line: 115, column: 17, scope: !195)
!198 = !DILocation(line: 116, column: 13, scope: !195)
!199 = !DILocation(line: 113, column: 33, scope: !191)
!200 = !DILocation(line: 113, column: 13, scope: !191)
!201 = distinct !{!201, !193, !202, !49}
!202 = !DILocation(line: 116, column: 13, scope: !188)
!203 = !DILocation(line: 117, column: 9, scope: !184)
!204 = !DILocation(line: 120, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !177, file: !14, line: 119, column: 9)
!206 = !DILocation(line: 122, column: 14, scope: !148)
!207 = !DILocation(line: 122, column: 9, scope: !148)
!208 = !DILocation(line: 124, column: 1, scope: !143)
