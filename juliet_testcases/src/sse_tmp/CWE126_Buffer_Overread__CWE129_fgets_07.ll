; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@staticFive = internal global i32 5, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  %0 = load i32, i32* @staticFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end5, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !27, metadata !DIExpression()), !dbg !34
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !34
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !38
  %cmp1 = icmp ne i8* %call, null, !dbg !39
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !40

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !41
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !43
  store i32 %call4, i32* %data, align 4, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !48

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !49
  %cmp6 = icmp eq i32 %3, 5, !dbg !51
  br i1 %cmp6, label %if.then7, label %if.end12, !dbg !52

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !53, metadata !DIExpression()), !dbg !59
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !59
  %5 = load i32, i32* %data, align 4, !dbg !60
  %cmp8 = icmp sge i32 %5, 0, !dbg !62
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !63

if.then9:                                         ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !64
  %idxprom = sext i32 %6 to i64, !dbg !66
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !66
  %7 = load i32, i32* %arrayidx, align 4, !dbg !66
  call void @printIntLine(i32 %7), !dbg !67
  br label %if.end11, !dbg !68

if.else10:                                        ; preds = %if.then7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end12, !dbg !71

if.end12:                                         ; preds = %if.end11, %if.end5
  ret void, !dbg !72
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_07_good() #0 !dbg !73 {
entry:
  call void @goodB2G1(), !dbg !74
  call void @goodB2G2(), !dbg !75
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__CWE129_fgets_07_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  call void @CWE126_Buffer_Overread__CWE129_fgets_07_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !98 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  %0 = load i32, i32* @staticFive, align 4, !dbg !102
  %cmp = icmp eq i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.end5, !dbg !105

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !109
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !110
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !112
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !113
  %cmp1 = icmp ne i8* %call, null, !dbg !114
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !115

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !116
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !118
  store i32 %call4, i32* %data, align 4, !dbg !119
  br label %if.end, !dbg !120

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !123

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !124
  %cmp6 = icmp ne i32 %3, 5, !dbg !126
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !127

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !128
  br label %if.end14, !dbg !130

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !134
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !134
  %5 = load i32, i32* %data, align 4, !dbg !135
  %cmp9 = icmp sge i32 %5, 0, !dbg !137
  br i1 %cmp9, label %land.lhs.true, label %if.else12, !dbg !138

land.lhs.true:                                    ; preds = %if.else8
  %6 = load i32, i32* %data, align 4, !dbg !139
  %cmp10 = icmp slt i32 %6, 10, !dbg !140
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !141

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %7 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %8 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 %8), !dbg !145
  br label %if.end13, !dbg !146

if.else12:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !147
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.then7
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !150 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 -1, i32* %data, align 4, !dbg !153
  %0 = load i32, i32* @staticFive, align 4, !dbg !154
  %cmp = icmp eq i32 %0, 5, !dbg !156
  br i1 %cmp, label %if.then, label %if.end5, !dbg !157

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !158, metadata !DIExpression()), !dbg !161
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !161
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !162
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !164
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !165
  %cmp1 = icmp ne i8* %call, null, !dbg !166
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !167

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !168
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !170
  store i32 %call4, i32* %data, align 4, !dbg !171
  br label %if.end, !dbg !172

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !173
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !175

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !176
  %cmp6 = icmp eq i32 %3, 5, !dbg !178
  br i1 %cmp6, label %if.then7, label %if.end13, !dbg !179

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !180, metadata !DIExpression()), !dbg !183
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !183
  %5 = load i32, i32* %data, align 4, !dbg !184
  %cmp8 = icmp sge i32 %5, 0, !dbg !186
  br i1 %cmp8, label %land.lhs.true, label %if.else11, !dbg !187

land.lhs.true:                                    ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !188
  %cmp9 = icmp slt i32 %6, 10, !dbg !189
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !190

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !191
  %idxprom = sext i32 %7 to i64, !dbg !193
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !193
  %8 = load i32, i32* %arrayidx, align 4, !dbg !193
  call void @printIntLine(i32 %8), !dbg !194
  br label %if.end12, !dbg !195

if.else11:                                        ; preds = %land.lhs.true, %if.then7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !196
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  br label %if.end13, !dbg !198

