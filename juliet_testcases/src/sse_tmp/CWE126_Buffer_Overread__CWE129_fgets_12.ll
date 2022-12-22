; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_12_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer15 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else5, !dbg !22

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
  br label %if.end6, !dbg !44

if.else5:                                         ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !45
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.end
  %call7 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !47
  %tobool8 = icmp ne i32 %call7, 0, !dbg !47
  br i1 %tobool8, label %if.then9, label %if.else14, !dbg !49

if.then9:                                         ; preds = %if.end6
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !50, metadata !DIExpression()), !dbg !56
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !56
  %3 = load i32, i32* %data, align 4, !dbg !57
  %cmp10 = icmp sge i32 %3, 0, !dbg !59
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !60

if.then11:                                        ; preds = %if.then9
  %4 = load i32, i32* %data, align 4, !dbg !61
  %idxprom = sext i32 %4 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !63
  %5 = load i32, i32* %arrayidx, align 4, !dbg !63
  call void @printIntLine(i32 %5), !dbg !64
  br label %if.end13, !dbg !65

if.else12:                                        ; preds = %if.then9
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  br label %if.end23, !dbg !68

if.else14:                                        ; preds = %if.end6
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer15, metadata !69, metadata !DIExpression()), !dbg !72
  %6 = bitcast [10 x i32]* %buffer15 to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !72
  %7 = load i32, i32* %data, align 4, !dbg !73
  %cmp16 = icmp sge i32 %7, 0, !dbg !75
  br i1 %cmp16, label %land.lhs.true, label %if.else21, !dbg !76

land.lhs.true:                                    ; preds = %if.else14
  %8 = load i32, i32* %data, align 4, !dbg !77
  %cmp17 = icmp slt i32 %8, 10, !dbg !78
  br i1 %cmp17, label %if.then18, label %if.else21, !dbg !79

if.then18:                                        ; preds = %land.lhs.true
  %9 = load i32, i32* %data, align 4, !dbg !80
  %idxprom19 = sext i32 %9 to i64, !dbg !82
  %arrayidx20 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer15, i64 0, i64 %idxprom19, !dbg !82
  %10 = load i32, i32* %arrayidx20, align 4, !dbg !82
  call void @printIntLine(i32 %10), !dbg !83
  br label %if.end22, !dbg !84

if.else21:                                        ; preds = %land.lhs.true, %if.else14
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then18
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.end13
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #2

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_12_good() #0 !dbg !88 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__CWE129_fgets_12_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__CWE129_fgets_12_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !111 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %inputBuffer6 = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer25 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %data, align 4, !dbg !114
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else5, !dbg !117

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !118, metadata !DIExpression()), !dbg !121
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !121
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !122
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !124
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !125
  %cmp = icmp ne i8* %call1, null, !dbg !126
  br i1 %cmp, label %if.then2, label %if.else, !dbg !127

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !128
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !130
  store i32 %call4, i32* %data, align 4, !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end15, !dbg !135

if.else5:                                         ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer6, metadata !136, metadata !DIExpression()), !dbg !139
  %2 = bitcast [14 x i8]* %inputBuffer6 to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !139
  %arraydecay7 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !140
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !142
  %call8 = call i8* @fgets(i8* %arraydecay7, i32 14, %struct._IO_FILE* %3), !dbg !143
  %cmp9 = icmp ne i8* %call8, null, !dbg !144
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !145

if.then10:                                        ; preds = %if.else5
  %arraydecay11 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !146
  %call12 = call i32 @atoi(i8* %arraydecay11) #6, !dbg !148
  store i32 %call12, i32* %data, align 4, !dbg !149
  br label %if.end14, !dbg !150

if.else13:                                        ; preds = %if.else5
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !151
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  %call16 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !153
  %tobool17 = icmp ne i32 %call16, 0, !dbg !153
  br i1 %tobool17, label %if.then18, label %if.else24, !dbg !155

