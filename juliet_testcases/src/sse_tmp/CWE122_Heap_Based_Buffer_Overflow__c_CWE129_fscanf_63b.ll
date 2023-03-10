; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b_badSink(i32* %dataPtr) #0 !dbg !13 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !21
  %1 = load i32, i32* %0, align 4, !dbg !22
  store i32 %1, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !28
  %2 = bitcast i8* %call to i32*, !dbg !29
  store i32* %2, i32** %buffer, align 8, !dbg !27
  %3 = load i32*, i32** %buffer, align 8, !dbg !30
  %cmp = icmp eq i32* %3, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !39
  %cmp1 = icmp slt i32 %4, 10, !dbg !41
  br i1 %cmp1, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !43
  %6 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %6 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %7, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !53
  %cmp2 = icmp sge i32 %8, 0, !dbg !55
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !56

if.then3:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !57
  %10 = load i32, i32* %data, align 4, !dbg !59
  %idxprom4 = sext i32 %10 to i64, !dbg !57
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %idxprom4, !dbg !57
  store i32 1, i32* %arrayidx5, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond6, !dbg !63

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %11 = load i32, i32* %i, align 4, !dbg !64
  %cmp7 = icmp slt i32 %11, 10, !dbg !66
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !67

for.body8:                                        ; preds = %for.cond6
  %12 = load i32*, i32** %buffer, align 8, !dbg !68
  %13 = load i32, i32* %i, align 4, !dbg !70
  %idxprom9 = sext i32 %13 to i64, !dbg !68
  %arrayidx10 = getelementptr inbounds i32, i32* %12, i64 %idxprom9, !dbg !68
  %14 = load i32, i32* %arrayidx10, align 4, !dbg !68
  call void @printIntLine(i32 %14), !dbg !71
  br label %for.inc11, !dbg !72

for.inc11:                                        ; preds = %for.body8
  %15 = load i32, i32* %i, align 4, !dbg !73
  %inc12 = add nsw i32 %15, 1, !dbg !73
  store i32 %inc12, i32* %i, align 4, !dbg !73
  br label %for.cond6, !dbg !74, !llvm.loop !75

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !77

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !78
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %16 = load i32*, i32** %buffer, align 8, !dbg !80
  %17 = bitcast i32* %16 to i8*, !dbg !80
  call void @free(i8* %17) #5, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b_goodG2BSink(i32* %dataPtr) #0 !dbg !83 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %data, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !88
  %1 = load i32, i32* %0, align 4, !dbg !89
  store i32 %1, i32* %data, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !95
  %2 = bitcast i8* %call to i32*, !dbg !96
  store i32* %2, i32** %buffer, align 8, !dbg !94
  %3 = load i32*, i32** %buffer, align 8, !dbg !97
  %cmp = icmp eq i32* %3, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !106
  %cmp1 = icmp slt i32 %4, 10, !dbg !108
  br i1 %cmp1, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !110
  %6 = load i32, i32* %i, align 4, !dbg !112
  %idxprom = sext i32 %6 to i64, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !115
  %inc = add nsw i32 %7, 1, !dbg !115
  store i32 %inc, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !119
  %cmp2 = icmp sge i32 %8, 0, !dbg !121
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !122

if.then3:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !123
  %10 = load i32, i32* %data, align 4, !dbg !125
  %idxprom4 = sext i32 %10 to i64, !dbg !123
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %idxprom4, !dbg !123
  store i32 1, i32* %arrayidx5, align 4, !dbg !126
  store i32 0, i32* %i, align 4, !dbg !127
  br label %for.cond6, !dbg !129

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %11 = load i32, i32* %i, align 4, !dbg !130
  %cmp7 = icmp slt i32 %11, 10, !dbg !132
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !133

for.body8:                                        ; preds = %for.cond6
  %12 = load i32*, i32** %buffer, align 8, !dbg !134
  %13 = load i32, i32* %i, align 4, !dbg !136
  %idxprom9 = sext i32 %13 to i64, !dbg !134
  %arrayidx10 = getelementptr inbounds i32, i32* %12, i64 %idxprom9, !dbg !134
  %14 = load i32, i32* %arrayidx10, align 4, !dbg !134
  call void @printIntLine(i32 %14), !dbg !137
  br label %for.inc11, !dbg !138

