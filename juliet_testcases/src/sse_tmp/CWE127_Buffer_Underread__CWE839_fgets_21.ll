; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_21.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !9
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !13
@goodG2BStatic = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !29, metadata !DIExpression()), !dbg !35
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !39
  %cmp = icmp ne i8* %call, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !42
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !44
  store i32 %call2, i32* %data, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @badStatic, align 4, !dbg !49
  %2 = load i32, i32* %data, align 4, !dbg !50
  call void @badSink(i32 %2), !dbg !51
  ret void, !dbg !52
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
define internal void @badSink(i32 %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @badStatic, align 4, !dbg !58
  %tobool = icmp ne i32 %0, 0, !dbg !58
  br i1 %tobool, label %if.then, label %if.end2, !dbg !60

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !61, metadata !DIExpression()), !dbg !67
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !67
  %2 = load i32, i32* %data.addr, align 4, !dbg !68
  %cmp = icmp slt i32 %2, 10, !dbg !70
  br i1 %cmp, label %if.then1, label %if.else, !dbg !71

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !72
  %idxprom = sext i32 %3 to i64, !dbg !74
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !74
  %4 = load i32, i32* %arrayidx, align 4, !dbg !74
  call void @printIntLine(i32 %4), !dbg !75
  br label %if.end, !dbg !76

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !77
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !79

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_21_good() #0 !dbg !81 {
entry:
  call void @goodB2G1(), !dbg !82
  call void @goodB2G2(), !dbg !83
  call void @goodG2B(), !dbg !84
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @CWE127_Buffer_Underread__CWE839_fgets_21_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__CWE839_fgets_21_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !105 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %data, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !111
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !112
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !114
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !115
  %cmp = icmp ne i8* %call, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !118
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !120
  store i32 %call2, i32* %data, align 4, !dbg !121
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !125
  %2 = load i32, i32* %data, align 4, !dbg !126
  call void @goodB2G1Sink(i32 %2), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !129 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !135
  br label %if.end4, !dbg !137

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !138, metadata !DIExpression()), !dbg !141
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !141
  %2 = load i32, i32* %data.addr, align 4, !dbg !142
  %cmp = icmp sge i32 %2, 0, !dbg !144
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !145

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !146
  %cmp1 = icmp slt i32 %3, 10, !dbg !147
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !148

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !149
  %idxprom = sext i32 %4 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !151
  %5 = load i32, i32* %arrayidx, align 4, !dbg !151
  call void @printIntLine(i32 %5), !dbg !152
  br label %if.end, !dbg !153

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !154
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !157 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !158, metadata !DIExpression()), !dbg !159
  store i32 -1, i32* %data, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !161, metadata !DIExpression()), !dbg !163
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !163
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !164
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !166
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !167
  %cmp = icmp ne i8* %call, null, !dbg !168
  br i1 %cmp, label %if.then, label %if.else, !dbg !169

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !172
  store i32 %call2, i32* %data, align 4, !dbg !173
  br label %if.end, !dbg !174

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !175
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !177
  %2 = load i32, i32* %data, align 4, !dbg !178
  call void @goodB2G2Sink(i32 %2), !dbg !179
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !181 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !182, metadata !DIExpression()), !dbg !183
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !184
  %tobool = icmp ne i32 %0, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end3, !dbg !186

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !187, metadata !DIExpression()), !dbg !190
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !190
  %2 = load i32, i32* %data.addr, align 4, !dbg !191
  %cmp = icmp sge i32 %2, 0, !dbg !193
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !194

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !195
  %cmp1 = icmp slt i32 %3, 10, !dbg !196
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !197

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !198
  %idxprom = sext i32 %4 to i64, !dbg !200
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !200
  %5 = load i32, i32* %arrayidx, align 4, !dbg !200
  call void @printIntLine(i32 %5), !dbg !201
  br label %if.end, !dbg !202

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !203
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !205

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %data, align 4, !dbg !210
  store i32 7, i32* %data, align 4, !dbg !211
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !212
  %0 = load i32, i32* %data, align 4, !dbg !213
  call void @goodG2BSink(i32 %0), !dbg !214
  ret void, !dbg !215
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !216 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !217, metadata !DIExpression()), !dbg !218
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !219
  %tobool = icmp ne i32 %0, 0, !dbg !219
  br i1 %tobool, label %if.then, label %if.end2, !dbg !221

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !222, metadata !DIExpression()), !dbg !225
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !225
  %2 = load i32, i32* %data.addr, align 4, !dbg !226
  %cmp = icmp slt i32 %2, 10, !dbg !228
  br i1 %cmp, label %if.then1, label %if.else, !dbg !229

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !230
  %idxprom = sext i32 %3 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !232
  %4 = load i32, i32* %arrayidx, align 4, !dbg !232
  call void @printIntLine(i32 %4), !dbg !233
  br label %if.end, !dbg !234

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !235
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !237

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !238
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
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13, !15}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !11, line: 74, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_21.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !11, line: 75, type: !12, isLocal: true, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !11, line: 76, type: !12, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_21_bad", scope: !11, file: !11, line: 47, type: !24, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !11, line: 49, type: !12)
!27 = !DILocation(line: 49, column: 9, scope: !23)
!28 = !DILocation(line: 51, column: 10, scope: !23)
!29 = !DILocalVariable(name: "inputBuffer", scope: !30, file: !11, line: 53, type: !31)
!30 = distinct !DILexicalBlock(scope: !23, file: !11, line: 52, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 112, elements: !33)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 14)
!35 = !DILocation(line: 53, column: 14, scope: !30)
!36 = !DILocation(line: 55, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !11, line: 55, column: 13)
!38 = !DILocation(line: 55, column: 49, scope: !37)
!39 = !DILocation(line: 55, column: 13, scope: !37)
!40 = !DILocation(line: 55, column: 56, scope: !37)
!41 = !DILocation(line: 55, column: 13, scope: !30)
!42 = !DILocation(line: 58, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !11, line: 56, column: 9)
!44 = !DILocation(line: 58, column: 20, scope: !43)
!45 = !DILocation(line: 58, column: 18, scope: !43)
!46 = !DILocation(line: 59, column: 9, scope: !43)
!47 = !DILocation(line: 62, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !11, line: 61, column: 9)
!49 = !DILocation(line: 65, column: 15, scope: !23)
!50 = !DILocation(line: 66, column: 13, scope: !23)
!51 = !DILocation(line: 66, column: 5, scope: !23)
!52 = !DILocation(line: 67, column: 1, scope: !23)
!53 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 27, type: !54, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !12}
!56 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !11, line: 27, type: !12)
!57 = !DILocation(line: 27, column: 25, scope: !53)
!58 = !DILocation(line: 29, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !11, line: 29, column: 8)
!60 = !DILocation(line: 29, column: 8, scope: !53)
!61 = !DILocalVariable(name: "buffer", scope: !62, file: !11, line: 32, type: !64)
!62 = distinct !DILexicalBlock(scope: !63, file: !11, line: 31, column: 9)
!63 = distinct !DILexicalBlock(scope: !59, file: !11, line: 30, column: 5)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 10)
!67 = !DILocation(line: 32, column: 17, scope: !62)
!68 = !DILocation(line: 35, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !62, file: !11, line: 35, column: 17)
!70 = !DILocation(line: 35, column: 22, scope: !69)
!71 = !DILocation(line: 35, column: 17, scope: !62)
!72 = !DILocation(line: 37, column: 37, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !11, line: 36, column: 13)
!74 = !DILocation(line: 37, column: 30, scope: !73)
!75 = !DILocation(line: 37, column: 17, scope: !73)
!76 = !DILocation(line: 38, column: 13, scope: !73)
!77 = !DILocation(line: 41, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !69, file: !11, line: 40, column: 13)
!79 = !DILocation(line: 44, column: 5, scope: !63)
!80 = !DILocation(line: 45, column: 1, scope: !53)
!81 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_21_good", scope: !11, file: !11, line: 200, type: !24, scopeLine: 201, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 202, column: 5, scope: !81)
!83 = !DILocation(line: 203, column: 5, scope: !81)
!84 = !DILocation(line: 204, column: 5, scope: !81)
!85 = !DILocation(line: 205, column: 1, scope: !81)
!86 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 216, type: !87, scopeLine: 217, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!12, !12, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !11, line: 216, type: !12)
!92 = !DILocation(line: 216, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !11, line: 216, type: !89)
!94 = !DILocation(line: 216, column: 27, scope: !86)
!95 = !DILocation(line: 219, column: 22, scope: !86)
!96 = !DILocation(line: 219, column: 12, scope: !86)
!97 = !DILocation(line: 219, column: 5, scope: !86)
!98 = !DILocation(line: 221, column: 5, scope: !86)
!99 = !DILocation(line: 222, column: 5, scope: !86)
!100 = !DILocation(line: 223, column: 5, scope: !86)
!101 = !DILocation(line: 226, column: 5, scope: !86)
!102 = !DILocation(line: 227, column: 5, scope: !86)
!103 = !DILocation(line: 228, column: 5, scope: !86)
!104 = !DILocation(line: 230, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 103, type: !24, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !11, line: 105, type: !12)
!107 = !DILocation(line: 105, column: 9, scope: !105)
!108 = !DILocation(line: 107, column: 10, scope: !105)
!109 = !DILocalVariable(name: "inputBuffer", scope: !110, file: !11, line: 109, type: !31)
!110 = distinct !DILexicalBlock(scope: !105, file: !11, line: 108, column: 5)
!111 = !DILocation(line: 109, column: 14, scope: !110)
!112 = !DILocation(line: 111, column: 19, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !11, line: 111, column: 13)
!114 = !DILocation(line: 111, column: 49, scope: !113)
!115 = !DILocation(line: 111, column: 13, scope: !113)
!116 = !DILocation(line: 111, column: 56, scope: !113)
!117 = !DILocation(line: 111, column: 13, scope: !110)
!118 = !DILocation(line: 114, column: 25, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !11, line: 112, column: 9)
!120 = !DILocation(line: 114, column: 20, scope: !119)
!121 = !DILocation(line: 114, column: 18, scope: !119)
!122 = !DILocation(line: 115, column: 9, scope: !119)
!123 = !DILocation(line: 118, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !113, file: !11, line: 117, column: 9)
!125 = !DILocation(line: 121, column: 20, scope: !105)
!126 = !DILocation(line: 122, column: 18, scope: !105)
!127 = !DILocation(line: 122, column: 5, scope: !105)
!128 = !DILocation(line: 123, column: 1, scope: !105)
!129 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !11, file: !11, line: 79, type: !54, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", arg: 1, scope: !129, file: !11, line: 79, type: !12)
!131 = !DILocation(line: 79, column: 30, scope: !129)
!132 = !DILocation(line: 81, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !11, line: 81, column: 8)
!134 = !DILocation(line: 81, column: 8, scope: !129)
!135 = !DILocation(line: 84, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !11, line: 82, column: 5)
!137 = !DILocation(line: 85, column: 5, scope: !136)
!138 = !DILocalVariable(name: "buffer", scope: !139, file: !11, line: 89, type: !64)
!139 = distinct !DILexicalBlock(scope: !140, file: !11, line: 88, column: 9)
!140 = distinct !DILexicalBlock(scope: !133, file: !11, line: 87, column: 5)
!141 = !DILocation(line: 89, column: 17, scope: !139)
!142 = !DILocation(line: 91, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !11, line: 91, column: 17)
!144 = !DILocation(line: 91, column: 22, scope: !143)
!145 = !DILocation(line: 91, column: 27, scope: !143)
!146 = !DILocation(line: 91, column: 30, scope: !143)
!147 = !DILocation(line: 91, column: 35, scope: !143)
!148 = !DILocation(line: 91, column: 17, scope: !139)
!149 = !DILocation(line: 93, column: 37, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !11, line: 92, column: 13)
!151 = !DILocation(line: 93, column: 30, scope: !150)
!152 = !DILocation(line: 93, column: 17, scope: !150)
!153 = !DILocation(line: 94, column: 13, scope: !150)
!154 = !DILocation(line: 97, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !143, file: !11, line: 96, column: 13)
!156 = !DILocation(line: 101, column: 1, scope: !129)
!157 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 145, type: !24, scopeLine: 146, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!158 = !DILocalVariable(name: "data", scope: !157, file: !11, line: 147, type: !12)
!159 = !DILocation(line: 147, column: 9, scope: !157)
!160 = !DILocation(line: 149, column: 10, scope: !157)
!161 = !DILocalVariable(name: "inputBuffer", scope: !162, file: !11, line: 151, type: !31)
!162 = distinct !DILexicalBlock(scope: !157, file: !11, line: 150, column: 5)
!163 = !DILocation(line: 151, column: 14, scope: !162)
!164 = !DILocation(line: 153, column: 19, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !11, line: 153, column: 13)
!166 = !DILocation(line: 153, column: 49, scope: !165)
!167 = !DILocation(line: 153, column: 13, scope: !165)
!168 = !DILocation(line: 153, column: 56, scope: !165)
!169 = !DILocation(line: 153, column: 13, scope: !162)
!170 = !DILocation(line: 156, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !11, line: 154, column: 9)
!172 = !DILocation(line: 156, column: 20, scope: !171)
!173 = !DILocation(line: 156, column: 18, scope: !171)
!174 = !DILocation(line: 157, column: 9, scope: !171)
!175 = !DILocation(line: 160, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !165, file: !11, line: 159, column: 9)
!177 = !DILocation(line: 163, column: 20, scope: !157)
!178 = !DILocation(line: 164, column: 18, scope: !157)
!179 = !DILocation(line: 164, column: 5, scope: !157)
!180 = !DILocation(line: 165, column: 1, scope: !157)
!181 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !11, file: !11, line: 126, type: !54, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DILocalVariable(name: "data", arg: 1, scope: !181, file: !11, line: 126, type: !12)
!183 = !DILocation(line: 126, column: 30, scope: !181)
!184 = !DILocation(line: 128, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !11, line: 128, column: 8)
!186 = !DILocation(line: 128, column: 8, scope: !181)
!187 = !DILocalVariable(name: "buffer", scope: !188, file: !11, line: 131, type: !64)
!188 = distinct !DILexicalBlock(scope: !189, file: !11, line: 130, column: 9)
!189 = distinct !DILexicalBlock(scope: !185, file: !11, line: 129, column: 5)
!190 = !DILocation(line: 131, column: 17, scope: !188)
!191 = !DILocation(line: 133, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !11, line: 133, column: 17)
!193 = !DILocation(line: 133, column: 22, scope: !192)
!194 = !DILocation(line: 133, column: 27, scope: !192)
!195 = !DILocation(line: 133, column: 30, scope: !192)
!196 = !DILocation(line: 133, column: 35, scope: !192)
!197 = !DILocation(line: 133, column: 17, scope: !188)
!198 = !DILocation(line: 135, column: 37, scope: !199)
!199 = distinct !DILexicalBlock(scope: !192, file: !11, line: 134, column: 13)
!200 = !DILocation(line: 135, column: 30, scope: !199)
!201 = !DILocation(line: 135, column: 17, scope: !199)
!202 = !DILocation(line: 136, column: 13, scope: !199)
!203 = !DILocation(line: 139, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !192, file: !11, line: 138, column: 13)
!205 = !DILocation(line: 142, column: 5, scope: !189)
!206 = !DILocation(line: 143, column: 1, scope: !181)
!207 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 188, type: !24, scopeLine: 189, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DILocalVariable(name: "data", scope: !207, file: !11, line: 190, type: !12)
!209 = !DILocation(line: 190, column: 9, scope: !207)
!210 = !DILocation(line: 192, column: 10, scope: !207)
!211 = !DILocation(line: 195, column: 10, scope: !207)
!212 = !DILocation(line: 196, column: 19, scope: !207)
!213 = !DILocation(line: 197, column: 17, scope: !207)
!214 = !DILocation(line: 197, column: 5, scope: !207)
!215 = !DILocation(line: 198, column: 1, scope: !207)
!216 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 168, type: !54, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!217 = !DILocalVariable(name: "data", arg: 1, scope: !216, file: !11, line: 168, type: !12)
!218 = !DILocation(line: 168, column: 29, scope: !216)
!219 = !DILocation(line: 170, column: 8, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !11, line: 170, column: 8)
!221 = !DILocation(line: 170, column: 8, scope: !216)
!222 = !DILocalVariable(name: "buffer", scope: !223, file: !11, line: 173, type: !64)
!223 = distinct !DILexicalBlock(scope: !224, file: !11, line: 172, column: 9)
!224 = distinct !DILexicalBlock(scope: !220, file: !11, line: 171, column: 5)
!225 = !DILocation(line: 173, column: 17, scope: !223)
!226 = !DILocation(line: 176, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !11, line: 176, column: 17)
!228 = !DILocation(line: 176, column: 22, scope: !227)
!229 = !DILocation(line: 176, column: 17, scope: !223)
!230 = !DILocation(line: 178, column: 37, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !11, line: 177, column: 13)
!232 = !DILocation(line: 178, column: 30, scope: !231)
!233 = !DILocation(line: 178, column: 17, scope: !231)
!234 = !DILocation(line: 179, column: 13, scope: !231)
!235 = !DILocation(line: 182, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !227, file: !11, line: 181, column: 13)
!237 = !DILocation(line: 185, column: 5, scope: !224)
!238 = !DILocation(line: 186, column: 1, scope: !216)
