; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* %data, align 4, !dbg !21
  %call = call i32 @badSource(i32 %0), !dbg !22
  store i32 %call, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !27, metadata !DIExpression()), !dbg !28
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !29
  %1 = bitcast i8* %call1 to i32*, !dbg !30
  store i32* %1, i32** %buffer, align 8, !dbg !28
  %2 = load i32*, i32** %buffer, align 8, !dbg !31
  %cmp = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !40
  %cmp2 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !44
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %5 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !54
  %cmp3 = icmp sge i32 %7, 0, !dbg !56
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !57

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !58
  %9 = load i32, i32* %data, align 4, !dbg !60
  %idxprom5 = sext i32 %9 to i64, !dbg !58
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !58
  store i32 1, i32* %arrayidx6, align 4, !dbg !61
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond7, !dbg !64

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !65
  %cmp8 = icmp slt i32 %10, 10, !dbg !67
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !68

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !69
  %12 = load i32, i32* %i, align 4, !dbg !71
  %idxprom10 = sext i32 %12 to i64, !dbg !69
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !69
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !69
  call void @printIntLine(i32 %13), !dbg !72
  br label %for.inc12, !dbg !73

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !74
  %inc13 = add nsw i32 %14, 1, !dbg !74
  store i32 %inc13, i32* %i, align 4, !dbg !74
  br label %for.cond7, !dbg !75, !llvm.loop !76

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !78

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !81
  %16 = bitcast i32* %15 to i8*, !dbg !81
  call void @free(i8* %16) #5, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 10, i32* %data.addr, align 4, !dbg !89
  %0 = load i32, i32* %data.addr, align 4, !dbg !90
  ret i32 %0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42_good() #0 !dbg !92 {