for.inc11:                                        ; preds = %for.body8
  %15 = load i32, i32* %i, align 4, !dbg !139
  %inc12 = add nsw i32 %15, 1, !dbg !139
  store i32 %inc12, i32* %i, align 4, !dbg !139
  br label %for.cond6, !dbg !140, !llvm.loop !141

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !143

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !144
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %16 = load i32*, i32** %buffer, align 8, !dbg !146
  %17 = bitcast i32* %16 to i8*, !dbg !146
  call void @free(i8* %17) #5, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b_goodB2GSink(i32* %dataPtr) #0 !dbg !149 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !154
  %1 = load i32, i32* %0, align 4, !dbg !155
  store i32 %1, i32* %data, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata i32* %i, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !159, metadata !DIExpression()), !dbg !160
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !161
  %2 = bitcast i8* %call to i32*, !dbg !162
  store i32* %2, i32** %buffer, align 8, !dbg !160
  %3 = load i32*, i32** %buffer, align 8, !dbg !163
  %cmp = icmp eq i32* %3, null, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !172
  %cmp1 = icmp slt i32 %4, 10, !dbg !174
  br i1 %cmp1, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !176
  %6 = load i32, i32* %i, align 4, !dbg !178
  %idxprom = sext i32 %6 to i64, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !181
  %inc = add nsw i32 %7, 1, !dbg !181
  store i32 %inc, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !185
  %cmp2 = icmp sge i32 %8, 0, !dbg !187
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !188

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !189
  %cmp3 = icmp slt i32 %9, 10, !dbg !190
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !191

if.then4:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !192
  %11 = load i32, i32* %data, align 4, !dbg !194
  %idxprom5 = sext i32 %11 to i64, !dbg !192
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %idxprom5, !dbg !192
  store i32 1, i32* %arrayidx6, align 4, !dbg !195
  store i32 0, i32* %i, align 4, !dbg !196
  br label %for.cond7, !dbg !198

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %12 = load i32, i32* %i, align 4, !dbg !199
  %cmp8 = icmp slt i32 %12, 10, !dbg !201
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !202

for.body9:                                        ; preds = %for.cond7
  %13 = load i32*, i32** %buffer, align 8, !dbg !203
  %14 = load i32, i32* %i, align 4, !dbg !205
  %idxprom10 = sext i32 %14 to i64, !dbg !203
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %idxprom10, !dbg !203
  %15 = load i32, i32* %arrayidx11, align 4, !dbg !203
  call void @printIntLine(i32 %15), !dbg !206
  br label %for.inc12, !dbg !207

