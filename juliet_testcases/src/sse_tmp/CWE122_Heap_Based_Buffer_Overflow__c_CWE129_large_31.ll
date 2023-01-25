; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  store i32 10, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !22, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* %data, align 4, !dbg !25
  store i32 %0, i32* %dataCopy, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = load i32, i32* %dataCopy, align 4, !dbg !28
  store i32 %1, i32* %data1, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !32, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !34
  %2 = bitcast i8* %call to i32*, !dbg !35
  store i32* %2, i32** %buffer, align 8, !dbg !33
  %3 = load i32*, i32** %buffer, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !45
  %cmp2 = icmp slt i32 %4, 10, !dbg !47
  br i1 %cmp2, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !49
  %6 = load i32, i32* %i, align 4, !dbg !51
  %idxprom = sext i32 %6 to i64, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %7, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !59
  %cmp3 = icmp sge i32 %8, 0, !dbg !61
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !62

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !63
  %10 = load i32, i32* %data1, align 4, !dbg !65
  %idxprom5 = sext i32 %10 to i64, !dbg !63
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !63
  store i32 1, i32* %arrayidx6, align 4, !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond7, !dbg !69

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !70
  %cmp8 = icmp slt i32 %11, 10, !dbg !72
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !73

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !74
  %13 = load i32, i32* %i, align 4, !dbg !76
  %idxprom10 = sext i32 %13 to i64, !dbg !74
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !74
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !74
  call void @printIntLine(i32 %14), !dbg !77
  br label %for.inc12, !dbg !78

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !79
  %inc13 = add nsw i32 %15, 1, !dbg !79
  store i32 %inc13, i32* %i, align 4, !dbg !79
  br label %for.cond7, !dbg !80, !llvm.loop !81

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !83

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !84
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !86
  %17 = bitcast i32* %16 to i8*, !dbg !86
  call void @free(i8* %17) #5, !dbg !87
  ret void, !dbg !88
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  call void @goodB2G(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  store i32 7, i32* %data, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = load i32, i32* %data, align 4, !dbg !121
  store i32 %0, i32* %dataCopy, align 4, !dbg !120
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !122, metadata !DIExpression()), !dbg !123
  %1 = load i32, i32* %dataCopy, align 4, !dbg !124
  store i32 %1, i32* %data1, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !130
  %2 = bitcast i8* %call to i32*, !dbg !131
  store i32* %2, i32** %buffer, align 8, !dbg !129
  %3 = load i32*, i32** %buffer, align 8, !dbg !132
  %cmp = icmp eq i32* %3, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !141
  %cmp2 = icmp slt i32 %4, 10, !dbg !143
  br i1 %cmp2, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !145
  %6 = load i32, i32* %i, align 4, !dbg !147
  %idxprom = sext i32 %6 to i64, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %7, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !154
  %cmp3 = icmp sge i32 %8, 0, !dbg !156
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !157

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !158
  %10 = load i32, i32* %data1, align 4, !dbg !160
  %idxprom5 = sext i32 %10 to i64, !dbg !158
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !158
  store i32 1, i32* %arrayidx6, align 4, !dbg !161
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond7, !dbg !164

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !165
  %cmp8 = icmp slt i32 %11, 10, !dbg !167
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !168

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !169
  %13 = load i32, i32* %i, align 4, !dbg !171
  %idxprom10 = sext i32 %13 to i64, !dbg !169
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !169
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !169
  call void @printIntLine(i32 %14), !dbg !172
  br label %for.inc12, !dbg !173

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !174
  %inc13 = add nsw i32 %15, 1, !dbg !174
  store i32 %inc13, i32* %i, align 4, !dbg !174
  br label %for.cond7, !dbg !175, !llvm.loop !176

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !178

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !179
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !181
  %17 = bitcast i32* %16 to i8*, !dbg !181
  call void @free(i8* %17) #5, !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !184 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !185, metadata !DIExpression()), !dbg !186
  store i32 -1, i32* %data, align 4, !dbg !187
  store i32 10, i32* %data, align 4, !dbg !188
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !189, metadata !DIExpression()), !dbg !191
  %0 = load i32, i32* %data, align 4, !dbg !192
  store i32 %0, i32* %dataCopy, align 4, !dbg !191
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !193, metadata !DIExpression()), !dbg !194
  %1 = load i32, i32* %dataCopy, align 4, !dbg !195
  store i32 %1, i32* %data1, align 4, !dbg !194
  call void @llvm.dbg.declare(metadata i32* %i, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !199, metadata !DIExpression()), !dbg !200
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !201
  %2 = bitcast i8* %call to i32*, !dbg !202
  store i32* %2, i32** %buffer, align 8, !dbg !200
  %3 = load i32*, i32** %buffer, align 8, !dbg !203
  %cmp = icmp eq i32* %3, null, !dbg !205
  br i1 %cmp, label %if.then, label %if.end, !dbg !206

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !207
  unreachable, !dbg !207

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !212
  %cmp2 = icmp slt i32 %4, 10, !dbg !214
  br i1 %cmp2, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !216
  %6 = load i32, i32* %i, align 4, !dbg !218
  %idxprom = sext i32 %6 to i64, !dbg !216
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !216
  store i32 0, i32* %arrayidx, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %7, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !225
  %cmp3 = icmp sge i32 %8, 0, !dbg !227
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !228

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data1, align 4, !dbg !229
  %cmp4 = icmp slt i32 %9, 10, !dbg !230
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !231