entry:
  call void @goodB2G(), !dbg !93
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  %0 = load i32, i32* %data, align 4, !dbg !120
  %call = call i32 @goodB2GSource(i32 %0), !dbg !121
  store i32 %call, i32* %data, align 4, !dbg !122
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !126, metadata !DIExpression()), !dbg !127
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !128
  %1 = bitcast i8* %call1 to i32*, !dbg !129
  store i32* %1, i32** %buffer, align 8, !dbg !127
  %2 = load i32*, i32** %buffer, align 8, !dbg !130
  %cmp = icmp eq i32* %2, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !139
  %cmp2 = icmp slt i32 %3, 10, !dbg !141
  br i1 %cmp2, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !143
  %5 = load i32, i32* %i, align 4, !dbg !145
  %idxprom = sext i32 %5 to i64, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !148
  %inc = add nsw i32 %6, 1, !dbg !148
  store i32 %inc, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !152
  %cmp3 = icmp sge i32 %7, 0, !dbg !154
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !155

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !156
  %cmp4 = icmp slt i32 %8, 10, !dbg !157
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !158

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !159
  %10 = load i32, i32* %data, align 4, !dbg !161
  %idxprom6 = sext i32 %10 to i64, !dbg !159
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !159
  store i32 1, i32* %arrayidx7, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond8, !dbg !165

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !166
  %cmp9 = icmp slt i32 %11, 10, !dbg !168
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !169

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !170
  %13 = load i32, i32* %i, align 4, !dbg !172
  %idxprom11 = sext i32 %13 to i64, !dbg !170
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !170
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !170
  call void @printIntLine(i32 %14), !dbg !173
  br label %for.inc13, !dbg !174

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !175
  %inc14 = add nsw i32 %15, 1, !dbg !175
  store i32 %inc14, i32* %i, align 4, !dbg !175
  br label %for.cond8, !dbg !176, !llvm.loop !177

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !179

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !180
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !182
  %17 = bitcast i32* %16 to i8*, !dbg !182
  call void @free(i8* %17) #5, !dbg !183
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !185 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 10, i32* %data.addr, align 4, !dbg !188
  %0 = load i32, i32* %data.addr, align 4, !dbg !189
  ret i32 %0, !dbg !190
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !191 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !192, metadata !DIExpression()), !dbg !193
  store i32 -1, i32* %data, align 4, !dbg !194
  %0 = load i32, i32* %data, align 4, !dbg !195
  %call = call i32 @goodG2BSource(i32 %0), !dbg !196
  store i32 %call, i32* %data, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !203
  %1 = bitcast i8* %call1 to i32*, !dbg !204
  store i32* %1, i32** %buffer, align 8, !dbg !202
  %2 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp = icmp eq i32* %2, null, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !209
  unreachable, !dbg !209

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !214
  %cmp2 = icmp slt i32 %3, 10, !dbg !216
  br i1 %cmp2, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !218
  %5 = load i32, i32* %i, align 4, !dbg !220
  %idxprom = sext i32 %5 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !218
  store i32 0, i32* %arrayidx, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %6, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !227
  %cmp3 = icmp sge i32 %7, 0, !dbg !229
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !230

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !231
  %9 = load i32, i32* %data, align 4, !dbg !233
  %idxprom5 = sext i32 %9 to i64, !dbg !231
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !231
  store i32 1, i32* %arrayidx6, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond7, !dbg !237

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !238
  %cmp8 = icmp slt i32 %10, 10, !dbg !240
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !241

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !242
  %12 = load i32, i32* %i, align 4, !dbg !244
  %idxprom10 = sext i32 %12 to i64, !dbg !242
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !242
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !242
  call void @printIntLine(i32 %13), !dbg !245
  br label %for.inc12, !dbg !246

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !247
  %inc13 = add nsw i32 %14, 1, !dbg !247
  store i32 %inc13, i32* %i, align 4, !dbg !247
  br label %for.cond7, !dbg !248, !llvm.loop !249

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !251

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !252
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !254
  %16 = bitcast i32* %15 to i8*, !dbg !254
  call void @free(i8* %16) #5, !dbg !255
  ret void, !dbg !256
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !257 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 7, i32* %data.addr, align 4, !dbg !260
  %0 = load i32, i32* %data.addr, align 4, !dbg !261
  ret i32 %0, !dbg !262
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !5)
!19 = !DILocation(line: 31, column: 9, scope: !14)
!20 = !DILocation(line: 33, column: 10, scope: !14)
!21 = !DILocation(line: 34, column: 22, scope: !14)
!22 = !DILocation(line: 34, column: 12, scope: !14)
!23 = !DILocation(line: 34, column: 10, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 36, type: !5)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!26 = !DILocation(line: 36, column: 13, scope: !25)
!27 = !DILocalVariable(name: "buffer", scope: !25, file: !15, line: 37, type: !4)
!28 = !DILocation(line: 37, column: 15, scope: !25)
!29 = !DILocation(line: 37, column: 31, scope: !25)
!30 = !DILocation(line: 37, column: 24, scope: !25)
!31 = !DILocation(line: 38, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !15, line: 38, column: 13)
!33 = !DILocation(line: 38, column: 20, scope: !32)
!34 = !DILocation(line: 38, column: 13, scope: !25)
!35 = !DILocation(line: 38, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 29)
!37 = !DILocation(line: 40, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !25, file: !15, line: 40, column: 9)
!39 = !DILocation(line: 40, column: 14, scope: !38)
!40 = !DILocation(line: 40, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !15, line: 40, column: 9)
!42 = !DILocation(line: 40, column: 23, scope: !41)
!43 = !DILocation(line: 40, column: 9, scope: !38)
!44 = !DILocation(line: 42, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 41, column: 9)
!46 = !DILocation(line: 42, column: 20, scope: !45)
!47 = !DILocation(line: 42, column: 23, scope: !45)
!48 = !DILocation(line: 43, column: 9, scope: !45)
!49 = !DILocation(line: 40, column: 30, scope: !41)
!50 = !DILocation(line: 40, column: 9, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 43, column: 9, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 46, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !25, file: !15, line: 46, column: 13)
!56 = !DILocation(line: 46, column: 18, scope: !55)
!57 = !DILocation(line: 46, column: 13, scope: !25)
!58 = !DILocation(line: 48, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 47, column: 9)
!60 = !DILocation(line: 48, column: 20, scope: !59)
!61 = !DILocation(line: 48, column: 26, scope: !59)
!62 = !DILocation(line: 50, column: 19, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 50, column: 13)
!64 = !DILocation(line: 50, column: 17, scope: !63)
!65 = !DILocation(line: 50, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 50, column: 13)
!67 = !DILocation(line: 50, column: 26, scope: !66)
!68 = !DILocation(line: 50, column: 13, scope: !63)
!69 = !DILocation(line: 52, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 51, column: 13)
!71 = !DILocation(line: 52, column: 37, scope: !70)
!72 = !DILocation(line: 52, column: 17, scope: !70)
!73 = !DILocation(line: 53, column: 13, scope: !70)
!74 = !DILocation(line: 50, column: 33, scope: !66)
!75 = !DILocation(line: 50, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !53}
!77 = !DILocation(line: 53, column: 13, scope: !63)
!78 = !DILocation(line: 54, column: 9, scope: !59)
!79 = !DILocation(line: 57, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !55, file: !15, line: 56, column: 9)
!81 = !DILocation(line: 59, column: 14, scope: !25)
!82 = !DILocation(line: 59, column: 9, scope: !25)
!83 = !DILocation(line: 61, column: 1, scope: !14)
!84 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 22, type: !85, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!5, !5}
!87 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !15, line: 22, type: !5)
!88 = !DILocation(line: 22, column: 26, scope: !84)
!89 = !DILocation(line: 25, column: 10, scope: !84)
!90 = !DILocation(line: 26, column: 12, scope: !84)
!91 = !DILocation(line: 26, column: 5, scope: !84)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_42_good", scope: !15, file: !15, line: 151, type: !16, scopeLine: 152, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 153, column: 5, scope: !92)
!94 = !DILocation(line: 154, column: 5, scope: !92)
!95 = !DILocation(line: 155, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 166, type: !97, scopeLine: 167, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!5, !5, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !15, line: 166, type: !5)
!103 = !DILocation(line: 166, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !15, line: 166, type: !99)
!105 = !DILocation(line: 166, column: 27, scope: !96)
!106 = !DILocation(line: 169, column: 22, scope: !96)
!107 = !DILocation(line: 169, column: 12, scope: !96)
!108 = !DILocation(line: 169, column: 5, scope: !96)
!109 = !DILocation(line: 171, column: 5, scope: !96)
!110 = !DILocation(line: 172, column: 5, scope: !96)
!111 = !DILocation(line: 173, column: 5, scope: !96)
!112 = !DILocation(line: 176, column: 5, scope: !96)
!113 = !DILocation(line: 177, column: 5, scope: !96)
!114 = !DILocation(line: 178, column: 5, scope: !96)
!115 = !DILocation(line: 180, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 118, type: !16, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 120, type: !5)
!118 = !DILocation(line: 120, column: 9, scope: !116)
!119 = !DILocation(line: 122, column: 10, scope: !116)
!120 = !DILocation(line: 123, column: 26, scope: !116)
!121 = !DILocation(line: 123, column: 12, scope: !116)
!122 = !DILocation(line: 123, column: 10, scope: !116)
!123 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 125, type: !5)
!124 = distinct !DILexicalBlock(scope: !116, file: !15, line: 124, column: 5)
!125 = !DILocation(line: 125, column: 13, scope: !124)
!126 = !DILocalVariable(name: "buffer", scope: !124, file: !15, line: 126, type: !4)
!127 = !DILocation(line: 126, column: 15, scope: !124)
!128 = !DILocation(line: 126, column: 31, scope: !124)
!129 = !DILocation(line: 126, column: 24, scope: !124)
!130 = !DILocation(line: 127, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !15, line: 127, column: 13)
!132 = !DILocation(line: 127, column: 20, scope: !131)
!133 = !DILocation(line: 127, column: 13, scope: !124)
!134 = !DILocation(line: 127, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 127, column: 29)
!136 = !DILocation(line: 129, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !15, line: 129, column: 9)
!138 = !DILocation(line: 129, column: 14, scope: !137)
!139 = !DILocation(line: 129, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 129, column: 9)
!141 = !DILocation(line: 129, column: 23, scope: !140)
!142 = !DILocation(line: 129, column: 9, scope: !137)
!143 = !DILocation(line: 131, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 130, column: 9)
!145 = !DILocation(line: 131, column: 20, scope: !144)
!146 = !DILocation(line: 131, column: 23, scope: !144)
!147 = !DILocation(line: 132, column: 9, scope: !144)
!148 = !DILocation(line: 129, column: 30, scope: !140)
!149 = !DILocation(line: 129, column: 9, scope: !140)
!150 = distinct !{!150, !142, !151, !53}
!151 = !DILocation(line: 132, column: 9, scope: !137)
!152 = !DILocation(line: 134, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !124, file: !15, line: 134, column: 13)
!154 = !DILocation(line: 134, column: 18, scope: !153)
!155 = !DILocation(line: 134, column: 23, scope: !153)
!156 = !DILocation(line: 134, column: 26, scope: !153)
!157 = !DILocation(line: 134, column: 31, scope: !153)
!158 = !DILocation(line: 134, column: 13, scope: !124)
!159 = !DILocation(line: 136, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !15, line: 135, column: 9)
!161 = !DILocation(line: 136, column: 20, scope: !160)
!162 = !DILocation(line: 136, column: 26, scope: !160)
!163 = !DILocation(line: 138, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 138, column: 13)
!165 = !DILocation(line: 138, column: 17, scope: !164)
!166 = !DILocation(line: 138, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 138, column: 13)
!168 = !DILocation(line: 138, column: 26, scope: !167)
!169 = !DILocation(line: 138, column: 13, scope: !164)
!170 = !DILocation(line: 140, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 139, column: 13)
!172 = !DILocation(line: 140, column: 37, scope: !171)
!173 = !DILocation(line: 140, column: 17, scope: !171)
!174 = !DILocation(line: 141, column: 13, scope: !171)
!175 = !DILocation(line: 138, column: 33, scope: !167)
!176 = !DILocation(line: 138, column: 13, scope: !167)
!177 = distinct !{!177, !169, !178, !53}
!178 = !DILocation(line: 141, column: 13, scope: !164)
!179 = !DILocation(line: 142, column: 9, scope: !160)
!180 = !DILocation(line: 145, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !153, file: !15, line: 144, column: 9)
!182 = !DILocation(line: 147, column: 14, scope: !124)
!183 = !DILocation(line: 147, column: 9, scope: !124)
!184 = !DILocation(line: 149, column: 1, scope: !116)
!185 = distinct !DISubprogram(name: "goodB2GSource", scope: !15, file: !15, line: 111, type: !85, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!186 = !DILocalVariable(name: "data", arg: 1, scope: !185, file: !15, line: 111, type: !5)
!187 = !DILocation(line: 111, column: 30, scope: !185)
!188 = !DILocation(line: 114, column: 10, scope: !185)
!189 = !DILocation(line: 115, column: 12, scope: !185)
!190 = !DILocation(line: 115, column: 5, scope: !185)
!191 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!192 = !DILocalVariable(name: "data", scope: !191, file: !15, line: 78, type: !5)
!193 = !DILocation(line: 78, column: 9, scope: !191)
!194 = !DILocation(line: 80, column: 10, scope: !191)
!195 = !DILocation(line: 81, column: 26, scope: !191)
!196 = !DILocation(line: 81, column: 12, scope: !191)
!197 = !DILocation(line: 81, column: 10, scope: !191)
!198 = !DILocalVariable(name: "i", scope: !199, file: !15, line: 83, type: !5)
!199 = distinct !DILexicalBlock(scope: !191, file: !15, line: 82, column: 5)
!200 = !DILocation(line: 83, column: 13, scope: !199)
!201 = !DILocalVariable(name: "buffer", scope: !199, file: !15, line: 84, type: !4)
!202 = !DILocation(line: 84, column: 15, scope: !199)
!203 = !DILocation(line: 84, column: 31, scope: !199)
!204 = !DILocation(line: 84, column: 24, scope: !199)
!205 = !DILocation(line: 85, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !15, line: 85, column: 13)
!207 = !DILocation(line: 85, column: 20, scope: !206)
!208 = !DILocation(line: 85, column: 13, scope: !199)
!209 = !DILocation(line: 85, column: 30, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 85, column: 29)
!211 = !DILocation(line: 87, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !199, file: !15, line: 87, column: 9)
!213 = !DILocation(line: 87, column: 14, scope: !212)
!214 = !DILocation(line: 87, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !15, line: 87, column: 9)
!216 = !DILocation(line: 87, column: 23, scope: !215)
!217 = !DILocation(line: 87, column: 9, scope: !212)
!218 = !DILocation(line: 89, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 88, column: 9)
!220 = !DILocation(line: 89, column: 20, scope: !219)
!221 = !DILocation(line: 89, column: 23, scope: !219)
!222 = !DILocation(line: 90, column: 9, scope: !219)
!223 = !DILocation(line: 87, column: 30, scope: !215)
!224 = !DILocation(line: 87, column: 9, scope: !215)
!225 = distinct !{!225, !217, !226, !53}
!226 = !DILocation(line: 90, column: 9, scope: !212)
!227 = !DILocation(line: 93, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !199, file: !15, line: 93, column: 13)
!229 = !DILocation(line: 93, column: 18, scope: !228)
!230 = !DILocation(line: 93, column: 13, scope: !199)
!231 = !DILocation(line: 95, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 94, column: 9)
!233 = !DILocation(line: 95, column: 20, scope: !232)
!234 = !DILocation(line: 95, column: 26, scope: !232)
!235 = !DILocation(line: 97, column: 19, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !15, line: 97, column: 13)
!237 = !DILocation(line: 97, column: 17, scope: !236)
!238 = !DILocation(line: 97, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !15, line: 97, column: 13)
!240 = !DILocation(line: 97, column: 26, scope: !239)
!241 = !DILocation(line: 97, column: 13, scope: !236)
!242 = !DILocation(line: 99, column: 30, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 98, column: 13)
!244 = !DILocation(line: 99, column: 37, scope: !243)
!245 = !DILocation(line: 99, column: 17, scope: !243)
!246 = !DILocation(line: 100, column: 13, scope: !243)
!247 = !DILocation(line: 97, column: 33, scope: !239)
!248 = !DILocation(line: 97, column: 13, scope: !239)
!249 = distinct !{!249, !241, !250, !53}
!250 = !DILocation(line: 100, column: 13, scope: !236)
!251 = !DILocation(line: 101, column: 9, scope: !232)
!252 = !DILocation(line: 104, column: 13, scope: !253)
!253 = distinct !DILexicalBlock(scope: !228, file: !15, line: 103, column: 9)
!254 = !DILocation(line: 106, column: 14, scope: !199)
!255 = !DILocation(line: 106, column: 9, scope: !199)
!256 = !DILocation(line: 108, column: 1, scope: !191)
!257 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 68, type: !85, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!258 = !DILocalVariable(name: "data", arg: 1, scope: !257, file: !15, line: 68, type: !5)
!259 = !DILocation(line: 68, column: 30, scope: !257)
!260 = !DILocation(line: 72, column: 10, scope: !257)
!261 = !DILocation(line: 73, column: 12, scope: !257)
!262 = !DILocation(line: 73, column: 5, scope: !257)
