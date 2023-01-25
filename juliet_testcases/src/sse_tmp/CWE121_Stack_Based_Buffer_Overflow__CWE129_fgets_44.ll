; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !31
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !34
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !35
  %cmp = icmp ne i8* %call, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !40
  store i32 %call2, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !45
  %3 = load i32, i32* %data, align 4, !dbg !46
  call void %2(i32 %3), !dbg !45
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !54, metadata !DIExpression()), !dbg !58
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !58
  %1 = load i32, i32* %data.addr, align 4, !dbg !59
  %cmp = icmp sge i32 %1, 0, !dbg !61
  br i1 %cmp, label %if.then, label %if.else, !dbg !62

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !63
  %idxprom = sext i32 %2 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !65
  store i32 1, i32* %arrayidx, align 4, !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !70
  %cmp1 = icmp slt i32 %3, 10, !dbg !72
  br i1 %cmp1, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !74
  %idxprom2 = sext i32 %4 to i64, !dbg !76
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !76
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !76
  call void @printIntLine(i32 %5), !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !79
  %inc = add nsw i32 %6, 1, !dbg !79
  store i32 %inc, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !85
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !87
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  call void @goodB2G(), !dbg !90
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !114, metadata !DIExpression()), !dbg !115
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  store i32 7, i32* %data, align 4, !dbg !117
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !118
  %1 = load i32, i32* %data, align 4, !dbg !119
  call void %0(i32 %1), !dbg !118
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !121 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !128
  %1 = load i32, i32* %data.addr, align 4, !dbg !129
  %cmp = icmp sge i32 %1, 0, !dbg !131
  br i1 %cmp, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !133
  %idxprom = sext i32 %2 to i64, !dbg !135
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !135
  store i32 1, i32* %arrayidx, align 4, !dbg !136
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !140
  %cmp1 = icmp slt i32 %3, 10, !dbg !142
  br i1 %cmp1, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !144
  %idxprom2 = sext i32 %4 to i64, !dbg !146
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !146
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !146
  call void @printIntLine(i32 %5), !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %6, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !153

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !154
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !157 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !160, metadata !DIExpression()), !dbg !161
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !161
  store i32 -1, i32* %data, align 4, !dbg !162
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !163, metadata !DIExpression()), !dbg !165
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !165
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !166
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !168
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !169
  %cmp = icmp ne i8* %call, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.else, !dbg !171

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !172
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !174
  store i32 %call2, i32* %data, align 4, !dbg !175
  br label %if.end, !dbg !176

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !179
  %3 = load i32, i32* %data, align 4, !dbg !180
  call void %2(i32 %3), !dbg !179
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !182 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %i, metadata !185, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !188, metadata !DIExpression()), !dbg !189
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !189
  %1 = load i32, i32* %data.addr, align 4, !dbg !190
  %cmp = icmp sge i32 %1, 0, !dbg !192
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !193

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !194
  %cmp1 = icmp slt i32 %2, 10, !dbg !195
  br i1 %cmp1, label %if.then, label %if.else, !dbg !196

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !197
  %idxprom = sext i32 %3 to i64, !dbg !199
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !199
  store i32 1, i32* %arrayidx, align 4, !dbg !200
  store i32 0, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !204
  %cmp2 = icmp slt i32 %4, 10, !dbg !206
  br i1 %cmp2, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !208
  %idxprom3 = sext i32 %5 to i64, !dbg !210
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !210
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !210
  call void @printIntLine(i32 %6), !dbg !211
  br label %for.inc, !dbg !212

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !213
  %inc = add nsw i32 %7, 1, !dbg !213
  store i32 %inc, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !214, !llvm.loop !215

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !217

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !218
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !220
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44_bad", scope: !13, file: !13, line: 47, type: !14, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 49, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 49, column: 9, scope: !12)
!19 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 51, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !17}
!23 = !DILocation(line: 51, column: 12, scope: !12)
!24 = !DILocation(line: 53, column: 10, scope: !12)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !13, line: 55, type: !27)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 54, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 55, column: 14, scope: !26)
!32 = !DILocation(line: 57, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !13, line: 57, column: 13)
!34 = !DILocation(line: 57, column: 49, scope: !33)
!35 = !DILocation(line: 57, column: 13, scope: !33)
!36 = !DILocation(line: 57, column: 56, scope: !33)
!37 = !DILocation(line: 57, column: 13, scope: !26)
!38 = !DILocation(line: 60, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 58, column: 9)
!40 = !DILocation(line: 60, column: 20, scope: !39)
!41 = !DILocation(line: 60, column: 18, scope: !39)
!42 = !DILocation(line: 61, column: 9, scope: !39)
!43 = !DILocation(line: 64, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 63, column: 9)
!45 = !DILocation(line: 68, column: 5, scope: !12)
!46 = !DILocation(line: 68, column: 13, scope: !12)
!47 = !DILocation(line: 69, column: 1, scope: !12)
!48 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !21, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !13, line: 24, type: !17)
!50 = !DILocation(line: 24, column: 25, scope: !48)
!51 = !DILocalVariable(name: "i", scope: !52, file: !13, line: 27, type: !17)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 26, column: 5)
!53 = !DILocation(line: 27, column: 13, scope: !52)
!54 = !DILocalVariable(name: "buffer", scope: !52, file: !13, line: 28, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 10)
!58 = !DILocation(line: 28, column: 13, scope: !52)
!59 = !DILocation(line: 31, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !52, file: !13, line: 31, column: 13)
!61 = !DILocation(line: 31, column: 18, scope: !60)
!62 = !DILocation(line: 31, column: 13, scope: !52)
!63 = !DILocation(line: 33, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 32, column: 9)
!65 = !DILocation(line: 33, column: 13, scope: !64)
!66 = !DILocation(line: 33, column: 26, scope: !64)
!67 = !DILocation(line: 35, column: 19, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !13, line: 35, column: 13)
!69 = !DILocation(line: 35, column: 17, scope: !68)
!70 = !DILocation(line: 35, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !13, line: 35, column: 13)
!72 = !DILocation(line: 35, column: 26, scope: !71)
!73 = !DILocation(line: 35, column: 13, scope: !68)
!74 = !DILocation(line: 37, column: 37, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 36, column: 13)
!76 = !DILocation(line: 37, column: 30, scope: !75)
!77 = !DILocation(line: 37, column: 17, scope: !75)
!78 = !DILocation(line: 38, column: 13, scope: !75)
!79 = !DILocation(line: 35, column: 33, scope: !71)
!80 = !DILocation(line: 35, column: 13, scope: !71)
!81 = distinct !{!81, !73, !82, !83}
!82 = !DILocation(line: 38, column: 13, scope: !68)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 39, column: 9, scope: !64)
!85 = !DILocation(line: 42, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !60, file: !13, line: 41, column: 9)
!87 = !DILocation(line: 45, column: 1, scope: !48)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_44_good", scope: !13, file: !13, line: 156, type: !14, scopeLine: 157, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 158, column: 5, scope: !88)
!90 = !DILocation(line: 159, column: 5, scope: !88)
!91 = !DILocation(line: 160, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 170, type: !93, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!17, !17, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !13, line: 170, type: !17)
!98 = !DILocation(line: 170, column: 14, scope: !92)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !13, line: 170, type: !95)
!100 = !DILocation(line: 170, column: 27, scope: !92)
!101 = !DILocation(line: 173, column: 22, scope: !92)
!102 = !DILocation(line: 173, column: 12, scope: !92)
!103 = !DILocation(line: 173, column: 5, scope: !92)
!104 = !DILocation(line: 175, column: 5, scope: !92)
!105 = !DILocation(line: 176, column: 5, scope: !92)
!106 = !DILocation(line: 177, column: 5, scope: !92)
!107 = !DILocation(line: 180, column: 5, scope: !92)
!108 = !DILocation(line: 181, column: 5, scope: !92)
!109 = !DILocation(line: 182, column: 5, scope: !92)
!110 = !DILocation(line: 184, column: 5, scope: !92)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 99, type: !14, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !13, line: 101, type: !17)
!113 = !DILocation(line: 101, column: 9, scope: !111)
!114 = !DILocalVariable(name: "funcPtr", scope: !111, file: !13, line: 102, type: !20)
!115 = !DILocation(line: 102, column: 12, scope: !111)
!116 = !DILocation(line: 104, column: 10, scope: !111)
!117 = !DILocation(line: 107, column: 10, scope: !111)
!118 = !DILocation(line: 108, column: 5, scope: !111)
!119 = !DILocation(line: 108, column: 13, scope: !111)
!120 = !DILocation(line: 109, column: 1, scope: !111)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 76, type: !21, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", arg: 1, scope: !121, file: !13, line: 76, type: !17)
!123 = !DILocation(line: 76, column: 29, scope: !121)
!124 = !DILocalVariable(name: "i", scope: !125, file: !13, line: 79, type: !17)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 78, column: 5)
!126 = !DILocation(line: 79, column: 13, scope: !125)
!127 = !DILocalVariable(name: "buffer", scope: !125, file: !13, line: 80, type: !55)
!128 = !DILocation(line: 80, column: 13, scope: !125)
!129 = !DILocation(line: 83, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !13, line: 83, column: 13)
!131 = !DILocation(line: 83, column: 18, scope: !130)
!132 = !DILocation(line: 83, column: 13, scope: !125)
!133 = !DILocation(line: 85, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 84, column: 9)
!135 = !DILocation(line: 85, column: 13, scope: !134)
!136 = !DILocation(line: 85, column: 26, scope: !134)
!137 = !DILocation(line: 87, column: 19, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !13, line: 87, column: 13)
!139 = !DILocation(line: 87, column: 17, scope: !138)
!140 = !DILocation(line: 87, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !13, line: 87, column: 13)
!142 = !DILocation(line: 87, column: 26, scope: !141)
!143 = !DILocation(line: 87, column: 13, scope: !138)
!144 = !DILocation(line: 89, column: 37, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !13, line: 88, column: 13)
!146 = !DILocation(line: 89, column: 30, scope: !145)
!147 = !DILocation(line: 89, column: 17, scope: !145)
!148 = !DILocation(line: 90, column: 13, scope: !145)
!149 = !DILocation(line: 87, column: 33, scope: !141)
!150 = !DILocation(line: 87, column: 13, scope: !141)
!151 = distinct !{!151, !143, !152, !83}
!152 = !DILocation(line: 90, column: 13, scope: !138)
!153 = !DILocation(line: 91, column: 9, scope: !134)
!154 = !DILocation(line: 94, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !130, file: !13, line: 93, column: 9)
!156 = !DILocation(line: 97, column: 1, scope: !121)
!157 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 134, type: !14, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !13, line: 136, type: !17)
!159 = !DILocation(line: 136, column: 9, scope: !157)
!160 = !DILocalVariable(name: "funcPtr", scope: !157, file: !13, line: 137, type: !20)
!161 = !DILocation(line: 137, column: 12, scope: !157)
!162 = !DILocation(line: 139, column: 10, scope: !157)
!163 = !DILocalVariable(name: "inputBuffer", scope: !164, file: !13, line: 141, type: !27)
!164 = distinct !DILexicalBlock(scope: !157, file: !13, line: 140, column: 5)
!165 = !DILocation(line: 141, column: 14, scope: !164)
!166 = !DILocation(line: 143, column: 19, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !13, line: 143, column: 13)
!168 = !DILocation(line: 143, column: 49, scope: !167)
!169 = !DILocation(line: 143, column: 13, scope: !167)
!170 = !DILocation(line: 143, column: 56, scope: !167)
!171 = !DILocation(line: 143, column: 13, scope: !164)
!172 = !DILocation(line: 146, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !13, line: 144, column: 9)
!174 = !DILocation(line: 146, column: 20, scope: !173)
!175 = !DILocation(line: 146, column: 18, scope: !173)
!176 = !DILocation(line: 147, column: 9, scope: !173)
!177 = !DILocation(line: 150, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !167, file: !13, line: 149, column: 9)
!179 = !DILocation(line: 153, column: 5, scope: !157)
!180 = !DILocation(line: 153, column: 13, scope: !157)
!181 = !DILocation(line: 154, column: 1, scope: !157)
!182 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 112, type: !21, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!183 = !DILocalVariable(name: "data", arg: 1, scope: !182, file: !13, line: 112, type: !17)
!184 = !DILocation(line: 112, column: 29, scope: !182)
!185 = !DILocalVariable(name: "i", scope: !186, file: !13, line: 115, type: !17)
!186 = distinct !DILexicalBlock(scope: !182, file: !13, line: 114, column: 5)
!187 = !DILocation(line: 115, column: 13, scope: !186)
!188 = !DILocalVariable(name: "buffer", scope: !186, file: !13, line: 116, type: !55)
!189 = !DILocation(line: 116, column: 13, scope: !186)
!190 = !DILocation(line: 118, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !13, line: 118, column: 13)
!192 = !DILocation(line: 118, column: 18, scope: !191)
!193 = !DILocation(line: 118, column: 23, scope: !191)
!194 = !DILocation(line: 118, column: 26, scope: !191)
!195 = !DILocation(line: 118, column: 31, scope: !191)
!196 = !DILocation(line: 118, column: 13, scope: !186)
!197 = !DILocation(line: 120, column: 20, scope: !198)
!198 = distinct !DILexicalBlock(scope: !191, file: !13, line: 119, column: 9)
!199 = !DILocation(line: 120, column: 13, scope: !198)
!200 = !DILocation(line: 120, column: 26, scope: !198)
!201 = !DILocation(line: 122, column: 19, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !13, line: 122, column: 13)
!203 = !DILocation(line: 122, column: 17, scope: !202)
!204 = !DILocation(line: 122, column: 24, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !13, line: 122, column: 13)
!206 = !DILocation(line: 122, column: 26, scope: !205)
!207 = !DILocation(line: 122, column: 13, scope: !202)
!208 = !DILocation(line: 124, column: 37, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !13, line: 123, column: 13)
!210 = !DILocation(line: 124, column: 30, scope: !209)
!211 = !DILocation(line: 124, column: 17, scope: !209)
!212 = !DILocation(line: 125, column: 13, scope: !209)
!213 = !DILocation(line: 122, column: 33, scope: !205)
!214 = !DILocation(line: 122, column: 13, scope: !205)
!215 = distinct !{!215, !207, !216, !83}
!216 = !DILocation(line: 125, column: 13, scope: !202)
!217 = !DILocation(line: 126, column: 9, scope: !198)
!218 = !DILocation(line: 129, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !191, file: !13, line: 128, column: 9)
!220 = !DILocation(line: 132, column: 1, scope: !182)