if.then18:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !156, metadata !DIExpression()), !dbg !159
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !159
  %5 = load i32, i32* %data, align 4, !dbg !160
  %cmp19 = icmp sge i32 %5, 0, !dbg !162
  br i1 %cmp19, label %land.lhs.true, label %if.else22, !dbg !163

land.lhs.true:                                    ; preds = %if.then18
  %6 = load i32, i32* %data, align 4, !dbg !164
  %cmp20 = icmp slt i32 %6, 10, !dbg !165
  br i1 %cmp20, label %if.then21, label %if.else22, !dbg !166

if.then21:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !167
  %idxprom = sext i32 %7 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !169
  %8 = load i32, i32* %arrayidx, align 4, !dbg !169
  call void @printIntLine(i32 %8), !dbg !170
  br label %if.end23, !dbg !171

if.else22:                                        ; preds = %land.lhs.true, %if.then18
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !172
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %if.then21
  br label %if.end34, !dbg !174

if.else24:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer25, metadata !175, metadata !DIExpression()), !dbg !178
  %9 = bitcast [10 x i32]* %buffer25 to i8*, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 40, i1 false), !dbg !178
  %10 = load i32, i32* %data, align 4, !dbg !179
  %cmp26 = icmp sge i32 %10, 0, !dbg !181
  br i1 %cmp26, label %land.lhs.true27, label %if.else32, !dbg !182

land.lhs.true27:                                  ; preds = %if.else24
  %11 = load i32, i32* %data, align 4, !dbg !183
  %cmp28 = icmp slt i32 %11, 10, !dbg !184
  br i1 %cmp28, label %if.then29, label %if.else32, !dbg !185

if.then29:                                        ; preds = %land.lhs.true27
  %12 = load i32, i32* %data, align 4, !dbg !186
  %idxprom30 = sext i32 %12 to i64, !dbg !188
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer25, i64 0, i64 %idxprom30, !dbg !188
  %13 = load i32, i32* %arrayidx31, align 4, !dbg !188
  call void @printIntLine(i32 %13), !dbg !189
  br label %if.end33, !dbg !190

