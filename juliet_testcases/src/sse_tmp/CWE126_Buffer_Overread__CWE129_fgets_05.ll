; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end4, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !28, metadata !DIExpression()), !dbg !35
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !39
  %cmp = icmp ne i8* %call, null, !dbg !40
  br i1 %cmp, label %if.then1, label %if.else, !dbg !41

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !42
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !44
  store i32 %call3, i32* %data, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !49

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !50
  %tobool5 = icmp ne i32 %3, 0, !dbg !50
  br i1 %tobool5, label %if.then6, label %if.end11, !dbg !52

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !53, metadata !DIExpression()), !dbg !59
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !59
  %5 = load i32, i32* %data, align 4, !dbg !60
  %cmp7 = icmp sge i32 %5, 0, !dbg !62
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !63

if.then8:                                         ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !64
  %idxprom = sext i32 %6 to i64, !dbg !66
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !66
  %7 = load i32, i32* %arrayidx, align 4, !dbg !66
  call void @printIntLine(i32 %7), !dbg !67
  br label %if.end10, !dbg !68

if.else9:                                         ; preds = %if.then6
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.then8
  br label %if.end11, !dbg !71

if.end11:                                         ; preds = %if.end10, %if.end4
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_05_good() #0 !dbg !73 {
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
  call void @CWE126_Buffer_Overread__CWE129_fgets_05_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  call void @CWE126_Buffer_Overread__CWE129_fgets_05_bad(), !dbg !95
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !102
  %tobool = icmp ne i32 %0, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.end4, !dbg !104

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !105, metadata !DIExpression()), !dbg !108
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !109
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !111
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !112
  %cmp = icmp ne i8* %call, null, !dbg !113
  br i1 %cmp, label %if.then1, label %if.else, !dbg !114

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !117
  store i32 %call3, i32* %data, align 4, !dbg !118
  br label %if.end, !dbg !119

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !122

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFalse, align 4, !dbg !123
  %tobool5 = icmp ne i32 %3, 0, !dbg !123
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !125

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !126
  br label %if.end13, !dbg !128

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !129, metadata !DIExpression()), !dbg !132
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !132
  %5 = load i32, i32* %data, align 4, !dbg !133
  %cmp8 = icmp sge i32 %5, 0, !dbg !135
  br i1 %cmp8, label %land.lhs.true, label %if.else11, !dbg !136

land.lhs.true:                                    ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !137
  %cmp9 = icmp slt i32 %6, 10, !dbg !138
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !139

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !140
  %idxprom = sext i32 %7 to i64, !dbg !142
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !142
  %8 = load i32, i32* %arrayidx, align 4, !dbg !142
  call void @printIntLine(i32 %8), !dbg !143
  br label %if.end12, !dbg !144

if.else11:                                        ; preds = %land.lhs.true, %if.else7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !145
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then6
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %0 = load i32, i32* @staticTrue, align 4, !dbg !152
  %tobool = icmp ne i32 %0, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end4, !dbg !154

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !155, metadata !DIExpression()), !dbg !158
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !161
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !162
  %cmp = icmp ne i8* %call, null, !dbg !163
  br i1 %cmp, label %if.then1, label %if.else, !dbg !164

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !167
  store i32 %call3, i32* %data, align 4, !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !172

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !173
  %tobool5 = icmp ne i32 %3, 0, !dbg !173
  br i1 %tobool5, label %if.then6, label %if.end12, !dbg !175

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !176, metadata !DIExpression()), !dbg !179
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !179
  %5 = load i32, i32* %data, align 4, !dbg !180
  %cmp7 = icmp sge i32 %5, 0, !dbg !182
  br i1 %cmp7, label %land.lhs.true, label %if.else10, !dbg !183

land.lhs.true:                                    ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !184
  %cmp8 = icmp slt i32 %6, 10, !dbg !185
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !186

if.then9:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !187
  %idxprom = sext i32 %7 to i64, !dbg !189
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !189
  %8 = load i32, i32* %arrayidx, align 4, !dbg !189
  call void @printIntLine(i32 %8), !dbg !190
  br label %if.end11, !dbg !191

