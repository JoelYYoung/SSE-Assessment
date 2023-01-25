; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %j, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp = icmp slt i32 %0, 1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !30
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !32
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !34
  %inc = add nsw i32 %2, 1, !dbg !34
  store i32 %inc, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !39
  br label %for.cond1, !dbg !41

for.cond1:                                        ; preds = %for.inc14, %for.end
  %3 = load i32, i32* %j, align 4, !dbg !42
  %cmp2 = icmp slt i32 %3, 1, !dbg !44
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !45

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !50, metadata !DIExpression()), !dbg !54
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !54
  %5 = load i32, i32* %data, align 4, !dbg !55
  %cmp5 = icmp sge i32 %5, 0, !dbg !57
  br i1 %cmp5, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %for.body3
  %6 = load i32, i32* %data, align 4, !dbg !59
  %idxprom = sext i32 %6 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !61
  store i32 1, i32* %arrayidx, align 4, !dbg !62
  store i32 0, i32* %i4, align 4, !dbg !63
  br label %for.cond6, !dbg !65

for.cond6:                                        ; preds = %for.inc11, %if.then
  %7 = load i32, i32* %i4, align 4, !dbg !66
  %cmp7 = icmp slt i32 %7, 10, !dbg !68
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !69

for.body8:                                        ; preds = %for.cond6
  %8 = load i32, i32* %i4, align 4, !dbg !70
  %idxprom9 = sext i32 %8 to i64, !dbg !72
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom9, !dbg !72
  %9 = load i32, i32* %arrayidx10, align 4, !dbg !72
  call void @printIntLine(i32 %9), !dbg !73
  br label %for.inc11, !dbg !74

for.inc11:                                        ; preds = %for.body8
  %10 = load i32, i32* %i4, align 4, !dbg !75
  %inc12 = add nsw i32 %10, 1, !dbg !75
  store i32 %inc12, i32* %i4, align 4, !dbg !75
  br label %for.cond6, !dbg !76, !llvm.loop !77

for.end13:                                        ; preds = %for.cond6
  br label %if.end, !dbg !79

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end13
  br label %for.inc14, !dbg !82

for.inc14:                                        ; preds = %if.end
  %11 = load i32, i32* %j, align 4, !dbg !83
  %inc15 = add nsw i32 %11, 1, !dbg !83
  store i32 %inc15, i32* %j, align 4, !dbg !83
  br label %for.cond1, !dbg !84, !llvm.loop !85

for.end16:                                        ; preds = %for.cond1
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17_good() #0 !dbg !88 {
entry:
  call void @goodB2G(), !dbg !89
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !112 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %i4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %k, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  store i32 0, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !123
  %cmp = icmp slt i32 %0, 1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !127
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !131
  %inc = add nsw i32 %2, 1, !dbg !131
  store i32 %inc, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !135
  br label %for.cond1, !dbg !137

for.cond1:                                        ; preds = %for.inc15, %for.end
  %3 = load i32, i32* %k, align 4, !dbg !138
  %cmp2 = icmp slt i32 %3, 1, !dbg !140
  br i1 %cmp2, label %for.body3, label %for.end17, !dbg !141

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !142, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !146, metadata !DIExpression()), !dbg !147
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !147
  %5 = load i32, i32* %data, align 4, !dbg !148
  %cmp5 = icmp sge i32 %5, 0, !dbg !150
  br i1 %cmp5, label %land.lhs.true, label %if.else, !dbg !151

land.lhs.true:                                    ; preds = %for.body3
  %6 = load i32, i32* %data, align 4, !dbg !152
  %cmp6 = icmp slt i32 %6, 10, !dbg !153
  br i1 %cmp6, label %if.then, label %if.else, !dbg !154

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !155
  %idxprom = sext i32 %7 to i64, !dbg !157
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !157
  store i32 1, i32* %arrayidx, align 4, !dbg !158
  store i32 0, i32* %i4, align 4, !dbg !159
  br label %for.cond7, !dbg !161

