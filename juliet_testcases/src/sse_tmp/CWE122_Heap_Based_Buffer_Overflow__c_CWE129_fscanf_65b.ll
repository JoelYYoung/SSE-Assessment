; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b_badSink(i32 %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %buffer, align 8, !dbg !23
  %1 = load i32*, i32** %buffer, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !35
  %cmp1 = icmp slt i32 %2, 10, !dbg !37
  br i1 %cmp1, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !39
  %4 = load i32, i32* %i, align 4, !dbg !41
  %idxprom = sext i32 %4 to i64, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %5, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !49
  %cmp2 = icmp sge i32 %6, 0, !dbg !51
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !52

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !53
  %8 = load i32, i32* %data.addr, align 4, !dbg !55
  %idxprom4 = sext i32 %8 to i64, !dbg !53
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !53
  store i32 1, i32* %arrayidx5, align 4, !dbg !56
  store i32 0, i32* %i, align 4, !dbg !57
  br label %for.cond6, !dbg !59

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !60
  %cmp7 = icmp slt i32 %9, 10, !dbg !62
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !63

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !64
  %11 = load i32, i32* %i, align 4, !dbg !66
  %idxprom9 = sext i32 %11 to i64, !dbg !64
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !64
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !64
  call void @printIntLine(i32 %12), !dbg !67
  br label %for.inc11, !dbg !68

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !69
  %inc12 = add nsw i32 %13, 1, !dbg !69
  store i32 %inc12, i32* %i, align 4, !dbg !69
  br label %for.cond6, !dbg !70, !llvm.loop !71

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !73

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !74
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !76
  %15 = bitcast i32* %14 to i8*, !dbg !76
  call void @free(i8* %15) #5, !dbg !77
  ret void, !dbg !78
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b_goodG2BSink(i32 %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %i, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %buffer, align 8, !dbg !86
  %1 = load i32*, i32** %buffer, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !98
  %cmp1 = icmp slt i32 %2, 10, !dbg !100
  br i1 %cmp1, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !102
  %4 = load i32, i32* %i, align 4, !dbg !104
  %idxprom = sext i32 %4 to i64, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !107
  %inc = add nsw i32 %5, 1, !dbg !107
  store i32 %inc, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !111
  %cmp2 = icmp sge i32 %6, 0, !dbg !113
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !114

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !115
  %8 = load i32, i32* %data.addr, align 4, !dbg !117
  %idxprom4 = sext i32 %8 to i64, !dbg !115
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !115
  store i32 1, i32* %arrayidx5, align 4, !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond6, !dbg !121

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !122
  %cmp7 = icmp slt i32 %9, 10, !dbg !124
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !125

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !126
  %11 = load i32, i32* %i, align 4, !dbg !128
  %idxprom9 = sext i32 %11 to i64, !dbg !126
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !126
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !126
  call void @printIntLine(i32 %12), !dbg !129
  br label %for.inc11, !dbg !130

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !131
  %inc12 = add nsw i32 %13, 1, !dbg !131
  store i32 %inc12, i32* %i, align 4, !dbg !131
  br label %for.cond6, !dbg !132, !llvm.loop !133

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !135

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !136
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !138
  %15 = bitcast i32* %14 to i8*, !dbg !138
  call void @free(i8* %15) #5, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b_goodB2GSink(i32 %data) #0 !dbg !141 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !149
  %0 = bitcast i8* %call to i32*, !dbg !150
  store i32* %0, i32** %buffer, align 8, !dbg !148
  %1 = load i32*, i32** %buffer, align 8, !dbg !151
  %cmp = icmp eq i32* %1, null, !dbg !153
  br i1 %cmp, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !160
  %cmp1 = icmp slt i32 %2, 10, !dbg !162
  br i1 %cmp1, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !164
  %4 = load i32, i32* %i, align 4, !dbg !166
  %idxprom = sext i32 %4 to i64, !dbg !164
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !164
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %5, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !173
  %cmp2 = icmp sge i32 %6, 0, !dbg !175
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !176

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !177
  %cmp3 = icmp slt i32 %7, 10, !dbg !178
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !179

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !180
  %9 = load i32, i32* %data.addr, align 4, !dbg !182
  %idxprom5 = sext i32 %9 to i64, !dbg !180
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !180
  store i32 1, i32* %arrayidx6, align 4, !dbg !183
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond7, !dbg !186

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !187
  %cmp8 = icmp slt i32 %10, 10, !dbg !189
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !190

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !191
  %12 = load i32, i32* %i, align 4, !dbg !193
  %idxprom10 = sext i32 %12 to i64, !dbg !191
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !191
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !191
  call void @printIntLine(i32 %13), !dbg !194
  br label %for.inc12, !dbg !195

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !196
  %inc13 = add nsw i32 %14, 1, !dbg !196
  store i32 %inc13, i32* %i, align 4, !dbg !196
  br label %for.cond7, !dbg !197, !llvm.loop !198

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !200

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !201
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !203
  %16 = bitcast i32* %15 to i8*, !dbg !203
  call void @free(i8* %16) #5, !dbg !204
  ret void, !dbg !205
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b_badSink", scope: !14, file: !14, line: 22, type: !15, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !5}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 22, type: !5)
!18 = !DILocation(line: 22, column: 73, scope: !13)
!19 = !DILocalVariable(name: "i", scope: !20, file: !14, line: 25, type: !5)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 24, column: 5)
!21 = !DILocation(line: 25, column: 13, scope: !20)
!22 = !DILocalVariable(name: "buffer", scope: !20, file: !14, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !20)
!24 = !DILocation(line: 26, column: 31, scope: !20)
!25 = !DILocation(line: 26, column: 24, scope: !20)
!26 = !DILocation(line: 27, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !14, line: 27, column: 13)
!28 = !DILocation(line: 27, column: 20, scope: !27)
!29 = !DILocation(line: 27, column: 13, scope: !20)
!30 = !DILocation(line: 27, column: 30, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 27, column: 29)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !14, line: 29, column: 9)
!34 = !DILocation(line: 29, column: 14, scope: !33)
!35 = !DILocation(line: 29, column: 21, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !14, line: 29, column: 9)
!37 = !DILocation(line: 29, column: 23, scope: !36)
!38 = !DILocation(line: 29, column: 9, scope: !33)
!39 = !DILocation(line: 31, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 30, column: 9)
!41 = !DILocation(line: 31, column: 20, scope: !40)
!42 = !DILocation(line: 31, column: 23, scope: !40)
!43 = !DILocation(line: 32, column: 9, scope: !40)
!44 = !DILocation(line: 29, column: 30, scope: !36)
!45 = !DILocation(line: 29, column: 9, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 32, column: 9, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 35, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !20, file: !14, line: 35, column: 13)
!51 = !DILocation(line: 35, column: 18, scope: !50)
!52 = !DILocation(line: 35, column: 13, scope: !20)
!53 = !DILocation(line: 37, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !14, line: 36, column: 9)
!55 = !DILocation(line: 37, column: 20, scope: !54)
!56 = !DILocation(line: 37, column: 26, scope: !54)
!57 = !DILocation(line: 39, column: 19, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 39, column: 13)
!59 = !DILocation(line: 39, column: 17, scope: !58)
!60 = !DILocation(line: 39, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 39, column: 13)
!62 = !DILocation(line: 39, column: 26, scope: !61)
!63 = !DILocation(line: 39, column: 13, scope: !58)
!64 = !DILocation(line: 41, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !14, line: 40, column: 13)
!66 = !DILocation(line: 41, column: 37, scope: !65)
!67 = !DILocation(line: 41, column: 17, scope: !65)
!68 = !DILocation(line: 42, column: 13, scope: !65)
!69 = !DILocation(line: 39, column: 33, scope: !61)
!70 = !DILocation(line: 39, column: 13, scope: !61)
!71 = distinct !{!71, !63, !72, !48}
!72 = !DILocation(line: 42, column: 13, scope: !58)
!73 = !DILocation(line: 43, column: 9, scope: !54)
!74 = !DILocation(line: 46, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !50, file: !14, line: 45, column: 9)
!76 = !DILocation(line: 48, column: 14, scope: !20)
!77 = !DILocation(line: 48, column: 9, scope: !20)
!78 = !DILocation(line: 50, column: 1, scope: !13)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b_goodG2BSink", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !14, line: 57, type: !5)
!81 = !DILocation(line: 57, column: 77, scope: !79)
!82 = !DILocalVariable(name: "i", scope: !83, file: !14, line: 60, type: !5)
!83 = distinct !DILexicalBlock(scope: !79, file: !14, line: 59, column: 5)
!84 = !DILocation(line: 60, column: 13, scope: !83)
!85 = !DILocalVariable(name: "buffer", scope: !83, file: !14, line: 61, type: !4)
!86 = !DILocation(line: 61, column: 15, scope: !83)
!87 = !DILocation(line: 61, column: 31, scope: !83)
!88 = !DILocation(line: 61, column: 24, scope: !83)
!89 = !DILocation(line: 62, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !14, line: 62, column: 13)
!91 = !DILocation(line: 62, column: 20, scope: !90)
!92 = !DILocation(line: 62, column: 13, scope: !83)
!93 = !DILocation(line: 62, column: 30, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !14, line: 62, column: 29)
!95 = !DILocation(line: 64, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !83, file: !14, line: 64, column: 9)
!97 = !DILocation(line: 64, column: 14, scope: !96)
!98 = !DILocation(line: 64, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !14, line: 64, column: 9)
!100 = !DILocation(line: 64, column: 23, scope: !99)
!101 = !DILocation(line: 64, column: 9, scope: !96)
!102 = !DILocation(line: 66, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !14, line: 65, column: 9)
!104 = !DILocation(line: 66, column: 20, scope: !103)
!105 = !DILocation(line: 66, column: 23, scope: !103)
!106 = !DILocation(line: 67, column: 9, scope: !103)
!107 = !DILocation(line: 64, column: 30, scope: !99)
!108 = !DILocation(line: 64, column: 9, scope: !99)
!109 = distinct !{!109, !101, !110, !48}
!110 = !DILocation(line: 67, column: 9, scope: !96)
!111 = !DILocation(line: 70, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !83, file: !14, line: 70, column: 13)
!113 = !DILocation(line: 70, column: 18, scope: !112)
!114 = !DILocation(line: 70, column: 13, scope: !83)
!115 = !DILocation(line: 72, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !14, line: 71, column: 9)
!117 = !DILocation(line: 72, column: 20, scope: !116)
!118 = !DILocation(line: 72, column: 26, scope: !116)
!119 = !DILocation(line: 74, column: 19, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !14, line: 74, column: 13)
!121 = !DILocation(line: 74, column: 17, scope: !120)
!122 = !DILocation(line: 74, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 74, column: 13)
!124 = !DILocation(line: 74, column: 26, scope: !123)
!125 = !DILocation(line: 74, column: 13, scope: !120)
!126 = !DILocation(line: 76, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !14, line: 75, column: 13)
!128 = !DILocation(line: 76, column: 37, scope: !127)
!129 = !DILocation(line: 76, column: 17, scope: !127)
!130 = !DILocation(line: 77, column: 13, scope: !127)
!131 = !DILocation(line: 74, column: 33, scope: !123)
!132 = !DILocation(line: 74, column: 13, scope: !123)
!133 = distinct !{!133, !125, !134, !48}
!134 = !DILocation(line: 77, column: 13, scope: !120)
!135 = !DILocation(line: 78, column: 9, scope: !116)
!136 = !DILocation(line: 81, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !112, file: !14, line: 80, column: 9)
!138 = !DILocation(line: 83, column: 14, scope: !83)
!139 = !DILocation(line: 83, column: 9, scope: !83)
!140 = !DILocation(line: 85, column: 1, scope: !79)
!141 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_65b_goodB2GSink", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", arg: 1, scope: !141, file: !14, line: 88, type: !5)
!143 = !DILocation(line: 88, column: 77, scope: !141)
!144 = !DILocalVariable(name: "i", scope: !145, file: !14, line: 91, type: !5)
!145 = distinct !DILexicalBlock(scope: !141, file: !14, line: 90, column: 5)
!146 = !DILocation(line: 91, column: 13, scope: !145)
!147 = !DILocalVariable(name: "buffer", scope: !145, file: !14, line: 92, type: !4)
!148 = !DILocation(line: 92, column: 15, scope: !145)
!149 = !DILocation(line: 92, column: 31, scope: !145)
!150 = !DILocation(line: 92, column: 24, scope: !145)
!151 = !DILocation(line: 93, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !14, line: 93, column: 13)
!153 = !DILocation(line: 93, column: 20, scope: !152)
!154 = !DILocation(line: 93, column: 13, scope: !145)
!155 = !DILocation(line: 93, column: 30, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !14, line: 93, column: 29)
!157 = !DILocation(line: 95, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !14, line: 95, column: 9)
!159 = !DILocation(line: 95, column: 14, scope: !158)
!160 = !DILocation(line: 95, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !14, line: 95, column: 9)
!162 = !DILocation(line: 95, column: 23, scope: !161)
!163 = !DILocation(line: 95, column: 9, scope: !158)
!164 = !DILocation(line: 97, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !14, line: 96, column: 9)
!166 = !DILocation(line: 97, column: 20, scope: !165)
!167 = !DILocation(line: 97, column: 23, scope: !165)
!168 = !DILocation(line: 98, column: 9, scope: !165)
!169 = !DILocation(line: 95, column: 30, scope: !161)
!170 = !DILocation(line: 95, column: 9, scope: !161)
!171 = distinct !{!171, !163, !172, !48}
!172 = !DILocation(line: 98, column: 9, scope: !158)
!173 = !DILocation(line: 100, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !145, file: !14, line: 100, column: 13)
!175 = !DILocation(line: 100, column: 18, scope: !174)
!176 = !DILocation(line: 100, column: 23, scope: !174)
!177 = !DILocation(line: 100, column: 26, scope: !174)
!178 = !DILocation(line: 100, column: 31, scope: !174)
!179 = !DILocation(line: 100, column: 13, scope: !145)
!180 = !DILocation(line: 102, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !174, file: !14, line: 101, column: 9)
!182 = !DILocation(line: 102, column: 20, scope: !181)
!183 = !DILocation(line: 102, column: 26, scope: !181)
!184 = !DILocation(line: 104, column: 19, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !14, line: 104, column: 13)
!186 = !DILocation(line: 104, column: 17, scope: !185)
!187 = !DILocation(line: 104, column: 24, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !14, line: 104, column: 13)
!189 = !DILocation(line: 104, column: 26, scope: !188)
!190 = !DILocation(line: 104, column: 13, scope: !185)
!191 = !DILocation(line: 106, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !14, line: 105, column: 13)
!193 = !DILocation(line: 106, column: 37, scope: !192)
!194 = !DILocation(line: 106, column: 17, scope: !192)
!195 = !DILocation(line: 107, column: 13, scope: !192)
!196 = !DILocation(line: 104, column: 33, scope: !188)
!197 = !DILocation(line: 104, column: 13, scope: !188)
!198 = distinct !{!198, !190, !199, !48}
!199 = !DILocation(line: 107, column: 13, scope: !185)
!200 = !DILocation(line: 108, column: 9, scope: !181)
!201 = !DILocation(line: 111, column: 13, scope: !202)
!202 = distinct !DILexicalBlock(scope: !174, file: !14, line: 110, column: 9)
!203 = !DILocation(line: 113, column: 14, scope: !145)
!204 = !DILocation(line: 113, column: 9, scope: !145)
!205 = !DILocation(line: 115, column: 1, scope: !141)
