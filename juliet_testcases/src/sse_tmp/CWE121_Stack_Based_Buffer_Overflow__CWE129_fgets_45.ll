; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodG2BData = internal global i32 0, align 4, !dbg !9
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodB2GData = internal global i32 0, align 4, !dbg !13
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !27, metadata !DIExpression()), !dbg !33
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !34
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !36
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !37
  %cmp = icmp ne i8* %call, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !42
  store i32 %call2, i32* %data, align 4, !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !47
  store i32 %2, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_badData, align 4, !dbg !48
  call void @badSink(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  call void @goodB2G(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_badData, align 4, !dbg !77
  store i32 %0, i32* %data, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !81, metadata !DIExpression()), !dbg !85
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !85
  %2 = load i32, i32* %data, align 4, !dbg !86
  %cmp = icmp sge i32 %2, 0, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !90
  %idxprom = sext i32 %3 to i64, !dbg !92
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !92
  store i32 1, i32* %arrayidx, align 4, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !97
  %cmp1 = icmp slt i32 %4, 10, !dbg !99
  br i1 %cmp1, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !101
  %idxprom2 = sext i32 %5 to i64, !dbg !103
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !103
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !103
  call void @printIntLine(i32 %6), !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !106
  %inc = add nsw i32 %7, 1, !dbg !106
  store i32 %inc, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !114
}

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  store i32 7, i32* %data, align 4, !dbg !119
  %0 = load i32, i32* %data, align 4, !dbg !120
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodG2BData, align 4, !dbg !121
  call void @goodG2BSink(), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodG2BData, align 4, !dbg !127
  store i32 %0, i32* %data, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !132
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !132
  %2 = load i32, i32* %data, align 4, !dbg !133
  %cmp = icmp sge i32 %2, 0, !dbg !135
  br i1 %cmp, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !137
  %idxprom = sext i32 %3 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !139
  store i32 1, i32* %arrayidx, align 4, !dbg !140
  store i32 0, i32* %i, align 4, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !144
  %cmp1 = icmp slt i32 %4, 10, !dbg !146
  br i1 %cmp1, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !148
  %idxprom2 = sext i32 %5 to i64, !dbg !150
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !150
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !150
  call void @printIntLine(i32 %6), !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %7, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !157

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !161 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 -1, i32* %data, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !165, metadata !DIExpression()), !dbg !167
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !167
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !168
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !170
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !171
  %cmp = icmp ne i8* %call, null, !dbg !172
  br i1 %cmp, label %if.then, label %if.else, !dbg !173

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !174
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !176
  store i32 %call2, i32* %data, align 4, !dbg !177
  br label %if.end, !dbg !178

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !179
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !181
  store i32 %2, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodB2GData, align 4, !dbg !182
  call void @goodB2GSink(), !dbg !183
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodB2GData, align 4, !dbg !188
  store i32 %0, i32* %data, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %i, metadata !189, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !192, metadata !DIExpression()), !dbg !193
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !193
  %2 = load i32, i32* %data, align 4, !dbg !194
  %cmp = icmp sge i32 %2, 0, !dbg !196
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !197

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !198
  %cmp1 = icmp slt i32 %3, 10, !dbg !199
  br i1 %cmp1, label %if.then, label %if.else, !dbg !200

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !201
  %idxprom = sext i32 %4 to i64, !dbg !203
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !203
  store i32 1, i32* %arrayidx, align 4, !dbg !204
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !208
  %cmp2 = icmp slt i32 %5, 10, !dbg !210
  br i1 %cmp2, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !212
  %idxprom3 = sext i32 %6 to i64, !dbg !214
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !214
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !214
  call void @printIntLine(i32 %7), !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !217
  %inc = add nsw i32 %8, 1, !dbg !217
  store i32 %inc, i32* %i, align 4, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !221

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !222
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !224
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_badData", scope: !2, file: !11, line: 22, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodG2BData", scope: !2, file: !11, line: 23, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_goodB2GData", scope: !2, file: !11, line: 24, type: !12, isLocal: true, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_bad", scope: !11, file: !11, line: 52, type: !22, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !11, line: 54, type: !12)
!25 = !DILocation(line: 54, column: 9, scope: !21)
!26 = !DILocation(line: 56, column: 10, scope: !21)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !11, line: 58, type: !29)
!28 = distinct !DILexicalBlock(scope: !21, file: !11, line: 57, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 112, elements: !31)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 14)
!33 = !DILocation(line: 58, column: 14, scope: !28)
!34 = !DILocation(line: 60, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !11, line: 60, column: 13)
!36 = !DILocation(line: 60, column: 49, scope: !35)
!37 = !DILocation(line: 60, column: 13, scope: !35)
!38 = !DILocation(line: 60, column: 56, scope: !35)
!39 = !DILocation(line: 60, column: 13, scope: !28)
!40 = !DILocation(line: 63, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !11, line: 61, column: 9)
!42 = !DILocation(line: 63, column: 20, scope: !41)
!43 = !DILocation(line: 63, column: 18, scope: !41)
!44 = !DILocation(line: 64, column: 9, scope: !41)
!45 = !DILocation(line: 67, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !11, line: 66, column: 9)
!47 = !DILocation(line: 70, column: 67, scope: !21)
!48 = !DILocation(line: 70, column: 65, scope: !21)
!49 = !DILocation(line: 71, column: 5, scope: !21)
!50 = !DILocation(line: 72, column: 1, scope: !21)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_45_good", scope: !11, file: !11, line: 161, type: !22, scopeLine: 162, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 163, column: 5, scope: !51)
!53 = !DILocation(line: 164, column: 5, scope: !51)
!54 = !DILocation(line: 165, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 175, type: !56, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!12, !12, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !11, line: 175, type: !12)
!61 = !DILocation(line: 175, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !11, line: 175, type: !58)
!63 = !DILocation(line: 175, column: 27, scope: !55)
!64 = !DILocation(line: 178, column: 22, scope: !55)
!65 = !DILocation(line: 178, column: 12, scope: !55)
!66 = !DILocation(line: 178, column: 5, scope: !55)
!67 = !DILocation(line: 180, column: 5, scope: !55)
!68 = !DILocation(line: 181, column: 5, scope: !55)
!69 = !DILocation(line: 182, column: 5, scope: !55)
!70 = !DILocation(line: 185, column: 5, scope: !55)
!71 = !DILocation(line: 186, column: 5, scope: !55)
!72 = !DILocation(line: 187, column: 5, scope: !55)
!73 = !DILocation(line: 189, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 28, type: !22, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !11, line: 30, type: !12)
!76 = !DILocation(line: 30, column: 9, scope: !74)
!77 = !DILocation(line: 30, column: 16, scope: !74)
!78 = !DILocalVariable(name: "i", scope: !79, file: !11, line: 32, type: !12)
!79 = distinct !DILexicalBlock(scope: !74, file: !11, line: 31, column: 5)
!80 = !DILocation(line: 32, column: 13, scope: !79)
!81 = !DILocalVariable(name: "buffer", scope: !79, file: !11, line: 33, type: !82)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 10)
!85 = !DILocation(line: 33, column: 13, scope: !79)
!86 = !DILocation(line: 36, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !11, line: 36, column: 13)
!88 = !DILocation(line: 36, column: 18, scope: !87)
!89 = !DILocation(line: 36, column: 13, scope: !79)
!90 = !DILocation(line: 38, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !11, line: 37, column: 9)
!92 = !DILocation(line: 38, column: 13, scope: !91)
!93 = !DILocation(line: 38, column: 26, scope: !91)
!94 = !DILocation(line: 40, column: 19, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !11, line: 40, column: 13)
!96 = !DILocation(line: 40, column: 17, scope: !95)
!97 = !DILocation(line: 40, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !11, line: 40, column: 13)
!99 = !DILocation(line: 40, column: 26, scope: !98)
!100 = !DILocation(line: 40, column: 13, scope: !95)
!101 = !DILocation(line: 42, column: 37, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !11, line: 41, column: 13)
!103 = !DILocation(line: 42, column: 30, scope: !102)
!104 = !DILocation(line: 42, column: 17, scope: !102)
!105 = !DILocation(line: 43, column: 13, scope: !102)
!106 = !DILocation(line: 40, column: 33, scope: !98)
!107 = !DILocation(line: 40, column: 13, scope: !98)
!108 = distinct !{!108, !100, !109, !110}
!109 = !DILocation(line: 43, column: 13, scope: !95)
!110 = !{!"llvm.loop.mustprogress"}
!111 = !DILocation(line: 44, column: 9, scope: !91)
!112 = !DILocation(line: 47, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !87, file: !11, line: 46, column: 9)
!114 = !DILocation(line: 50, column: 1, scope: !74)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 103, type: !22, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !11, line: 105, type: !12)
!117 = !DILocation(line: 105, column: 9, scope: !115)
!118 = !DILocation(line: 107, column: 10, scope: !115)
!119 = !DILocation(line: 110, column: 10, scope: !115)
!120 = !DILocation(line: 111, column: 71, scope: !115)
!121 = !DILocation(line: 111, column: 69, scope: !115)
!122 = !DILocation(line: 112, column: 5, scope: !115)
!123 = !DILocation(line: 113, column: 1, scope: !115)
!124 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 79, type: !22, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !11, line: 81, type: !12)
!126 = !DILocation(line: 81, column: 9, scope: !124)
!127 = !DILocation(line: 81, column: 16, scope: !124)
!128 = !DILocalVariable(name: "i", scope: !129, file: !11, line: 83, type: !12)
!129 = distinct !DILexicalBlock(scope: !124, file: !11, line: 82, column: 5)
!130 = !DILocation(line: 83, column: 13, scope: !129)
!131 = !DILocalVariable(name: "buffer", scope: !129, file: !11, line: 84, type: !82)
!132 = !DILocation(line: 84, column: 13, scope: !129)
!133 = !DILocation(line: 87, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !11, line: 87, column: 13)
!135 = !DILocation(line: 87, column: 18, scope: !134)
!136 = !DILocation(line: 87, column: 13, scope: !129)
!137 = !DILocation(line: 89, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !11, line: 88, column: 9)
!139 = !DILocation(line: 89, column: 13, scope: !138)
!140 = !DILocation(line: 89, column: 26, scope: !138)
!141 = !DILocation(line: 91, column: 19, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !11, line: 91, column: 13)
!143 = !DILocation(line: 91, column: 17, scope: !142)
!144 = !DILocation(line: 91, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !11, line: 91, column: 13)
!146 = !DILocation(line: 91, column: 26, scope: !145)
!147 = !DILocation(line: 91, column: 13, scope: !142)
!148 = !DILocation(line: 93, column: 37, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !11, line: 92, column: 13)
!150 = !DILocation(line: 93, column: 30, scope: !149)
!151 = !DILocation(line: 93, column: 17, scope: !149)
!152 = !DILocation(line: 94, column: 13, scope: !149)
!153 = !DILocation(line: 91, column: 33, scope: !145)
!154 = !DILocation(line: 91, column: 13, scope: !145)
!155 = distinct !{!155, !147, !156, !110}
!156 = !DILocation(line: 94, column: 13, scope: !142)
!157 = !DILocation(line: 95, column: 9, scope: !138)
!158 = !DILocation(line: 98, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !134, file: !11, line: 97, column: 9)
!160 = !DILocation(line: 101, column: 1, scope: !124)
!161 = distinct !DISubprogram(name: "goodB2G", scope: !11, file: !11, line: 139, type: !22, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", scope: !161, file: !11, line: 141, type: !12)
!163 = !DILocation(line: 141, column: 9, scope: !161)
!164 = !DILocation(line: 143, column: 10, scope: !161)
!165 = !DILocalVariable(name: "inputBuffer", scope: !166, file: !11, line: 145, type: !29)
!166 = distinct !DILexicalBlock(scope: !161, file: !11, line: 144, column: 5)
!167 = !DILocation(line: 145, column: 14, scope: !166)
!168 = !DILocation(line: 147, column: 19, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !11, line: 147, column: 13)
!170 = !DILocation(line: 147, column: 49, scope: !169)
!171 = !DILocation(line: 147, column: 13, scope: !169)
!172 = !DILocation(line: 147, column: 56, scope: !169)
!173 = !DILocation(line: 147, column: 13, scope: !166)
!174 = !DILocation(line: 150, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !11, line: 148, column: 9)
!176 = !DILocation(line: 150, column: 20, scope: !175)
!177 = !DILocation(line: 150, column: 18, scope: !175)
!178 = !DILocation(line: 151, column: 9, scope: !175)
!179 = !DILocation(line: 154, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !169, file: !11, line: 153, column: 9)
!181 = !DILocation(line: 157, column: 71, scope: !161)
!182 = !DILocation(line: 157, column: 69, scope: !161)
!183 = !DILocation(line: 158, column: 5, scope: !161)
!184 = !DILocation(line: 159, column: 1, scope: !161)
!185 = distinct !DISubprogram(name: "goodB2GSink", scope: !11, file: !11, line: 116, type: !22, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!186 = !DILocalVariable(name: "data", scope: !185, file: !11, line: 118, type: !12)
!187 = !DILocation(line: 118, column: 9, scope: !185)
!188 = !DILocation(line: 118, column: 16, scope: !185)
!189 = !DILocalVariable(name: "i", scope: !190, file: !11, line: 120, type: !12)
!190 = distinct !DILexicalBlock(scope: !185, file: !11, line: 119, column: 5)
!191 = !DILocation(line: 120, column: 13, scope: !190)
!192 = !DILocalVariable(name: "buffer", scope: !190, file: !11, line: 121, type: !82)
!193 = !DILocation(line: 121, column: 13, scope: !190)
!194 = !DILocation(line: 123, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !190, file: !11, line: 123, column: 13)
!196 = !DILocation(line: 123, column: 18, scope: !195)
!197 = !DILocation(line: 123, column: 23, scope: !195)
!198 = !DILocation(line: 123, column: 26, scope: !195)
!199 = !DILocation(line: 123, column: 31, scope: !195)
!200 = !DILocation(line: 123, column: 13, scope: !190)
!201 = !DILocation(line: 125, column: 20, scope: !202)
!202 = distinct !DILexicalBlock(scope: !195, file: !11, line: 124, column: 9)
!203 = !DILocation(line: 125, column: 13, scope: !202)
!204 = !DILocation(line: 125, column: 26, scope: !202)
!205 = !DILocation(line: 127, column: 19, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !11, line: 127, column: 13)
!207 = !DILocation(line: 127, column: 17, scope: !206)
!208 = !DILocation(line: 127, column: 24, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !11, line: 127, column: 13)
!210 = !DILocation(line: 127, column: 26, scope: !209)
!211 = !DILocation(line: 127, column: 13, scope: !206)
!212 = !DILocation(line: 129, column: 37, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !11, line: 128, column: 13)
!214 = !DILocation(line: 129, column: 30, scope: !213)
!215 = !DILocation(line: 129, column: 17, scope: !213)
!216 = !DILocation(line: 130, column: 13, scope: !213)
!217 = !DILocation(line: 127, column: 33, scope: !209)
!218 = !DILocation(line: 127, column: 13, scope: !209)
!219 = distinct !{!219, !211, !220, !110}
!220 = !DILocation(line: 130, column: 13, scope: !206)
!221 = !DILocation(line: 131, column: 9, scope: !202)
!222 = !DILocation(line: 134, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !195, file: !11, line: 133, column: 9)
!224 = !DILocation(line: 137, column: 1, scope: !185)
