; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  store i32 10, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %buffer, align 8, !dbg !26
  %1 = load i32*, i32** %buffer, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !38
  %cmp1 = icmp slt i32 %2, 10, !dbg !40
  br i1 %cmp1, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !42
  %4 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %5, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !52
  %cmp2 = icmp sge i32 %6, 0, !dbg !54
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !55

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !56
  %8 = load i32, i32* %data, align 4, !dbg !58
  %idxprom4 = sext i32 %8 to i64, !dbg !56
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !56
  store i32 1, i32* %arrayidx5, align 4, !dbg !59
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond6, !dbg !62

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !63
  %cmp7 = icmp slt i32 %9, 10, !dbg !65
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !66

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !67
  %11 = load i32, i32* %i, align 4, !dbg !69
  %idxprom9 = sext i32 %11 to i64, !dbg !67
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !67
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !67
  call void @printIntLine(i32 %12), !dbg !70
  br label %for.inc11, !dbg !71

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !72
  %inc12 = add nsw i32 %13, 1, !dbg !72
  store i32 %inc12, i32* %i, align 4, !dbg !72
  br label %for.cond6, !dbg !73, !llvm.loop !74

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !76

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !79
  %15 = bitcast i32* %14 to i8*, !dbg !79
  call void @free(i8* %15) #5, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  call void @goodB2G(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #5, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #5, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  store i32 7, i32* %data, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %i, metadata !111, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %buffer, align 8, !dbg !115
  %1 = load i32*, i32** %buffer, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !127
  %cmp1 = icmp slt i32 %2, 10, !dbg !129
  br i1 %cmp1, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !131
  %4 = load i32, i32* %i, align 4, !dbg !133
  %idxprom = sext i32 %4 to i64, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !136
  %inc = add nsw i32 %5, 1, !dbg !136
  store i32 %inc, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !140
  %cmp2 = icmp sge i32 %6, 0, !dbg !142
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !143

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !144
  %8 = load i32, i32* %data, align 4, !dbg !146
  %idxprom4 = sext i32 %8 to i64, !dbg !144
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !144
  store i32 1, i32* %arrayidx5, align 4, !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond6, !dbg !150

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !151
  %cmp7 = icmp slt i32 %9, 10, !dbg !153
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !154

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !155
  %11 = load i32, i32* %i, align 4, !dbg !157
  %idxprom9 = sext i32 %11 to i64, !dbg !155
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !155
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !155
  call void @printIntLine(i32 %12), !dbg !158
  br label %for.inc11, !dbg !159

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !160
  %inc12 = add nsw i32 %13, 1, !dbg !160
  store i32 %inc12, i32* %i, align 4, !dbg !160
  br label %for.cond6, !dbg !161, !llvm.loop !162

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !164

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !165
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !167
  %15 = bitcast i32* %14 to i8*, !dbg !167
  call void @free(i8* %15) #5, !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !170 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !171, metadata !DIExpression()), !dbg !172
  store i32 -1, i32* %data, align 4, !dbg !173
  store i32 10, i32* %data, align 4, !dbg !174
  call void @llvm.dbg.declare(metadata i32* %i, metadata !175, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !178, metadata !DIExpression()), !dbg !179
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !180
  %0 = bitcast i8* %call to i32*, !dbg !181
  store i32* %0, i32** %buffer, align 8, !dbg !179
  %1 = load i32*, i32** %buffer, align 8, !dbg !182
  %cmp = icmp eq i32* %1, null, !dbg !184
  br i1 %cmp, label %if.then, label %if.end, !dbg !185

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !186
  unreachable, !dbg !186

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !191
  %cmp1 = icmp slt i32 %2, 10, !dbg !193
  br i1 %cmp1, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !195
  %4 = load i32, i32* %i, align 4, !dbg !197
  %idxprom = sext i32 %4 to i64, !dbg !195
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !195
  store i32 0, i32* %arrayidx, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !200
  %inc = add nsw i32 %5, 1, !dbg !200
  store i32 %inc, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !204
  %cmp2 = icmp sge i32 %6, 0, !dbg !206
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !207

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !208
  %cmp3 = icmp slt i32 %7, 10, !dbg !209
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !210

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !211
  %9 = load i32, i32* %data, align 4, !dbg !213
  %idxprom5 = sext i32 %9 to i64, !dbg !211
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !211
  store i32 1, i32* %arrayidx6, align 4, !dbg !214
  store i32 0, i32* %i, align 4, !dbg !215
  br label %for.cond7, !dbg !217

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !218
  %cmp8 = icmp slt i32 %10, 10, !dbg !220
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !221

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !222
  %12 = load i32, i32* %i, align 4, !dbg !224
  %idxprom10 = sext i32 %12 to i64, !dbg !222
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !222
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !222
  call void @printIntLine(i32 %13), !dbg !225
  br label %for.inc12, !dbg !226

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !227
  %inc13 = add nsw i32 %14, 1, !dbg !227
  store i32 %inc13, i32* %i, align 4, !dbg !227
  br label %for.cond7, !dbg !228, !llvm.loop !229

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !231

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !232
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !234
  %16 = bitcast i32* %15 to i8*, !dbg !234
  call void @free(i8* %16) #5, !dbg !235
  ret void, !dbg !236
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 10, scope: !14)
!22 = !DILocalVariable(name: "i", scope: !23, file: !15, line: 30, type: !5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!24 = !DILocation(line: 30, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !15, line: 31, type: !4)
!26 = !DILocation(line: 31, column: 15, scope: !23)
!27 = !DILocation(line: 31, column: 31, scope: !23)
!28 = !DILocation(line: 31, column: 24, scope: !23)
!29 = !DILocation(line: 32, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 32, column: 13)
!31 = !DILocation(line: 32, column: 20, scope: !30)
!32 = !DILocation(line: 32, column: 13, scope: !23)
!33 = !DILocation(line: 32, column: 30, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 32, column: 29)
!35 = !DILocation(line: 34, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !23, file: !15, line: 34, column: 9)
!37 = !DILocation(line: 34, column: 14, scope: !36)
!38 = !DILocation(line: 34, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !15, line: 34, column: 9)
!40 = !DILocation(line: 34, column: 23, scope: !39)
!41 = !DILocation(line: 34, column: 9, scope: !36)
!42 = !DILocation(line: 36, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 35, column: 9)
!44 = !DILocation(line: 36, column: 20, scope: !43)
!45 = !DILocation(line: 36, column: 23, scope: !43)
!46 = !DILocation(line: 37, column: 9, scope: !43)
!47 = !DILocation(line: 34, column: 30, scope: !39)
!48 = !DILocation(line: 34, column: 9, scope: !39)
!49 = distinct !{!49, !41, !50, !51}
!50 = !DILocation(line: 37, column: 9, scope: !36)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 40, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !23, file: !15, line: 40, column: 13)
!54 = !DILocation(line: 40, column: 18, scope: !53)
!55 = !DILocation(line: 40, column: 13, scope: !23)
!56 = !DILocation(line: 42, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 41, column: 9)
!58 = !DILocation(line: 42, column: 20, scope: !57)
!59 = !DILocation(line: 42, column: 26, scope: !57)
!60 = !DILocation(line: 44, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 44, column: 13)
!62 = !DILocation(line: 44, column: 17, scope: !61)
!63 = !DILocation(line: 44, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !15, line: 44, column: 13)
!65 = !DILocation(line: 44, column: 26, scope: !64)
!66 = !DILocation(line: 44, column: 13, scope: !61)
!67 = !DILocation(line: 46, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 45, column: 13)
!69 = !DILocation(line: 46, column: 37, scope: !68)
!70 = !DILocation(line: 46, column: 17, scope: !68)
!71 = !DILocation(line: 47, column: 13, scope: !68)
!72 = !DILocation(line: 44, column: 33, scope: !64)
!73 = !DILocation(line: 44, column: 13, scope: !64)
!74 = distinct !{!74, !66, !75, !51}
!75 = !DILocation(line: 47, column: 13, scope: !61)
!76 = !DILocation(line: 48, column: 9, scope: !57)
!77 = !DILocation(line: 51, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !53, file: !15, line: 50, column: 9)
!79 = !DILocation(line: 53, column: 14, scope: !23)
!80 = !DILocation(line: 53, column: 9, scope: !23)
!81 = !DILocation(line: 55, column: 1, scope: !14)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_01_good", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 135, column: 5, scope: !82)
!84 = !DILocation(line: 136, column: 5, scope: !82)
!85 = !DILocation(line: 137, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 148, type: !87, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!5, !5, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !15, line: 148, type: !5)
!93 = !DILocation(line: 148, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !15, line: 148, type: !89)
!95 = !DILocation(line: 148, column: 27, scope: !86)
!96 = !DILocation(line: 151, column: 22, scope: !86)
!97 = !DILocation(line: 151, column: 12, scope: !86)
!98 = !DILocation(line: 151, column: 5, scope: !86)
!99 = !DILocation(line: 153, column: 5, scope: !86)
!100 = !DILocation(line: 154, column: 5, scope: !86)
!101 = !DILocation(line: 155, column: 5, scope: !86)
!102 = !DILocation(line: 158, column: 5, scope: !86)
!103 = !DILocation(line: 159, column: 5, scope: !86)
!104 = !DILocation(line: 160, column: 5, scope: !86)
!105 = !DILocation(line: 162, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 64, type: !5)
!108 = !DILocation(line: 64, column: 9, scope: !106)
!109 = !DILocation(line: 66, column: 10, scope: !106)
!110 = !DILocation(line: 69, column: 10, scope: !106)
!111 = !DILocalVariable(name: "i", scope: !112, file: !15, line: 71, type: !5)
!112 = distinct !DILexicalBlock(scope: !106, file: !15, line: 70, column: 5)
!113 = !DILocation(line: 71, column: 13, scope: !112)
!114 = !DILocalVariable(name: "buffer", scope: !112, file: !15, line: 72, type: !4)
!115 = !DILocation(line: 72, column: 15, scope: !112)
!116 = !DILocation(line: 72, column: 31, scope: !112)
!117 = !DILocation(line: 72, column: 24, scope: !112)
!118 = !DILocation(line: 73, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !15, line: 73, column: 13)
!120 = !DILocation(line: 73, column: 20, scope: !119)
!121 = !DILocation(line: 73, column: 13, scope: !112)
!122 = !DILocation(line: 73, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 73, column: 29)
!124 = !DILocation(line: 75, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !112, file: !15, line: 75, column: 9)
!126 = !DILocation(line: 75, column: 14, scope: !125)
!127 = !DILocation(line: 75, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !15, line: 75, column: 9)
!129 = !DILocation(line: 75, column: 23, scope: !128)
!130 = !DILocation(line: 75, column: 9, scope: !125)
!131 = !DILocation(line: 77, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 76, column: 9)
!133 = !DILocation(line: 77, column: 20, scope: !132)
!134 = !DILocation(line: 77, column: 23, scope: !132)
!135 = !DILocation(line: 78, column: 9, scope: !132)
!136 = !DILocation(line: 75, column: 30, scope: !128)
!137 = !DILocation(line: 75, column: 9, scope: !128)
!138 = distinct !{!138, !130, !139, !51}
!139 = !DILocation(line: 78, column: 9, scope: !125)
!140 = !DILocation(line: 81, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !112, file: !15, line: 81, column: 13)
!142 = !DILocation(line: 81, column: 18, scope: !141)
!143 = !DILocation(line: 81, column: 13, scope: !112)
!144 = !DILocation(line: 83, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 82, column: 9)
!146 = !DILocation(line: 83, column: 20, scope: !145)
!147 = !DILocation(line: 83, column: 26, scope: !145)
!148 = !DILocation(line: 85, column: 19, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 85, column: 13)
!150 = !DILocation(line: 85, column: 17, scope: !149)
!151 = !DILocation(line: 85, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !15, line: 85, column: 13)
!153 = !DILocation(line: 85, column: 26, scope: !152)
!154 = !DILocation(line: 85, column: 13, scope: !149)
!155 = !DILocation(line: 87, column: 30, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 86, column: 13)
!157 = !DILocation(line: 87, column: 37, scope: !156)
!158 = !DILocation(line: 87, column: 17, scope: !156)
!159 = !DILocation(line: 88, column: 13, scope: !156)
!160 = !DILocation(line: 85, column: 33, scope: !152)
!161 = !DILocation(line: 85, column: 13, scope: !152)
!162 = distinct !{!162, !154, !163, !51}
!163 = !DILocation(line: 88, column: 13, scope: !149)
!164 = !DILocation(line: 89, column: 9, scope: !145)
!165 = !DILocation(line: 92, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !141, file: !15, line: 91, column: 9)
!167 = !DILocation(line: 94, column: 14, scope: !112)
!168 = !DILocation(line: 94, column: 9, scope: !112)
!169 = !DILocation(line: 96, column: 1, scope: !106)
!170 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DILocalVariable(name: "data", scope: !170, file: !15, line: 101, type: !5)
!172 = !DILocation(line: 101, column: 9, scope: !170)
!173 = !DILocation(line: 103, column: 10, scope: !170)
!174 = !DILocation(line: 105, column: 10, scope: !170)
!175 = !DILocalVariable(name: "i", scope: !176, file: !15, line: 107, type: !5)
!176 = distinct !DILexicalBlock(scope: !170, file: !15, line: 106, column: 5)
!177 = !DILocation(line: 107, column: 13, scope: !176)
!178 = !DILocalVariable(name: "buffer", scope: !176, file: !15, line: 108, type: !4)
!179 = !DILocation(line: 108, column: 15, scope: !176)
!180 = !DILocation(line: 108, column: 31, scope: !176)
!181 = !DILocation(line: 108, column: 24, scope: !176)
!182 = !DILocation(line: 109, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !176, file: !15, line: 109, column: 13)
!184 = !DILocation(line: 109, column: 20, scope: !183)
!185 = !DILocation(line: 109, column: 13, scope: !176)
!186 = !DILocation(line: 109, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !15, line: 109, column: 29)
!188 = !DILocation(line: 111, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !176, file: !15, line: 111, column: 9)
!190 = !DILocation(line: 111, column: 14, scope: !189)
!191 = !DILocation(line: 111, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !15, line: 111, column: 9)
!193 = !DILocation(line: 111, column: 23, scope: !192)
!194 = !DILocation(line: 111, column: 9, scope: !189)
!195 = !DILocation(line: 113, column: 13, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !15, line: 112, column: 9)
!197 = !DILocation(line: 113, column: 20, scope: !196)
!198 = !DILocation(line: 113, column: 23, scope: !196)
!199 = !DILocation(line: 114, column: 9, scope: !196)
!200 = !DILocation(line: 111, column: 30, scope: !192)
!201 = !DILocation(line: 111, column: 9, scope: !192)
!202 = distinct !{!202, !194, !203, !51}
!203 = !DILocation(line: 114, column: 9, scope: !189)
!204 = !DILocation(line: 116, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !176, file: !15, line: 116, column: 13)
!206 = !DILocation(line: 116, column: 18, scope: !205)
!207 = !DILocation(line: 116, column: 23, scope: !205)
!208 = !DILocation(line: 116, column: 26, scope: !205)
!209 = !DILocation(line: 116, column: 31, scope: !205)
!210 = !DILocation(line: 116, column: 13, scope: !176)
!211 = !DILocation(line: 118, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !205, file: !15, line: 117, column: 9)
!213 = !DILocation(line: 118, column: 20, scope: !212)
!214 = !DILocation(line: 118, column: 26, scope: !212)
!215 = !DILocation(line: 120, column: 19, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 120, column: 13)
!217 = !DILocation(line: 120, column: 17, scope: !216)
!218 = !DILocation(line: 120, column: 24, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !15, line: 120, column: 13)
!220 = !DILocation(line: 120, column: 26, scope: !219)
!221 = !DILocation(line: 120, column: 13, scope: !216)
!222 = !DILocation(line: 122, column: 30, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !15, line: 121, column: 13)
!224 = !DILocation(line: 122, column: 37, scope: !223)
!225 = !DILocation(line: 122, column: 17, scope: !223)
!226 = !DILocation(line: 123, column: 13, scope: !223)
!227 = !DILocation(line: 120, column: 33, scope: !219)
!228 = !DILocation(line: 120, column: 13, scope: !219)
!229 = distinct !{!229, !221, !230, !51}
!230 = !DILocation(line: 123, column: 13, scope: !216)
!231 = !DILocation(line: 124, column: 9, scope: !212)
!232 = !DILocation(line: 127, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !205, file: !15, line: 126, column: 9)
!234 = !DILocation(line: 129, column: 14, scope: !176)
!235 = !DILocation(line: 129, column: 9, scope: !176)
!236 = !DILocation(line: 131, column: 1, scope: !170)