if.end13:                                         ; preds = %if.end12, %if.end5
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !200 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 -1, i32* %data, align 4, !dbg !203
  %0 = load i32, i32* @staticFive, align 4, !dbg !204
  %cmp = icmp ne i32 %0, 5, !dbg !206
  br i1 %cmp, label %if.then, label %if.else, !dbg !207

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !208
  br label %if.end, !dbg !210

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !211
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !213
  %cmp1 = icmp eq i32 %1, 5, !dbg !215
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !216

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !217, metadata !DIExpression()), !dbg !220
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !220
  %3 = load i32, i32* %data, align 4, !dbg !221
  %cmp3 = icmp sge i32 %3, 0, !dbg !223
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !224

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !225
  %idxprom = sext i32 %4 to i64, !dbg !227
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !227
  %5 = load i32, i32* %arrayidx, align 4, !dbg !227
  call void @printIntLine(i32 %5), !dbg !228
  br label %if.end6, !dbg !229

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !230
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !232

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !233
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !234 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %data, align 4, !dbg !237
  %0 = load i32, i32* @staticFive, align 4, !dbg !238
  %cmp = icmp eq i32 %0, 5, !dbg !240
  br i1 %cmp, label %if.then, label %if.end, !dbg !241

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !242
  br label %if.end, !dbg !244

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !245
  %cmp1 = icmp eq i32 %1, 5, !dbg !247
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !248

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !249, metadata !DIExpression()), !dbg !252
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !252
  %3 = load i32, i32* %data, align 4, !dbg !253
  %cmp3 = icmp sge i32 %3, 0, !dbg !255
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !256

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !257
  %idxprom = sext i32 %4 to i64, !dbg !259
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !259
  %5 = load i32, i32* %arrayidx, align 4, !dbg !259
  call void @printIntLine(i32 %5), !dbg !260
  br label %if.end5, !dbg !261

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !262
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !264

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !265
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
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_07.c", directory: "/home/joelyang/SSE-Assessment")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_07_bad", scope: !9, file: !9, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !17, file: !9, line: 31, type: !10)
!21 = !DILocation(line: 31, column: 9, scope: !17)
!22 = !DILocation(line: 33, column: 10, scope: !17)
!23 = !DILocation(line: 34, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !9, line: 34, column: 8)
!25 = !DILocation(line: 34, column: 18, scope: !24)
!26 = !DILocation(line: 34, column: 8, scope: !17)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !9, line: 37, type: !30)
!28 = distinct !DILexicalBlock(scope: !29, file: !9, line: 36, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !9, line: 35, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 112, elements: !32)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !{!33}
!33 = !DISubrange(count: 14)
!34 = !DILocation(line: 37, column: 18, scope: !28)
!35 = !DILocation(line: 39, column: 23, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !9, line: 39, column: 17)
!37 = !DILocation(line: 39, column: 53, scope: !36)
!38 = !DILocation(line: 39, column: 17, scope: !36)
!39 = !DILocation(line: 39, column: 60, scope: !36)
!40 = !DILocation(line: 39, column: 17, scope: !28)
!41 = !DILocation(line: 42, column: 29, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !9, line: 40, column: 13)
!43 = !DILocation(line: 42, column: 24, scope: !42)
!44 = !DILocation(line: 42, column: 22, scope: !42)
!45 = !DILocation(line: 43, column: 13, scope: !42)
!46 = !DILocation(line: 46, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !9, line: 45, column: 13)
!48 = !DILocation(line: 49, column: 5, scope: !29)
!49 = !DILocation(line: 50, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !17, file: !9, line: 50, column: 8)
!51 = !DILocation(line: 50, column: 18, scope: !50)
!52 = !DILocation(line: 50, column: 8, scope: !17)
!53 = !DILocalVariable(name: "buffer", scope: !54, file: !9, line: 53, type: !56)
!54 = distinct !DILexicalBlock(scope: !55, file: !9, line: 52, column: 9)
!55 = distinct !DILexicalBlock(scope: !50, file: !9, line: 51, column: 5)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 10)
!59 = !DILocation(line: 53, column: 17, scope: !54)
!60 = !DILocation(line: 56, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !54, file: !9, line: 56, column: 17)
!62 = !DILocation(line: 56, column: 22, scope: !61)
!63 = !DILocation(line: 56, column: 17, scope: !54)
!64 = !DILocation(line: 58, column: 37, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !9, line: 57, column: 13)
!66 = !DILocation(line: 58, column: 30, scope: !65)
!67 = !DILocation(line: 58, column: 17, scope: !65)
!68 = !DILocation(line: 59, column: 13, scope: !65)
!69 = !DILocation(line: 62, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !61, file: !9, line: 61, column: 13)
!71 = !DILocation(line: 65, column: 5, scope: !55)
!72 = !DILocation(line: 66, column: 1, scope: !17)
!73 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_07_good", scope: !9, file: !9, line: 220, type: !18, scopeLine: 221, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 222, column: 5, scope: !73)
!75 = !DILocation(line: 223, column: 5, scope: !73)
!76 = !DILocation(line: 224, column: 5, scope: !73)
!77 = !DILocation(line: 225, column: 5, scope: !73)
!78 = !DILocation(line: 226, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 237, type: !80, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!10, !10, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !9, line: 237, type: !10)
!85 = !DILocation(line: 237, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !9, line: 237, type: !82)
!87 = !DILocation(line: 237, column: 27, scope: !79)
!88 = !DILocation(line: 240, column: 22, scope: !79)
!89 = !DILocation(line: 240, column: 12, scope: !79)
!90 = !DILocation(line: 240, column: 5, scope: !79)
!91 = !DILocation(line: 242, column: 5, scope: !79)
!92 = !DILocation(line: 243, column: 5, scope: !79)
!93 = !DILocation(line: 244, column: 5, scope: !79)
!94 = !DILocation(line: 247, column: 5, scope: !79)
!95 = !DILocation(line: 248, column: 5, scope: !79)
!96 = !DILocation(line: 249, column: 5, scope: !79)
!97 = !DILocation(line: 251, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodB2G1", scope: !9, file: !9, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !9, line: 75, type: !10)
!100 = !DILocation(line: 75, column: 9, scope: !98)
!101 = !DILocation(line: 77, column: 10, scope: !98)
!102 = !DILocation(line: 78, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !9, line: 78, column: 8)
!104 = !DILocation(line: 78, column: 18, scope: !103)
!105 = !DILocation(line: 78, column: 8, scope: !98)
!106 = !DILocalVariable(name: "inputBuffer", scope: !107, file: !9, line: 81, type: !30)
!107 = distinct !DILexicalBlock(scope: !108, file: !9, line: 80, column: 9)
!108 = distinct !DILexicalBlock(scope: !103, file: !9, line: 79, column: 5)
!109 = !DILocation(line: 81, column: 18, scope: !107)
!110 = !DILocation(line: 83, column: 23, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !9, line: 83, column: 17)
!112 = !DILocation(line: 83, column: 53, scope: !111)
!113 = !DILocation(line: 83, column: 17, scope: !111)
!114 = !DILocation(line: 83, column: 60, scope: !111)
!115 = !DILocation(line: 83, column: 17, scope: !107)
!116 = !DILocation(line: 86, column: 29, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !9, line: 84, column: 13)
!118 = !DILocation(line: 86, column: 24, scope: !117)
!119 = !DILocation(line: 86, column: 22, scope: !117)
!120 = !DILocation(line: 87, column: 13, scope: !117)
!121 = !DILocation(line: 90, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !111, file: !9, line: 89, column: 13)
!123 = !DILocation(line: 93, column: 5, scope: !108)
!124 = !DILocation(line: 94, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !98, file: !9, line: 94, column: 8)
!126 = !DILocation(line: 94, column: 18, scope: !125)
!127 = !DILocation(line: 94, column: 8, scope: !98)
!128 = !DILocation(line: 97, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !9, line: 95, column: 5)
!130 = !DILocation(line: 98, column: 5, scope: !129)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !9, line: 102, type: !56)
!132 = distinct !DILexicalBlock(scope: !133, file: !9, line: 101, column: 9)
!133 = distinct !DILexicalBlock(scope: !125, file: !9, line: 100, column: 5)
!134 = !DILocation(line: 102, column: 17, scope: !132)
!135 = !DILocation(line: 104, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !9, line: 104, column: 17)
!137 = !DILocation(line: 104, column: 22, scope: !136)
!138 = !DILocation(line: 104, column: 27, scope: !136)
!139 = !DILocation(line: 104, column: 30, scope: !136)
!140 = !DILocation(line: 104, column: 35, scope: !136)
!141 = !DILocation(line: 104, column: 17, scope: !132)
!142 = !DILocation(line: 106, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !9, line: 105, column: 13)
!144 = !DILocation(line: 106, column: 30, scope: !143)
!145 = !DILocation(line: 106, column: 17, scope: !143)
!146 = !DILocation(line: 107, column: 13, scope: !143)
!147 = !DILocation(line: 110, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !9, line: 109, column: 13)
!149 = !DILocation(line: 114, column: 1, scope: !98)
!150 = distinct !DISubprogram(name: "goodB2G2", scope: !9, file: !9, line: 117, type: !18, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", scope: !150, file: !9, line: 119, type: !10)
!152 = !DILocation(line: 119, column: 9, scope: !150)
!153 = !DILocation(line: 121, column: 10, scope: !150)
!154 = !DILocation(line: 122, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !9, line: 122, column: 8)
!156 = !DILocation(line: 122, column: 18, scope: !155)
!157 = !DILocation(line: 122, column: 8, scope: !150)
!158 = !DILocalVariable(name: "inputBuffer", scope: !159, file: !9, line: 125, type: !30)
!159 = distinct !DILexicalBlock(scope: !160, file: !9, line: 124, column: 9)
!160 = distinct !DILexicalBlock(scope: !155, file: !9, line: 123, column: 5)
!161 = !DILocation(line: 125, column: 18, scope: !159)
!162 = !DILocation(line: 127, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !9, line: 127, column: 17)
!164 = !DILocation(line: 127, column: 53, scope: !163)
!165 = !DILocation(line: 127, column: 17, scope: !163)
!166 = !DILocation(line: 127, column: 60, scope: !163)
!167 = !DILocation(line: 127, column: 17, scope: !159)
!168 = !DILocation(line: 130, column: 29, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !9, line: 128, column: 13)
!170 = !DILocation(line: 130, column: 24, scope: !169)
!171 = !DILocation(line: 130, column: 22, scope: !169)
!172 = !DILocation(line: 131, column: 13, scope: !169)
!173 = !DILocation(line: 134, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !163, file: !9, line: 133, column: 13)
!175 = !DILocation(line: 137, column: 5, scope: !160)
!176 = !DILocation(line: 138, column: 8, scope: !177)
!177 = distinct !DILexicalBlock(scope: !150, file: !9, line: 138, column: 8)
!178 = !DILocation(line: 138, column: 18, scope: !177)
!179 = !DILocation(line: 138, column: 8, scope: !150)
!180 = !DILocalVariable(name: "buffer", scope: !181, file: !9, line: 141, type: !56)
!181 = distinct !DILexicalBlock(scope: !182, file: !9, line: 140, column: 9)
!182 = distinct !DILexicalBlock(scope: !177, file: !9, line: 139, column: 5)
!183 = !DILocation(line: 141, column: 17, scope: !181)
!184 = !DILocation(line: 143, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !9, line: 143, column: 17)
!186 = !DILocation(line: 143, column: 22, scope: !185)
!187 = !DILocation(line: 143, column: 27, scope: !185)
!188 = !DILocation(line: 143, column: 30, scope: !185)
!189 = !DILocation(line: 143, column: 35, scope: !185)
!190 = !DILocation(line: 143, column: 17, scope: !181)
!191 = !DILocation(line: 145, column: 37, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !9, line: 144, column: 13)
!193 = !DILocation(line: 145, column: 30, scope: !192)
!194 = !DILocation(line: 145, column: 17, scope: !192)
!195 = !DILocation(line: 146, column: 13, scope: !192)
!196 = !DILocation(line: 149, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !185, file: !9, line: 148, column: 13)
!198 = !DILocation(line: 152, column: 5, scope: !182)
!199 = !DILocation(line: 153, column: 1, scope: !150)
!200 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 156, type: !18, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!201 = !DILocalVariable(name: "data", scope: !200, file: !9, line: 158, type: !10)
!202 = !DILocation(line: 158, column: 9, scope: !200)
!203 = !DILocation(line: 160, column: 10, scope: !200)
!204 = !DILocation(line: 161, column: 8, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !9, line: 161, column: 8)
!206 = !DILocation(line: 161, column: 18, scope: !205)
!207 = !DILocation(line: 161, column: 8, scope: !200)
!208 = !DILocation(line: 164, column: 9, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !9, line: 162, column: 5)
!210 = !DILocation(line: 165, column: 5, scope: !209)
!211 = !DILocation(line: 170, column: 14, scope: !212)
!212 = distinct !DILexicalBlock(scope: !205, file: !9, line: 167, column: 5)
!213 = !DILocation(line: 172, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !200, file: !9, line: 172, column: 8)
!215 = !DILocation(line: 172, column: 18, scope: !214)
!216 = !DILocation(line: 172, column: 8, scope: !200)
!217 = !DILocalVariable(name: "buffer", scope: !218, file: !9, line: 175, type: !56)
!218 = distinct !DILexicalBlock(scope: !219, file: !9, line: 174, column: 9)
!219 = distinct !DILexicalBlock(scope: !214, file: !9, line: 173, column: 5)
!220 = !DILocation(line: 175, column: 17, scope: !218)
!221 = !DILocation(line: 178, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !9, line: 178, column: 17)
!223 = !DILocation(line: 178, column: 22, scope: !222)
!224 = !DILocation(line: 178, column: 17, scope: !218)
!225 = !DILocation(line: 180, column: 37, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !9, line: 179, column: 13)
!227 = !DILocation(line: 180, column: 30, scope: !226)
!228 = !DILocation(line: 180, column: 17, scope: !226)
!229 = !DILocation(line: 181, column: 13, scope: !226)
!230 = !DILocation(line: 184, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !222, file: !9, line: 183, column: 13)
!232 = !DILocation(line: 187, column: 5, scope: !219)
!233 = !DILocation(line: 188, column: 1, scope: !200)
!234 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 191, type: !18, scopeLine: 192, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!235 = !DILocalVariable(name: "data", scope: !234, file: !9, line: 193, type: !10)
!236 = !DILocation(line: 193, column: 9, scope: !234)
!237 = !DILocation(line: 195, column: 10, scope: !234)
!238 = !DILocation(line: 196, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !9, line: 196, column: 8)
!240 = !DILocation(line: 196, column: 18, scope: !239)
!241 = !DILocation(line: 196, column: 8, scope: !234)
!242 = !DILocation(line: 200, column: 14, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !9, line: 197, column: 5)
!244 = !DILocation(line: 201, column: 5, scope: !243)
!245 = !DILocation(line: 202, column: 8, scope: !246)
!246 = distinct !DILexicalBlock(scope: !234, file: !9, line: 202, column: 8)
!247 = !DILocation(line: 202, column: 18, scope: !246)
!248 = !DILocation(line: 202, column: 8, scope: !234)
!249 = !DILocalVariable(name: "buffer", scope: !250, file: !9, line: 205, type: !56)
!250 = distinct !DILexicalBlock(scope: !251, file: !9, line: 204, column: 9)
!251 = distinct !DILexicalBlock(scope: !246, file: !9, line: 203, column: 5)
!252 = !DILocation(line: 205, column: 17, scope: !250)
!253 = !DILocation(line: 208, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !9, line: 208, column: 17)
!255 = !DILocation(line: 208, column: 22, scope: !254)
!256 = !DILocation(line: 208, column: 17, scope: !250)
!257 = !DILocation(line: 210, column: 37, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !9, line: 209, column: 13)
!259 = !DILocation(line: 210, column: 30, scope: !258)
!260 = !DILocation(line: 210, column: 17, scope: !258)
!261 = !DILocation(line: 211, column: 13, scope: !258)
!262 = !DILocation(line: 214, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !254, file: !9, line: 213, column: 13)
!264 = !DILocation(line: 217, column: 5, scope: !251)
!265 = !DILocation(line: 218, column: 1, scope: !234)
