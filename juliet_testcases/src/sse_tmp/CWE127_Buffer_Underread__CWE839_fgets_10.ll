; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_10.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@globalTrue = external dso_local global i32, align 4
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_10_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* @globalTrue, align 4, !dbg !20
  %tobool = icmp ne i32 %0, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end4, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !30
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !33
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !34
  %cmp = icmp ne i8* %call, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.else, !dbg !36

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !39
  store i32 %call3, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !44

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalTrue, align 4, !dbg !45
  %tobool5 = icmp ne i32 %3, 0, !dbg !45
  br i1 %tobool5, label %if.then6, label %if.end11, !dbg !47

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !54
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !54
  %5 = load i32, i32* %data, align 4, !dbg !55
  %cmp7 = icmp slt i32 %5, 10, !dbg !57
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !58

if.then8:                                         ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !59
  %idxprom = sext i32 %6 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !61
  %7 = load i32, i32* %arrayidx, align 4, !dbg !61
  call void @printIntLine(i32 %7), !dbg !62
  br label %if.end10, !dbg !63

if.else9:                                         ; preds = %if.then6
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.then8
  br label %if.end11, !dbg !66

if.end11:                                         ; preds = %if.end10, %if.end4
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_10_good() #0 !dbg !68 {
entry:
  call void @goodB2G1(), !dbg !69
  call void @goodB2G2(), !dbg !70
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__CWE839_fgets_10_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__CWE839_fgets_10_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32 -1, i32* %data, align 4, !dbg !96
  %0 = load i32, i32* @globalTrue, align 4, !dbg !97
  %tobool = icmp ne i32 %0, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.end4, !dbg !99

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !100, metadata !DIExpression()), !dbg !103
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !104
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !106
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !107
  %cmp = icmp ne i8* %call, null, !dbg !108
  br i1 %cmp, label %if.then1, label %if.else, !dbg !109

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !110
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !112
  store i32 %call3, i32* %data, align 4, !dbg !113
  br label %if.end, !dbg !114

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !117

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFalse, align 4, !dbg !118
  %tobool5 = icmp ne i32 %3, 0, !dbg !118
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !120

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !121
  br label %if.end13, !dbg !123

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !124, metadata !DIExpression()), !dbg !127
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !127
  %5 = load i32, i32* %data, align 4, !dbg !128
  %cmp8 = icmp sge i32 %5, 0, !dbg !130
  br i1 %cmp8, label %land.lhs.true, label %if.else11, !dbg !131

land.lhs.true:                                    ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !132
  %cmp9 = icmp slt i32 %6, 10, !dbg !133
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !134

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !135
  %idxprom = sext i32 %7 to i64, !dbg !137
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !137
  %8 = load i32, i32* %arrayidx, align 4, !dbg !137
  call void @printIntLine(i32 %8), !dbg !138
  br label %if.end12, !dbg !139

if.else11:                                        ; preds = %land.lhs.true, %if.else7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !140
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then6
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !143 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 -1, i32* %data, align 4, !dbg !146
  %0 = load i32, i32* @globalTrue, align 4, !dbg !147
  %tobool = icmp ne i32 %0, 0, !dbg !147
  br i1 %tobool, label %if.then, label %if.end4, !dbg !149

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !150, metadata !DIExpression()), !dbg !153
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !153
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !156
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !157
  %cmp = icmp ne i8* %call, null, !dbg !158
  br i1 %cmp, label %if.then1, label %if.else, !dbg !159

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !162
  store i32 %call3, i32* %data, align 4, !dbg !163
  br label %if.end, !dbg !164

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !165
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !167

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalTrue, align 4, !dbg !168
  %tobool5 = icmp ne i32 %3, 0, !dbg !168
  br i1 %tobool5, label %if.then6, label %if.end12, !dbg !170

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !171, metadata !DIExpression()), !dbg !174
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !174
  %5 = load i32, i32* %data, align 4, !dbg !175
  %cmp7 = icmp sge i32 %5, 0, !dbg !177
  br i1 %cmp7, label %land.lhs.true, label %if.else10, !dbg !178

