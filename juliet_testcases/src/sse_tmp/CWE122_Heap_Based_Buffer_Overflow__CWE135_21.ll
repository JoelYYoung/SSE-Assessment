; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !18
@goodG2BStatic = internal global i32 0, align 4, !dbg !20

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_21_bad() #0 !dbg !28 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !31, metadata !DIExpression()), !dbg !32
  store i8* null, i8** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !34, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !37
  %0 = bitcast i8* %call to i32*, !dbg !38
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !36
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %cmp = icmp eq i32* %1, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !46
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !49
  %5 = bitcast i32* %4 to i8*, !dbg !50
  store i8* %5, i8** %data, align 8, !dbg !51
  store i32 1, i32* @badStatic, align 4, !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  call void @badSink(i8* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @badStatic, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end4, !dbg !63

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !64, metadata !DIExpression()), !dbg !69
  %1 = load i8*, i8** %data.addr, align 8, !dbg !70
  %call = call i64 @strlen(i8* %1) #9, !dbg !71
  store i64 %call, i64* %dataLen, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !72, metadata !DIExpression()), !dbg !73
  %2 = load i64, i64* %dataLen, align 8, !dbg !74
  %add = add i64 %2, 1, !dbg !75
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !76
  store i8* %call1, i8** %dest, align 8, !dbg !73
  %3 = load i8*, i8** %dest, align 8, !dbg !77
  %cmp = icmp eq i8* %3, null, !dbg !79
  br i1 %cmp, label %if.then2, label %if.end, !dbg !80

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %if.then
  %4 = load i8*, i8** %dest, align 8, !dbg !83
  %5 = bitcast i8* %4 to i32*, !dbg !83
  %6 = load i8*, i8** %data.addr, align 8, !dbg !84
  %7 = bitcast i8* %6 to i32*, !dbg !84
  %call3 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !85
  %8 = load i8*, i8** %dest, align 8, !dbg !86
  call void @printLine(i8* %8), !dbg !87
  %9 = load i8*, i8** %dest, align 8, !dbg !88
  call void @free(i8* %9) #7, !dbg !89
  br label %if.end4, !dbg !90

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_21_good() #0 !dbg !92 {
entry:
  call void @goodB2G1(), !dbg !93
  call void @goodB2G2(), !dbg !94
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #7, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #7, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_21_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_21_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i8* null, i8** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !122
  %0 = bitcast i8* %call to i32*, !dbg !123
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !121
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !124
  %cmp = icmp eq i32* %1, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !130
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !131
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !134
  %5 = bitcast i32* %4 to i8*, !dbg !135
  store i8* %5, i8** %data, align 8, !dbg !136
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !137
  %6 = load i8*, i8** %data, align 8, !dbg !138
  call void @goodB2G1Sink(i8* %6), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i8* %data) #0 !dbg !141 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !144
  %tobool = icmp ne i32 %0, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.else, !dbg !146

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !147
  br label %if.end4, !dbg !149

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !150, metadata !DIExpression()), !dbg !153
  %1 = load i8*, i8** %data.addr, align 8, !dbg !154
  %2 = bitcast i8* %1 to i32*, !dbg !155
  %call = call i64 @wcslen(i32* %2) #9, !dbg !156
  store i64 %call, i64* %dataLen, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !157, metadata !DIExpression()), !dbg !158
  %3 = load i64, i64* %dataLen, align 8, !dbg !159
  %add = add i64 %3, 1, !dbg !160
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !161
  store i8* %call1, i8** %dest, align 8, !dbg !158
  %4 = load i8*, i8** %dest, align 8, !dbg !162
  %cmp = icmp eq i8* %4, null, !dbg !164
  br i1 %cmp, label %if.then2, label %if.end, !dbg !165

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !166
  unreachable, !dbg !166

