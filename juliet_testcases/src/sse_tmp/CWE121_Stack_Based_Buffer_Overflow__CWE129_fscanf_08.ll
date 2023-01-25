; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08.c"
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
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @staticReturnsTrue(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !22
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !26
  %tobool3 = icmp ne i32 %call2, 0, !dbg !26
  br i1 %tobool3, label %if.then4, label %if.end10, !dbg !28

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !33, metadata !DIExpression()), !dbg !37
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !37
  %2 = load i32, i32* %data, align 4, !dbg !38
  %cmp = icmp sge i32 %2, 0, !dbg !40
  br i1 %cmp, label %if.then5, label %if.else, !dbg !41

if.then5:                                         ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !42
  %idxprom = sext i32 %3 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !44
  store i32 1, i32* %arrayidx, align 4, !dbg !45
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.then5
  %4 = load i32, i32* %i, align 4, !dbg !49
  %cmp6 = icmp slt i32 %4, 10, !dbg !51
  br i1 %cmp6, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !53
  %idxprom7 = sext i32 %5 to i64, !dbg !55
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !55
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !55
  call void @printIntLine(i32 %6), !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %7, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !63

if.else:                                          ; preds = %if.then4
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  br label %if.end9

if.end9:                                          ; preds = %if.else, %for.end
  br label %if.end10, !dbg !66

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08_good() #0 !dbg !68 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !94 {
entry:
  ret i32 1, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !98 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  %call = call i32 @staticReturnsTrue(), !dbg !102
  %tobool = icmp ne i32 %call, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !105
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsFalse(), !dbg !109
  %tobool3 = icmp ne i32 %call2, 0, !dbg !109
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !111

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !112
  br label %if.end12, !dbg !114

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !115, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !119, metadata !DIExpression()), !dbg !120
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !120
  %2 = load i32, i32* %data, align 4, !dbg !121
  %cmp = icmp sge i32 %2, 0, !dbg !123
  br i1 %cmp, label %land.lhs.true, label %if.else10, !dbg !124

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data, align 4, !dbg !125
  %cmp5 = icmp slt i32 %3, 10, !dbg !126
  br i1 %cmp5, label %if.then6, label %if.else10, !dbg !127

if.then6:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !128
  %idxprom = sext i32 %4 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !130
  store i32 1, i32* %arrayidx, align 4, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.then6
  %5 = load i32, i32* %i, align 4, !dbg !135
  %cmp7 = icmp slt i32 %5, 10, !dbg !137
  br i1 %cmp7, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !139
  %idxprom8 = sext i32 %6 to i64, !dbg !141
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !141
  %7 = load i32, i32* %arrayidx9, align 4, !dbg !141
  call void @printIntLine(i32 %7), !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %8, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  br label %if.end11, !dbg !148