for.cond7:                                        ; preds = %for.inc12, %if.then
  %8 = load i32, i32* %i4, align 4, !dbg !162
  %cmp8 = icmp slt i32 %8, 10, !dbg !164
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !165

for.body9:                                        ; preds = %for.cond7
  %9 = load i32, i32* %i4, align 4, !dbg !166
  %idxprom10 = sext i32 %9 to i64, !dbg !168
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom10, !dbg !168
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !168
  call void @printIntLine(i32 %10), !dbg !169
  br label %for.inc12, !dbg !170

for.inc12:                                        ; preds = %for.body9
  %11 = load i32, i32* %i4, align 4, !dbg !171
  %inc13 = add nsw i32 %11, 1, !dbg !171
  store i32 %inc13, i32* %i4, align 4, !dbg !171
  br label %for.cond7, !dbg !172, !llvm.loop !173

for.end14:                                        ; preds = %for.cond7
  br label %if.end, !dbg !175

if.else:                                          ; preds = %land.lhs.true, %for.body3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !176
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end14
  br label %for.inc15, !dbg !178

for.inc15:                                        ; preds = %if.end
  %12 = load i32, i32* %k, align 4, !dbg !179
  %inc16 = add nsw i32 %12, 1, !dbg !179
  store i32 %inc16, i32* %k, align 4, !dbg !179
  br label %for.cond1, !dbg !180, !llvm.loop !181