if.end:                                           ; preds = %if.else
  %5 = load i8*, i8** %dest, align 8, !dbg !168
  %6 = bitcast i8* %5 to i32*, !dbg !168
  %7 = load i8*, i8** %data.addr, align 8, !dbg !169
  %8 = bitcast i8* %7 to i32*, !dbg !169
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !170
  %9 = load i8*, i8** %dest, align 8, !dbg !171
  %10 = bitcast i8* %9 to i32*, !dbg !172
  call void @printWLine(i32* %10), !dbg !173
  %11 = load i8*, i8** %dest, align 8, !dbg !174
  call void @free(i8* %11) #7, !dbg !175
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !176
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !177 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !178, metadata !DIExpression()), !dbg !179
  store i8* null, i8** %data, align 8, !dbg !180
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !181, metadata !DIExpression()), !dbg !183
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !184
  %0 = bitcast i8* %call to i32*, !dbg !185
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !183
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !186
  %cmp = icmp eq i32* %1, null, !dbg !188
  br i1 %cmp, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !190
  unreachable, !dbg !190

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !192
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !193
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !194
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !194
  store i32 0, i32* %arrayidx, align 4, !dbg !195
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !196
  %5 = bitcast i32* %4 to i8*, !dbg !197
  store i8* %5, i8** %data, align 8, !dbg !198
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !199
  %6 = load i8*, i8** %data, align 8, !dbg !200
  call void @goodB2G2Sink(i8* %6), !dbg !201
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i8* %data) #0 !dbg !203 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !204, metadata !DIExpression()), !dbg !205
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !206
  %tobool = icmp ne i32 %0, 0, !dbg !206
  br i1 %tobool, label %if.then, label %if.end4, !dbg !208

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !209, metadata !DIExpression()), !dbg !212
  %1 = load i8*, i8** %data.addr, align 8, !dbg !213
  %2 = bitcast i8* %1 to i32*, !dbg !214
  %call = call i64 @wcslen(i32* %2) #9, !dbg !215
  store i64 %call, i64* %dataLen, align 8, !dbg !212
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !216, metadata !DIExpression()), !dbg !217
  %3 = load i64, i64* %dataLen, align 8, !dbg !218
  %add = add i64 %3, 1, !dbg !219
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !220
  store i8* %call1, i8** %dest, align 8, !dbg !217
  %4 = load i8*, i8** %dest, align 8, !dbg !221
  %cmp = icmp eq i8* %4, null, !dbg !223
  br i1 %cmp, label %if.then2, label %if.end, !dbg !224

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !225
  unreachable, !dbg !225

if.end:                                           ; preds = %if.then
  %5 = load i8*, i8** %dest, align 8, !dbg !227
  %6 = bitcast i8* %5 to i32*, !dbg !227
  %7 = load i8*, i8** %data.addr, align 8, !dbg !228
  %8 = bitcast i8* %7 to i32*, !dbg !228
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !229
  %9 = load i8*, i8** %dest, align 8, !dbg !230
  %10 = bitcast i8* %9 to i32*, !dbg !231
  call void @printWLine(i32* %10), !dbg !232
  %11 = load i8*, i8** %dest, align 8, !dbg !233
  call void @free(i8* %11) #7, !dbg !234
  br label %if.end4, !dbg !235

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !236
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !237 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !238, metadata !DIExpression()), !dbg !239
  store i8* null, i8** %data, align 8, !dbg !240
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !241, metadata !DIExpression()), !dbg !243
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !244
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !243
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !245
  %cmp = icmp eq i8* %0, null, !dbg !247
  br i1 %cmp, label %if.then, label %if.end, !dbg !248

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !249
  unreachable, !dbg !249

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !251
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !252
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !253
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !253
  store i8 0, i8* %arrayidx, align 1, !dbg !254
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !255
  store i8* %3, i8** %data, align 8, !dbg !256
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !257
  %4 = load i8*, i8** %data, align 8, !dbg !258
  call void @goodG2BSink(i8* %4), !dbg !259
  ret void, !dbg !260
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !261 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !262, metadata !DIExpression()), !dbg !263
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !264
  %tobool = icmp ne i32 %0, 0, !dbg !264
  br i1 %tobool, label %if.then, label %if.end4, !dbg !266

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !267, metadata !DIExpression()), !dbg !270
  %1 = load i8*, i8** %data.addr, align 8, !dbg !271
  %call = call i64 @strlen(i8* %1) #9, !dbg !272
  store i64 %call, i64* %dataLen, align 8, !dbg !270
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !273, metadata !DIExpression()), !dbg !274
  %2 = load i64, i64* %dataLen, align 8, !dbg !275
  %add = add i64 %2, 1, !dbg !276
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !277
  store i8* %call1, i8** %dest, align 8, !dbg !274
  %3 = load i8*, i8** %dest, align 8, !dbg !278
  %cmp = icmp eq i8* %3, null, !dbg !280
  br i1 %cmp, label %if.then2, label %if.end, !dbg !281

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !282
  unreachable, !dbg !282

