; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_02_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !39
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  %5 = bitcast i32* %4 to i8*, !dbg !43
  store i8* %5, i8** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !53
  store i64 %call2, i64* %dataLen, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !54, metadata !DIExpression()), !dbg !55
  %7 = load i64, i64* %dataLen, align 8, !dbg !56
  %add = add i64 %7, 1, !dbg !57
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !58
  store i8* %call3, i8** %dest, align 8, !dbg !55
  %8 = load i8*, i8** %dest, align 8, !dbg !59
  %cmp4 = icmp eq i8* %8, null, !dbg !61
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !62

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !63
  unreachable, !dbg !63

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %dest, align 8, !dbg !65
  %10 = bitcast i8* %9 to i32*, !dbg !65
  %11 = load i8*, i8** %data, align 8, !dbg !66
  %12 = bitcast i8* %11 to i32*, !dbg !66
  %call7 = call i32* @wcscpy(i32* %10, i32* %12) #7, !dbg !67
  %13 = load i8*, i8** %dest, align 8, !dbg !68
  call void @printLine(i8* %13), !dbg !69
  %14 = load i8*, i8** %dest, align 8, !dbg !70
  call void @free(i8* %14) #7, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_02_good() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_02_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_02_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !105
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !114
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !115
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !118
  %5 = bitcast i32* %4 to i8*, !dbg !119
  store i8* %5, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !121, metadata !DIExpression()), !dbg !125
  %6 = load i8*, i8** %data, align 8, !dbg !126
  %7 = bitcast i8* %6 to i32*, !dbg !127
  %call2 = call i64 @wcslen(i32* %7) #9, !dbg !128
  store i64 %call2, i64* %dataLen, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !129, metadata !DIExpression()), !dbg !130
  %8 = load i64, i64* %dataLen, align 8, !dbg !131
  %add = add i64 %8, 1, !dbg !132
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !133
  store i8* %call3, i8** %dest, align 8, !dbg !130
  %9 = load i8*, i8** %dest, align 8, !dbg !134
  %cmp4 = icmp eq i8* %9, null, !dbg !136
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !137

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !138
  unreachable, !dbg !138

if.end6:                                          ; preds = %if.end
  %10 = load i8*, i8** %dest, align 8, !dbg !140
  %11 = bitcast i8* %10 to i32*, !dbg !140
  %12 = load i8*, i8** %data, align 8, !dbg !141
  %13 = bitcast i8* %12 to i32*, !dbg !141
  %call7 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !142
  %14 = load i8*, i8** %dest, align 8, !dbg !143
  %15 = bitcast i8* %14 to i32*, !dbg !144
  call void @printWLine(i32* %15), !dbg !145
  %16 = load i8*, i8** %dest, align 8, !dbg !146
  call void @free(i8* %16) #7, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i8* null, i8** %data, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !157
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !158
  %0 = bitcast i8* %call to i32*, !dbg !159
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !157
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !160
  %cmp = icmp eq i32* %1, null, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !164
  unreachable, !dbg !164

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !166
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !167
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !170
  %5 = bitcast i32* %4 to i8*, !dbg !171
  store i8* %5, i8** %data, align 8, !dbg !172
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !173, metadata !DIExpression()), !dbg !177
  %6 = load i8*, i8** %data, align 8, !dbg !178
  %7 = bitcast i8* %6 to i32*, !dbg !179
  %call2 = call i64 @wcslen(i32* %7) #9, !dbg !180
  store i64 %call2, i64* %dataLen, align 8, !dbg !177
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !181, metadata !DIExpression()), !dbg !182
  %8 = load i64, i64* %dataLen, align 8, !dbg !183
  %add = add i64 %8, 1, !dbg !184
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !185
  store i8* %call3, i8** %dest, align 8, !dbg !182
  %9 = load i8*, i8** %dest, align 8, !dbg !186
  %cmp4 = icmp eq i8* %9, null, !dbg !188
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !189

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !190
  unreachable, !dbg !190