if.else10:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !149
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %for.end
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then4
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !152 {
entry:
  ret i32 0, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !154 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i32 -1, i32* %data, align 4, !dbg !157
  %call = call i32 @staticReturnsTrue(), !dbg !158
  %tobool = icmp ne i32 %call, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !161
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !165
  %tobool3 = icmp ne i32 %call2, 0, !dbg !165
  br i1 %tobool3, label %if.then4, label %if.end11, !dbg !167

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !173
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !173
  %2 = load i32, i32* %data, align 4, !dbg !174
  %cmp = icmp sge i32 %2, 0, !dbg !176
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !177

land.lhs.true:                                    ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !178
  %cmp5 = icmp slt i32 %3, 10, !dbg !179
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !180

if.then6:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !181
  %idxprom = sext i32 %4 to i64, !dbg !183
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !183
  store i32 1, i32* %arrayidx, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then6
  %5 = load i32, i32* %i, align 4, !dbg !188
  %cmp7 = icmp slt i32 %5, 10, !dbg !190
  br i1 %cmp7, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !192
  %idxprom8 = sext i32 %6 to i64, !dbg !194
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !194
  %7 = load i32, i32* %arrayidx9, align 4, !dbg !194
  call void @printIntLine(i32 %7), !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %8, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !201

if.else:                                          ; preds = %land.lhs.true, %if.then4
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !202
  br label %if.end10

if.end10:                                         ; preds = %if.else, %for.end
  br label %if.end11, !dbg !204

if.end11:                                         ; preds = %if.end10, %if.end
  ret void, !dbg !205
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 -1, i32* %data, align 4, !dbg !209
  %call = call i32 @staticReturnsFalse(), !dbg !210
  %tobool = icmp ne i32 %call, 0, !dbg !210
  br i1 %tobool, label %if.then, label %if.else, !dbg !212

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !213
  br label %if.end, !dbg !215

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !216
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !218
  %tobool2 = icmp ne i32 %call1, 0, !dbg !218
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !220

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !221, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !225, metadata !DIExpression()), !dbg !226
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !226
  %1 = load i32, i32* %data, align 4, !dbg !227
  %cmp = icmp sge i32 %1, 0, !dbg !229
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !230

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !231
  %idxprom = sext i32 %2 to i64, !dbg !233
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !233
  store i32 1, i32* %arrayidx, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !238
  %cmp5 = icmp slt i32 %3, 10, !dbg !240
  br i1 %cmp5, label %for.body, label %for.end, !dbg !241

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !242
  %idxprom6 = sext i32 %4 to i64, !dbg !244
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !244
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !244
  call void @printIntLine(i32 %5), !dbg !245
  br label %for.inc, !dbg !246

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !247
  %inc = add nsw i32 %6, 1, !dbg !247
  store i32 %inc, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !248, !llvm.loop !249

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !251

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !252
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !254

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !256 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 -1, i32* %data, align 4, !dbg !259
  %call = call i32 @staticReturnsTrue(), !dbg !260
  %tobool = icmp ne i32 %call, 0, !dbg !260
  br i1 %tobool, label %if.then, label %if.end, !dbg !262

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !263
  br label %if.end, !dbg !265

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !266
  %tobool2 = icmp ne i32 %call1, 0, !dbg !266
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !268

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !269, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !273, metadata !DIExpression()), !dbg !274
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !274
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !274
  %1 = load i32, i32* %data, align 4, !dbg !275
  %cmp = icmp sge i32 %1, 0, !dbg !277
  br i1 %cmp, label %if.then4, label %if.else, !dbg !278

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !279
  %idxprom = sext i32 %2 to i64, !dbg !281
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !281
  store i32 1, i32* %arrayidx, align 4, !dbg !282
  store i32 0, i32* %i, align 4, !dbg !283
  br label %for.cond, !dbg !285

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !286
  %cmp5 = icmp slt i32 %3, 10, !dbg !288
  br i1 %cmp5, label %for.body, label %for.end, !dbg !289

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !290
  %idxprom6 = sext i32 %4 to i64, !dbg !292
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !292
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !292
  call void @printIntLine(i32 %5), !dbg !293
  br label %for.inc, !dbg !294

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !295
  %inc = add nsw i32 %6, 1, !dbg !295
  store i32 %inc, i32* %i, align 4, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !299

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !300
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !302

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !303
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 37, column: 9, scope: !11)
!18 = !DILocation(line: 39, column: 10, scope: !11)
!19 = !DILocation(line: 40, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!21 = !DILocation(line: 40, column: 8, scope: !11)
!22 = !DILocation(line: 43, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!24 = !DILocation(line: 43, column: 9, scope: !23)
!25 = !DILocation(line: 44, column: 5, scope: !23)
!26 = !DILocation(line: 45, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 8)
!28 = !DILocation(line: 45, column: 8, scope: !11)
!29 = !DILocalVariable(name: "i", scope: !30, file: !12, line: 48, type: !16)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 47, column: 9)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 46, column: 5)
!32 = !DILocation(line: 48, column: 17, scope: !30)
!33 = !DILocalVariable(name: "buffer", scope: !30, file: !12, line: 49, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 49, column: 17, scope: !30)
!38 = !DILocation(line: 52, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 52, column: 17)
!40 = !DILocation(line: 52, column: 22, scope: !39)
!41 = !DILocation(line: 52, column: 17, scope: !30)
!42 = !DILocation(line: 54, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 53, column: 13)
!44 = !DILocation(line: 54, column: 17, scope: !43)
!45 = !DILocation(line: 54, column: 30, scope: !43)
!46 = !DILocation(line: 56, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 56, column: 17)
!48 = !DILocation(line: 56, column: 21, scope: !47)
!49 = !DILocation(line: 56, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 56, column: 17)
!51 = !DILocation(line: 56, column: 30, scope: !50)
!52 = !DILocation(line: 56, column: 17, scope: !47)
!53 = !DILocation(line: 58, column: 41, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 57, column: 17)
!55 = !DILocation(line: 58, column: 34, scope: !54)
!56 = !DILocation(line: 58, column: 21, scope: !54)
!57 = !DILocation(line: 59, column: 17, scope: !54)
!58 = !DILocation(line: 56, column: 37, scope: !50)
!59 = !DILocation(line: 56, column: 17, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 59, column: 17, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 60, column: 13, scope: !43)
!64 = !DILocation(line: 63, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !39, file: !12, line: 62, column: 13)
!66 = !DILocation(line: 66, column: 5, scope: !31)
!67 = !DILocation(line: 67, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_08_good", scope: !12, file: !12, line: 223, type: !13, scopeLine: 224, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 225, column: 5, scope: !68)
!70 = !DILocation(line: 226, column: 5, scope: !68)
!71 = !DILocation(line: 227, column: 5, scope: !68)
!72 = !DILocation(line: 228, column: 5, scope: !68)
!73 = !DILocation(line: 229, column: 1, scope: !68)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 240, type: !75, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!16, !16, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 240, type: !16)
!81 = !DILocation(line: 240, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 240, type: !77)
!83 = !DILocation(line: 240, column: 27, scope: !74)
!84 = !DILocation(line: 243, column: 22, scope: !74)
!85 = !DILocation(line: 243, column: 12, scope: !74)
!86 = !DILocation(line: 243, column: 5, scope: !74)
!87 = !DILocation(line: 245, column: 5, scope: !74)
!88 = !DILocation(line: 246, column: 5, scope: !74)
!89 = !DILocation(line: 247, column: 5, scope: !74)
!90 = !DILocation(line: 250, column: 5, scope: !74)
!91 = !DILocation(line: 251, column: 5, scope: !74)
!92 = !DILocation(line: 252, column: 5, scope: !74)
!93 = !DILocation(line: 254, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !95, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!16}
!97 = !DILocation(line: 25, column: 5, scope: !94)
!98 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 76, type: !16)
!100 = !DILocation(line: 76, column: 9, scope: !98)
!101 = !DILocation(line: 78, column: 10, scope: !98)
!102 = !DILocation(line: 79, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !12, line: 79, column: 8)
!104 = !DILocation(line: 79, column: 8, scope: !98)
!105 = !DILocation(line: 82, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 80, column: 5)
!107 = !DILocation(line: 82, column: 9, scope: !106)
!108 = !DILocation(line: 83, column: 5, scope: !106)
!109 = !DILocation(line: 84, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !98, file: !12, line: 84, column: 8)
!111 = !DILocation(line: 84, column: 8, scope: !98)
!112 = !DILocation(line: 87, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 85, column: 5)
!114 = !DILocation(line: 88, column: 5, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 92, type: !16)
!116 = distinct !DILexicalBlock(scope: !117, file: !12, line: 91, column: 9)
!117 = distinct !DILexicalBlock(scope: !110, file: !12, line: 90, column: 5)
!118 = !DILocation(line: 92, column: 17, scope: !116)
!119 = !DILocalVariable(name: "buffer", scope: !116, file: !12, line: 93, type: !34)
!120 = !DILocation(line: 93, column: 17, scope: !116)
!121 = !DILocation(line: 95, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !12, line: 95, column: 17)
!123 = !DILocation(line: 95, column: 22, scope: !122)
!124 = !DILocation(line: 95, column: 27, scope: !122)
!125 = !DILocation(line: 95, column: 30, scope: !122)
!126 = !DILocation(line: 95, column: 35, scope: !122)
!127 = !DILocation(line: 95, column: 17, scope: !116)
!128 = !DILocation(line: 97, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !12, line: 96, column: 13)
!130 = !DILocation(line: 97, column: 17, scope: !129)
!131 = !DILocation(line: 97, column: 30, scope: !129)
!132 = !DILocation(line: 99, column: 23, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 99, column: 17)
!134 = !DILocation(line: 99, column: 21, scope: !133)
!135 = !DILocation(line: 99, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 99, column: 17)
!137 = !DILocation(line: 99, column: 30, scope: !136)
!138 = !DILocation(line: 99, column: 17, scope: !133)
!139 = !DILocation(line: 101, column: 41, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 100, column: 17)
!141 = !DILocation(line: 101, column: 34, scope: !140)
!142 = !DILocation(line: 101, column: 21, scope: !140)
!143 = !DILocation(line: 102, column: 17, scope: !140)
!144 = !DILocation(line: 99, column: 37, scope: !136)
!145 = !DILocation(line: 99, column: 17, scope: !136)
!146 = distinct !{!146, !138, !147, !62}
!147 = !DILocation(line: 102, column: 17, scope: !133)
!148 = !DILocation(line: 103, column: 13, scope: !129)
!149 = !DILocation(line: 106, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !122, file: !12, line: 105, column: 13)
!151 = !DILocation(line: 110, column: 1, scope: !98)
!152 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !95, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocation(line: 30, column: 5, scope: !152)
!154 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !12, line: 115, type: !16)
!156 = !DILocation(line: 115, column: 9, scope: !154)
!157 = !DILocation(line: 117, column: 10, scope: !154)
!158 = !DILocation(line: 118, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !12, line: 118, column: 8)
!160 = !DILocation(line: 118, column: 8, scope: !154)
!161 = !DILocation(line: 121, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 119, column: 5)
!163 = !DILocation(line: 121, column: 9, scope: !162)
!164 = !DILocation(line: 122, column: 5, scope: !162)
!165 = !DILocation(line: 123, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !154, file: !12, line: 123, column: 8)
!167 = !DILocation(line: 123, column: 8, scope: !154)
!168 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 126, type: !16)
!169 = distinct !DILexicalBlock(scope: !170, file: !12, line: 125, column: 9)
!170 = distinct !DILexicalBlock(scope: !166, file: !12, line: 124, column: 5)
!171 = !DILocation(line: 126, column: 17, scope: !169)
!172 = !DILocalVariable(name: "buffer", scope: !169, file: !12, line: 127, type: !34)
!173 = !DILocation(line: 127, column: 17, scope: !169)
!174 = !DILocation(line: 129, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !12, line: 129, column: 17)
!176 = !DILocation(line: 129, column: 22, scope: !175)
!177 = !DILocation(line: 129, column: 27, scope: !175)
!178 = !DILocation(line: 129, column: 30, scope: !175)
!179 = !DILocation(line: 129, column: 35, scope: !175)
!180 = !DILocation(line: 129, column: 17, scope: !169)
!181 = !DILocation(line: 131, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !175, file: !12, line: 130, column: 13)
!183 = !DILocation(line: 131, column: 17, scope: !182)
!184 = !DILocation(line: 131, column: 30, scope: !182)
!185 = !DILocation(line: 133, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !12, line: 133, column: 17)
!187 = !DILocation(line: 133, column: 21, scope: !186)
!188 = !DILocation(line: 133, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !12, line: 133, column: 17)
!190 = !DILocation(line: 133, column: 30, scope: !189)
!191 = !DILocation(line: 133, column: 17, scope: !186)
!192 = !DILocation(line: 135, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !12, line: 134, column: 17)
!194 = !DILocation(line: 135, column: 34, scope: !193)
!195 = !DILocation(line: 135, column: 21, scope: !193)
!196 = !DILocation(line: 136, column: 17, scope: !193)
!197 = !DILocation(line: 133, column: 37, scope: !189)
!198 = !DILocation(line: 133, column: 17, scope: !189)
!199 = distinct !{!199, !191, !200, !62}
!200 = !DILocation(line: 136, column: 17, scope: !186)
!201 = !DILocation(line: 137, column: 13, scope: !182)
!202 = !DILocation(line: 140, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !175, file: !12, line: 139, column: 13)
!204 = !DILocation(line: 143, column: 5, scope: !170)
!205 = !DILocation(line: 144, column: 1, scope: !154)
!206 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 147, type: !13, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!207 = !DILocalVariable(name: "data", scope: !206, file: !12, line: 149, type: !16)
!208 = !DILocation(line: 149, column: 9, scope: !206)
!209 = !DILocation(line: 151, column: 10, scope: !206)
!210 = !DILocation(line: 152, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !12, line: 152, column: 8)
!212 = !DILocation(line: 152, column: 8, scope: !206)
!213 = !DILocation(line: 155, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !12, line: 153, column: 5)
!215 = !DILocation(line: 156, column: 5, scope: !214)
!216 = !DILocation(line: 161, column: 14, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !12, line: 158, column: 5)
!218 = !DILocation(line: 163, column: 8, scope: !219)
!219 = distinct !DILexicalBlock(scope: !206, file: !12, line: 163, column: 8)
!220 = !DILocation(line: 163, column: 8, scope: !206)
!221 = !DILocalVariable(name: "i", scope: !222, file: !12, line: 166, type: !16)
!222 = distinct !DILexicalBlock(scope: !223, file: !12, line: 165, column: 9)
!223 = distinct !DILexicalBlock(scope: !219, file: !12, line: 164, column: 5)
!224 = !DILocation(line: 166, column: 17, scope: !222)
!225 = !DILocalVariable(name: "buffer", scope: !222, file: !12, line: 167, type: !34)
!226 = !DILocation(line: 167, column: 17, scope: !222)
!227 = !DILocation(line: 170, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !222, file: !12, line: 170, column: 17)
!229 = !DILocation(line: 170, column: 22, scope: !228)
!230 = !DILocation(line: 170, column: 17, scope: !222)
!231 = !DILocation(line: 172, column: 24, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !12, line: 171, column: 13)
!233 = !DILocation(line: 172, column: 17, scope: !232)
!234 = !DILocation(line: 172, column: 30, scope: !232)
!235 = !DILocation(line: 174, column: 23, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !12, line: 174, column: 17)
!237 = !DILocation(line: 174, column: 21, scope: !236)
!238 = !DILocation(line: 174, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !12, line: 174, column: 17)
!240 = !DILocation(line: 174, column: 30, scope: !239)
!241 = !DILocation(line: 174, column: 17, scope: !236)
!242 = !DILocation(line: 176, column: 41, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !12, line: 175, column: 17)
!244 = !DILocation(line: 176, column: 34, scope: !243)
!245 = !DILocation(line: 176, column: 21, scope: !243)
!246 = !DILocation(line: 177, column: 17, scope: !243)
!247 = !DILocation(line: 174, column: 37, scope: !239)
!248 = !DILocation(line: 174, column: 17, scope: !239)
!249 = distinct !{!249, !241, !250, !62}
!250 = !DILocation(line: 177, column: 17, scope: !236)
!251 = !DILocation(line: 178, column: 13, scope: !232)
!252 = !DILocation(line: 181, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !228, file: !12, line: 180, column: 13)
!254 = !DILocation(line: 184, column: 5, scope: !223)
!255 = !DILocation(line: 185, column: 1, scope: !206)
!256 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 188, type: !13, scopeLine: 189, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!257 = !DILocalVariable(name: "data", scope: !256, file: !12, line: 190, type: !16)
!258 = !DILocation(line: 190, column: 9, scope: !256)
!259 = !DILocation(line: 192, column: 10, scope: !256)
!260 = !DILocation(line: 193, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !12, line: 193, column: 8)
!262 = !DILocation(line: 193, column: 8, scope: !256)
!263 = !DILocation(line: 197, column: 14, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !12, line: 194, column: 5)
!265 = !DILocation(line: 198, column: 5, scope: !264)
!266 = !DILocation(line: 199, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !256, file: !12, line: 199, column: 8)
!268 = !DILocation(line: 199, column: 8, scope: !256)
!269 = !DILocalVariable(name: "i", scope: !270, file: !12, line: 202, type: !16)
!270 = distinct !DILexicalBlock(scope: !271, file: !12, line: 201, column: 9)
!271 = distinct !DILexicalBlock(scope: !267, file: !12, line: 200, column: 5)
!272 = !DILocation(line: 202, column: 17, scope: !270)
!273 = !DILocalVariable(name: "buffer", scope: !270, file: !12, line: 203, type: !34)
!274 = !DILocation(line: 203, column: 17, scope: !270)
!275 = !DILocation(line: 206, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !270, file: !12, line: 206, column: 17)
!277 = !DILocation(line: 206, column: 22, scope: !276)
!278 = !DILocation(line: 206, column: 17, scope: !270)
!279 = !DILocation(line: 208, column: 24, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !12, line: 207, column: 13)
!281 = !DILocation(line: 208, column: 17, scope: !280)
!282 = !DILocation(line: 208, column: 30, scope: !280)
!283 = !DILocation(line: 210, column: 23, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !12, line: 210, column: 17)
!285 = !DILocation(line: 210, column: 21, scope: !284)
!286 = !DILocation(line: 210, column: 28, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !12, line: 210, column: 17)
!288 = !DILocation(line: 210, column: 30, scope: !287)
!289 = !DILocation(line: 210, column: 17, scope: !284)
!290 = !DILocation(line: 212, column: 41, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !12, line: 211, column: 17)
!292 = !DILocation(line: 212, column: 34, scope: !291)
!293 = !DILocation(line: 212, column: 21, scope: !291)
!294 = !DILocation(line: 213, column: 17, scope: !291)
!295 = !DILocation(line: 210, column: 37, scope: !287)
!296 = !DILocation(line: 210, column: 17, scope: !287)
!297 = distinct !{!297, !289, !298, !62}
!298 = !DILocation(line: 213, column: 17, scope: !284)
!299 = !DILocation(line: 214, column: 13, scope: !280)
!300 = !DILocation(line: 217, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !276, file: !12, line: 216, column: 13)
!302 = !DILocation(line: 220, column: 5, scope: !271)
!303 = !DILocation(line: 221, column: 1, scope: !256)