if.end:                                           ; preds = %if.then
  %4 = load i8*, i8** %dest, align 8, !dbg !284
  %5 = load i8*, i8** %data.addr, align 8, !dbg !285
  %call3 = call i8* @strcpy(i8* %4, i8* %5) #7, !dbg !286
  %6 = load i8*, i8** %dest, align 8, !dbg !287
  call void @printLine(i8* %6), !dbg !288
  %7 = load i8*, i8** %dest, align 8, !dbg !289
  call void @free(i8* %7) #7, !dbg !290
  br label %if.end4, !dbg !291

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !292
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !17, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!0, !15, !18, !20}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !17, line: 64, type: !10, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_21.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !17, line: 65, type: !10, isLocal: true, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !17, line: 66, type: !10, isLocal: true, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_21_bad", scope: !17, file: !17, line: 43, type: !29, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !DILocalVariable(name: "data", scope: !28, file: !17, line: 45, type: !6)
!32 = !DILocation(line: 45, column: 12, scope: !28)
!33 = !DILocation(line: 46, column: 10, scope: !28)
!34 = !DILocalVariable(name: "dataBadBuffer", scope: !35, file: !17, line: 48, type: !7)
!35 = distinct !DILexicalBlock(scope: !28, file: !17, line: 47, column: 5)
!36 = !DILocation(line: 48, column: 19, scope: !35)
!37 = !DILocation(line: 48, column: 46, scope: !35)
!38 = !DILocation(line: 48, column: 35, scope: !35)
!39 = !DILocation(line: 49, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !17, line: 49, column: 13)
!41 = !DILocation(line: 49, column: 27, scope: !40)
!42 = !DILocation(line: 49, column: 13, scope: !35)
!43 = !DILocation(line: 49, column: 37, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 49, column: 36)
!45 = !DILocation(line: 50, column: 17, scope: !35)
!46 = !DILocation(line: 50, column: 9, scope: !35)
!47 = !DILocation(line: 51, column: 9, scope: !35)
!48 = !DILocation(line: 51, column: 29, scope: !35)
!49 = !DILocation(line: 53, column: 24, scope: !35)
!50 = !DILocation(line: 53, column: 16, scope: !35)
!51 = !DILocation(line: 53, column: 14, scope: !35)
!52 = !DILocation(line: 55, column: 15, scope: !28)
!53 = !DILocation(line: 56, column: 13, scope: !28)
!54 = !DILocation(line: 56, column: 5, scope: !28)
!55 = !DILocation(line: 57, column: 1, scope: !28)
!56 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 27, type: !57, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !6}
!59 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !17, line: 27, type: !6)
!60 = !DILocation(line: 27, column: 28, scope: !56)
!61 = !DILocation(line: 29, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !17, line: 29, column: 8)
!63 = !DILocation(line: 29, column: 8, scope: !56)
!64 = !DILocalVariable(name: "dataLen", scope: !65, file: !17, line: 33, type: !67)
!65 = distinct !DILexicalBlock(scope: !66, file: !17, line: 31, column: 9)
!66 = distinct !DILexicalBlock(scope: !62, file: !17, line: 30, column: 5)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !68)
!68 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!69 = !DILocation(line: 33, column: 20, scope: !65)
!70 = !DILocation(line: 33, column: 45, scope: !65)
!71 = !DILocation(line: 33, column: 30, scope: !65)
!72 = !DILocalVariable(name: "dest", scope: !65, file: !17, line: 34, type: !6)
!73 = !DILocation(line: 34, column: 20, scope: !65)
!74 = !DILocation(line: 34, column: 42, scope: !65)
!75 = !DILocation(line: 34, column: 49, scope: !65)
!76 = !DILocation(line: 34, column: 35, scope: !65)
!77 = !DILocation(line: 35, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !65, file: !17, line: 35, column: 17)
!79 = !DILocation(line: 35, column: 22, scope: !78)
!80 = !DILocation(line: 35, column: 17, scope: !65)
!81 = !DILocation(line: 35, column: 32, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !17, line: 35, column: 31)
!83 = !DILocation(line: 36, column: 26, scope: !65)
!84 = !DILocation(line: 36, column: 32, scope: !65)
!85 = !DILocation(line: 36, column: 19, scope: !65)
!86 = !DILocation(line: 37, column: 31, scope: !65)
!87 = !DILocation(line: 37, column: 13, scope: !65)
!88 = !DILocation(line: 38, column: 18, scope: !65)
!89 = !DILocation(line: 38, column: 13, scope: !65)
!90 = !DILocation(line: 40, column: 5, scope: !66)
!91 = !DILocation(line: 41, column: 1, scope: !56)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_21_good", scope: !17, file: !17, line: 172, type: !29, scopeLine: 173, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 174, column: 5, scope: !92)
!94 = !DILocation(line: 175, column: 5, scope: !92)
!95 = !DILocation(line: 176, column: 5, scope: !92)
!96 = !DILocation(line: 177, column: 1, scope: !92)
!97 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 188, type: !98, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!10, !10, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !17, line: 188, type: !10)
!102 = !DILocation(line: 188, column: 14, scope: !97)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !17, line: 188, type: !100)
!104 = !DILocation(line: 188, column: 27, scope: !97)
!105 = !DILocation(line: 191, column: 22, scope: !97)
!106 = !DILocation(line: 191, column: 12, scope: !97)
!107 = !DILocation(line: 191, column: 5, scope: !97)
!108 = !DILocation(line: 193, column: 5, scope: !97)
!109 = !DILocation(line: 194, column: 5, scope: !97)
!110 = !DILocation(line: 195, column: 5, scope: !97)
!111 = !DILocation(line: 198, column: 5, scope: !97)
!112 = !DILocation(line: 199, column: 5, scope: !97)
!113 = !DILocation(line: 200, column: 5, scope: !97)
!114 = !DILocation(line: 202, column: 5, scope: !97)
!115 = distinct !DISubprogram(name: "goodB2G1", scope: !17, file: !17, line: 90, type: !29, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !17, line: 92, type: !6)
!117 = !DILocation(line: 92, column: 12, scope: !115)
!118 = !DILocation(line: 93, column: 10, scope: !115)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !17, line: 95, type: !7)
!120 = distinct !DILexicalBlock(scope: !115, file: !17, line: 94, column: 5)
!121 = !DILocation(line: 95, column: 19, scope: !120)
!122 = !DILocation(line: 95, column: 46, scope: !120)
!123 = !DILocation(line: 95, column: 35, scope: !120)
!124 = !DILocation(line: 96, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !17, line: 96, column: 13)
!126 = !DILocation(line: 96, column: 27, scope: !125)
!127 = !DILocation(line: 96, column: 13, scope: !120)
!128 = !DILocation(line: 96, column: 37, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 96, column: 36)
!130 = !DILocation(line: 97, column: 17, scope: !120)
!131 = !DILocation(line: 97, column: 9, scope: !120)
!132 = !DILocation(line: 98, column: 9, scope: !120)
!133 = !DILocation(line: 98, column: 29, scope: !120)
!134 = !DILocation(line: 100, column: 24, scope: !120)
!135 = !DILocation(line: 100, column: 16, scope: !120)
!136 = !DILocation(line: 100, column: 14, scope: !120)
!137 = !DILocation(line: 102, column: 20, scope: !115)
!138 = !DILocation(line: 103, column: 18, scope: !115)
!139 = !DILocation(line: 103, column: 5, scope: !115)
!140 = !DILocation(line: 104, column: 1, scope: !115)
!141 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !17, file: !17, line: 69, type: !57, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!142 = !DILocalVariable(name: "data", arg: 1, scope: !141, file: !17, line: 69, type: !6)
!143 = !DILocation(line: 69, column: 33, scope: !141)
!144 = !DILocation(line: 71, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !17, line: 71, column: 8)
!146 = !DILocation(line: 71, column: 8, scope: !141)
!147 = !DILocation(line: 74, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !17, line: 72, column: 5)
!149 = !DILocation(line: 75, column: 5, scope: !148)
!150 = !DILocalVariable(name: "dataLen", scope: !151, file: !17, line: 80, type: !67)
!151 = distinct !DILexicalBlock(scope: !152, file: !17, line: 78, column: 9)
!152 = distinct !DILexicalBlock(scope: !145, file: !17, line: 77, column: 5)
!153 = !DILocation(line: 80, column: 20, scope: !151)
!154 = !DILocation(line: 80, column: 48, scope: !151)
!155 = !DILocation(line: 80, column: 37, scope: !151)
!156 = !DILocation(line: 80, column: 30, scope: !151)
!157 = !DILocalVariable(name: "dest", scope: !151, file: !17, line: 81, type: !6)
!158 = !DILocation(line: 81, column: 20, scope: !151)
!159 = !DILocation(line: 81, column: 42, scope: !151)
!160 = !DILocation(line: 81, column: 49, scope: !151)
!161 = !DILocation(line: 81, column: 35, scope: !151)
!162 = !DILocation(line: 82, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !151, file: !17, line: 82, column: 17)
!164 = !DILocation(line: 82, column: 22, scope: !163)
!165 = !DILocation(line: 82, column: 17, scope: !151)
!166 = !DILocation(line: 82, column: 32, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !17, line: 82, column: 31)
!168 = !DILocation(line: 83, column: 26, scope: !151)
!169 = !DILocation(line: 83, column: 32, scope: !151)
!170 = !DILocation(line: 83, column: 19, scope: !151)
!171 = !DILocation(line: 84, column: 35, scope: !151)
!172 = !DILocation(line: 84, column: 24, scope: !151)
!173 = !DILocation(line: 84, column: 13, scope: !151)
!174 = !DILocation(line: 85, column: 18, scope: !151)
!175 = !DILocation(line: 85, column: 13, scope: !151)
!176 = !DILocation(line: 88, column: 1, scope: !141)
!177 = distinct !DISubprogram(name: "goodB2G2", scope: !17, file: !17, line: 123, type: !29, scopeLine: 124, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DILocalVariable(name: "data", scope: !177, file: !17, line: 125, type: !6)
!179 = !DILocation(line: 125, column: 12, scope: !177)
!180 = !DILocation(line: 126, column: 10, scope: !177)
!181 = !DILocalVariable(name: "dataBadBuffer", scope: !182, file: !17, line: 128, type: !7)
!182 = distinct !DILexicalBlock(scope: !177, file: !17, line: 127, column: 5)
!183 = !DILocation(line: 128, column: 19, scope: !182)
!184 = !DILocation(line: 128, column: 46, scope: !182)
!185 = !DILocation(line: 128, column: 35, scope: !182)
!186 = !DILocation(line: 129, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !17, line: 129, column: 13)
!188 = !DILocation(line: 129, column: 27, scope: !187)
!189 = !DILocation(line: 129, column: 13, scope: !182)
!190 = !DILocation(line: 129, column: 37, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !17, line: 129, column: 36)
!192 = !DILocation(line: 130, column: 17, scope: !182)
!193 = !DILocation(line: 130, column: 9, scope: !182)
!194 = !DILocation(line: 131, column: 9, scope: !182)
!195 = !DILocation(line: 131, column: 29, scope: !182)
!196 = !DILocation(line: 133, column: 24, scope: !182)
!197 = !DILocation(line: 133, column: 16, scope: !182)
!198 = !DILocation(line: 133, column: 14, scope: !182)
!199 = !DILocation(line: 135, column: 20, scope: !177)
!200 = !DILocation(line: 136, column: 18, scope: !177)
!201 = !DILocation(line: 136, column: 5, scope: !177)
!202 = !DILocation(line: 137, column: 1, scope: !177)
!203 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !17, file: !17, line: 107, type: !57, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!204 = !DILocalVariable(name: "data", arg: 1, scope: !203, file: !17, line: 107, type: !6)
!205 = !DILocation(line: 107, column: 33, scope: !203)
!206 = !DILocation(line: 109, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !17, line: 109, column: 8)
!208 = !DILocation(line: 109, column: 8, scope: !203)
!209 = !DILocalVariable(name: "dataLen", scope: !210, file: !17, line: 113, type: !67)
!210 = distinct !DILexicalBlock(scope: !211, file: !17, line: 111, column: 9)
!211 = distinct !DILexicalBlock(scope: !207, file: !17, line: 110, column: 5)
!212 = !DILocation(line: 113, column: 20, scope: !210)
!213 = !DILocation(line: 113, column: 48, scope: !210)
!214 = !DILocation(line: 113, column: 37, scope: !210)
!215 = !DILocation(line: 113, column: 30, scope: !210)
!216 = !DILocalVariable(name: "dest", scope: !210, file: !17, line: 114, type: !6)
!217 = !DILocation(line: 114, column: 20, scope: !210)
!218 = !DILocation(line: 114, column: 42, scope: !210)
!219 = !DILocation(line: 114, column: 49, scope: !210)
!220 = !DILocation(line: 114, column: 35, scope: !210)
!221 = !DILocation(line: 115, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !210, file: !17, line: 115, column: 17)
!223 = !DILocation(line: 115, column: 22, scope: !222)
!224 = !DILocation(line: 115, column: 17, scope: !210)
!225 = !DILocation(line: 115, column: 32, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !17, line: 115, column: 31)
!227 = !DILocation(line: 116, column: 26, scope: !210)
!228 = !DILocation(line: 116, column: 32, scope: !210)
!229 = !DILocation(line: 116, column: 19, scope: !210)
!230 = !DILocation(line: 117, column: 35, scope: !210)
!231 = !DILocation(line: 117, column: 24, scope: !210)
!232 = !DILocation(line: 117, column: 13, scope: !210)
!233 = !DILocation(line: 118, column: 18, scope: !210)
!234 = !DILocation(line: 118, column: 13, scope: !210)
!235 = !DILocation(line: 120, column: 5, scope: !211)
!236 = !DILocation(line: 121, column: 1, scope: !203)
!237 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 156, type: !29, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!238 = !DILocalVariable(name: "data", scope: !237, file: !17, line: 158, type: !6)
!239 = !DILocation(line: 158, column: 12, scope: !237)
!240 = !DILocation(line: 159, column: 10, scope: !237)
!241 = !DILocalVariable(name: "dataGoodBuffer", scope: !242, file: !17, line: 161, type: !12)
!242 = distinct !DILexicalBlock(scope: !237, file: !17, line: 160, column: 5)
!243 = !DILocation(line: 161, column: 16, scope: !242)
!244 = !DILocation(line: 161, column: 41, scope: !242)
!245 = !DILocation(line: 162, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !17, line: 162, column: 13)
!247 = !DILocation(line: 162, column: 28, scope: !246)
!248 = !DILocation(line: 162, column: 13, scope: !242)
!249 = !DILocation(line: 162, column: 38, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !17, line: 162, column: 37)
!251 = !DILocation(line: 163, column: 16, scope: !242)
!252 = !DILocation(line: 163, column: 9, scope: !242)
!253 = !DILocation(line: 164, column: 9, scope: !242)
!254 = !DILocation(line: 164, column: 30, scope: !242)
!255 = !DILocation(line: 166, column: 24, scope: !242)
!256 = !DILocation(line: 166, column: 14, scope: !242)
!257 = !DILocation(line: 168, column: 19, scope: !237)
!258 = !DILocation(line: 169, column: 17, scope: !237)
!259 = !DILocation(line: 169, column: 5, scope: !237)
!260 = !DILocation(line: 170, column: 1, scope: !237)
!261 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 140, type: !57, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!262 = !DILocalVariable(name: "data", arg: 1, scope: !261, file: !17, line: 140, type: !6)
!263 = !DILocation(line: 140, column: 32, scope: !261)
!264 = !DILocation(line: 142, column: 8, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !17, line: 142, column: 8)
!266 = !DILocation(line: 142, column: 8, scope: !261)
!267 = !DILocalVariable(name: "dataLen", scope: !268, file: !17, line: 146, type: !67)
!268 = distinct !DILexicalBlock(scope: !269, file: !17, line: 144, column: 9)
!269 = distinct !DILexicalBlock(scope: !265, file: !17, line: 143, column: 5)
!270 = !DILocation(line: 146, column: 20, scope: !268)
!271 = !DILocation(line: 146, column: 45, scope: !268)
!272 = !DILocation(line: 146, column: 30, scope: !268)
!273 = !DILocalVariable(name: "dest", scope: !268, file: !17, line: 147, type: !6)
!274 = !DILocation(line: 147, column: 20, scope: !268)
!275 = !DILocation(line: 147, column: 42, scope: !268)
!276 = !DILocation(line: 147, column: 49, scope: !268)
!277 = !DILocation(line: 147, column: 35, scope: !268)
!278 = !DILocation(line: 148, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !268, file: !17, line: 148, column: 17)
!280 = !DILocation(line: 148, column: 22, scope: !279)
!281 = !DILocation(line: 148, column: 17, scope: !268)
!282 = !DILocation(line: 148, column: 32, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !17, line: 148, column: 31)
!284 = !DILocation(line: 149, column: 26, scope: !268)
!285 = !DILocation(line: 149, column: 32, scope: !268)
!286 = !DILocation(line: 149, column: 19, scope: !268)
!287 = !DILocation(line: 150, column: 31, scope: !268)
!288 = !DILocation(line: 150, column: 13, scope: !268)
!289 = !DILocation(line: 151, column: 18, scope: !268)
!290 = !DILocation(line: 151, column: 13, scope: !268)
!291 = !DILocation(line: 153, column: 5, scope: !269)
!292 = !DILocation(line: 154, column: 1, scope: !261)