if.end6:                                          ; preds = %if.end
  %10 = load i8*, i8** %dest, align 8, !dbg !192
  %11 = bitcast i8* %10 to i32*, !dbg !192
  %12 = load i8*, i8** %data, align 8, !dbg !193
  %13 = bitcast i8* %12 to i32*, !dbg !193
  %call7 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !194
  %14 = load i8*, i8** %dest, align 8, !dbg !195
  %15 = bitcast i8* %14 to i32*, !dbg !196
  call void @printWLine(i32* %15), !dbg !197
  %16 = load i8*, i8** %dest, align 8, !dbg !198
  call void @free(i8* %16) #7, !dbg !199
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !201 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !202, metadata !DIExpression()), !dbg !203
  store i8* null, i8** %data, align 8, !dbg !204
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !205, metadata !DIExpression()), !dbg !209
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !210
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !209
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !211
  %cmp = icmp eq i8* %0, null, !dbg !213
  br i1 %cmp, label %if.then, label %if.end, !dbg !214

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !215
  unreachable, !dbg !215

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !218
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !219
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !219
  store i8 0, i8* %arrayidx, align 1, !dbg !220
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !221
  store i8* %3, i8** %data, align 8, !dbg !222
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !223, metadata !DIExpression()), !dbg !227
  %4 = load i8*, i8** %data, align 8, !dbg !228
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !229
  store i64 %call1, i64* %dataLen, align 8, !dbg !227
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !230, metadata !DIExpression()), !dbg !231
  %5 = load i64, i64* %dataLen, align 8, !dbg !232
  %add = add i64 %5, 1, !dbg !233
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !234
  store i8* %call2, i8** %dest, align 8, !dbg !231
  %6 = load i8*, i8** %dest, align 8, !dbg !235
  %cmp3 = icmp eq i8* %6, null, !dbg !237
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !238

if.then4:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !239
  unreachable, !dbg !239

if.end5:                                          ; preds = %if.end
  %7 = load i8*, i8** %dest, align 8, !dbg !241
  %8 = load i8*, i8** %data, align 8, !dbg !242
  %call6 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !243
  %9 = load i8*, i8** %dest, align 8, !dbg !244
  call void @printLine(i8* %9), !dbg !245
  %10 = load i8*, i8** %dest, align 8, !dbg !246
  call void @free(i8* %10) #7, !dbg !247
  ret void, !dbg !248
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !249 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !250, metadata !DIExpression()), !dbg !251
  store i8* null, i8** %data, align 8, !dbg !252
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !253, metadata !DIExpression()), !dbg !257
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !258
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !257
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !259
  %cmp = icmp eq i8* %0, null, !dbg !261
  br i1 %cmp, label %if.then, label %if.end, !dbg !262

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !263
  unreachable, !dbg !263

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !265
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !266
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !267
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !267
  store i8 0, i8* %arrayidx, align 1, !dbg !268
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !269
  store i8* %3, i8** %data, align 8, !dbg !270
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !271, metadata !DIExpression()), !dbg !275
  %4 = load i8*, i8** %data, align 8, !dbg !276
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !277
  store i64 %call1, i64* %dataLen, align 8, !dbg !275
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !278, metadata !DIExpression()), !dbg !279
  %5 = load i64, i64* %dataLen, align 8, !dbg !280
  %add = add i64 %5, 1, !dbg !281
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !282
  store i8* %call2, i8** %dest, align 8, !dbg !279
  %6 = load i8*, i8** %dest, align 8, !dbg !283
  %cmp3 = icmp eq i8* %6, null, !dbg !285
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !286

if.then4:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !287
  unreachable, !dbg !287