for.end17:                                        ; preds = %for.cond1
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !184 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i32* %j, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata i32* %data, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 -1, i32* %data, align 4, !dbg !191
  store i32 0, i32* %h, align 4, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !195
  %cmp = icmp slt i32 %0, 1, !dbg !197
  br i1 %cmp, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !199
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !202
  %inc = add nsw i32 %1, 1, !dbg !202
  store i32 %inc, i32* %h, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !206
  br label %for.cond1, !dbg !208

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !209
  %cmp2 = icmp slt i32 %2, 1, !dbg !211
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !212

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !213, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !217, metadata !DIExpression()), !dbg !218
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !218
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !218
  %4 = load i32, i32* %data, align 4, !dbg !219
  %cmp4 = icmp sge i32 %4, 0, !dbg !221
  br i1 %cmp4, label %if.then, label %if.else, !dbg !222

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !223
  %idxprom = sext i32 %5 to i64, !dbg !225
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !225
  store i32 1, i32* %arrayidx, align 4, !dbg !226
  store i32 0, i32* %i, align 4, !dbg !227
  br label %for.cond5, !dbg !229

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !230
  %cmp6 = icmp slt i32 %6, 10, !dbg !232
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !233

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !234
  %idxprom8 = sext i32 %7 to i64, !dbg !236
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !236
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !236
  call void @printIntLine(i32 %8), !dbg !237
  br label %for.inc10, !dbg !238

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !239
  %inc11 = add nsw i32 %9, 1, !dbg !239
  store i32 %inc11, i32* %i, align 4, !dbg !239
  br label %for.cond5, !dbg !240, !llvm.loop !241

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !243

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !244
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !246

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !247
  %inc14 = add nsw i32 %10, 1, !dbg !247
  store i32 %inc14, i32* %j, align 4, !dbg !247
  br label %for.cond1, !dbg !248, !llvm.loop !249

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !251
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 24, type: !16)
!19 = !DILocation(line: 24, column: 11, scope: !11)
!20 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!21 = !DILocation(line: 25, column: 9, scope: !11)
!22 = !DILocation(line: 27, column: 10, scope: !11)
!23 = !DILocation(line: 28, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 28, column: 9, scope: !24)
!26 = !DILocation(line: 28, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !12, line: 28, column: 5)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 5, scope: !24)
!30 = !DILocation(line: 31, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 5, scope: !31)
!34 = !DILocation(line: 28, column: 24, scope: !27)
!35 = !DILocation(line: 28, column: 5, scope: !27)
!36 = distinct !{!36, !29, !37, !38}
!37 = !DILocation(line: 32, column: 5, scope: !24)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 33, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 5, scope: !40)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 36, type: !16)
!47 = distinct !DILexicalBlock(scope: !48, file: !12, line: 35, column: 9)
!48 = distinct !DILexicalBlock(scope: !43, file: !12, line: 34, column: 5)
!49 = !DILocation(line: 36, column: 17, scope: !47)
!50 = !DILocalVariable(name: "buffer", scope: !47, file: !12, line: 37, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 10)
!54 = !DILocation(line: 37, column: 17, scope: !47)
!55 = !DILocation(line: 40, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !47, file: !12, line: 40, column: 17)
!57 = !DILocation(line: 40, column: 22, scope: !56)
!58 = !DILocation(line: 40, column: 17, scope: !47)
!59 = !DILocation(line: 42, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 41, column: 13)
!61 = !DILocation(line: 42, column: 17, scope: !60)
!62 = !DILocation(line: 42, column: 30, scope: !60)
!63 = !DILocation(line: 44, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 44, column: 17)
!65 = !DILocation(line: 44, column: 21, scope: !64)
!66 = !DILocation(line: 44, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 44, column: 17)
!68 = !DILocation(line: 44, column: 30, scope: !67)
!69 = !DILocation(line: 44, column: 17, scope: !64)
!70 = !DILocation(line: 46, column: 41, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !12, line: 45, column: 17)
!72 = !DILocation(line: 46, column: 34, scope: !71)
!73 = !DILocation(line: 46, column: 21, scope: !71)
!74 = !DILocation(line: 47, column: 17, scope: !71)
!75 = !DILocation(line: 44, column: 37, scope: !67)
!76 = !DILocation(line: 44, column: 17, scope: !67)
!77 = distinct !{!77, !69, !78, !38}
!78 = !DILocation(line: 47, column: 17, scope: !64)
!79 = !DILocation(line: 48, column: 13, scope: !60)
!80 = !DILocation(line: 51, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !56, file: !12, line: 50, column: 13)
!82 = !DILocation(line: 54, column: 5, scope: !48)
!83 = !DILocation(line: 33, column: 24, scope: !43)
!84 = !DILocation(line: 33, column: 5, scope: !43)
!85 = distinct !{!85, !45, !86, !38}
!86 = !DILocation(line: 54, column: 5, scope: !40)
!87 = !DILocation(line: 55, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_17_good", scope: !12, file: !12, line: 133, type: !13, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 135, column: 5, scope: !88)
!90 = !DILocation(line: 136, column: 5, scope: !88)
!91 = !DILocation(line: 137, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 148, type: !93, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!16, !16, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 148, type: !16)
!99 = !DILocation(line: 148, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 148, type: !95)
!101 = !DILocation(line: 148, column: 27, scope: !92)
!102 = !DILocation(line: 151, column: 22, scope: !92)
!103 = !DILocation(line: 151, column: 12, scope: !92)
!104 = !DILocation(line: 151, column: 5, scope: !92)
!105 = !DILocation(line: 153, column: 5, scope: !92)
!106 = !DILocation(line: 154, column: 5, scope: !92)
!107 = !DILocation(line: 155, column: 5, scope: !92)
!108 = !DILocation(line: 158, column: 5, scope: !92)
!109 = !DILocation(line: 159, column: 5, scope: !92)
!110 = !DILocation(line: 160, column: 5, scope: !92)
!111 = !DILocation(line: 162, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 64, type: !16)
!114 = !DILocation(line: 64, column: 9, scope: !112)
!115 = !DILocalVariable(name: "k", scope: !112, file: !12, line: 64, type: !16)
!116 = !DILocation(line: 64, column: 11, scope: !112)
!117 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 65, type: !16)
!118 = !DILocation(line: 65, column: 9, scope: !112)
!119 = !DILocation(line: 67, column: 10, scope: !112)
!120 = !DILocation(line: 68, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !12, line: 68, column: 5)
!122 = !DILocation(line: 68, column: 9, scope: !121)
!123 = !DILocation(line: 68, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 68, column: 5)
!125 = !DILocation(line: 68, column: 18, scope: !124)
!126 = !DILocation(line: 68, column: 5, scope: !121)
!127 = !DILocation(line: 71, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 69, column: 5)
!129 = !DILocation(line: 71, column: 9, scope: !128)
!130 = !DILocation(line: 72, column: 5, scope: !128)
!131 = !DILocation(line: 68, column: 24, scope: !124)
!132 = !DILocation(line: 68, column: 5, scope: !124)
!133 = distinct !{!133, !126, !134, !38}
!134 = !DILocation(line: 72, column: 5, scope: !121)
!135 = !DILocation(line: 73, column: 11, scope: !136)
!136 = distinct !DILexicalBlock(scope: !112, file: !12, line: 73, column: 5)
!137 = !DILocation(line: 73, column: 9, scope: !136)
!138 = !DILocation(line: 73, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 73, column: 5)
!140 = !DILocation(line: 73, column: 18, scope: !139)
!141 = !DILocation(line: 73, column: 5, scope: !136)
!142 = !DILocalVariable(name: "i", scope: !143, file: !12, line: 76, type: !16)
!143 = distinct !DILexicalBlock(scope: !144, file: !12, line: 75, column: 9)
!144 = distinct !DILexicalBlock(scope: !139, file: !12, line: 74, column: 5)
!145 = !DILocation(line: 76, column: 17, scope: !143)
!146 = !DILocalVariable(name: "buffer", scope: !143, file: !12, line: 77, type: !51)
!147 = !DILocation(line: 77, column: 17, scope: !143)
!148 = !DILocation(line: 79, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !12, line: 79, column: 17)
!150 = !DILocation(line: 79, column: 22, scope: !149)
!151 = !DILocation(line: 79, column: 27, scope: !149)
!152 = !DILocation(line: 79, column: 30, scope: !149)
!153 = !DILocation(line: 79, column: 35, scope: !149)
!154 = !DILocation(line: 79, column: 17, scope: !143)
!155 = !DILocation(line: 81, column: 24, scope: !156)
!156 = distinct !DILexicalBlock(scope: !149, file: !12, line: 80, column: 13)
!157 = !DILocation(line: 81, column: 17, scope: !156)
!158 = !DILocation(line: 81, column: 30, scope: !156)
!159 = !DILocation(line: 83, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !12, line: 83, column: 17)
!161 = !DILocation(line: 83, column: 21, scope: !160)
!162 = !DILocation(line: 83, column: 28, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 83, column: 17)
!164 = !DILocation(line: 83, column: 30, scope: !163)
!165 = !DILocation(line: 83, column: 17, scope: !160)
!166 = !DILocation(line: 85, column: 41, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 84, column: 17)
!168 = !DILocation(line: 85, column: 34, scope: !167)
!169 = !DILocation(line: 85, column: 21, scope: !167)
!170 = !DILocation(line: 86, column: 17, scope: !167)
!171 = !DILocation(line: 83, column: 37, scope: !163)
!172 = !DILocation(line: 83, column: 17, scope: !163)
!173 = distinct !{!173, !165, !174, !38}
!174 = !DILocation(line: 86, column: 17, scope: !160)
!175 = !DILocation(line: 87, column: 13, scope: !156)
!176 = !DILocation(line: 90, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !149, file: !12, line: 89, column: 13)
!178 = !DILocation(line: 93, column: 5, scope: !144)
!179 = !DILocation(line: 73, column: 24, scope: !139)
!180 = !DILocation(line: 73, column: 5, scope: !139)
!181 = distinct !{!181, !141, !182, !38}
!182 = !DILocation(line: 93, column: 5, scope: !136)
!183 = !DILocation(line: 94, column: 1, scope: !112)
!184 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocalVariable(name: "h", scope: !184, file: !12, line: 99, type: !16)
!186 = !DILocation(line: 99, column: 9, scope: !184)
!187 = !DILocalVariable(name: "j", scope: !184, file: !12, line: 99, type: !16)
!188 = !DILocation(line: 99, column: 11, scope: !184)
!189 = !DILocalVariable(name: "data", scope: !184, file: !12, line: 100, type: !16)
!190 = !DILocation(line: 100, column: 9, scope: !184)
!191 = !DILocation(line: 102, column: 10, scope: !184)
!192 = !DILocation(line: 103, column: 11, scope: !193)
!193 = distinct !DILexicalBlock(scope: !184, file: !12, line: 103, column: 5)
!194 = !DILocation(line: 103, column: 9, scope: !193)
!195 = !DILocation(line: 103, column: 16, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 103, column: 5)
!197 = !DILocation(line: 103, column: 18, scope: !196)
!198 = !DILocation(line: 103, column: 5, scope: !193)
!199 = !DILocation(line: 107, column: 14, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !12, line: 104, column: 5)
!201 = !DILocation(line: 108, column: 5, scope: !200)
!202 = !DILocation(line: 103, column: 24, scope: !196)
!203 = !DILocation(line: 103, column: 5, scope: !196)
!204 = distinct !{!204, !198, !205, !38}
!205 = !DILocation(line: 108, column: 5, scope: !193)
!206 = !DILocation(line: 109, column: 11, scope: !207)
!207 = distinct !DILexicalBlock(scope: !184, file: !12, line: 109, column: 5)
!208 = !DILocation(line: 109, column: 9, scope: !207)
!209 = !DILocation(line: 109, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !12, line: 109, column: 5)
!211 = !DILocation(line: 109, column: 18, scope: !210)
!212 = !DILocation(line: 109, column: 5, scope: !207)
!213 = !DILocalVariable(name: "i", scope: !214, file: !12, line: 112, type: !16)
!214 = distinct !DILexicalBlock(scope: !215, file: !12, line: 111, column: 9)
!215 = distinct !DILexicalBlock(scope: !210, file: !12, line: 110, column: 5)
!216 = !DILocation(line: 112, column: 17, scope: !214)
!217 = !DILocalVariable(name: "buffer", scope: !214, file: !12, line: 113, type: !51)
!218 = !DILocation(line: 113, column: 17, scope: !214)
!219 = !DILocation(line: 116, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !214, file: !12, line: 116, column: 17)
!221 = !DILocation(line: 116, column: 22, scope: !220)
!222 = !DILocation(line: 116, column: 17, scope: !214)
!223 = !DILocation(line: 118, column: 24, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !12, line: 117, column: 13)
!225 = !DILocation(line: 118, column: 17, scope: !224)
!226 = !DILocation(line: 118, column: 30, scope: !224)
!227 = !DILocation(line: 120, column: 23, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !12, line: 120, column: 17)
!229 = !DILocation(line: 120, column: 21, scope: !228)
!230 = !DILocation(line: 120, column: 28, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !12, line: 120, column: 17)
!232 = !DILocation(line: 120, column: 30, scope: !231)
!233 = !DILocation(line: 120, column: 17, scope: !228)
!234 = !DILocation(line: 122, column: 41, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !12, line: 121, column: 17)
!236 = !DILocation(line: 122, column: 34, scope: !235)
!237 = !DILocation(line: 122, column: 21, scope: !235)
!238 = !DILocation(line: 123, column: 17, scope: !235)
!239 = !DILocation(line: 120, column: 37, scope: !231)
!240 = !DILocation(line: 120, column: 17, scope: !231)
!241 = distinct !{!241, !233, !242, !38}
!242 = !DILocation(line: 123, column: 17, scope: !228)
!243 = !DILocation(line: 124, column: 13, scope: !224)
!244 = !DILocation(line: 127, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !220, file: !12, line: 126, column: 13)
!246 = !DILocation(line: 130, column: 5, scope: !215)
!247 = !DILocation(line: 109, column: 24, scope: !210)
!248 = !DILocation(line: 109, column: 5, scope: !210)
!249 = distinct !{!249, !212, !250, !38}
!250 = !DILocation(line: 130, column: 5, scope: !207)
!251 = !DILocation(line: 131, column: 1, scope: !184)
