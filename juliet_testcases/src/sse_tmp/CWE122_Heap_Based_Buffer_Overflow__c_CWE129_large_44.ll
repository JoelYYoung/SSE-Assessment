; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  store i32 10, i32* %data, align 4, !dbg !26
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  call void %0(i32 %1), !dbg !27
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !30 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !36, metadata !DIExpression()), !dbg !37
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !38
  %0 = bitcast i8* %call to i32*, !dbg !39
  store i32* %0, i32** %buffer, align 8, !dbg !37
  %1 = load i32*, i32** %buffer, align 8, !dbg !40
  %cmp = icmp eq i32* %1, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !49
  %cmp1 = icmp slt i32 %2, 10, !dbg !51
  br i1 %cmp1, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !53
  %4 = load i32, i32* %i, align 4, !dbg !55
  %idxprom = sext i32 %4 to i64, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %5, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !63
  %cmp2 = icmp sge i32 %6, 0, !dbg !65
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !66

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !67
  %8 = load i32, i32* %data.addr, align 4, !dbg !69
  %idxprom4 = sext i32 %8 to i64, !dbg !67
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !67
  store i32 1, i32* %arrayidx5, align 4, !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond6, !dbg !73

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !74
  %cmp7 = icmp slt i32 %9, 10, !dbg !76
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !77

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !78
  %11 = load i32, i32* %i, align 4, !dbg !80
  %idxprom9 = sext i32 %11 to i64, !dbg !78
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !78
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !78
  call void @printIntLine(i32 %12), !dbg !81
  br label %for.inc11, !dbg !82

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !83
  %inc12 = add nsw i32 %13, 1, !dbg !83
  store i32 %inc12, i32* %i, align 4, !dbg !83
  br label %for.cond6, !dbg !84, !llvm.loop !85

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !87

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !90
  %15 = bitcast i32* %14 to i8*, !dbg !90
  call void @free(i8* %15) #5, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  call void @goodB2G(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !120, metadata !DIExpression()), !dbg !121
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !121
  store i32 -1, i32* %data, align 4, !dbg !122
  store i32 7, i32* %data, align 4, !dbg !123
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !124
  %1 = load i32, i32* %data, align 4, !dbg !125
  call void %0(i32 %1), !dbg !124
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !127 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !133, metadata !DIExpression()), !dbg !134
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !135
  %0 = bitcast i8* %call to i32*, !dbg !136
  store i32* %0, i32** %buffer, align 8, !dbg !134
  %1 = load i32*, i32** %buffer, align 8, !dbg !137
  %cmp = icmp eq i32* %1, null, !dbg !139
  br i1 %cmp, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !146
  %cmp1 = icmp slt i32 %2, 10, !dbg !148
  br i1 %cmp1, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !150
  %4 = load i32, i32* %i, align 4, !dbg !152
  %idxprom = sext i32 %4 to i64, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !155
  %inc = add nsw i32 %5, 1, !dbg !155
  store i32 %inc, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !159
  %cmp2 = icmp sge i32 %6, 0, !dbg !161
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !162

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !163
  %8 = load i32, i32* %data.addr, align 4, !dbg !165
  %idxprom4 = sext i32 %8 to i64, !dbg !163
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !163
  store i32 1, i32* %arrayidx5, align 4, !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond6, !dbg !169

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !170
  %cmp7 = icmp slt i32 %9, 10, !dbg !172
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !173

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !174
  %11 = load i32, i32* %i, align 4, !dbg !176
  %idxprom9 = sext i32 %11 to i64, !dbg !174
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !174
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !174
  call void @printIntLine(i32 %12), !dbg !177
  br label %for.inc11, !dbg !178

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !179
  %inc12 = add nsw i32 %13, 1, !dbg !179
  store i32 %inc12, i32* %i, align 4, !dbg !179
  br label %for.cond6, !dbg !180, !llvm.loop !181

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !183

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !184
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !186
  %15 = bitcast i32* %14 to i8*, !dbg !186
  call void @free(i8* %15) #5, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !189 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !190, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !192, metadata !DIExpression()), !dbg !193
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !193
  store i32 -1, i32* %data, align 4, !dbg !194
  store i32 10, i32* %data, align 4, !dbg !195
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !196
  %1 = load i32, i32* %data, align 4, !dbg !197
  call void %0(i32 %1), !dbg !196
  ret void, !dbg !198
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !199 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !200, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata i32* %i, metadata !202, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !205, metadata !DIExpression()), !dbg !206
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !207
  %0 = bitcast i8* %call to i32*, !dbg !208
  store i32* %0, i32** %buffer, align 8, !dbg !206
  %1 = load i32*, i32** %buffer, align 8, !dbg !209
  %cmp = icmp eq i32* %1, null, !dbg !211
  br i1 %cmp, label %if.then, label %if.end, !dbg !212

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !213
  unreachable, !dbg !213

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !218
  %cmp1 = icmp slt i32 %2, 10, !dbg !220
  br i1 %cmp1, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !222
  %4 = load i32, i32* %i, align 4, !dbg !224
  %idxprom = sext i32 %4 to i64, !dbg !222
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !222
  store i32 0, i32* %arrayidx, align 4, !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !227
  %inc = add nsw i32 %5, 1, !dbg !227
  store i32 %inc, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !231
  %cmp2 = icmp sge i32 %6, 0, !dbg !233
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !234

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !235
  %cmp3 = icmp slt i32 %7, 10, !dbg !236
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !237

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !238
  %9 = load i32, i32* %data.addr, align 4, !dbg !240
  %idxprom5 = sext i32 %9 to i64, !dbg !238
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !238
  store i32 1, i32* %arrayidx6, align 4, !dbg !241
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond7, !dbg !244

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !245
  %cmp8 = icmp slt i32 %10, 10, !dbg !247
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !248

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !249
  %12 = load i32, i32* %i, align 4, !dbg !251
  %idxprom10 = sext i32 %12 to i64, !dbg !249
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !249
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !249
  call void @printIntLine(i32 %13), !dbg !252
  br label %for.inc12, !dbg !253

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !254
  %inc13 = add nsw i32 %14, 1, !dbg !254
  store i32 %inc13, i32* %i, align 4, !dbg !254
  br label %for.cond7, !dbg !255, !llvm.loop !256

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !258

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !259
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !261
  %16 = bitcast i32* %15 to i8*, !dbg !261
  call void @free(i8* %16) #5, !dbg !262
  ret void, !dbg !263
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !6)
!19 = !DILocation(line: 54, column: 9, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 56, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !6}
!24 = !DILocation(line: 56, column: 12, scope: !14)
!25 = !DILocation(line: 58, column: 10, scope: !14)
!26 = !DILocation(line: 60, column: 10, scope: !14)
!27 = !DILocation(line: 62, column: 5, scope: !14)
!28 = !DILocation(line: 62, column: 13, scope: !14)
!29 = !DILocation(line: 63, column: 1, scope: !14)
!30 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !22, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "data", arg: 1, scope: !30, file: !15, line: 22, type: !6)
!32 = !DILocation(line: 22, column: 25, scope: !30)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 25, type: !6)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 24, column: 5)
!35 = !DILocation(line: 25, column: 13, scope: !34)
!36 = !DILocalVariable(name: "buffer", scope: !34, file: !15, line: 26, type: !5)
!37 = !DILocation(line: 26, column: 15, scope: !34)
!38 = !DILocation(line: 26, column: 31, scope: !34)
!39 = !DILocation(line: 26, column: 24, scope: !34)
!40 = !DILocation(line: 27, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !15, line: 27, column: 13)
!42 = !DILocation(line: 27, column: 20, scope: !41)
!43 = !DILocation(line: 27, column: 13, scope: !34)
!44 = !DILocation(line: 27, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 27, column: 29)
!46 = !DILocation(line: 29, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !34, file: !15, line: 29, column: 9)
!48 = !DILocation(line: 29, column: 14, scope: !47)
!49 = !DILocation(line: 29, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !15, line: 29, column: 9)
!51 = !DILocation(line: 29, column: 23, scope: !50)
!52 = !DILocation(line: 29, column: 9, scope: !47)
!53 = !DILocation(line: 31, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 30, column: 9)
!55 = !DILocation(line: 31, column: 20, scope: !54)
!56 = !DILocation(line: 31, column: 23, scope: !54)
!57 = !DILocation(line: 32, column: 9, scope: !54)
!58 = !DILocation(line: 29, column: 30, scope: !50)
!59 = !DILocation(line: 29, column: 9, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 32, column: 9, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 35, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 13)
!65 = !DILocation(line: 35, column: 18, scope: !64)
!66 = !DILocation(line: 35, column: 13, scope: !34)
!67 = !DILocation(line: 37, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 36, column: 9)
!69 = !DILocation(line: 37, column: 20, scope: !68)
!70 = !DILocation(line: 37, column: 26, scope: !68)
!71 = !DILocation(line: 39, column: 19, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 39, column: 13)
!73 = !DILocation(line: 39, column: 17, scope: !72)
!74 = !DILocation(line: 39, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !15, line: 39, column: 13)
!76 = !DILocation(line: 39, column: 26, scope: !75)
!77 = !DILocation(line: 39, column: 13, scope: !72)
!78 = !DILocation(line: 41, column: 30, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 40, column: 13)
!80 = !DILocation(line: 41, column: 37, scope: !79)
!81 = !DILocation(line: 41, column: 17, scope: !79)
!82 = !DILocation(line: 42, column: 13, scope: !79)
!83 = !DILocation(line: 39, column: 33, scope: !75)
!84 = !DILocation(line: 39, column: 13, scope: !75)
!85 = distinct !{!85, !77, !86, !62}
!86 = !DILocation(line: 42, column: 13, scope: !72)
!87 = !DILocation(line: 43, column: 9, scope: !68)
!88 = !DILocation(line: 46, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !64, file: !15, line: 45, column: 9)
!90 = !DILocation(line: 48, column: 14, scope: !34)
!91 = !DILocation(line: 48, column: 9, scope: !34)
!92 = !DILocation(line: 50, column: 1, scope: !30)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_44_good", scope: !15, file: !15, line: 153, type: !16, scopeLine: 154, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 155, column: 5, scope: !93)
!95 = !DILocation(line: 156, column: 5, scope: !93)
!96 = !DILocation(line: 157, column: 1, scope: !93)
!97 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 167, type: !98, scopeLine: 168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!6, !6, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !15, line: 167, type: !6)
!104 = !DILocation(line: 167, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !15, line: 167, type: !100)
!106 = !DILocation(line: 167, column: 27, scope: !97)
!107 = !DILocation(line: 170, column: 22, scope: !97)
!108 = !DILocation(line: 170, column: 12, scope: !97)
!109 = !DILocation(line: 170, column: 5, scope: !97)
!110 = !DILocation(line: 172, column: 5, scope: !97)
!111 = !DILocation(line: 173, column: 5, scope: !97)
!112 = !DILocation(line: 174, column: 5, scope: !97)
!113 = !DILocation(line: 177, column: 5, scope: !97)
!114 = !DILocation(line: 178, column: 5, scope: !97)
!115 = !DILocation(line: 179, column: 5, scope: !97)
!116 = !DILocation(line: 181, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 102, type: !6)
!119 = !DILocation(line: 102, column: 9, scope: !117)
!120 = !DILocalVariable(name: "funcPtr", scope: !117, file: !15, line: 103, type: !21)
!121 = !DILocation(line: 103, column: 12, scope: !117)
!122 = !DILocation(line: 105, column: 10, scope: !117)
!123 = !DILocation(line: 108, column: 10, scope: !117)
!124 = !DILocation(line: 109, column: 5, scope: !117)
!125 = !DILocation(line: 109, column: 13, scope: !117)
!126 = !DILocation(line: 110, column: 1, scope: !117)
!127 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 70, type: !22, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", arg: 1, scope: !127, file: !15, line: 70, type: !6)
!129 = !DILocation(line: 70, column: 29, scope: !127)
!130 = !DILocalVariable(name: "i", scope: !131, file: !15, line: 73, type: !6)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 72, column: 5)
!132 = !DILocation(line: 73, column: 13, scope: !131)
!133 = !DILocalVariable(name: "buffer", scope: !131, file: !15, line: 74, type: !5)
!134 = !DILocation(line: 74, column: 15, scope: !131)
!135 = !DILocation(line: 74, column: 31, scope: !131)
!136 = !DILocation(line: 74, column: 24, scope: !131)
!137 = !DILocation(line: 75, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !131, file: !15, line: 75, column: 13)
!139 = !DILocation(line: 75, column: 20, scope: !138)
!140 = !DILocation(line: 75, column: 13, scope: !131)
!141 = !DILocation(line: 75, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !15, line: 75, column: 29)
!143 = !DILocation(line: 77, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !131, file: !15, line: 77, column: 9)
!145 = !DILocation(line: 77, column: 14, scope: !144)
!146 = !DILocation(line: 77, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 77, column: 9)
!148 = !DILocation(line: 77, column: 23, scope: !147)
!149 = !DILocation(line: 77, column: 9, scope: !144)
!150 = !DILocation(line: 79, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 78, column: 9)
!152 = !DILocation(line: 79, column: 20, scope: !151)
!153 = !DILocation(line: 79, column: 23, scope: !151)
!154 = !DILocation(line: 80, column: 9, scope: !151)
!155 = !DILocation(line: 77, column: 30, scope: !147)
!156 = !DILocation(line: 77, column: 9, scope: !147)
!157 = distinct !{!157, !149, !158, !62}
!158 = !DILocation(line: 80, column: 9, scope: !144)
!159 = !DILocation(line: 83, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !131, file: !15, line: 83, column: 13)
!161 = !DILocation(line: 83, column: 18, scope: !160)
!162 = !DILocation(line: 83, column: 13, scope: !131)
!163 = !DILocation(line: 85, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 84, column: 9)
!165 = !DILocation(line: 85, column: 20, scope: !164)
!166 = !DILocation(line: 85, column: 26, scope: !164)
!167 = !DILocation(line: 87, column: 19, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 87, column: 13)
!169 = !DILocation(line: 87, column: 17, scope: !168)
!170 = !DILocation(line: 87, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !15, line: 87, column: 13)
!172 = !DILocation(line: 87, column: 26, scope: !171)
!173 = !DILocation(line: 87, column: 13, scope: !168)
!174 = !DILocation(line: 89, column: 30, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !15, line: 88, column: 13)
!176 = !DILocation(line: 89, column: 37, scope: !175)
!177 = !DILocation(line: 89, column: 17, scope: !175)
!178 = !DILocation(line: 90, column: 13, scope: !175)
!179 = !DILocation(line: 87, column: 33, scope: !171)
!180 = !DILocation(line: 87, column: 13, scope: !171)
!181 = distinct !{!181, !173, !182, !62}
!182 = !DILocation(line: 90, column: 13, scope: !168)
!183 = !DILocation(line: 91, column: 9, scope: !164)
!184 = !DILocation(line: 94, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !160, file: !15, line: 93, column: 9)
!186 = !DILocation(line: 96, column: 14, scope: !131)
!187 = !DILocation(line: 96, column: 9, scope: !131)
!188 = !DILocation(line: 98, column: 1, scope: !127)
!189 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 142, type: !16, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!190 = !DILocalVariable(name: "data", scope: !189, file: !15, line: 144, type: !6)
!191 = !DILocation(line: 144, column: 9, scope: !189)
!192 = !DILocalVariable(name: "funcPtr", scope: !189, file: !15, line: 145, type: !21)
!193 = !DILocation(line: 145, column: 12, scope: !189)
!194 = !DILocation(line: 147, column: 10, scope: !189)
!195 = !DILocation(line: 149, column: 10, scope: !189)
!196 = !DILocation(line: 150, column: 5, scope: !189)
!197 = !DILocation(line: 150, column: 13, scope: !189)
!198 = !DILocation(line: 151, column: 1, scope: !189)
!199 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 113, type: !22, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!200 = !DILocalVariable(name: "data", arg: 1, scope: !199, file: !15, line: 113, type: !6)
!201 = !DILocation(line: 113, column: 29, scope: !199)
!202 = !DILocalVariable(name: "i", scope: !203, file: !15, line: 116, type: !6)
!203 = distinct !DILexicalBlock(scope: !199, file: !15, line: 115, column: 5)
!204 = !DILocation(line: 116, column: 13, scope: !203)
!205 = !DILocalVariable(name: "buffer", scope: !203, file: !15, line: 117, type: !5)
!206 = !DILocation(line: 117, column: 15, scope: !203)
!207 = !DILocation(line: 117, column: 31, scope: !203)
!208 = !DILocation(line: 117, column: 24, scope: !203)
!209 = !DILocation(line: 118, column: 13, scope: !210)
!210 = distinct !DILexicalBlock(scope: !203, file: !15, line: 118, column: 13)
!211 = !DILocation(line: 118, column: 20, scope: !210)
!212 = !DILocation(line: 118, column: 13, scope: !203)
!213 = !DILocation(line: 118, column: 30, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !15, line: 118, column: 29)
!215 = !DILocation(line: 120, column: 16, scope: !216)
!216 = distinct !DILexicalBlock(scope: !203, file: !15, line: 120, column: 9)
!217 = !DILocation(line: 120, column: 14, scope: !216)
!218 = !DILocation(line: 120, column: 21, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !15, line: 120, column: 9)
!220 = !DILocation(line: 120, column: 23, scope: !219)
!221 = !DILocation(line: 120, column: 9, scope: !216)
!222 = !DILocation(line: 122, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !15, line: 121, column: 9)
!224 = !DILocation(line: 122, column: 20, scope: !223)
!225 = !DILocation(line: 122, column: 23, scope: !223)
!226 = !DILocation(line: 123, column: 9, scope: !223)
!227 = !DILocation(line: 120, column: 30, scope: !219)
!228 = !DILocation(line: 120, column: 9, scope: !219)
!229 = distinct !{!229, !221, !230, !62}
!230 = !DILocation(line: 123, column: 9, scope: !216)
!231 = !DILocation(line: 125, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !203, file: !15, line: 125, column: 13)
!233 = !DILocation(line: 125, column: 18, scope: !232)
!234 = !DILocation(line: 125, column: 23, scope: !232)
!235 = !DILocation(line: 125, column: 26, scope: !232)
!236 = !DILocation(line: 125, column: 31, scope: !232)
!237 = !DILocation(line: 125, column: 13, scope: !203)
!238 = !DILocation(line: 127, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !232, file: !15, line: 126, column: 9)
!240 = !DILocation(line: 127, column: 20, scope: !239)
!241 = !DILocation(line: 127, column: 26, scope: !239)
!242 = !DILocation(line: 129, column: 19, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 129, column: 13)
!244 = !DILocation(line: 129, column: 17, scope: !243)
!245 = !DILocation(line: 129, column: 24, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !15, line: 129, column: 13)
!247 = !DILocation(line: 129, column: 26, scope: !246)
!248 = !DILocation(line: 129, column: 13, scope: !243)
!249 = !DILocation(line: 131, column: 30, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !15, line: 130, column: 13)
!251 = !DILocation(line: 131, column: 37, scope: !250)
!252 = !DILocation(line: 131, column: 17, scope: !250)
!253 = !DILocation(line: 132, column: 13, scope: !250)
!254 = !DILocation(line: 129, column: 33, scope: !246)
!255 = !DILocation(line: 129, column: 13, scope: !246)
!256 = distinct !{!256, !248, !257, !62}
!257 = !DILocation(line: 132, column: 13, scope: !243)
!258 = !DILocation(line: 133, column: 9, scope: !239)
!259 = !DILocation(line: 136, column: 13, scope: !260)
!260 = distinct !DILexicalBlock(scope: !232, file: !15, line: 135, column: 9)
!261 = !DILocation(line: 138, column: 14, scope: !203)
!262 = !DILocation(line: 138, column: 9, scope: !203)
!263 = !DILocation(line: 140, column: 1, scope: !199)
