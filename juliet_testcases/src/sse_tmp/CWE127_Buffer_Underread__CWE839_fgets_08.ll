; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_08_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 @staticReturnsTrue(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end5, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !30
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !33
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !34
  %cmp = icmp ne i8* %call1, null, !dbg !35
  br i1 %cmp, label %if.then2, label %if.else, !dbg !36

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !39
  store i32 %call4, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !44

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !45
  %tobool7 = icmp ne i32 %call6, 0, !dbg !45
  br i1 %tobool7, label %if.then8, label %if.end13, !dbg !47

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !54
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !54
  %3 = load i32, i32* %data, align 4, !dbg !55
  %cmp9 = icmp slt i32 %3, 10, !dbg !57
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !58

if.then10:                                        ; preds = %if.then8
  %4 = load i32, i32* %data, align 4, !dbg !59
  %idxprom = sext i32 %4 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !61
  %5 = load i32, i32* %arrayidx, align 4, !dbg !61
  call void @printIntLine(i32 %5), !dbg !62
  br label %if.end12, !dbg !63

if.else11:                                        ; preds = %if.then8
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  br label %if.end13, !dbg !66

if.end13:                                         ; preds = %if.end12, %if.end5
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
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_08_good() #0 !dbg !68 {
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
  call void @CWE127_Buffer_Underread__CWE839_fgets_08_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__CWE839_fgets_08_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !93 {
entry:
  ret i32 1, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  %call = call i32 @staticReturnsTrue(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.end5, !dbg !103

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !107
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !108
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !110
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !111
  %cmp = icmp ne i8* %call1, null, !dbg !112
  br i1 %cmp, label %if.then2, label %if.else, !dbg !113

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !114
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !116
  store i32 %call4, i32* %data, align 4, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !121

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsFalse(), !dbg !122
  %tobool7 = icmp ne i32 %call6, 0, !dbg !122
  br i1 %tobool7, label %if.then8, label %if.else9, !dbg !124

if.then8:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !125
  br label %if.end15, !dbg !127

if.else9:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !128, metadata !DIExpression()), !dbg !131
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !131
  %3 = load i32, i32* %data, align 4, !dbg !132
  %cmp10 = icmp sge i32 %3, 0, !dbg !134
  br i1 %cmp10, label %land.lhs.true, label %if.else13, !dbg !135

land.lhs.true:                                    ; preds = %if.else9
  %4 = load i32, i32* %data, align 4, !dbg !136
  %cmp11 = icmp slt i32 %4, 10, !dbg !137
  br i1 %cmp11, label %if.then12, label %if.else13, !dbg !138

if.then12:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !139
  %idxprom = sext i32 %5 to i64, !dbg !141
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !141
  %6 = load i32, i32* %arrayidx, align 4, !dbg !141
  call void @printIntLine(i32 %6), !dbg !142
  br label %if.end14, !dbg !143

if.else13:                                        ; preds = %land.lhs.true, %if.else9
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !144
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then12
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then8
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !147 {
entry:
  ret i32 0, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !149 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 -1, i32* %data, align 4, !dbg !152
  %call = call i32 @staticReturnsTrue(), !dbg !153
  %tobool = icmp ne i32 %call, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end5, !dbg !155

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !156, metadata !DIExpression()), !dbg !159
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !159
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !162
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !163
  %cmp = icmp ne i8* %call1, null, !dbg !164
  br i1 %cmp, label %if.then2, label %if.else, !dbg !165

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !166
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !168
  store i32 %call4, i32* %data, align 4, !dbg !169
  br label %if.end, !dbg !170

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !171
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !173

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !174
  %tobool7 = icmp ne i32 %call6, 0, !dbg !174
  br i1 %tobool7, label %if.then8, label %if.end14, !dbg !176

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !180
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !180
  %3 = load i32, i32* %data, align 4, !dbg !181
  %cmp9 = icmp sge i32 %3, 0, !dbg !183
  br i1 %cmp9, label %land.lhs.true, label %if.else12, !dbg !184

land.lhs.true:                                    ; preds = %if.then8
  %4 = load i32, i32* %data, align 4, !dbg !185
  %cmp10 = icmp slt i32 %4, 10, !dbg !186
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !187

if.then11:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !188
  %idxprom = sext i32 %5 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !190
  %6 = load i32, i32* %arrayidx, align 4, !dbg !190
  call void @printIntLine(i32 %6), !dbg !191
  br label %if.end13, !dbg !192

if.else12:                                        ; preds = %land.lhs.true, %if.then8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !193
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  br label %if.end14, !dbg !195

if.end14:                                         ; preds = %if.end13, %if.end5
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !197 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 -1, i32* %data, align 4, !dbg !200
  %call = call i32 @staticReturnsFalse(), !dbg !201
  %tobool = icmp ne i32 %call, 0, !dbg !201
  br i1 %tobool, label %if.then, label %if.else, !dbg !203

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !204
  br label %if.end, !dbg !206

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !207
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !209
  %tobool2 = icmp ne i32 %call1, 0, !dbg !209
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !211

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !212, metadata !DIExpression()), !dbg !215
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !215
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !215
  %1 = load i32, i32* %data, align 4, !dbg !216
  %cmp = icmp slt i32 %1, 10, !dbg !218
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !219

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !220
  %idxprom = sext i32 %2 to i64, !dbg !222
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !222
  %3 = load i32, i32* %arrayidx, align 4, !dbg !222
  call void @printIntLine(i32 %3), !dbg !223
  br label %if.end6, !dbg !224

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !225
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !227

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !228
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !229 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 -1, i32* %data, align 4, !dbg !232
  %call = call i32 @staticReturnsTrue(), !dbg !233
  %tobool = icmp ne i32 %call, 0, !dbg !233
  br i1 %tobool, label %if.then, label %if.end, !dbg !235

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !236
  br label %if.end, !dbg !238

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !239
  %tobool2 = icmp ne i32 %call1, 0, !dbg !239
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !241

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !242, metadata !DIExpression()), !dbg !245
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !245
  %1 = load i32, i32* %data, align 4, !dbg !246
  %cmp = icmp slt i32 %1, 10, !dbg !248
  br i1 %cmp, label %if.then4, label %if.else, !dbg !249

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !250
  %idxprom = sext i32 %2 to i64, !dbg !252
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !252
  %3 = load i32, i32* %arrayidx, align 4, !dbg !252
  call void @printIntLine(i32 %3), !dbg !253
  br label %if.end5, !dbg !254

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !255
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !257

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !258
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_08_bad", scope: !13, file: !13, line: 37, type: !14, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_08.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 39, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 39, column: 9, scope: !12)
!19 = !DILocation(line: 41, column: 10, scope: !12)
!20 = !DILocation(line: 42, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 8)
!22 = !DILocation(line: 42, column: 8, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 45, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 44, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !13, line: 43, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 45, column: 18, scope: !24)
!31 = !DILocation(line: 47, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 47, column: 17)
!33 = !DILocation(line: 47, column: 53, scope: !32)
!34 = !DILocation(line: 47, column: 17, scope: !32)
!35 = !DILocation(line: 47, column: 60, scope: !32)
!36 = !DILocation(line: 47, column: 17, scope: !24)
!37 = !DILocation(line: 50, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !13, line: 48, column: 13)
!39 = !DILocation(line: 50, column: 24, scope: !38)
!40 = !DILocation(line: 50, column: 22, scope: !38)
!41 = !DILocation(line: 51, column: 13, scope: !38)
!42 = !DILocation(line: 54, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !13, line: 53, column: 13)
!44 = !DILocation(line: 57, column: 5, scope: !25)
!45 = !DILocation(line: 58, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 58, column: 8)
!47 = !DILocation(line: 58, column: 8, scope: !12)
!48 = !DILocalVariable(name: "buffer", scope: !49, file: !13, line: 61, type: !51)
!49 = distinct !DILexicalBlock(scope: !50, file: !13, line: 60, column: 9)
!50 = distinct !DILexicalBlock(scope: !46, file: !13, line: 59, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 10)
!54 = !DILocation(line: 61, column: 17, scope: !49)
!55 = !DILocation(line: 64, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !13, line: 64, column: 17)
!57 = !DILocation(line: 64, column: 22, scope: !56)
!58 = !DILocation(line: 64, column: 17, scope: !49)
!59 = !DILocation(line: 66, column: 37, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !13, line: 65, column: 13)
!61 = !DILocation(line: 66, column: 30, scope: !60)
!62 = !DILocation(line: 66, column: 17, scope: !60)
!63 = !DILocation(line: 67, column: 13, scope: !60)
!64 = !DILocation(line: 70, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !56, file: !13, line: 69, column: 13)
!66 = !DILocation(line: 73, column: 5, scope: !50)
!67 = !DILocation(line: 74, column: 1, scope: !12)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_08_good", scope: !13, file: !13, line: 228, type: !14, scopeLine: 229, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 230, column: 5, scope: !68)
!70 = !DILocation(line: 231, column: 5, scope: !68)
!71 = !DILocation(line: 232, column: 5, scope: !68)
!72 = !DILocation(line: 233, column: 5, scope: !68)
!73 = !DILocation(line: 234, column: 1, scope: !68)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 245, type: !75, scopeLine: 246, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!17, !17, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 245, type: !17)
!80 = !DILocation(line: 245, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 245, type: !77)
!82 = !DILocation(line: 245, column: 27, scope: !74)
!83 = !DILocation(line: 248, column: 22, scope: !74)
!84 = !DILocation(line: 248, column: 12, scope: !74)
!85 = !DILocation(line: 248, column: 5, scope: !74)
!86 = !DILocation(line: 250, column: 5, scope: !74)
!87 = !DILocation(line: 251, column: 5, scope: !74)
!88 = !DILocation(line: 252, column: 5, scope: !74)
!89 = !DILocation(line: 255, column: 5, scope: !74)
!90 = !DILocation(line: 256, column: 5, scope: !74)
!91 = !DILocation(line: 257, column: 5, scope: !74)
!92 = !DILocation(line: 259, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !13, file: !13, line: 25, type: !94, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!17}
!96 = !DILocation(line: 27, column: 5, scope: !93)
!97 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 81, type: !14, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !13, line: 83, type: !17)
!99 = !DILocation(line: 83, column: 9, scope: !97)
!100 = !DILocation(line: 85, column: 10, scope: !97)
!101 = !DILocation(line: 86, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !13, line: 86, column: 8)
!103 = !DILocation(line: 86, column: 8, scope: !97)
!104 = !DILocalVariable(name: "inputBuffer", scope: !105, file: !13, line: 89, type: !26)
!105 = distinct !DILexicalBlock(scope: !106, file: !13, line: 88, column: 9)
!106 = distinct !DILexicalBlock(scope: !102, file: !13, line: 87, column: 5)
!107 = !DILocation(line: 89, column: 18, scope: !105)
!108 = !DILocation(line: 91, column: 23, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !13, line: 91, column: 17)
!110 = !DILocation(line: 91, column: 53, scope: !109)
!111 = !DILocation(line: 91, column: 17, scope: !109)
!112 = !DILocation(line: 91, column: 60, scope: !109)
!113 = !DILocation(line: 91, column: 17, scope: !105)
!114 = !DILocation(line: 94, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !13, line: 92, column: 13)
!116 = !DILocation(line: 94, column: 24, scope: !115)
!117 = !DILocation(line: 94, column: 22, scope: !115)
!118 = !DILocation(line: 95, column: 13, scope: !115)
!119 = !DILocation(line: 98, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !13, line: 97, column: 13)
!121 = !DILocation(line: 101, column: 5, scope: !106)
!122 = !DILocation(line: 102, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !97, file: !13, line: 102, column: 8)
!124 = !DILocation(line: 102, column: 8, scope: !97)
!125 = !DILocation(line: 105, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !13, line: 103, column: 5)
!127 = !DILocation(line: 106, column: 5, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !129, file: !13, line: 110, type: !51)
!129 = distinct !DILexicalBlock(scope: !130, file: !13, line: 109, column: 9)
!130 = distinct !DILexicalBlock(scope: !123, file: !13, line: 108, column: 5)
!131 = !DILocation(line: 110, column: 17, scope: !129)
!132 = !DILocation(line: 112, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 112, column: 17)
!134 = !DILocation(line: 112, column: 22, scope: !133)
!135 = !DILocation(line: 112, column: 27, scope: !133)
!136 = !DILocation(line: 112, column: 30, scope: !133)
!137 = !DILocation(line: 112, column: 35, scope: !133)
!138 = !DILocation(line: 112, column: 17, scope: !129)
!139 = !DILocation(line: 114, column: 37, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !13, line: 113, column: 13)
!141 = !DILocation(line: 114, column: 30, scope: !140)
!142 = !DILocation(line: 114, column: 17, scope: !140)
!143 = !DILocation(line: 115, column: 13, scope: !140)
!144 = !DILocation(line: 118, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !133, file: !13, line: 117, column: 13)
!146 = !DILocation(line: 122, column: 1, scope: !97)
!147 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !13, file: !13, line: 30, type: !94, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocation(line: 32, column: 5, scope: !147)
!149 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 125, type: !14, scopeLine: 126, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !13, line: 127, type: !17)
!151 = !DILocation(line: 127, column: 9, scope: !149)
!152 = !DILocation(line: 129, column: 10, scope: !149)
!153 = !DILocation(line: 130, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !13, line: 130, column: 8)
!155 = !DILocation(line: 130, column: 8, scope: !149)
!156 = !DILocalVariable(name: "inputBuffer", scope: !157, file: !13, line: 133, type: !26)
!157 = distinct !DILexicalBlock(scope: !158, file: !13, line: 132, column: 9)
!158 = distinct !DILexicalBlock(scope: !154, file: !13, line: 131, column: 5)
!159 = !DILocation(line: 133, column: 18, scope: !157)
!160 = !DILocation(line: 135, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 135, column: 17)
!162 = !DILocation(line: 135, column: 53, scope: !161)
!163 = !DILocation(line: 135, column: 17, scope: !161)
!164 = !DILocation(line: 135, column: 60, scope: !161)
!165 = !DILocation(line: 135, column: 17, scope: !157)
!166 = !DILocation(line: 138, column: 29, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !13, line: 136, column: 13)
!168 = !DILocation(line: 138, column: 24, scope: !167)
!169 = !DILocation(line: 138, column: 22, scope: !167)
!170 = !DILocation(line: 139, column: 13, scope: !167)
!171 = !DILocation(line: 142, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !161, file: !13, line: 141, column: 13)
!173 = !DILocation(line: 145, column: 5, scope: !158)
!174 = !DILocation(line: 146, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !149, file: !13, line: 146, column: 8)
!176 = !DILocation(line: 146, column: 8, scope: !149)
!177 = !DILocalVariable(name: "buffer", scope: !178, file: !13, line: 149, type: !51)
!178 = distinct !DILexicalBlock(scope: !179, file: !13, line: 148, column: 9)
!179 = distinct !DILexicalBlock(scope: !175, file: !13, line: 147, column: 5)
!180 = !DILocation(line: 149, column: 17, scope: !178)
!181 = !DILocation(line: 151, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !13, line: 151, column: 17)
!183 = !DILocation(line: 151, column: 22, scope: !182)
!184 = !DILocation(line: 151, column: 27, scope: !182)
!185 = !DILocation(line: 151, column: 30, scope: !182)
!186 = !DILocation(line: 151, column: 35, scope: !182)
!187 = !DILocation(line: 151, column: 17, scope: !178)
!188 = !DILocation(line: 153, column: 37, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !13, line: 152, column: 13)
!190 = !DILocation(line: 153, column: 30, scope: !189)
!191 = !DILocation(line: 153, column: 17, scope: !189)
!192 = !DILocation(line: 154, column: 13, scope: !189)
!193 = !DILocation(line: 157, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !182, file: !13, line: 156, column: 13)
!195 = !DILocation(line: 160, column: 5, scope: !179)
!196 = !DILocation(line: 161, column: 1, scope: !149)
!197 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 164, type: !14, scopeLine: 165, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!198 = !DILocalVariable(name: "data", scope: !197, file: !13, line: 166, type: !17)
!199 = !DILocation(line: 166, column: 9, scope: !197)
!200 = !DILocation(line: 168, column: 10, scope: !197)
!201 = !DILocation(line: 169, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !13, line: 169, column: 8)
!203 = !DILocation(line: 169, column: 8, scope: !197)
!204 = !DILocation(line: 172, column: 9, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !13, line: 170, column: 5)
!206 = !DILocation(line: 173, column: 5, scope: !205)
!207 = !DILocation(line: 178, column: 14, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !13, line: 175, column: 5)
!209 = !DILocation(line: 180, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !13, line: 180, column: 8)
!211 = !DILocation(line: 180, column: 8, scope: !197)
!212 = !DILocalVariable(name: "buffer", scope: !213, file: !13, line: 183, type: !51)
!213 = distinct !DILexicalBlock(scope: !214, file: !13, line: 182, column: 9)
!214 = distinct !DILexicalBlock(scope: !210, file: !13, line: 181, column: 5)
!215 = !DILocation(line: 183, column: 17, scope: !213)
!216 = !DILocation(line: 186, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !13, line: 186, column: 17)
!218 = !DILocation(line: 186, column: 22, scope: !217)
!219 = !DILocation(line: 186, column: 17, scope: !213)
!220 = !DILocation(line: 188, column: 37, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !13, line: 187, column: 13)
!222 = !DILocation(line: 188, column: 30, scope: !221)
!223 = !DILocation(line: 188, column: 17, scope: !221)
!224 = !DILocation(line: 189, column: 13, scope: !221)
!225 = !DILocation(line: 192, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !217, file: !13, line: 191, column: 13)
!227 = !DILocation(line: 195, column: 5, scope: !214)
!228 = !DILocation(line: 196, column: 1, scope: !197)
!229 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 199, type: !14, scopeLine: 200, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!230 = !DILocalVariable(name: "data", scope: !229, file: !13, line: 201, type: !17)
!231 = !DILocation(line: 201, column: 9, scope: !229)
!232 = !DILocation(line: 203, column: 10, scope: !229)
!233 = !DILocation(line: 204, column: 8, scope: !234)
!234 = distinct !DILexicalBlock(scope: !229, file: !13, line: 204, column: 8)
!235 = !DILocation(line: 204, column: 8, scope: !229)
!236 = !DILocation(line: 208, column: 14, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !13, line: 205, column: 5)
!238 = !DILocation(line: 209, column: 5, scope: !237)
!239 = !DILocation(line: 210, column: 8, scope: !240)
!240 = distinct !DILexicalBlock(scope: !229, file: !13, line: 210, column: 8)
!241 = !DILocation(line: 210, column: 8, scope: !229)
!242 = !DILocalVariable(name: "buffer", scope: !243, file: !13, line: 213, type: !51)
!243 = distinct !DILexicalBlock(scope: !244, file: !13, line: 212, column: 9)
!244 = distinct !DILexicalBlock(scope: !240, file: !13, line: 211, column: 5)
!245 = !DILocation(line: 213, column: 17, scope: !243)
!246 = !DILocation(line: 216, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !13, line: 216, column: 17)
!248 = !DILocation(line: 216, column: 22, scope: !247)
!249 = !DILocation(line: 216, column: 17, scope: !243)
!250 = !DILocation(line: 218, column: 37, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !13, line: 217, column: 13)
!252 = !DILocation(line: 218, column: 30, scope: !251)
!253 = !DILocation(line: 218, column: 17, scope: !251)
!254 = !DILocation(line: 219, column: 13, scope: !251)
!255 = !DILocation(line: 222, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !247, file: !13, line: 221, column: 13)
!257 = !DILocation(line: 225, column: 5, scope: !244)
!258 = !DILocation(line: 226, column: 1, scope: !229)