if.else32:                                        ; preds = %land.lhs.true27, %if.else24
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !191
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.then29
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end23
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 -1, i32* %data, align 4, !dbg !197
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !198
  %tobool = icmp ne i32 %call, 0, !dbg !198
  br i1 %tobool, label %if.then, label %if.else, !dbg !200

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !201
  br label %if.end, !dbg !203

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !204
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !206
  %tobool2 = icmp ne i32 %call1, 0, !dbg !206
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !208

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !209, metadata !DIExpression()), !dbg !212
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !212
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !212
  %1 = load i32, i32* %data, align 4, !dbg !213
  %cmp = icmp sge i32 %1, 0, !dbg !215
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !216

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !217
  %idxprom = sext i32 %2 to i64, !dbg !219
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !219
  %3 = load i32, i32* %arrayidx, align 4, !dbg !219
  call void @printIntLine(i32 %3), !dbg !220
  br label %if.end6, !dbg !221

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !222
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !224

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !225, metadata !DIExpression()), !dbg !228
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !228
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !228
  %5 = load i32, i32* %data, align 4, !dbg !229
  %cmp9 = icmp sge i32 %5, 0, !dbg !231
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !232

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !233
  %idxprom11 = sext i32 %6 to i64, !dbg !235
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !235
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !235
  call void @printIntLine(i32 %7), !dbg !236
  br label %if.end14, !dbg !237

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !238
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !240
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_12.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_12_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_12.c", directory: "/root/SSE-Assessment")
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
!45 = !DILocation(line: 49, column: 14, scope: !46)
!46 = distinct !DILexicalBlock(scope: !21, file: !13, line: 46, column: 5)
!47 = !DILocation(line: 51, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !12, file: !13, line: 51, column: 8)
!49 = !DILocation(line: 51, column: 8, scope: !12)
!50 = !DILocalVariable(name: "buffer", scope: !51, file: !13, line: 54, type: !53)
!51 = distinct !DILexicalBlock(scope: !52, file: !13, line: 53, column: 9)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 52, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 10)
!56 = !DILocation(line: 54, column: 17, scope: !51)
!57 = !DILocation(line: 57, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !13, line: 57, column: 17)
!59 = !DILocation(line: 57, column: 22, scope: !58)
!60 = !DILocation(line: 57, column: 17, scope: !51)
!61 = !DILocation(line: 59, column: 37, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 58, column: 13)
!63 = !DILocation(line: 59, column: 30, scope: !62)
!64 = !DILocation(line: 59, column: 17, scope: !62)
!65 = !DILocation(line: 60, column: 13, scope: !62)
!66 = !DILocation(line: 63, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !58, file: !13, line: 62, column: 13)
!68 = !DILocation(line: 66, column: 5, scope: !52)
!69 = !DILocalVariable(name: "buffer", scope: !70, file: !13, line: 70, type: !53)
!70 = distinct !DILexicalBlock(scope: !71, file: !13, line: 69, column: 9)
!71 = distinct !DILexicalBlock(scope: !48, file: !13, line: 68, column: 5)
!72 = !DILocation(line: 70, column: 17, scope: !70)
!73 = !DILocation(line: 72, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !13, line: 72, column: 17)
!75 = !DILocation(line: 72, column: 22, scope: !74)
!76 = !DILocation(line: 72, column: 27, scope: !74)
!77 = !DILocation(line: 72, column: 30, scope: !74)
!78 = !DILocation(line: 72, column: 35, scope: !74)
!79 = !DILocation(line: 72, column: 17, scope: !70)
!80 = !DILocation(line: 74, column: 37, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !13, line: 73, column: 13)
!82 = !DILocation(line: 74, column: 30, scope: !81)
!83 = !DILocation(line: 74, column: 17, scope: !81)
!84 = !DILocation(line: 75, column: 13, scope: !81)
!85 = !DILocation(line: 78, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !74, file: !13, line: 77, column: 13)
!87 = !DILocation(line: 82, column: 1, scope: !12)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_12_good", scope: !13, file: !13, line: 214, type: !14, scopeLine: 215, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 216, column: 5, scope: !88)
!90 = !DILocation(line: 217, column: 5, scope: !88)
!91 = !DILocation(line: 218, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 229, type: !93, scopeLine: 230, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!17, !17, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !13, line: 229, type: !17)
!98 = !DILocation(line: 229, column: 14, scope: !92)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !13, line: 229, type: !95)
!100 = !DILocation(line: 229, column: 27, scope: !92)
!101 = !DILocation(line: 232, column: 22, scope: !92)
!102 = !DILocation(line: 232, column: 12, scope: !92)
!103 = !DILocation(line: 232, column: 5, scope: !92)
!104 = !DILocation(line: 234, column: 5, scope: !92)
!105 = !DILocation(line: 235, column: 5, scope: !92)
!106 = !DILocation(line: 236, column: 5, scope: !92)
!107 = !DILocation(line: 239, column: 5, scope: !92)
!108 = !DILocation(line: 240, column: 5, scope: !92)
!109 = !DILocation(line: 241, column: 5, scope: !92)
!110 = !DILocation(line: 243, column: 5, scope: !92)
!111 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 91, type: !14, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !13, line: 93, type: !17)
!113 = !DILocation(line: 93, column: 9, scope: !111)
!114 = !DILocation(line: 95, column: 10, scope: !111)
!115 = !DILocation(line: 96, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !13, line: 96, column: 8)
!117 = !DILocation(line: 96, column: 8, scope: !111)
!118 = !DILocalVariable(name: "inputBuffer", scope: !119, file: !13, line: 99, type: !26)
!119 = distinct !DILexicalBlock(scope: !120, file: !13, line: 98, column: 9)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 97, column: 5)
!121 = !DILocation(line: 99, column: 18, scope: !119)
!122 = !DILocation(line: 101, column: 23, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !13, line: 101, column: 17)
!124 = !DILocation(line: 101, column: 53, scope: !123)
!125 = !DILocation(line: 101, column: 17, scope: !123)
!126 = !DILocation(line: 101, column: 60, scope: !123)
!127 = !DILocation(line: 101, column: 17, scope: !119)
!128 = !DILocation(line: 104, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !13, line: 102, column: 13)
!130 = !DILocation(line: 104, column: 24, scope: !129)
!131 = !DILocation(line: 104, column: 22, scope: !129)
!132 = !DILocation(line: 105, column: 13, scope: !129)
!133 = !DILocation(line: 108, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !123, file: !13, line: 107, column: 13)
!135 = !DILocation(line: 111, column: 5, scope: !120)
!136 = !DILocalVariable(name: "inputBuffer", scope: !137, file: !13, line: 115, type: !26)
!137 = distinct !DILexicalBlock(scope: !138, file: !13, line: 114, column: 9)
!138 = distinct !DILexicalBlock(scope: !116, file: !13, line: 113, column: 5)
!139 = !DILocation(line: 115, column: 18, scope: !137)
!140 = !DILocation(line: 117, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !13, line: 117, column: 17)
!142 = !DILocation(line: 117, column: 53, scope: !141)
!143 = !DILocation(line: 117, column: 17, scope: !141)
!144 = !DILocation(line: 117, column: 60, scope: !141)
!145 = !DILocation(line: 117, column: 17, scope: !137)
!146 = !DILocation(line: 120, column: 29, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !13, line: 118, column: 13)
!148 = !DILocation(line: 120, column: 24, scope: !147)
!149 = !DILocation(line: 120, column: 22, scope: !147)
!150 = !DILocation(line: 121, column: 13, scope: !147)
!151 = !DILocation(line: 124, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !141, file: !13, line: 123, column: 13)
!153 = !DILocation(line: 128, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !111, file: !13, line: 128, column: 8)
!155 = !DILocation(line: 128, column: 8, scope: !111)
!156 = !DILocalVariable(name: "buffer", scope: !157, file: !13, line: 131, type: !53)
!157 = distinct !DILexicalBlock(scope: !158, file: !13, line: 130, column: 9)
!158 = distinct !DILexicalBlock(scope: !154, file: !13, line: 129, column: 5)
!159 = !DILocation(line: 131, column: 17, scope: !157)
!160 = !DILocation(line: 133, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 133, column: 17)
!162 = !DILocation(line: 133, column: 22, scope: !161)
!163 = !DILocation(line: 133, column: 27, scope: !161)
!164 = !DILocation(line: 133, column: 30, scope: !161)
!165 = !DILocation(line: 133, column: 35, scope: !161)
!166 = !DILocation(line: 133, column: 17, scope: !157)
!167 = !DILocation(line: 135, column: 37, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !13, line: 134, column: 13)
!169 = !DILocation(line: 135, column: 30, scope: !168)
!170 = !DILocation(line: 135, column: 17, scope: !168)
!171 = !DILocation(line: 136, column: 13, scope: !168)
!172 = !DILocation(line: 139, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !13, line: 138, column: 13)
!174 = !DILocation(line: 142, column: 5, scope: !158)
!175 = !DILocalVariable(name: "buffer", scope: !176, file: !13, line: 146, type: !53)
!176 = distinct !DILexicalBlock(scope: !177, file: !13, line: 145, column: 9)
!177 = distinct !DILexicalBlock(scope: !154, file: !13, line: 144, column: 5)
!178 = !DILocation(line: 146, column: 17, scope: !176)
!179 = !DILocation(line: 148, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !13, line: 148, column: 17)
!181 = !DILocation(line: 148, column: 22, scope: !180)
!182 = !DILocation(line: 148, column: 27, scope: !180)
!183 = !DILocation(line: 148, column: 30, scope: !180)
!184 = !DILocation(line: 148, column: 35, scope: !180)
!185 = !DILocation(line: 148, column: 17, scope: !176)
!186 = !DILocation(line: 150, column: 37, scope: !187)
!187 = distinct !DILexicalBlock(scope: !180, file: !13, line: 149, column: 13)
!188 = !DILocation(line: 150, column: 30, scope: !187)
!189 = !DILocation(line: 150, column: 17, scope: !187)
!190 = !DILocation(line: 151, column: 13, scope: !187)
!191 = !DILocation(line: 154, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !180, file: !13, line: 153, column: 13)
!193 = !DILocation(line: 158, column: 1, scope: !111)
!194 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 163, type: !14, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!195 = !DILocalVariable(name: "data", scope: !194, file: !13, line: 165, type: !17)
!196 = !DILocation(line: 165, column: 9, scope: !194)
!197 = !DILocation(line: 167, column: 10, scope: !194)
!198 = !DILocation(line: 168, column: 8, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !13, line: 168, column: 8)
!200 = !DILocation(line: 168, column: 8, scope: !194)
!201 = !DILocation(line: 172, column: 14, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !13, line: 169, column: 5)
!203 = !DILocation(line: 173, column: 5, scope: !202)
!204 = !DILocation(line: 178, column: 14, scope: !205)
!205 = distinct !DILexicalBlock(scope: !199, file: !13, line: 175, column: 5)
!206 = !DILocation(line: 180, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !194, file: !13, line: 180, column: 8)
!208 = !DILocation(line: 180, column: 8, scope: !194)
!209 = !DILocalVariable(name: "buffer", scope: !210, file: !13, line: 183, type: !53)
!210 = distinct !DILexicalBlock(scope: !211, file: !13, line: 182, column: 9)
!211 = distinct !DILexicalBlock(scope: !207, file: !13, line: 181, column: 5)
!212 = !DILocation(line: 183, column: 17, scope: !210)
!213 = !DILocation(line: 186, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !13, line: 186, column: 17)
!215 = !DILocation(line: 186, column: 22, scope: !214)
!216 = !DILocation(line: 186, column: 17, scope: !210)
!217 = !DILocation(line: 188, column: 37, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !13, line: 187, column: 13)
!219 = !DILocation(line: 188, column: 30, scope: !218)
!220 = !DILocation(line: 188, column: 17, scope: !218)
!221 = !DILocation(line: 189, column: 13, scope: !218)
!222 = !DILocation(line: 192, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !214, file: !13, line: 191, column: 13)
!224 = !DILocation(line: 195, column: 5, scope: !211)
!225 = !DILocalVariable(name: "buffer", scope: !226, file: !13, line: 199, type: !53)
!226 = distinct !DILexicalBlock(scope: !227, file: !13, line: 198, column: 9)
!227 = distinct !DILexicalBlock(scope: !207, file: !13, line: 197, column: 5)
!228 = !DILocation(line: 199, column: 17, scope: !226)
!229 = !DILocation(line: 202, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !13, line: 202, column: 17)
!231 = !DILocation(line: 202, column: 22, scope: !230)
!232 = !DILocation(line: 202, column: 17, scope: !226)
!233 = !DILocation(line: 204, column: 37, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !13, line: 203, column: 13)
!235 = !DILocation(line: 204, column: 30, scope: !234)
!236 = !DILocation(line: 204, column: 17, scope: !234)
!237 = !DILocation(line: 205, column: 13, scope: !234)
!238 = !DILocation(line: 208, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !230, file: !13, line: 207, column: 13)
!240 = !DILocation(line: 212, column: 1, scope: !194)