if.else10:                                        ; preds = %land.lhs.true, %if.then6
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !192
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end12, !dbg !194

if.end12:                                         ; preds = %if.end11, %if.end4
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !196 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 -1, i32* %data, align 4, !dbg !199
  %0 = load i32, i32* @staticFalse, align 4, !dbg !200
  %tobool = icmp ne i32 %0, 0, !dbg !200
  br i1 %tobool, label %if.then, label %if.else, !dbg !202

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !203
  br label %if.end, !dbg !205

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !206
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !208
  %tobool1 = icmp ne i32 %1, 0, !dbg !208
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !210

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !211, metadata !DIExpression()), !dbg !214
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !214
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !214
  %3 = load i32, i32* %data, align 4, !dbg !215
  %cmp = icmp sge i32 %3, 0, !dbg !217
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !218

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !219
  %idxprom = sext i32 %4 to i64, !dbg !221
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !221
  %5 = load i32, i32* %arrayidx, align 4, !dbg !221
  call void @printIntLine(i32 %5), !dbg !222
  br label %if.end5, !dbg !223

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !224
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !226

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !228 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !229, metadata !DIExpression()), !dbg !230
  store i32 -1, i32* %data, align 4, !dbg !231
  %0 = load i32, i32* @staticTrue, align 4, !dbg !232
  %tobool = icmp ne i32 %0, 0, !dbg !232
  br i1 %tobool, label %if.then, label %if.end, !dbg !234

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !235
  br label %if.end, !dbg !237

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !238
  %tobool1 = icmp ne i32 %1, 0, !dbg !238
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !240

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !241, metadata !DIExpression()), !dbg !244
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !244
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !244
  %3 = load i32, i32* %data, align 4, !dbg !245
  %cmp = icmp sge i32 %3, 0, !dbg !247
  br i1 %cmp, label %if.then3, label %if.else, !dbg !248

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !249
  %idxprom = sext i32 %4 to i64, !dbg !251
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !251
  %5 = load i32, i32* %arrayidx, align 4, !dbg !251
  call void @printIntLine(i32 %5), !dbg !252
  br label %if.end4, !dbg !253

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !254
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !256

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !257
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
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 26, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_05.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_05_bad", scope: !11, file: !11, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 32, type: !12)
!23 = !DILocation(line: 32, column: 9, scope: !19)
!24 = !DILocation(line: 34, column: 10, scope: !19)
!25 = !DILocation(line: 35, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 35, column: 8)
!27 = !DILocation(line: 35, column: 8, scope: !19)
!28 = !DILocalVariable(name: "inputBuffer", scope: !29, file: !11, line: 38, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 36, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 112, elements: !33)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 14)
!35 = !DILocation(line: 38, column: 18, scope: !29)
!36 = !DILocation(line: 40, column: 23, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !11, line: 40, column: 17)
!38 = !DILocation(line: 40, column: 53, scope: !37)
!39 = !DILocation(line: 40, column: 17, scope: !37)
!40 = !DILocation(line: 40, column: 60, scope: !37)
!41 = !DILocation(line: 40, column: 17, scope: !29)
!42 = !DILocation(line: 43, column: 29, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !11, line: 41, column: 13)
!44 = !DILocation(line: 43, column: 24, scope: !43)
!45 = !DILocation(line: 43, column: 22, scope: !43)
!46 = !DILocation(line: 44, column: 13, scope: !43)
!47 = !DILocation(line: 47, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !11, line: 46, column: 13)
!49 = !DILocation(line: 50, column: 5, scope: !30)
!50 = !DILocation(line: 51, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !19, file: !11, line: 51, column: 8)
!52 = !DILocation(line: 51, column: 8, scope: !19)
!53 = !DILocalVariable(name: "buffer", scope: !54, file: !11, line: 54, type: !56)
!54 = distinct !DILexicalBlock(scope: !55, file: !11, line: 53, column: 9)
!55 = distinct !DILexicalBlock(scope: !51, file: !11, line: 52, column: 5)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 10)
!59 = !DILocation(line: 54, column: 17, scope: !54)
!60 = !DILocation(line: 57, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !54, file: !11, line: 57, column: 17)
!62 = !DILocation(line: 57, column: 22, scope: !61)
!63 = !DILocation(line: 57, column: 17, scope: !54)
!64 = !DILocation(line: 59, column: 37, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !11, line: 58, column: 13)
!66 = !DILocation(line: 59, column: 30, scope: !65)
!67 = !DILocation(line: 59, column: 17, scope: !65)
!68 = !DILocation(line: 60, column: 13, scope: !65)
!69 = !DILocation(line: 63, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !61, file: !11, line: 62, column: 13)
!71 = !DILocation(line: 66, column: 5, scope: !55)
!72 = !DILocation(line: 67, column: 1, scope: !19)
!73 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_05_good", scope: !11, file: !11, line: 221, type: !20, scopeLine: 222, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 223, column: 5, scope: !73)
!75 = !DILocation(line: 224, column: 5, scope: !73)
!76 = !DILocation(line: 225, column: 5, scope: !73)
!77 = !DILocation(line: 226, column: 5, scope: !73)
!78 = !DILocation(line: 227, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 238, type: !80, scopeLine: 239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!12, !12, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !11, line: 238, type: !12)
!85 = !DILocation(line: 238, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !11, line: 238, type: !82)
!87 = !DILocation(line: 238, column: 27, scope: !79)
!88 = !DILocation(line: 241, column: 22, scope: !79)
!89 = !DILocation(line: 241, column: 12, scope: !79)
!90 = !DILocation(line: 241, column: 5, scope: !79)
!91 = !DILocation(line: 243, column: 5, scope: !79)
!92 = !DILocation(line: 244, column: 5, scope: !79)
!93 = !DILocation(line: 245, column: 5, scope: !79)
!94 = !DILocation(line: 248, column: 5, scope: !79)
!95 = !DILocation(line: 249, column: 5, scope: !79)
!96 = !DILocation(line: 250, column: 5, scope: !79)
!97 = !DILocation(line: 252, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !11, line: 76, type: !12)
!100 = !DILocation(line: 76, column: 9, scope: !98)
!101 = !DILocation(line: 78, column: 10, scope: !98)
!102 = !DILocation(line: 79, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !11, line: 79, column: 8)
!104 = !DILocation(line: 79, column: 8, scope: !98)
!105 = !DILocalVariable(name: "inputBuffer", scope: !106, file: !11, line: 82, type: !31)
!106 = distinct !DILexicalBlock(scope: !107, file: !11, line: 81, column: 9)
!107 = distinct !DILexicalBlock(scope: !103, file: !11, line: 80, column: 5)
!108 = !DILocation(line: 82, column: 18, scope: !106)
!109 = !DILocation(line: 84, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !11, line: 84, column: 17)
!111 = !DILocation(line: 84, column: 53, scope: !110)
!112 = !DILocation(line: 84, column: 17, scope: !110)
!113 = !DILocation(line: 84, column: 60, scope: !110)
!114 = !DILocation(line: 84, column: 17, scope: !106)
!115 = !DILocation(line: 87, column: 29, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !11, line: 85, column: 13)
!117 = !DILocation(line: 87, column: 24, scope: !116)
!118 = !DILocation(line: 87, column: 22, scope: !116)
!119 = !DILocation(line: 88, column: 13, scope: !116)
!120 = !DILocation(line: 91, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !110, file: !11, line: 90, column: 13)
!122 = !DILocation(line: 94, column: 5, scope: !107)
!123 = !DILocation(line: 95, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !98, file: !11, line: 95, column: 8)
!125 = !DILocation(line: 95, column: 8, scope: !98)
!126 = !DILocation(line: 98, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !11, line: 96, column: 5)
!128 = !DILocation(line: 99, column: 5, scope: !127)
!129 = !DILocalVariable(name: "buffer", scope: !130, file: !11, line: 103, type: !56)
!130 = distinct !DILexicalBlock(scope: !131, file: !11, line: 102, column: 9)
!131 = distinct !DILexicalBlock(scope: !124, file: !11, line: 101, column: 5)
!132 = !DILocation(line: 103, column: 17, scope: !130)
!133 = !DILocation(line: 105, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !11, line: 105, column: 17)
!135 = !DILocation(line: 105, column: 22, scope: !134)
!136 = !DILocation(line: 105, column: 27, scope: !134)
!137 = !DILocation(line: 105, column: 30, scope: !134)
!138 = !DILocation(line: 105, column: 35, scope: !134)
!139 = !DILocation(line: 105, column: 17, scope: !130)
!140 = !DILocation(line: 107, column: 37, scope: !141)
!141 = distinct !DILexicalBlock(scope: !134, file: !11, line: 106, column: 13)
!142 = !DILocation(line: 107, column: 30, scope: !141)
!143 = !DILocation(line: 107, column: 17, scope: !141)
!144 = !DILocation(line: 108, column: 13, scope: !141)
!145 = !DILocation(line: 111, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !134, file: !11, line: 110, column: 13)
!147 = !DILocation(line: 115, column: 1, scope: !98)
!148 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 118, type: !20, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", scope: !148, file: !11, line: 120, type: !12)
!150 = !DILocation(line: 120, column: 9, scope: !148)
!151 = !DILocation(line: 122, column: 10, scope: !148)
!152 = !DILocation(line: 123, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !11, line: 123, column: 8)
!154 = !DILocation(line: 123, column: 8, scope: !148)
!155 = !DILocalVariable(name: "inputBuffer", scope: !156, file: !11, line: 126, type: !31)
!156 = distinct !DILexicalBlock(scope: !157, file: !11, line: 125, column: 9)
!157 = distinct !DILexicalBlock(scope: !153, file: !11, line: 124, column: 5)
!158 = !DILocation(line: 126, column: 18, scope: !156)
!159 = !DILocation(line: 128, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !11, line: 128, column: 17)
!161 = !DILocation(line: 128, column: 53, scope: !160)
!162 = !DILocation(line: 128, column: 17, scope: !160)
!163 = !DILocation(line: 128, column: 60, scope: !160)
!164 = !DILocation(line: 128, column: 17, scope: !156)
!165 = !DILocation(line: 131, column: 29, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !11, line: 129, column: 13)
!167 = !DILocation(line: 131, column: 24, scope: !166)
!168 = !DILocation(line: 131, column: 22, scope: !166)
!169 = !DILocation(line: 132, column: 13, scope: !166)
!170 = !DILocation(line: 135, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !160, file: !11, line: 134, column: 13)
!172 = !DILocation(line: 138, column: 5, scope: !157)
!173 = !DILocation(line: 139, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !148, file: !11, line: 139, column: 8)
!175 = !DILocation(line: 139, column: 8, scope: !148)
!176 = !DILocalVariable(name: "buffer", scope: !177, file: !11, line: 142, type: !56)
!177 = distinct !DILexicalBlock(scope: !178, file: !11, line: 141, column: 9)
!178 = distinct !DILexicalBlock(scope: !174, file: !11, line: 140, column: 5)
!179 = !DILocation(line: 142, column: 17, scope: !177)
!180 = !DILocation(line: 144, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !11, line: 144, column: 17)
!182 = !DILocation(line: 144, column: 22, scope: !181)
!183 = !DILocation(line: 144, column: 27, scope: !181)
!184 = !DILocation(line: 144, column: 30, scope: !181)
!185 = !DILocation(line: 144, column: 35, scope: !181)
!186 = !DILocation(line: 144, column: 17, scope: !177)
!187 = !DILocation(line: 146, column: 37, scope: !188)
!188 = distinct !DILexicalBlock(scope: !181, file: !11, line: 145, column: 13)
!189 = !DILocation(line: 146, column: 30, scope: !188)
!190 = !DILocation(line: 146, column: 17, scope: !188)
!191 = !DILocation(line: 147, column: 13, scope: !188)
!192 = !DILocation(line: 150, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !181, file: !11, line: 149, column: 13)
!194 = !DILocation(line: 153, column: 5, scope: !178)
!195 = !DILocation(line: 154, column: 1, scope: !148)
!196 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 157, type: !20, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DILocalVariable(name: "data", scope: !196, file: !11, line: 159, type: !12)
!198 = !DILocation(line: 159, column: 9, scope: !196)
!199 = !DILocation(line: 161, column: 10, scope: !196)
!200 = !DILocation(line: 162, column: 8, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !11, line: 162, column: 8)
!202 = !DILocation(line: 162, column: 8, scope: !196)
!203 = !DILocation(line: 165, column: 9, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !11, line: 163, column: 5)
!205 = !DILocation(line: 166, column: 5, scope: !204)
!206 = !DILocation(line: 171, column: 14, scope: !207)
!207 = distinct !DILexicalBlock(scope: !201, file: !11, line: 168, column: 5)
!208 = !DILocation(line: 173, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !196, file: !11, line: 173, column: 8)
!210 = !DILocation(line: 173, column: 8, scope: !196)
!211 = !DILocalVariable(name: "buffer", scope: !212, file: !11, line: 176, type: !56)
!212 = distinct !DILexicalBlock(scope: !213, file: !11, line: 175, column: 9)
!213 = distinct !DILexicalBlock(scope: !209, file: !11, line: 174, column: 5)
!214 = !DILocation(line: 176, column: 17, scope: !212)
!215 = !DILocation(line: 179, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !11, line: 179, column: 17)
!217 = !DILocation(line: 179, column: 22, scope: !216)
!218 = !DILocation(line: 179, column: 17, scope: !212)
!219 = !DILocation(line: 181, column: 37, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !11, line: 180, column: 13)
!221 = !DILocation(line: 181, column: 30, scope: !220)
!222 = !DILocation(line: 181, column: 17, scope: !220)
!223 = !DILocation(line: 182, column: 13, scope: !220)
!224 = !DILocation(line: 185, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !216, file: !11, line: 184, column: 13)
!226 = !DILocation(line: 188, column: 5, scope: !213)
!227 = !DILocation(line: 189, column: 1, scope: !196)
!228 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 192, type: !20, scopeLine: 193, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!229 = !DILocalVariable(name: "data", scope: !228, file: !11, line: 194, type: !12)
!230 = !DILocation(line: 194, column: 9, scope: !228)
!231 = !DILocation(line: 196, column: 10, scope: !228)
!232 = !DILocation(line: 197, column: 8, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !11, line: 197, column: 8)
!234 = !DILocation(line: 197, column: 8, scope: !228)
!235 = !DILocation(line: 201, column: 14, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !11, line: 198, column: 5)
!237 = !DILocation(line: 202, column: 5, scope: !236)
!238 = !DILocation(line: 203, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !228, file: !11, line: 203, column: 8)
!240 = !DILocation(line: 203, column: 8, scope: !228)
!241 = !DILocalVariable(name: "buffer", scope: !242, file: !11, line: 206, type: !56)
!242 = distinct !DILexicalBlock(scope: !243, file: !11, line: 205, column: 9)
!243 = distinct !DILexicalBlock(scope: !239, file: !11, line: 204, column: 5)
!244 = !DILocation(line: 206, column: 17, scope: !242)
!245 = !DILocation(line: 209, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !11, line: 209, column: 17)
!247 = !DILocation(line: 209, column: 22, scope: !246)
!248 = !DILocation(line: 209, column: 17, scope: !242)
!249 = !DILocation(line: 211, column: 37, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !11, line: 210, column: 13)
!251 = !DILocation(line: 211, column: 30, scope: !250)
!252 = !DILocation(line: 211, column: 17, scope: !250)
!253 = !DILocation(line: 212, column: 13, scope: !250)
!254 = !DILocation(line: 215, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !246, file: !11, line: 214, column: 13)
!256 = !DILocation(line: 218, column: 5, scope: !243)
!257 = !DILocation(line: 219, column: 1, scope: !228)