land.lhs.true:                                    ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !179
  %cmp8 = icmp slt i32 %6, 10, !dbg !180
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !181

if.then9:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !182
  %idxprom = sext i32 %7 to i64, !dbg !184
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !184
  %8 = load i32, i32* %arrayidx, align 4, !dbg !184
  call void @printIntLine(i32 %8), !dbg !185
  br label %if.end11, !dbg !186

if.else10:                                        ; preds = %land.lhs.true, %if.then6
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !187
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end12, !dbg !189

if.end12:                                         ; preds = %if.end11, %if.end4
  ret void, !dbg !190
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !191 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !192, metadata !DIExpression()), !dbg !193
  store i32 -1, i32* %data, align 4, !dbg !194
  %0 = load i32, i32* @globalFalse, align 4, !dbg !195
  %tobool = icmp ne i32 %0, 0, !dbg !195
  br i1 %tobool, label %if.then, label %if.else, !dbg !197

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !198
  br label %if.end, !dbg !200

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !201
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !203
  %tobool1 = icmp ne i32 %1, 0, !dbg !203
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !205

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !206, metadata !DIExpression()), !dbg !209
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !209
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !209
  %3 = load i32, i32* %data, align 4, !dbg !210
  %cmp = icmp slt i32 %3, 10, !dbg !212
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !213

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !214
  %idxprom = sext i32 %4 to i64, !dbg !216
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !216
  %5 = load i32, i32* %arrayidx, align 4, !dbg !216
  call void @printIntLine(i32 %5), !dbg !217
  br label %if.end5, !dbg !218

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !219
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !221

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !223 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 -1, i32* %data, align 4, !dbg !226
  %0 = load i32, i32* @globalTrue, align 4, !dbg !227
  %tobool = icmp ne i32 %0, 0, !dbg !227
  br i1 %tobool, label %if.then, label %if.end, !dbg !229

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !230
  br label %if.end, !dbg !232

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !233
  %tobool1 = icmp ne i32 %1, 0, !dbg !233
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !235

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !236, metadata !DIExpression()), !dbg !239
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !239
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !239
  %3 = load i32, i32* %data, align 4, !dbg !240
  %cmp = icmp slt i32 %3, 10, !dbg !242
  br i1 %cmp, label %if.then3, label %if.else, !dbg !243

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !244
  %idxprom = sext i32 %4 to i64, !dbg !246
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !246
  %5 = load i32, i32* %arrayidx, align 4, !dbg !246
  call void @printIntLine(i32 %5), !dbg !247
  br label %if.end4, !dbg !248

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !249
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !251

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !252
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_10_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_10.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!22 = !DILocation(line: 29, column: 8, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !13, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 32, column: 18, scope: !24)
!31 = !DILocation(line: 34, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 34, column: 17)
!33 = !DILocation(line: 34, column: 53, scope: !32)
!34 = !DILocation(line: 34, column: 17, scope: !32)
!35 = !DILocation(line: 34, column: 60, scope: !32)
!36 = !DILocation(line: 34, column: 17, scope: !24)
!37 = !DILocation(line: 37, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 13)
!39 = !DILocation(line: 37, column: 24, scope: !38)
!40 = !DILocation(line: 37, column: 22, scope: !38)
!41 = !DILocation(line: 38, column: 13, scope: !38)
!42 = !DILocation(line: 41, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !13, line: 40, column: 13)
!44 = !DILocation(line: 44, column: 5, scope: !25)
!45 = !DILocation(line: 45, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!47 = !DILocation(line: 45, column: 8, scope: !12)
!48 = !DILocalVariable(name: "buffer", scope: !49, file: !13, line: 48, type: !51)
!49 = distinct !DILexicalBlock(scope: !50, file: !13, line: 47, column: 9)
!50 = distinct !DILexicalBlock(scope: !46, file: !13, line: 46, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 10)
!54 = !DILocation(line: 48, column: 17, scope: !49)
!55 = !DILocation(line: 51, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !13, line: 51, column: 17)
!57 = !DILocation(line: 51, column: 22, scope: !56)
!58 = !DILocation(line: 51, column: 17, scope: !49)
!59 = !DILocation(line: 53, column: 37, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !13, line: 52, column: 13)
!61 = !DILocation(line: 53, column: 30, scope: !60)
!62 = !DILocation(line: 53, column: 17, scope: !60)
!63 = !DILocation(line: 54, column: 13, scope: !60)
!64 = !DILocation(line: 57, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !56, file: !13, line: 56, column: 13)
!66 = !DILocation(line: 60, column: 5, scope: !50)
!67 = !DILocation(line: 61, column: 1, scope: !12)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_10_good", scope: !13, file: !13, line: 215, type: !14, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 217, column: 5, scope: !68)
!70 = !DILocation(line: 218, column: 5, scope: !68)
!71 = !DILocation(line: 219, column: 5, scope: !68)
!72 = !DILocation(line: 220, column: 5, scope: !68)
!73 = !DILocation(line: 221, column: 1, scope: !68)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 232, type: !75, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!17, !17, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 232, type: !17)
!80 = !DILocation(line: 232, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 232, type: !77)
!82 = !DILocation(line: 232, column: 27, scope: !74)
!83 = !DILocation(line: 235, column: 22, scope: !74)
!84 = !DILocation(line: 235, column: 12, scope: !74)
!85 = !DILocation(line: 235, column: 5, scope: !74)
!86 = !DILocation(line: 237, column: 5, scope: !74)
!87 = !DILocation(line: 238, column: 5, scope: !74)
!88 = !DILocation(line: 239, column: 5, scope: !74)
!89 = !DILocation(line: 242, column: 5, scope: !74)
!90 = !DILocation(line: 243, column: 5, scope: !74)
!91 = !DILocation(line: 244, column: 5, scope: !74)
!92 = !DILocation(line: 246, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !13, line: 70, type: !17)
!95 = !DILocation(line: 70, column: 9, scope: !93)
!96 = !DILocation(line: 72, column: 10, scope: !93)
!97 = !DILocation(line: 73, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !13, line: 73, column: 8)
!99 = !DILocation(line: 73, column: 8, scope: !93)
!100 = !DILocalVariable(name: "inputBuffer", scope: !101, file: !13, line: 76, type: !26)
!101 = distinct !DILexicalBlock(scope: !102, file: !13, line: 75, column: 9)
!102 = distinct !DILexicalBlock(scope: !98, file: !13, line: 74, column: 5)
!103 = !DILocation(line: 76, column: 18, scope: !101)
!104 = !DILocation(line: 78, column: 23, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !13, line: 78, column: 17)
!106 = !DILocation(line: 78, column: 53, scope: !105)
!107 = !DILocation(line: 78, column: 17, scope: !105)
!108 = !DILocation(line: 78, column: 60, scope: !105)
!109 = !DILocation(line: 78, column: 17, scope: !101)
!110 = !DILocation(line: 81, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !13, line: 79, column: 13)
!112 = !DILocation(line: 81, column: 24, scope: !111)
!113 = !DILocation(line: 81, column: 22, scope: !111)
!114 = !DILocation(line: 82, column: 13, scope: !111)
!115 = !DILocation(line: 85, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !105, file: !13, line: 84, column: 13)
!117 = !DILocation(line: 88, column: 5, scope: !102)
!118 = !DILocation(line: 89, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !93, file: !13, line: 89, column: 8)
!120 = !DILocation(line: 89, column: 8, scope: !93)
!121 = !DILocation(line: 92, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !13, line: 90, column: 5)
!123 = !DILocation(line: 93, column: 5, scope: !122)
!124 = !DILocalVariable(name: "buffer", scope: !125, file: !13, line: 97, type: !51)
!125 = distinct !DILexicalBlock(scope: !126, file: !13, line: 96, column: 9)
!126 = distinct !DILexicalBlock(scope: !119, file: !13, line: 95, column: 5)
!127 = !DILocation(line: 97, column: 17, scope: !125)
!128 = !DILocation(line: 99, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 99, column: 17)
!130 = !DILocation(line: 99, column: 22, scope: !129)
!131 = !DILocation(line: 99, column: 27, scope: !129)
!132 = !DILocation(line: 99, column: 30, scope: !129)
!133 = !DILocation(line: 99, column: 35, scope: !129)
!134 = !DILocation(line: 99, column: 17, scope: !125)
!135 = !DILocation(line: 101, column: 37, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !13, line: 100, column: 13)
!137 = !DILocation(line: 101, column: 30, scope: !136)
!138 = !DILocation(line: 101, column: 17, scope: !136)
!139 = !DILocation(line: 102, column: 13, scope: !136)
!140 = !DILocation(line: 105, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !129, file: !13, line: 104, column: 13)
!142 = !DILocation(line: 109, column: 1, scope: !93)
!143 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !13, line: 114, type: !17)
!145 = !DILocation(line: 114, column: 9, scope: !143)
!146 = !DILocation(line: 116, column: 10, scope: !143)
!147 = !DILocation(line: 117, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !13, line: 117, column: 8)
!149 = !DILocation(line: 117, column: 8, scope: !143)
!150 = !DILocalVariable(name: "inputBuffer", scope: !151, file: !13, line: 120, type: !26)
!151 = distinct !DILexicalBlock(scope: !152, file: !13, line: 119, column: 9)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 118, column: 5)
!153 = !DILocation(line: 120, column: 18, scope: !151)
!154 = !DILocation(line: 122, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !13, line: 122, column: 17)
!156 = !DILocation(line: 122, column: 53, scope: !155)
!157 = !DILocation(line: 122, column: 17, scope: !155)
!158 = !DILocation(line: 122, column: 60, scope: !155)
!159 = !DILocation(line: 122, column: 17, scope: !151)
!160 = !DILocation(line: 125, column: 29, scope: !161)
!161 = distinct !DILexicalBlock(scope: !155, file: !13, line: 123, column: 13)
!162 = !DILocation(line: 125, column: 24, scope: !161)
!163 = !DILocation(line: 125, column: 22, scope: !161)
!164 = !DILocation(line: 126, column: 13, scope: !161)
!165 = !DILocation(line: 129, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !155, file: !13, line: 128, column: 13)
!167 = !DILocation(line: 132, column: 5, scope: !152)
!168 = !DILocation(line: 133, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !143, file: !13, line: 133, column: 8)
!170 = !DILocation(line: 133, column: 8, scope: !143)
!171 = !DILocalVariable(name: "buffer", scope: !172, file: !13, line: 136, type: !51)
!172 = distinct !DILexicalBlock(scope: !173, file: !13, line: 135, column: 9)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 134, column: 5)
!174 = !DILocation(line: 136, column: 17, scope: !172)
!175 = !DILocation(line: 138, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 138, column: 17)
!177 = !DILocation(line: 138, column: 22, scope: !176)
!178 = !DILocation(line: 138, column: 27, scope: !176)
!179 = !DILocation(line: 138, column: 30, scope: !176)
!180 = !DILocation(line: 138, column: 35, scope: !176)
!181 = !DILocation(line: 138, column: 17, scope: !172)
!182 = !DILocation(line: 140, column: 37, scope: !183)
!183 = distinct !DILexicalBlock(scope: !176, file: !13, line: 139, column: 13)
!184 = !DILocation(line: 140, column: 30, scope: !183)
!185 = !DILocation(line: 140, column: 17, scope: !183)
!186 = !DILocation(line: 141, column: 13, scope: !183)
!187 = !DILocation(line: 144, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !176, file: !13, line: 143, column: 13)
!189 = !DILocation(line: 147, column: 5, scope: !173)
!190 = !DILocation(line: 148, column: 1, scope: !143)
!191 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!192 = !DILocalVariable(name: "data", scope: !191, file: !13, line: 153, type: !17)
!193 = !DILocation(line: 153, column: 9, scope: !191)
!194 = !DILocation(line: 155, column: 10, scope: !191)
!195 = !DILocation(line: 156, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !13, line: 156, column: 8)
!197 = !DILocation(line: 156, column: 8, scope: !191)
!198 = !DILocation(line: 159, column: 9, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !13, line: 157, column: 5)
!200 = !DILocation(line: 160, column: 5, scope: !199)
!201 = !DILocation(line: 165, column: 14, scope: !202)
!202 = distinct !DILexicalBlock(scope: !196, file: !13, line: 162, column: 5)
!203 = !DILocation(line: 167, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !191, file: !13, line: 167, column: 8)
!205 = !DILocation(line: 167, column: 8, scope: !191)
!206 = !DILocalVariable(name: "buffer", scope: !207, file: !13, line: 170, type: !51)
!207 = distinct !DILexicalBlock(scope: !208, file: !13, line: 169, column: 9)
!208 = distinct !DILexicalBlock(scope: !204, file: !13, line: 168, column: 5)
!209 = !DILocation(line: 170, column: 17, scope: !207)
!210 = !DILocation(line: 173, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !13, line: 173, column: 17)
!212 = !DILocation(line: 173, column: 22, scope: !211)
!213 = !DILocation(line: 173, column: 17, scope: !207)
!214 = !DILocation(line: 175, column: 37, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !13, line: 174, column: 13)
!216 = !DILocation(line: 175, column: 30, scope: !215)
!217 = !DILocation(line: 175, column: 17, scope: !215)
!218 = !DILocation(line: 176, column: 13, scope: !215)
!219 = !DILocation(line: 179, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !211, file: !13, line: 178, column: 13)
!221 = !DILocation(line: 182, column: 5, scope: !208)
!222 = !DILocation(line: 183, column: 1, scope: !191)
!223 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 186, type: !14, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!224 = !DILocalVariable(name: "data", scope: !223, file: !13, line: 188, type: !17)
!225 = !DILocation(line: 188, column: 9, scope: !223)
!226 = !DILocation(line: 190, column: 10, scope: !223)
!227 = !DILocation(line: 191, column: 8, scope: !228)
!228 = distinct !DILexicalBlock(scope: !223, file: !13, line: 191, column: 8)
!229 = !DILocation(line: 191, column: 8, scope: !223)
!230 = !DILocation(line: 195, column: 14, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !13, line: 192, column: 5)
!232 = !DILocation(line: 196, column: 5, scope: !231)
!233 = !DILocation(line: 197, column: 8, scope: !234)
!234 = distinct !DILexicalBlock(scope: !223, file: !13, line: 197, column: 8)
!235 = !DILocation(line: 197, column: 8, scope: !223)
!236 = !DILocalVariable(name: "buffer", scope: !237, file: !13, line: 200, type: !51)
!237 = distinct !DILexicalBlock(scope: !238, file: !13, line: 199, column: 9)
!238 = distinct !DILexicalBlock(scope: !234, file: !13, line: 198, column: 5)
!239 = !DILocation(line: 200, column: 17, scope: !237)
!240 = !DILocation(line: 203, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !13, line: 203, column: 17)
!242 = !DILocation(line: 203, column: 22, scope: !241)
!243 = !DILocation(line: 203, column: 17, scope: !237)
!244 = !DILocation(line: 205, column: 37, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !13, line: 204, column: 13)
!246 = !DILocation(line: 205, column: 30, scope: !245)
!247 = !DILocation(line: 205, column: 17, scope: !245)
!248 = !DILocation(line: 206, column: 13, scope: !245)
!249 = !DILocation(line: 209, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !241, file: !13, line: 208, column: 13)
!251 = !DILocation(line: 212, column: 5, scope: !238)
!252 = !DILocation(line: 213, column: 1, scope: !223)