for.inc12:                                        ; preds = %for.body9
  %16 = load i32, i32* %i, align 4, !dbg !208
  %inc13 = add nsw i32 %16, 1, !dbg !208
  store i32 %inc13, i32* %i, align 4, !dbg !208
  br label %for.cond7, !dbg !209, !llvm.loop !210

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !212

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !213
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %17 = load i32*, i32** %buffer, align 8, !dbg !215
  %18 = bitcast i32* %17 to i8*, !dbg !215
  call void @free(i8* %18) #5, !dbg !216
  ret void, !dbg !217
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b_badSink", scope: !14, file: !14, line: 22, type: !15, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !13, file: !14, line: 22, type: !4)
!18 = !DILocation(line: 22, column: 75, scope: !13)
!19 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 24, type: !5)
!20 = !DILocation(line: 24, column: 9, scope: !13)
!21 = !DILocation(line: 24, column: 17, scope: !13)
!22 = !DILocation(line: 24, column: 16, scope: !13)
!23 = !DILocalVariable(name: "i", scope: !24, file: !14, line: 26, type: !5)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!25 = !DILocation(line: 26, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !14, line: 27, type: !4)
!27 = !DILocation(line: 27, column: 15, scope: !24)
!28 = !DILocation(line: 27, column: 31, scope: !24)
!29 = !DILocation(line: 27, column: 24, scope: !24)
!30 = !DILocation(line: 28, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !14, line: 28, column: 13)
!32 = !DILocation(line: 28, column: 20, scope: !31)
!33 = !DILocation(line: 28, column: 13, scope: !24)
!34 = !DILocation(line: 28, column: 30, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 28, column: 29)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !24, file: !14, line: 30, column: 9)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 30, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !14, line: 30, column: 9)
!41 = !DILocation(line: 30, column: 23, scope: !40)
!42 = !DILocation(line: 30, column: 9, scope: !37)
!43 = !DILocation(line: 32, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 31, column: 9)
!45 = !DILocation(line: 32, column: 20, scope: !44)
!46 = !DILocation(line: 32, column: 23, scope: !44)
!47 = !DILocation(line: 33, column: 9, scope: !44)
!48 = !DILocation(line: 30, column: 30, scope: !40)
!49 = !DILocation(line: 30, column: 9, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 33, column: 9, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 36, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !14, line: 36, column: 13)
!55 = !DILocation(line: 36, column: 18, scope: !54)
!56 = !DILocation(line: 36, column: 13, scope: !24)
!57 = !DILocation(line: 38, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 37, column: 9)
!59 = !DILocation(line: 38, column: 20, scope: !58)
!60 = !DILocation(line: 38, column: 26, scope: !58)
!61 = !DILocation(line: 40, column: 19, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !14, line: 40, column: 13)
!63 = !DILocation(line: 40, column: 17, scope: !62)
!64 = !DILocation(line: 40, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 40, column: 13)
!66 = !DILocation(line: 40, column: 26, scope: !65)
!67 = !DILocation(line: 40, column: 13, scope: !62)
!68 = !DILocation(line: 42, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !14, line: 41, column: 13)
!70 = !DILocation(line: 42, column: 37, scope: !69)
!71 = !DILocation(line: 42, column: 17, scope: !69)
!72 = !DILocation(line: 43, column: 13, scope: !69)
!73 = !DILocation(line: 40, column: 33, scope: !65)
!74 = !DILocation(line: 40, column: 13, scope: !65)
!75 = distinct !{!75, !67, !76, !52}
!76 = !DILocation(line: 43, column: 13, scope: !62)
!77 = !DILocation(line: 44, column: 9, scope: !58)
!78 = !DILocation(line: 47, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !54, file: !14, line: 46, column: 9)
!80 = !DILocation(line: 49, column: 14, scope: !24)
!81 = !DILocation(line: 49, column: 9, scope: !24)
!82 = !DILocation(line: 51, column: 1, scope: !13)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b_goodG2BSink", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !83, file: !14, line: 58, type: !4)
!85 = !DILocation(line: 58, column: 79, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 60, type: !5)
!87 = !DILocation(line: 60, column: 9, scope: !83)
!88 = !DILocation(line: 60, column: 17, scope: !83)
!89 = !DILocation(line: 60, column: 16, scope: !83)
!90 = !DILocalVariable(name: "i", scope: !91, file: !14, line: 62, type: !5)
!91 = distinct !DILexicalBlock(scope: !83, file: !14, line: 61, column: 5)
!92 = !DILocation(line: 62, column: 13, scope: !91)
!93 = !DILocalVariable(name: "buffer", scope: !91, file: !14, line: 63, type: !4)
!94 = !DILocation(line: 63, column: 15, scope: !91)
!95 = !DILocation(line: 63, column: 31, scope: !91)
!96 = !DILocation(line: 63, column: 24, scope: !91)
!97 = !DILocation(line: 64, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !14, line: 64, column: 13)
!99 = !DILocation(line: 64, column: 20, scope: !98)
!100 = !DILocation(line: 64, column: 13, scope: !91)
!101 = !DILocation(line: 64, column: 30, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !14, line: 64, column: 29)
!103 = !DILocation(line: 66, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !91, file: !14, line: 66, column: 9)
!105 = !DILocation(line: 66, column: 14, scope: !104)
!106 = !DILocation(line: 66, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !14, line: 66, column: 9)
!108 = !DILocation(line: 66, column: 23, scope: !107)
!109 = !DILocation(line: 66, column: 9, scope: !104)
!110 = !DILocation(line: 68, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !14, line: 67, column: 9)
!112 = !DILocation(line: 68, column: 20, scope: !111)
!113 = !DILocation(line: 68, column: 23, scope: !111)
!114 = !DILocation(line: 69, column: 9, scope: !111)
!115 = !DILocation(line: 66, column: 30, scope: !107)
!116 = !DILocation(line: 66, column: 9, scope: !107)
!117 = distinct !{!117, !109, !118, !52}
!118 = !DILocation(line: 69, column: 9, scope: !104)
!119 = !DILocation(line: 72, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !91, file: !14, line: 72, column: 13)
!121 = !DILocation(line: 72, column: 18, scope: !120)
!122 = !DILocation(line: 72, column: 13, scope: !91)
!123 = !DILocation(line: 74, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !14, line: 73, column: 9)
!125 = !DILocation(line: 74, column: 20, scope: !124)
!126 = !DILocation(line: 74, column: 26, scope: !124)
!127 = !DILocation(line: 76, column: 19, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !14, line: 76, column: 13)
!129 = !DILocation(line: 76, column: 17, scope: !128)
!130 = !DILocation(line: 76, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 76, column: 13)
!132 = !DILocation(line: 76, column: 26, scope: !131)
!133 = !DILocation(line: 76, column: 13, scope: !128)
!134 = !DILocation(line: 78, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !14, line: 77, column: 13)
!136 = !DILocation(line: 78, column: 37, scope: !135)
!137 = !DILocation(line: 78, column: 17, scope: !135)
!138 = !DILocation(line: 79, column: 13, scope: !135)
!139 = !DILocation(line: 76, column: 33, scope: !131)
!140 = !DILocation(line: 76, column: 13, scope: !131)
!141 = distinct !{!141, !133, !142, !52}
!142 = !DILocation(line: 79, column: 13, scope: !128)
!143 = !DILocation(line: 80, column: 9, scope: !124)
!144 = !DILocation(line: 83, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !120, file: !14, line: 82, column: 9)
!146 = !DILocation(line: 85, column: 14, scope: !91)
!147 = !DILocation(line: 85, column: 9, scope: !91)
!148 = !DILocation(line: 87, column: 1, scope: !83)
!149 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_63b_goodB2GSink", scope: !14, file: !14, line: 90, type: !15, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !149, file: !14, line: 90, type: !4)
!151 = !DILocation(line: 90, column: 79, scope: !149)
!152 = !DILocalVariable(name: "data", scope: !149, file: !14, line: 92, type: !5)
!153 = !DILocation(line: 92, column: 9, scope: !149)
!154 = !DILocation(line: 92, column: 17, scope: !149)
!155 = !DILocation(line: 92, column: 16, scope: !149)
!156 = !DILocalVariable(name: "i", scope: !157, file: !14, line: 94, type: !5)
!157 = distinct !DILexicalBlock(scope: !149, file: !14, line: 93, column: 5)
!158 = !DILocation(line: 94, column: 13, scope: !157)
!159 = !DILocalVariable(name: "buffer", scope: !157, file: !14, line: 95, type: !4)
!160 = !DILocation(line: 95, column: 15, scope: !157)
!161 = !DILocation(line: 95, column: 31, scope: !157)
!162 = !DILocation(line: 95, column: 24, scope: !157)
!163 = !DILocation(line: 96, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !14, line: 96, column: 13)
!165 = !DILocation(line: 96, column: 20, scope: !164)
!166 = !DILocation(line: 96, column: 13, scope: !157)
!167 = !DILocation(line: 96, column: 30, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !14, line: 96, column: 29)
!169 = !DILocation(line: 98, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !157, file: !14, line: 98, column: 9)
!171 = !DILocation(line: 98, column: 14, scope: !170)
!172 = !DILocation(line: 98, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !14, line: 98, column: 9)
!174 = !DILocation(line: 98, column: 23, scope: !173)
!175 = !DILocation(line: 98, column: 9, scope: !170)
!176 = !DILocation(line: 100, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !14, line: 99, column: 9)
!178 = !DILocation(line: 100, column: 20, scope: !177)
!179 = !DILocation(line: 100, column: 23, scope: !177)
!180 = !DILocation(line: 101, column: 9, scope: !177)
!181 = !DILocation(line: 98, column: 30, scope: !173)
!182 = !DILocation(line: 98, column: 9, scope: !173)
!183 = distinct !{!183, !175, !184, !52}
!184 = !DILocation(line: 101, column: 9, scope: !170)
!185 = !DILocation(line: 103, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !157, file: !14, line: 103, column: 13)
!187 = !DILocation(line: 103, column: 18, scope: !186)
!188 = !DILocation(line: 103, column: 23, scope: !186)
!189 = !DILocation(line: 103, column: 26, scope: !186)
!190 = !DILocation(line: 103, column: 31, scope: !186)
!191 = !DILocation(line: 103, column: 13, scope: !157)
!192 = !DILocation(line: 105, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !186, file: !14, line: 104, column: 9)
!194 = !DILocation(line: 105, column: 20, scope: !193)
!195 = !DILocation(line: 105, column: 26, scope: !193)
!196 = !DILocation(line: 107, column: 19, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !14, line: 107, column: 13)
!198 = !DILocation(line: 107, column: 17, scope: !197)
!199 = !DILocation(line: 107, column: 24, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !14, line: 107, column: 13)
!201 = !DILocation(line: 107, column: 26, scope: !200)
!202 = !DILocation(line: 107, column: 13, scope: !197)
!203 = !DILocation(line: 109, column: 30, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !14, line: 108, column: 13)
!205 = !DILocation(line: 109, column: 37, scope: !204)
!206 = !DILocation(line: 109, column: 17, scope: !204)
!207 = !DILocation(line: 110, column: 13, scope: !204)
!208 = !DILocation(line: 107, column: 33, scope: !200)
!209 = !DILocation(line: 107, column: 13, scope: !200)
!210 = distinct !{!210, !202, !211, !52}
!211 = !DILocation(line: 110, column: 13, scope: !197)
!212 = !DILocation(line: 111, column: 9, scope: !193)
!213 = !DILocation(line: 114, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !186, file: !14, line: 113, column: 9)
!215 = !DILocation(line: 116, column: 14, scope: !157)
!216 = !DILocation(line: 116, column: 9, scope: !157)
!217 = !DILocation(line: 118, column: 1, scope: !149)