if.then5:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !232
  %11 = load i32, i32* %data1, align 4, !dbg !234
  %idxprom6 = sext i32 %11 to i64, !dbg !232
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6, !dbg !232
  store i32 1, i32* %arrayidx7, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond8, !dbg !238

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %12 = load i32, i32* %i, align 4, !dbg !239
  %cmp9 = icmp slt i32 %12, 10, !dbg !241
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !242

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %buffer, align 8, !dbg !243
  %14 = load i32, i32* %i, align 4, !dbg !245
  %idxprom11 = sext i32 %14 to i64, !dbg !243
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 %idxprom11, !dbg !243
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !243
  call void @printIntLine(i32 %15), !dbg !246
  br label %for.inc13, !dbg !247

for.inc13:                                        ; preds = %for.body10
  %16 = load i32, i32* %i, align 4, !dbg !248
  %inc14 = add nsw i32 %16, 1, !dbg !248
  store i32 %inc14, i32* %i, align 4, !dbg !248
  br label %for.cond8, !dbg !249, !llvm.loop !250

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !252

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !253
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %17 = load i32*, i32** %buffer, align 8, !dbg !255
  %18 = bitcast i32* %17 to i8*, !dbg !255
  call void @free(i8* %18) #5, !dbg !256
  ret void, !dbg !257
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 10, scope: !14)
!22 = !DILocalVariable(name: "dataCopy", scope: !23, file: !15, line: 30, type: !5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!24 = !DILocation(line: 30, column: 13, scope: !23)
!25 = !DILocation(line: 30, column: 24, scope: !23)
!26 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 31, type: !5)
!27 = !DILocation(line: 31, column: 13, scope: !23)
!28 = !DILocation(line: 31, column: 20, scope: !23)
!29 = !DILocalVariable(name: "i", scope: !30, file: !15, line: 33, type: !5)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 32, column: 9)
!31 = !DILocation(line: 33, column: 17, scope: !30)
!32 = !DILocalVariable(name: "buffer", scope: !30, file: !15, line: 34, type: !4)
!33 = !DILocation(line: 34, column: 19, scope: !30)
!34 = !DILocation(line: 34, column: 35, scope: !30)
!35 = !DILocation(line: 34, column: 28, scope: !30)
!36 = !DILocation(line: 35, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !15, line: 35, column: 17)
!38 = !DILocation(line: 35, column: 24, scope: !37)
!39 = !DILocation(line: 35, column: 17, scope: !30)
!40 = !DILocation(line: 35, column: 34, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 35, column: 33)
!42 = !DILocation(line: 37, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !30, file: !15, line: 37, column: 13)
!44 = !DILocation(line: 37, column: 18, scope: !43)
!45 = !DILocation(line: 37, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !15, line: 37, column: 13)
!47 = !DILocation(line: 37, column: 27, scope: !46)
!48 = !DILocation(line: 37, column: 13, scope: !43)
!49 = !DILocation(line: 39, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 38, column: 13)
!51 = !DILocation(line: 39, column: 24, scope: !50)
!52 = !DILocation(line: 39, column: 27, scope: !50)
!53 = !DILocation(line: 40, column: 13, scope: !50)
!54 = !DILocation(line: 37, column: 34, scope: !46)
!55 = !DILocation(line: 37, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 40, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 43, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !30, file: !15, line: 43, column: 17)
!61 = !DILocation(line: 43, column: 22, scope: !60)
!62 = !DILocation(line: 43, column: 17, scope: !30)
!63 = !DILocation(line: 45, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 44, column: 13)
!65 = !DILocation(line: 45, column: 24, scope: !64)
!66 = !DILocation(line: 45, column: 30, scope: !64)
!67 = !DILocation(line: 47, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 47, column: 17)
!69 = !DILocation(line: 47, column: 21, scope: !68)
!70 = !DILocation(line: 47, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !15, line: 47, column: 17)
!72 = !DILocation(line: 47, column: 30, scope: !71)
!73 = !DILocation(line: 47, column: 17, scope: !68)
!74 = !DILocation(line: 49, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 48, column: 17)
!76 = !DILocation(line: 49, column: 41, scope: !75)
!77 = !DILocation(line: 49, column: 21, scope: !75)
!78 = !DILocation(line: 50, column: 17, scope: !75)
!79 = !DILocation(line: 47, column: 37, scope: !71)
!80 = !DILocation(line: 47, column: 17, scope: !71)
!81 = distinct !{!81, !73, !82, !58}
!82 = !DILocation(line: 50, column: 17, scope: !68)
!83 = !DILocation(line: 51, column: 13, scope: !64)
!84 = !DILocation(line: 54, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !60, file: !15, line: 53, column: 13)
!86 = !DILocation(line: 56, column: 18, scope: !30)
!87 = !DILocation(line: 56, column: 13, scope: !30)
!88 = !DILocation(line: 59, column: 1, scope: !14)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_31_good", scope: !15, file: !15, line: 145, type: !16, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 147, column: 5, scope: !89)
!91 = !DILocation(line: 148, column: 5, scope: !89)
!92 = !DILocation(line: 149, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 159, type: !94, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!5, !5, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 159, type: !5)
!100 = !DILocation(line: 159, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 159, type: !96)
!102 = !DILocation(line: 159, column: 27, scope: !93)
!103 = !DILocation(line: 162, column: 22, scope: !93)
!104 = !DILocation(line: 162, column: 12, scope: !93)
!105 = !DILocation(line: 162, column: 5, scope: !93)
!106 = !DILocation(line: 164, column: 5, scope: !93)
!107 = !DILocation(line: 165, column: 5, scope: !93)
!108 = !DILocation(line: 166, column: 5, scope: !93)
!109 = !DILocation(line: 169, column: 5, scope: !93)
!110 = !DILocation(line: 170, column: 5, scope: !93)
!111 = !DILocation(line: 171, column: 5, scope: !93)
!112 = !DILocation(line: 173, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 68, type: !5)
!115 = !DILocation(line: 68, column: 9, scope: !113)
!116 = !DILocation(line: 70, column: 10, scope: !113)
!117 = !DILocation(line: 73, column: 10, scope: !113)
!118 = !DILocalVariable(name: "dataCopy", scope: !119, file: !15, line: 75, type: !5)
!119 = distinct !DILexicalBlock(scope: !113, file: !15, line: 74, column: 5)
!120 = !DILocation(line: 75, column: 13, scope: !119)
!121 = !DILocation(line: 75, column: 24, scope: !119)
!122 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 76, type: !5)
!123 = !DILocation(line: 76, column: 13, scope: !119)
!124 = !DILocation(line: 76, column: 20, scope: !119)
!125 = !DILocalVariable(name: "i", scope: !126, file: !15, line: 78, type: !5)
!126 = distinct !DILexicalBlock(scope: !119, file: !15, line: 77, column: 9)
!127 = !DILocation(line: 78, column: 17, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !126, file: !15, line: 79, type: !4)
!129 = !DILocation(line: 79, column: 19, scope: !126)
!130 = !DILocation(line: 79, column: 35, scope: !126)
!131 = !DILocation(line: 79, column: 28, scope: !126)
!132 = !DILocation(line: 80, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !15, line: 80, column: 17)
!134 = !DILocation(line: 80, column: 24, scope: !133)
!135 = !DILocation(line: 80, column: 17, scope: !126)
!136 = !DILocation(line: 80, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 80, column: 33)
!138 = !DILocation(line: 82, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !15, line: 82, column: 13)
!140 = !DILocation(line: 82, column: 18, scope: !139)
!141 = !DILocation(line: 82, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 82, column: 13)
!143 = !DILocation(line: 82, column: 27, scope: !142)
!144 = !DILocation(line: 82, column: 13, scope: !139)
!145 = !DILocation(line: 84, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 83, column: 13)
!147 = !DILocation(line: 84, column: 24, scope: !146)
!148 = !DILocation(line: 84, column: 27, scope: !146)
!149 = !DILocation(line: 85, column: 13, scope: !146)
!150 = !DILocation(line: 82, column: 34, scope: !142)
!151 = !DILocation(line: 82, column: 13, scope: !142)
!152 = distinct !{!152, !144, !153, !58}
!153 = !DILocation(line: 85, column: 13, scope: !139)
!154 = !DILocation(line: 88, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !126, file: !15, line: 88, column: 17)
!156 = !DILocation(line: 88, column: 22, scope: !155)
!157 = !DILocation(line: 88, column: 17, scope: !126)
!158 = !DILocation(line: 90, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 89, column: 13)
!160 = !DILocation(line: 90, column: 24, scope: !159)
!161 = !DILocation(line: 90, column: 30, scope: !159)
!162 = !DILocation(line: 92, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 92, column: 17)
!164 = !DILocation(line: 92, column: 21, scope: !163)
!165 = !DILocation(line: 92, column: 28, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !15, line: 92, column: 17)
!167 = !DILocation(line: 92, column: 30, scope: !166)
!168 = !DILocation(line: 92, column: 17, scope: !163)
!169 = !DILocation(line: 94, column: 34, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 93, column: 17)
!171 = !DILocation(line: 94, column: 41, scope: !170)
!172 = !DILocation(line: 94, column: 21, scope: !170)
!173 = !DILocation(line: 95, column: 17, scope: !170)
!174 = !DILocation(line: 92, column: 37, scope: !166)
!175 = !DILocation(line: 92, column: 17, scope: !166)
!176 = distinct !{!176, !168, !177, !58}
!177 = !DILocation(line: 95, column: 17, scope: !163)
!178 = !DILocation(line: 96, column: 13, scope: !159)
!179 = !DILocation(line: 99, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !155, file: !15, line: 98, column: 13)
!181 = !DILocation(line: 101, column: 18, scope: !126)
!182 = !DILocation(line: 101, column: 13, scope: !126)
!183 = !DILocation(line: 104, column: 1, scope: !113)
!184 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocalVariable(name: "data", scope: !184, file: !15, line: 109, type: !5)
!186 = !DILocation(line: 109, column: 9, scope: !184)
!187 = !DILocation(line: 111, column: 10, scope: !184)
!188 = !DILocation(line: 113, column: 10, scope: !184)
!189 = !DILocalVariable(name: "dataCopy", scope: !190, file: !15, line: 115, type: !5)
!190 = distinct !DILexicalBlock(scope: !184, file: !15, line: 114, column: 5)
!191 = !DILocation(line: 115, column: 13, scope: !190)
!192 = !DILocation(line: 115, column: 24, scope: !190)
!193 = !DILocalVariable(name: "data", scope: !190, file: !15, line: 116, type: !5)
!194 = !DILocation(line: 116, column: 13, scope: !190)
!195 = !DILocation(line: 116, column: 20, scope: !190)
!196 = !DILocalVariable(name: "i", scope: !197, file: !15, line: 118, type: !5)
!197 = distinct !DILexicalBlock(scope: !190, file: !15, line: 117, column: 9)
!198 = !DILocation(line: 118, column: 17, scope: !197)
!199 = !DILocalVariable(name: "buffer", scope: !197, file: !15, line: 119, type: !4)
!200 = !DILocation(line: 119, column: 19, scope: !197)
!201 = !DILocation(line: 119, column: 35, scope: !197)
!202 = !DILocation(line: 119, column: 28, scope: !197)
!203 = !DILocation(line: 120, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !197, file: !15, line: 120, column: 17)
!205 = !DILocation(line: 120, column: 24, scope: !204)
!206 = !DILocation(line: 120, column: 17, scope: !197)
!207 = !DILocation(line: 120, column: 34, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 120, column: 33)
!209 = !DILocation(line: 122, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !15, line: 122, column: 13)
!211 = !DILocation(line: 122, column: 18, scope: !210)
!212 = !DILocation(line: 122, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 122, column: 13)
!214 = !DILocation(line: 122, column: 27, scope: !213)
!215 = !DILocation(line: 122, column: 13, scope: !210)
!216 = !DILocation(line: 124, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !15, line: 123, column: 13)
!218 = !DILocation(line: 124, column: 24, scope: !217)
!219 = !DILocation(line: 124, column: 27, scope: !217)
!220 = !DILocation(line: 125, column: 13, scope: !217)
!221 = !DILocation(line: 122, column: 34, scope: !213)
!222 = !DILocation(line: 122, column: 13, scope: !213)
!223 = distinct !{!223, !215, !224, !58}
!224 = !DILocation(line: 125, column: 13, scope: !210)
!225 = !DILocation(line: 127, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !197, file: !15, line: 127, column: 17)
!227 = !DILocation(line: 127, column: 22, scope: !226)
!228 = !DILocation(line: 127, column: 27, scope: !226)
!229 = !DILocation(line: 127, column: 30, scope: !226)
!230 = !DILocation(line: 127, column: 35, scope: !226)
!231 = !DILocation(line: 127, column: 17, scope: !197)
!232 = !DILocation(line: 129, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !226, file: !15, line: 128, column: 13)
!234 = !DILocation(line: 129, column: 24, scope: !233)
!235 = !DILocation(line: 129, column: 30, scope: !233)
!236 = !DILocation(line: 131, column: 23, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !15, line: 131, column: 17)
!238 = !DILocation(line: 131, column: 21, scope: !237)
!239 = !DILocation(line: 131, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !15, line: 131, column: 17)
!241 = !DILocation(line: 131, column: 30, scope: !240)
!242 = !DILocation(line: 131, column: 17, scope: !237)
!243 = !DILocation(line: 133, column: 34, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !15, line: 132, column: 17)
!245 = !DILocation(line: 133, column: 41, scope: !244)
!246 = !DILocation(line: 133, column: 21, scope: !244)
!247 = !DILocation(line: 134, column: 17, scope: !244)
!248 = !DILocation(line: 131, column: 37, scope: !240)
!249 = !DILocation(line: 131, column: 17, scope: !240)
!250 = distinct !{!250, !242, !251, !58}
!251 = !DILocation(line: 134, column: 17, scope: !237)
!252 = !DILocation(line: 135, column: 13, scope: !233)
!253 = !DILocation(line: 138, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !226, file: !15, line: 137, column: 13)
!255 = !DILocation(line: 140, column: 18, scope: !197)
!256 = !DILocation(line: 140, column: 13, scope: !197)
!257 = !DILocation(line: 143, column: 1, scope: !184)