if.end5:                                          ; preds = %if.end
  %7 = load i8*, i8** %dest, align 8, !dbg !289
  %8 = load i8*, i8** %data, align 8, !dbg !290
  %call6 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !291
  %9 = load i8*, i8** %dest, align 8, !dbg !292
  call void @printLine(i8* %9), !dbg !293
  %10 = load i8*, i8** %dest, align 8, !dbg !294
  call void @free(i8* %10) #7, !dbg !295
  ret void, !dbg !296
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_02_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_02.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !26, file: !19, line: 31, type: !5)
!26 = distinct !DILexicalBlock(scope: !27, file: !19, line: 30, column: 9)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 29, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!29 = !DILocation(line: 31, column: 23, scope: !26)
!30 = !DILocation(line: 31, column: 50, scope: !26)
!31 = !DILocation(line: 31, column: 39, scope: !26)
!32 = !DILocation(line: 32, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 17)
!34 = !DILocation(line: 32, column: 31, scope: !33)
!35 = !DILocation(line: 32, column: 17, scope: !26)
!36 = !DILocation(line: 32, column: 41, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 32, column: 40)
!38 = !DILocation(line: 33, column: 21, scope: !26)
!39 = !DILocation(line: 33, column: 13, scope: !26)
!40 = !DILocation(line: 34, column: 13, scope: !26)
!41 = !DILocation(line: 34, column: 33, scope: !26)
!42 = !DILocation(line: 36, column: 28, scope: !26)
!43 = !DILocation(line: 36, column: 20, scope: !26)
!44 = !DILocation(line: 36, column: 18, scope: !26)
!45 = !DILocalVariable(name: "dataLen", scope: !46, file: !19, line: 43, type: !49)
!46 = distinct !DILexicalBlock(scope: !47, file: !19, line: 41, column: 9)
!47 = distinct !DILexicalBlock(scope: !48, file: !19, line: 40, column: 5)
!48 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 8)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 43, column: 20, scope: !46)
!52 = !DILocation(line: 43, column: 45, scope: !46)
!53 = !DILocation(line: 43, column: 30, scope: !46)
!54 = !DILocalVariable(name: "dest", scope: !46, file: !19, line: 44, type: !4)
!55 = !DILocation(line: 44, column: 20, scope: !46)
!56 = !DILocation(line: 44, column: 42, scope: !46)
!57 = !DILocation(line: 44, column: 49, scope: !46)
!58 = !DILocation(line: 44, column: 35, scope: !46)
!59 = !DILocation(line: 45, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !46, file: !19, line: 45, column: 17)
!61 = !DILocation(line: 45, column: 22, scope: !60)
!62 = !DILocation(line: 45, column: 17, scope: !46)
!63 = !DILocation(line: 45, column: 32, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !19, line: 45, column: 31)
!65 = !DILocation(line: 46, column: 26, scope: !46)
!66 = !DILocation(line: 46, column: 32, scope: !46)
!67 = !DILocation(line: 46, column: 19, scope: !46)
!68 = !DILocation(line: 47, column: 31, scope: !46)
!69 = !DILocation(line: 47, column: 13, scope: !46)
!70 = !DILocation(line: 48, column: 18, scope: !46)
!71 = !DILocation(line: 48, column: 13, scope: !46)
!72 = !DILocation(line: 51, column: 1, scope: !18)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_02_good", scope: !19, file: !19, line: 187, type: !20, scopeLine: 188, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 189, column: 5, scope: !73)
!75 = !DILocation(line: 190, column: 5, scope: !73)
!76 = !DILocation(line: 191, column: 5, scope: !73)
!77 = !DILocation(line: 192, column: 5, scope: !73)
!78 = !DILocation(line: 193, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 204, type: !80, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!8, !8, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !19, line: 204, type: !8)
!84 = !DILocation(line: 204, column: 14, scope: !79)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !19, line: 204, type: !82)
!86 = !DILocation(line: 204, column: 27, scope: !79)
!87 = !DILocation(line: 207, column: 22, scope: !79)
!88 = !DILocation(line: 207, column: 12, scope: !79)
!89 = !DILocation(line: 207, column: 5, scope: !79)
!90 = !DILocation(line: 209, column: 5, scope: !79)
!91 = !DILocation(line: 210, column: 5, scope: !79)
!92 = !DILocation(line: 211, column: 5, scope: !79)
!93 = !DILocation(line: 214, column: 5, scope: !79)
!94 = !DILocation(line: 215, column: 5, scope: !79)
!95 = !DILocation(line: 216, column: 5, scope: !79)
!96 = !DILocation(line: 218, column: 5, scope: !79)
!97 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 60, type: !4)
!99 = !DILocation(line: 60, column: 12, scope: !97)
!100 = !DILocation(line: 61, column: 10, scope: !97)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !19, line: 65, type: !5)
!102 = distinct !DILexicalBlock(scope: !103, file: !19, line: 64, column: 9)
!103 = distinct !DILexicalBlock(scope: !104, file: !19, line: 63, column: 5)
!104 = distinct !DILexicalBlock(scope: !97, file: !19, line: 62, column: 8)
!105 = !DILocation(line: 65, column: 23, scope: !102)
!106 = !DILocation(line: 65, column: 50, scope: !102)
!107 = !DILocation(line: 65, column: 39, scope: !102)
!108 = !DILocation(line: 66, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !19, line: 66, column: 17)
!110 = !DILocation(line: 66, column: 31, scope: !109)
!111 = !DILocation(line: 66, column: 17, scope: !102)
!112 = !DILocation(line: 66, column: 41, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !19, line: 66, column: 40)
!114 = !DILocation(line: 67, column: 21, scope: !102)
!115 = !DILocation(line: 67, column: 13, scope: !102)
!116 = !DILocation(line: 68, column: 13, scope: !102)
!117 = !DILocation(line: 68, column: 33, scope: !102)
!118 = !DILocation(line: 70, column: 28, scope: !102)
!119 = !DILocation(line: 70, column: 20, scope: !102)
!120 = !DILocation(line: 70, column: 18, scope: !102)
!121 = !DILocalVariable(name: "dataLen", scope: !122, file: !19, line: 82, type: !49)
!122 = distinct !DILexicalBlock(scope: !123, file: !19, line: 80, column: 9)
!123 = distinct !DILexicalBlock(scope: !124, file: !19, line: 79, column: 5)
!124 = distinct !DILexicalBlock(scope: !97, file: !19, line: 73, column: 8)
!125 = !DILocation(line: 82, column: 20, scope: !122)
!126 = !DILocation(line: 82, column: 48, scope: !122)
!127 = !DILocation(line: 82, column: 37, scope: !122)
!128 = !DILocation(line: 82, column: 30, scope: !122)
!129 = !DILocalVariable(name: "dest", scope: !122, file: !19, line: 83, type: !4)
!130 = !DILocation(line: 83, column: 20, scope: !122)
!131 = !DILocation(line: 83, column: 42, scope: !122)
!132 = !DILocation(line: 83, column: 49, scope: !122)
!133 = !DILocation(line: 83, column: 35, scope: !122)
!134 = !DILocation(line: 84, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !122, file: !19, line: 84, column: 17)
!136 = !DILocation(line: 84, column: 22, scope: !135)
!137 = !DILocation(line: 84, column: 17, scope: !122)
!138 = !DILocation(line: 84, column: 32, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !19, line: 84, column: 31)
!140 = !DILocation(line: 85, column: 26, scope: !122)
!141 = !DILocation(line: 85, column: 32, scope: !122)
!142 = !DILocation(line: 85, column: 19, scope: !122)
!143 = !DILocation(line: 86, column: 35, scope: !122)
!144 = !DILocation(line: 86, column: 24, scope: !122)
!145 = !DILocation(line: 86, column: 13, scope: !122)
!146 = !DILocation(line: 87, column: 18, scope: !122)
!147 = !DILocation(line: 87, column: 13, scope: !122)
!148 = !DILocation(line: 90, column: 1, scope: !97)
!149 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !19, line: 95, type: !4)
!151 = !DILocation(line: 95, column: 12, scope: !149)
!152 = !DILocation(line: 96, column: 10, scope: !149)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !19, line: 100, type: !5)
!154 = distinct !DILexicalBlock(scope: !155, file: !19, line: 99, column: 9)
!155 = distinct !DILexicalBlock(scope: !156, file: !19, line: 98, column: 5)
!156 = distinct !DILexicalBlock(scope: !149, file: !19, line: 97, column: 8)
!157 = !DILocation(line: 100, column: 23, scope: !154)
!158 = !DILocation(line: 100, column: 50, scope: !154)
!159 = !DILocation(line: 100, column: 39, scope: !154)
!160 = !DILocation(line: 101, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !19, line: 101, column: 17)
!162 = !DILocation(line: 101, column: 31, scope: !161)
!163 = !DILocation(line: 101, column: 17, scope: !154)
!164 = !DILocation(line: 101, column: 41, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !19, line: 101, column: 40)
!166 = !DILocation(line: 102, column: 21, scope: !154)
!167 = !DILocation(line: 102, column: 13, scope: !154)
!168 = !DILocation(line: 103, column: 13, scope: !154)
!169 = !DILocation(line: 103, column: 33, scope: !154)
!170 = !DILocation(line: 105, column: 28, scope: !154)
!171 = !DILocation(line: 105, column: 20, scope: !154)
!172 = !DILocation(line: 105, column: 18, scope: !154)
!173 = !DILocalVariable(name: "dataLen", scope: !174, file: !19, line: 112, type: !49)
!174 = distinct !DILexicalBlock(scope: !175, file: !19, line: 110, column: 9)
!175 = distinct !DILexicalBlock(scope: !176, file: !19, line: 109, column: 5)
!176 = distinct !DILexicalBlock(scope: !149, file: !19, line: 108, column: 8)
!177 = !DILocation(line: 112, column: 20, scope: !174)
!178 = !DILocation(line: 112, column: 48, scope: !174)
!179 = !DILocation(line: 112, column: 37, scope: !174)
!180 = !DILocation(line: 112, column: 30, scope: !174)
!181 = !DILocalVariable(name: "dest", scope: !174, file: !19, line: 113, type: !4)
!182 = !DILocation(line: 113, column: 20, scope: !174)
!183 = !DILocation(line: 113, column: 42, scope: !174)
!184 = !DILocation(line: 113, column: 49, scope: !174)
!185 = !DILocation(line: 113, column: 35, scope: !174)
!186 = !DILocation(line: 114, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !174, file: !19, line: 114, column: 17)
!188 = !DILocation(line: 114, column: 22, scope: !187)
!189 = !DILocation(line: 114, column: 17, scope: !174)
!190 = !DILocation(line: 114, column: 32, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !19, line: 114, column: 31)
!192 = !DILocation(line: 115, column: 26, scope: !174)
!193 = !DILocation(line: 115, column: 32, scope: !174)
!194 = !DILocation(line: 115, column: 19, scope: !174)
!195 = !DILocation(line: 116, column: 35, scope: !174)
!196 = !DILocation(line: 116, column: 24, scope: !174)
!197 = !DILocation(line: 116, column: 13, scope: !174)
!198 = !DILocation(line: 117, column: 18, scope: !174)
!199 = !DILocation(line: 117, column: 13, scope: !174)
!200 = !DILocation(line: 120, column: 1, scope: !149)
!201 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 123, type: !20, scopeLine: 124, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!202 = !DILocalVariable(name: "data", scope: !201, file: !19, line: 125, type: !4)
!203 = !DILocation(line: 125, column: 12, scope: !201)
!204 = !DILocation(line: 126, column: 10, scope: !201)
!205 = !DILocalVariable(name: "dataGoodBuffer", scope: !206, file: !19, line: 135, type: !9)
!206 = distinct !DILexicalBlock(scope: !207, file: !19, line: 134, column: 9)
!207 = distinct !DILexicalBlock(scope: !208, file: !19, line: 133, column: 5)
!208 = distinct !DILexicalBlock(scope: !201, file: !19, line: 127, column: 8)
!209 = !DILocation(line: 135, column: 20, scope: !206)
!210 = !DILocation(line: 135, column: 45, scope: !206)
!211 = !DILocation(line: 136, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !206, file: !19, line: 136, column: 17)
!213 = !DILocation(line: 136, column: 32, scope: !212)
!214 = !DILocation(line: 136, column: 17, scope: !206)
!215 = !DILocation(line: 136, column: 42, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !19, line: 136, column: 41)
!217 = !DILocation(line: 137, column: 20, scope: !206)
!218 = !DILocation(line: 137, column: 13, scope: !206)
!219 = !DILocation(line: 138, column: 13, scope: !206)
!220 = !DILocation(line: 138, column: 34, scope: !206)
!221 = !DILocation(line: 140, column: 28, scope: !206)
!222 = !DILocation(line: 140, column: 18, scope: !206)
!223 = !DILocalVariable(name: "dataLen", scope: !224, file: !19, line: 147, type: !49)
!224 = distinct !DILexicalBlock(scope: !225, file: !19, line: 145, column: 9)
!225 = distinct !DILexicalBlock(scope: !226, file: !19, line: 144, column: 5)
!226 = distinct !DILexicalBlock(scope: !201, file: !19, line: 143, column: 8)
!227 = !DILocation(line: 147, column: 20, scope: !224)
!228 = !DILocation(line: 147, column: 45, scope: !224)
!229 = !DILocation(line: 147, column: 30, scope: !224)
!230 = !DILocalVariable(name: "dest", scope: !224, file: !19, line: 148, type: !4)
!231 = !DILocation(line: 148, column: 20, scope: !224)
!232 = !DILocation(line: 148, column: 42, scope: !224)
!233 = !DILocation(line: 148, column: 49, scope: !224)
!234 = !DILocation(line: 148, column: 35, scope: !224)
!235 = !DILocation(line: 149, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !224, file: !19, line: 149, column: 17)
!237 = !DILocation(line: 149, column: 22, scope: !236)
!238 = !DILocation(line: 149, column: 17, scope: !224)
!239 = !DILocation(line: 149, column: 32, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !19, line: 149, column: 31)
!241 = !DILocation(line: 150, column: 26, scope: !224)
!242 = !DILocation(line: 150, column: 32, scope: !224)
!243 = !DILocation(line: 150, column: 19, scope: !224)
!244 = !DILocation(line: 151, column: 31, scope: !224)
!245 = !DILocation(line: 151, column: 13, scope: !224)
!246 = !DILocation(line: 152, column: 18, scope: !224)
!247 = !DILocation(line: 152, column: 13, scope: !224)
!248 = !DILocation(line: 155, column: 1, scope: !201)
!249 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 158, type: !20, scopeLine: 159, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!250 = !DILocalVariable(name: "data", scope: !249, file: !19, line: 160, type: !4)
!251 = !DILocation(line: 160, column: 12, scope: !249)
!252 = !DILocation(line: 161, column: 10, scope: !249)
!253 = !DILocalVariable(name: "dataGoodBuffer", scope: !254, file: !19, line: 165, type: !9)
!254 = distinct !DILexicalBlock(scope: !255, file: !19, line: 164, column: 9)
!255 = distinct !DILexicalBlock(scope: !256, file: !19, line: 163, column: 5)
!256 = distinct !DILexicalBlock(scope: !249, file: !19, line: 162, column: 8)
!257 = !DILocation(line: 165, column: 20, scope: !254)
!258 = !DILocation(line: 165, column: 45, scope: !254)
!259 = !DILocation(line: 166, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !254, file: !19, line: 166, column: 17)
!261 = !DILocation(line: 166, column: 32, scope: !260)
!262 = !DILocation(line: 166, column: 17, scope: !254)
!263 = !DILocation(line: 166, column: 42, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !19, line: 166, column: 41)
!265 = !DILocation(line: 167, column: 20, scope: !254)
!266 = !DILocation(line: 167, column: 13, scope: !254)
!267 = !DILocation(line: 168, column: 13, scope: !254)
!268 = !DILocation(line: 168, column: 34, scope: !254)
!269 = !DILocation(line: 170, column: 28, scope: !254)
!270 = !DILocation(line: 170, column: 18, scope: !254)
!271 = !DILocalVariable(name: "dataLen", scope: !272, file: !19, line: 177, type: !49)
!272 = distinct !DILexicalBlock(scope: !273, file: !19, line: 175, column: 9)
!273 = distinct !DILexicalBlock(scope: !274, file: !19, line: 174, column: 5)
!274 = distinct !DILexicalBlock(scope: !249, file: !19, line: 173, column: 8)
!275 = !DILocation(line: 177, column: 20, scope: !272)
!276 = !DILocation(line: 177, column: 45, scope: !272)
!277 = !DILocation(line: 177, column: 30, scope: !272)
!278 = !DILocalVariable(name: "dest", scope: !272, file: !19, line: 178, type: !4)
!279 = !DILocation(line: 178, column: 20, scope: !272)
!280 = !DILocation(line: 178, column: 42, scope: !272)
!281 = !DILocation(line: 178, column: 49, scope: !272)
!282 = !DILocation(line: 178, column: 35, scope: !272)
!283 = !DILocation(line: 179, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !272, file: !19, line: 179, column: 17)
!285 = !DILocation(line: 179, column: 22, scope: !284)
!286 = !DILocation(line: 179, column: 17, scope: !272)
!287 = !DILocation(line: 179, column: 32, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !19, line: 179, column: 31)
!289 = !DILocation(line: 180, column: 26, scope: !272)
!290 = !DILocation(line: 180, column: 32, scope: !272)
!291 = !DILocation(line: 180, column: 19, scope: !272)
!292 = !DILocation(line: 181, column: 31, scope: !272)
!293 = !DILocation(line: 181, column: 13, scope: !272)
!294 = !DILocation(line: 182, column: 18, scope: !272)
!295 = !DILocation(line: 182, column: 13, scope: !272)
!296 = !DILocation(line: 185, column: 1, scope: !249)
