; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_05_bad() #0 !dbg !24 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end3, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !33, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !37
  %1 = bitcast i8* %call to i32*, !dbg !38
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !36
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %cmp = icmp eq i32* %2, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.end, !dbg !42

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !46
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !49
  %6 = bitcast i32* %5 to i8*, !dbg !50
  store i8* %6, i8** %data, align 8, !dbg !51
  br label %if.end3, !dbg !52

if.end3:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @staticTrue, align 4, !dbg !53
  %tobool4 = icmp ne i32 %7, 0, !dbg !53
  br i1 %tobool4, label %if.then5, label %if.end12, !dbg !55

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !61
  %8 = load i8*, i8** %data, align 8, !dbg !62
  %call6 = call i64 @strlen(i8* %8) #9, !dbg !63
  store i64 %call6, i64* %dataLen, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !64, metadata !DIExpression()), !dbg !65
  %9 = load i64, i64* %dataLen, align 8, !dbg !66
  %add = add i64 %9, 1, !dbg !67
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !68
  store i8* %call7, i8** %dest, align 8, !dbg !65
  %10 = load i8*, i8** %dest, align 8, !dbg !69
  %cmp8 = icmp eq i8* %10, null, !dbg !71
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !72

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !73
  unreachable, !dbg !73

if.end10:                                         ; preds = %if.then5
  %11 = load i8*, i8** %dest, align 8, !dbg !75
  %12 = bitcast i8* %11 to i32*, !dbg !75
  %13 = load i8*, i8** %data, align 8, !dbg !76
  %14 = bitcast i8* %13 to i32*, !dbg !76
  %call11 = call i32* @wcscpy(i32* %12, i32* %14) #7, !dbg !77
  %15 = load i8*, i8** %dest, align 8, !dbg !78
  call void @printLine(i8* %15), !dbg !79
  %16 = load i8*, i8** %dest, align 8, !dbg !80
  call void @free(i8* %16) #7, !dbg !81
  br label %if.end12, !dbg !82

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !83
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_05_good() #0 !dbg !84 {
entry:
  call void @goodB2G1(), !dbg !85
  call void @goodB2G2(), !dbg !86
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_05_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_05_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticTrue, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end3, !dbg !114

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !119
  %1 = bitcast i8* %call to i32*, !dbg !120
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !118
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !121
  %cmp = icmp eq i32* %2, null, !dbg !123
  br i1 %cmp, label %if.then1, label %if.end, !dbg !124

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !127
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !128
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !131
  %6 = bitcast i32* %5 to i8*, !dbg !132
  store i8* %6, i8** %data, align 8, !dbg !133
  br label %if.end3, !dbg !134

if.end3:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @staticFalse, align 4, !dbg !135
  %tobool4 = icmp ne i32 %7, 0, !dbg !135
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !137

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !138
  br label %if.end12, !dbg !140

if.else:                                          ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !141, metadata !DIExpression()), !dbg !144
  %8 = load i8*, i8** %data, align 8, !dbg !145
  %9 = bitcast i8* %8 to i32*, !dbg !146
  %call6 = call i64 @wcslen(i32* %9) #9, !dbg !147
  store i64 %call6, i64* %dataLen, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !148, metadata !DIExpression()), !dbg !149
  %10 = load i64, i64* %dataLen, align 8, !dbg !150
  %add = add i64 %10, 1, !dbg !151
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !152
  store i8* %call7, i8** %dest, align 8, !dbg !149
  %11 = load i8*, i8** %dest, align 8, !dbg !153
  %cmp8 = icmp eq i8* %11, null, !dbg !155
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !156

if.then9:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !157
  unreachable, !dbg !157

if.end10:                                         ; preds = %if.else
  %12 = load i8*, i8** %dest, align 8, !dbg !159
  %13 = bitcast i8* %12 to i32*, !dbg !159
  %14 = load i8*, i8** %data, align 8, !dbg !160
  %15 = bitcast i8* %14 to i32*, !dbg !160
  %call11 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !161
  %16 = load i8*, i8** %dest, align 8, !dbg !162
  %17 = bitcast i8* %16 to i32*, !dbg !163
  call void @printWLine(i32* %17), !dbg !164
  %18 = load i8*, i8** %dest, align 8, !dbg !165
  call void @free(i8* %18) #7, !dbg !166
  br label %if.end12

if.end12:                                         ; preds = %if.end10, %if.then5
  ret void, !dbg !167
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !168 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i8* null, i8** %data, align 8, !dbg !171
  %0 = load i32, i32* @staticTrue, align 4, !dbg !172
  %tobool = icmp ne i32 %0, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end3, !dbg !174

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !175, metadata !DIExpression()), !dbg !178
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !179
  %1 = bitcast i8* %call to i32*, !dbg !180
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !178
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !181
  %cmp = icmp eq i32* %2, null, !dbg !183
  br i1 %cmp, label %if.then1, label %if.end, !dbg !184

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !187
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !188
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !191
  %6 = bitcast i32* %5 to i8*, !dbg !192
  store i8* %6, i8** %data, align 8, !dbg !193
  br label %if.end3, !dbg !194

if.end3:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @staticTrue, align 4, !dbg !195
  %tobool4 = icmp ne i32 %7, 0, !dbg !195
  br i1 %tobool4, label %if.then5, label %if.end12, !dbg !197

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !198, metadata !DIExpression()), !dbg !201
  %8 = load i8*, i8** %data, align 8, !dbg !202
  %9 = bitcast i8* %8 to i32*, !dbg !203
  %call6 = call i64 @wcslen(i32* %9) #9, !dbg !204
  store i64 %call6, i64* %dataLen, align 8, !dbg !201
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !205, metadata !DIExpression()), !dbg !206
  %10 = load i64, i64* %dataLen, align 8, !dbg !207
  %add = add i64 %10, 1, !dbg !208
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !209
  store i8* %call7, i8** %dest, align 8, !dbg !206
  %11 = load i8*, i8** %dest, align 8, !dbg !210
  %cmp8 = icmp eq i8* %11, null, !dbg !212
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !213

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !214
  unreachable, !dbg !214

if.end10:                                         ; preds = %if.then5
  %12 = load i8*, i8** %dest, align 8, !dbg !216
  %13 = bitcast i8* %12 to i32*, !dbg !216
  %14 = load i8*, i8** %data, align 8, !dbg !217
  %15 = bitcast i8* %14 to i32*, !dbg !217
  %call11 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !218
  %16 = load i8*, i8** %dest, align 8, !dbg !219
  %17 = bitcast i8* %16 to i32*, !dbg !220
  call void @printWLine(i32* %17), !dbg !221
  %18 = load i8*, i8** %dest, align 8, !dbg !222
  call void @free(i8* %18) #7, !dbg !223
  br label %if.end12, !dbg !224

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !226 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !227, metadata !DIExpression()), !dbg !228
  store i8* null, i8** %data, align 8, !dbg !229
  %0 = load i32, i32* @staticFalse, align 4, !dbg !230
  %tobool = icmp ne i32 %0, 0, !dbg !230
  br i1 %tobool, label %if.then, label %if.else, !dbg !232

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !233
  br label %if.end2, !dbg !235

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !236, metadata !DIExpression()), !dbg !239
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !240
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !239
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !241
  %cmp = icmp eq i8* %1, null, !dbg !243
  br i1 %cmp, label %if.then1, label %if.end, !dbg !244

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !245
  unreachable, !dbg !245

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !247
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !248
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !249
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !249
  store i8 0, i8* %arrayidx, align 1, !dbg !250
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !251
  store i8* %4, i8** %data, align 8, !dbg !252
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i32, i32* @staticTrue, align 4, !dbg !253
  %tobool3 = icmp ne i32 %5, 0, !dbg !253
  br i1 %tobool3, label %if.then4, label %if.end11, !dbg !255

if.then4:                                         ; preds = %if.end2
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !256, metadata !DIExpression()), !dbg !259
  %6 = load i8*, i8** %data, align 8, !dbg !260
  %call5 = call i64 @strlen(i8* %6) #9, !dbg !261
  store i64 %call5, i64* %dataLen, align 8, !dbg !259
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !262, metadata !DIExpression()), !dbg !263
  %7 = load i64, i64* %dataLen, align 8, !dbg !264
  %add = add i64 %7, 1, !dbg !265
  %call6 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !266
  store i8* %call6, i8** %dest, align 8, !dbg !263
  %8 = load i8*, i8** %dest, align 8, !dbg !267
  %cmp7 = icmp eq i8* %8, null, !dbg !269
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !270

if.then8:                                         ; preds = %if.then4
  call void @exit(i32 -1) #8, !dbg !271
  unreachable, !dbg !271

if.end9:                                          ; preds = %if.then4
  %9 = load i8*, i8** %dest, align 8, !dbg !273
  %10 = load i8*, i8** %data, align 8, !dbg !274
  %call10 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !275
  %11 = load i8*, i8** %dest, align 8, !dbg !276
  call void @printLine(i8* %11), !dbg !277
  %12 = load i8*, i8** %dest, align 8, !dbg !278
  call void @free(i8* %12) #7, !dbg !279
  br label %if.end11, !dbg !280

if.end11:                                         ; preds = %if.end9, %if.end2
  ret void, !dbg !281
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !282 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !283, metadata !DIExpression()), !dbg !284
  store i8* null, i8** %data, align 8, !dbg !285
  %0 = load i32, i32* @staticTrue, align 4, !dbg !286
  %tobool = icmp ne i32 %0, 0, !dbg !286
  br i1 %tobool, label %if.then, label %if.end2, !dbg !288

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !289, metadata !DIExpression()), !dbg !292
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !293
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !292
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !294
  %cmp = icmp eq i8* %1, null, !dbg !296
  br i1 %cmp, label %if.then1, label %if.end, !dbg !297

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !298
  unreachable, !dbg !298

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !300
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !301
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !302
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !302
  store i8 0, i8* %arrayidx, align 1, !dbg !303
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !304
  store i8* %4, i8** %data, align 8, !dbg !305
  br label %if.end2, !dbg !306

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticTrue, align 4, !dbg !307
  %tobool3 = icmp ne i32 %5, 0, !dbg !307
  br i1 %tobool3, label %if.then4, label %if.end11, !dbg !309

if.then4:                                         ; preds = %if.end2
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !310, metadata !DIExpression()), !dbg !313
  %6 = load i8*, i8** %data, align 8, !dbg !314
  %call5 = call i64 @strlen(i8* %6) #9, !dbg !315
  store i64 %call5, i64* %dataLen, align 8, !dbg !313
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !316, metadata !DIExpression()), !dbg !317
  %7 = load i64, i64* %dataLen, align 8, !dbg !318
  %add = add i64 %7, 1, !dbg !319
  %call6 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !320
  store i8* %call6, i8** %dest, align 8, !dbg !317
  %8 = load i8*, i8** %dest, align 8, !dbg !321
  %cmp7 = icmp eq i8* %8, null, !dbg !323
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !324

if.then8:                                         ; preds = %if.then4
  call void @exit(i32 -1) #8, !dbg !325
  unreachable, !dbg !325

if.end9:                                          ; preds = %if.then4
  %9 = load i8*, i8** %dest, align 8, !dbg !327
  %10 = load i8*, i8** %data, align 8, !dbg !328
  %call10 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !329
  %11 = load i8*, i8** %dest, align 8, !dbg !330
  call void @printLine(i8* %11), !dbg !331
  %12 = load i8*, i8** %dest, align 8, !dbg !332
  call void @free(i8* %12) #7, !dbg !333
  br label %if.end11, !dbg !334

if.end11:                                         ; preds = %if.end9, %if.end2
  ret void, !dbg !335
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !17, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !17, line: 26, type: !10, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_05.c", directory: "/root/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_05_bad", scope: !17, file: !17, line: 30, type: !25, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 32, type: !6)
!28 = !DILocation(line: 32, column: 12, scope: !24)
!29 = !DILocation(line: 33, column: 10, scope: !24)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 8, scope: !24)
!33 = !DILocalVariable(name: "dataBadBuffer", scope: !34, file: !17, line: 37, type: !7)
!34 = distinct !DILexicalBlock(scope: !35, file: !17, line: 36, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 23, scope: !34)
!37 = !DILocation(line: 37, column: 50, scope: !34)
!38 = !DILocation(line: 37, column: 39, scope: !34)
!39 = !DILocation(line: 38, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !17, line: 38, column: 17)
!41 = !DILocation(line: 38, column: 31, scope: !40)
!42 = !DILocation(line: 38, column: 17, scope: !34)
!43 = !DILocation(line: 38, column: 41, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 38, column: 40)
!45 = !DILocation(line: 39, column: 21, scope: !34)
!46 = !DILocation(line: 39, column: 13, scope: !34)
!47 = !DILocation(line: 40, column: 13, scope: !34)
!48 = !DILocation(line: 40, column: 33, scope: !34)
!49 = !DILocation(line: 42, column: 28, scope: !34)
!50 = !DILocation(line: 42, column: 20, scope: !34)
!51 = !DILocation(line: 42, column: 18, scope: !34)
!52 = !DILocation(line: 44, column: 5, scope: !35)
!53 = !DILocation(line: 45, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !17, line: 45, column: 8)
!55 = !DILocation(line: 45, column: 8, scope: !24)
!56 = !DILocalVariable(name: "dataLen", scope: !57, file: !17, line: 49, type: !59)
!57 = distinct !DILexicalBlock(scope: !58, file: !17, line: 47, column: 9)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 46, column: 5)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !60)
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 49, column: 20, scope: !57)
!62 = !DILocation(line: 49, column: 45, scope: !57)
!63 = !DILocation(line: 49, column: 30, scope: !57)
!64 = !DILocalVariable(name: "dest", scope: !57, file: !17, line: 50, type: !6)
!65 = !DILocation(line: 50, column: 20, scope: !57)
!66 = !DILocation(line: 50, column: 42, scope: !57)
!67 = !DILocation(line: 50, column: 49, scope: !57)
!68 = !DILocation(line: 50, column: 35, scope: !57)
!69 = !DILocation(line: 51, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !57, file: !17, line: 51, column: 17)
!71 = !DILocation(line: 51, column: 22, scope: !70)
!72 = !DILocation(line: 51, column: 17, scope: !57)
!73 = !DILocation(line: 51, column: 32, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !17, line: 51, column: 31)
!75 = !DILocation(line: 52, column: 26, scope: !57)
!76 = !DILocation(line: 52, column: 32, scope: !57)
!77 = !DILocation(line: 52, column: 19, scope: !57)
!78 = !DILocation(line: 53, column: 31, scope: !57)
!79 = !DILocation(line: 53, column: 13, scope: !57)
!80 = !DILocation(line: 54, column: 18, scope: !57)
!81 = !DILocation(line: 54, column: 13, scope: !57)
!82 = !DILocation(line: 56, column: 5, scope: !58)
!83 = !DILocation(line: 57, column: 1, scope: !24)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_05_good", scope: !17, file: !17, line: 193, type: !25, scopeLine: 194, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 195, column: 5, scope: !84)
!86 = !DILocation(line: 196, column: 5, scope: !84)
!87 = !DILocation(line: 197, column: 5, scope: !84)
!88 = !DILocation(line: 198, column: 5, scope: !84)
!89 = !DILocation(line: 199, column: 1, scope: !84)
!90 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 210, type: !91, scopeLine: 211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!10, !10, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !17, line: 210, type: !10)
!95 = !DILocation(line: 210, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !17, line: 210, type: !93)
!97 = !DILocation(line: 210, column: 27, scope: !90)
!98 = !DILocation(line: 213, column: 22, scope: !90)
!99 = !DILocation(line: 213, column: 12, scope: !90)
!100 = !DILocation(line: 213, column: 5, scope: !90)
!101 = !DILocation(line: 215, column: 5, scope: !90)
!102 = !DILocation(line: 216, column: 5, scope: !90)
!103 = !DILocation(line: 217, column: 5, scope: !90)
!104 = !DILocation(line: 220, column: 5, scope: !90)
!105 = !DILocation(line: 221, column: 5, scope: !90)
!106 = !DILocation(line: 222, column: 5, scope: !90)
!107 = !DILocation(line: 224, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodB2G1", scope: !17, file: !17, line: 64, type: !25, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 66, type: !6)
!110 = !DILocation(line: 66, column: 12, scope: !108)
!111 = !DILocation(line: 67, column: 10, scope: !108)
!112 = !DILocation(line: 68, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !17, line: 68, column: 8)
!114 = !DILocation(line: 68, column: 8, scope: !108)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !17, line: 71, type: !7)
!116 = distinct !DILexicalBlock(scope: !117, file: !17, line: 70, column: 9)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 69, column: 5)
!118 = !DILocation(line: 71, column: 23, scope: !116)
!119 = !DILocation(line: 71, column: 50, scope: !116)
!120 = !DILocation(line: 71, column: 39, scope: !116)
!121 = !DILocation(line: 72, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !17, line: 72, column: 17)
!123 = !DILocation(line: 72, column: 31, scope: !122)
!124 = !DILocation(line: 72, column: 17, scope: !116)
!125 = !DILocation(line: 72, column: 41, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !17, line: 72, column: 40)
!127 = !DILocation(line: 73, column: 21, scope: !116)
!128 = !DILocation(line: 73, column: 13, scope: !116)
!129 = !DILocation(line: 74, column: 13, scope: !116)
!130 = !DILocation(line: 74, column: 33, scope: !116)
!131 = !DILocation(line: 76, column: 28, scope: !116)
!132 = !DILocation(line: 76, column: 20, scope: !116)
!133 = !DILocation(line: 76, column: 18, scope: !116)
!134 = !DILocation(line: 78, column: 5, scope: !117)
!135 = !DILocation(line: 79, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !108, file: !17, line: 79, column: 8)
!137 = !DILocation(line: 79, column: 8, scope: !108)
!138 = !DILocation(line: 82, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !17, line: 80, column: 5)
!140 = !DILocation(line: 83, column: 5, scope: !139)
!141 = !DILocalVariable(name: "dataLen", scope: !142, file: !17, line: 88, type: !59)
!142 = distinct !DILexicalBlock(scope: !143, file: !17, line: 86, column: 9)
!143 = distinct !DILexicalBlock(scope: !136, file: !17, line: 85, column: 5)
!144 = !DILocation(line: 88, column: 20, scope: !142)
!145 = !DILocation(line: 88, column: 48, scope: !142)
!146 = !DILocation(line: 88, column: 37, scope: !142)
!147 = !DILocation(line: 88, column: 30, scope: !142)
!148 = !DILocalVariable(name: "dest", scope: !142, file: !17, line: 89, type: !6)
!149 = !DILocation(line: 89, column: 20, scope: !142)
!150 = !DILocation(line: 89, column: 42, scope: !142)
!151 = !DILocation(line: 89, column: 49, scope: !142)
!152 = !DILocation(line: 89, column: 35, scope: !142)
!153 = !DILocation(line: 90, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !142, file: !17, line: 90, column: 17)
!155 = !DILocation(line: 90, column: 22, scope: !154)
!156 = !DILocation(line: 90, column: 17, scope: !142)
!157 = !DILocation(line: 90, column: 32, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !17, line: 90, column: 31)
!159 = !DILocation(line: 91, column: 26, scope: !142)
!160 = !DILocation(line: 91, column: 32, scope: !142)
!161 = !DILocation(line: 91, column: 19, scope: !142)
!162 = !DILocation(line: 92, column: 35, scope: !142)
!163 = !DILocation(line: 92, column: 24, scope: !142)
!164 = !DILocation(line: 92, column: 13, scope: !142)
!165 = !DILocation(line: 93, column: 18, scope: !142)
!166 = !DILocation(line: 93, column: 13, scope: !142)
!167 = !DILocation(line: 96, column: 1, scope: !108)
!168 = distinct !DISubprogram(name: "goodB2G2", scope: !17, file: !17, line: 99, type: !25, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!169 = !DILocalVariable(name: "data", scope: !168, file: !17, line: 101, type: !6)
!170 = !DILocation(line: 101, column: 12, scope: !168)
!171 = !DILocation(line: 102, column: 10, scope: !168)
!172 = !DILocation(line: 103, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !17, line: 103, column: 8)
!174 = !DILocation(line: 103, column: 8, scope: !168)
!175 = !DILocalVariable(name: "dataBadBuffer", scope: !176, file: !17, line: 106, type: !7)
!176 = distinct !DILexicalBlock(scope: !177, file: !17, line: 105, column: 9)
!177 = distinct !DILexicalBlock(scope: !173, file: !17, line: 104, column: 5)
!178 = !DILocation(line: 106, column: 23, scope: !176)
!179 = !DILocation(line: 106, column: 50, scope: !176)
!180 = !DILocation(line: 106, column: 39, scope: !176)
!181 = !DILocation(line: 107, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !17, line: 107, column: 17)
!183 = !DILocation(line: 107, column: 31, scope: !182)
!184 = !DILocation(line: 107, column: 17, scope: !176)
!185 = !DILocation(line: 107, column: 41, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !17, line: 107, column: 40)
!187 = !DILocation(line: 108, column: 21, scope: !176)
!188 = !DILocation(line: 108, column: 13, scope: !176)
!189 = !DILocation(line: 109, column: 13, scope: !176)
!190 = !DILocation(line: 109, column: 33, scope: !176)
!191 = !DILocation(line: 111, column: 28, scope: !176)
!192 = !DILocation(line: 111, column: 20, scope: !176)
!193 = !DILocation(line: 111, column: 18, scope: !176)
!194 = !DILocation(line: 113, column: 5, scope: !177)
!195 = !DILocation(line: 114, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !168, file: !17, line: 114, column: 8)
!197 = !DILocation(line: 114, column: 8, scope: !168)
!198 = !DILocalVariable(name: "dataLen", scope: !199, file: !17, line: 118, type: !59)
!199 = distinct !DILexicalBlock(scope: !200, file: !17, line: 116, column: 9)
!200 = distinct !DILexicalBlock(scope: !196, file: !17, line: 115, column: 5)
!201 = !DILocation(line: 118, column: 20, scope: !199)
!202 = !DILocation(line: 118, column: 48, scope: !199)
!203 = !DILocation(line: 118, column: 37, scope: !199)
!204 = !DILocation(line: 118, column: 30, scope: !199)
!205 = !DILocalVariable(name: "dest", scope: !199, file: !17, line: 119, type: !6)
!206 = !DILocation(line: 119, column: 20, scope: !199)
!207 = !DILocation(line: 119, column: 42, scope: !199)
!208 = !DILocation(line: 119, column: 49, scope: !199)
!209 = !DILocation(line: 119, column: 35, scope: !199)
!210 = !DILocation(line: 120, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !199, file: !17, line: 120, column: 17)
!212 = !DILocation(line: 120, column: 22, scope: !211)
!213 = !DILocation(line: 120, column: 17, scope: !199)
!214 = !DILocation(line: 120, column: 32, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !17, line: 120, column: 31)
!216 = !DILocation(line: 121, column: 26, scope: !199)
!217 = !DILocation(line: 121, column: 32, scope: !199)
!218 = !DILocation(line: 121, column: 19, scope: !199)
!219 = !DILocation(line: 122, column: 35, scope: !199)
!220 = !DILocation(line: 122, column: 24, scope: !199)
!221 = !DILocation(line: 122, column: 13, scope: !199)
!222 = !DILocation(line: 123, column: 18, scope: !199)
!223 = !DILocation(line: 123, column: 13, scope: !199)
!224 = !DILocation(line: 125, column: 5, scope: !200)
!225 = !DILocation(line: 126, column: 1, scope: !168)
!226 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 129, type: !25, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!227 = !DILocalVariable(name: "data", scope: !226, file: !17, line: 131, type: !6)
!228 = !DILocation(line: 131, column: 12, scope: !226)
!229 = !DILocation(line: 132, column: 10, scope: !226)
!230 = !DILocation(line: 133, column: 8, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !17, line: 133, column: 8)
!232 = !DILocation(line: 133, column: 8, scope: !226)
!233 = !DILocation(line: 136, column: 9, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !17, line: 134, column: 5)
!235 = !DILocation(line: 137, column: 5, scope: !234)
!236 = !DILocalVariable(name: "dataGoodBuffer", scope: !237, file: !17, line: 141, type: !11)
!237 = distinct !DILexicalBlock(scope: !238, file: !17, line: 140, column: 9)
!238 = distinct !DILexicalBlock(scope: !231, file: !17, line: 139, column: 5)
!239 = !DILocation(line: 141, column: 20, scope: !237)
!240 = !DILocation(line: 141, column: 45, scope: !237)
!241 = !DILocation(line: 142, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !17, line: 142, column: 17)
!243 = !DILocation(line: 142, column: 32, scope: !242)
!244 = !DILocation(line: 142, column: 17, scope: !237)
!245 = !DILocation(line: 142, column: 42, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !17, line: 142, column: 41)
!247 = !DILocation(line: 143, column: 20, scope: !237)
!248 = !DILocation(line: 143, column: 13, scope: !237)
!249 = !DILocation(line: 144, column: 13, scope: !237)
!250 = !DILocation(line: 144, column: 34, scope: !237)
!251 = !DILocation(line: 146, column: 28, scope: !237)
!252 = !DILocation(line: 146, column: 18, scope: !237)
!253 = !DILocation(line: 149, column: 8, scope: !254)
!254 = distinct !DILexicalBlock(scope: !226, file: !17, line: 149, column: 8)
!255 = !DILocation(line: 149, column: 8, scope: !226)
!256 = !DILocalVariable(name: "dataLen", scope: !257, file: !17, line: 153, type: !59)
!257 = distinct !DILexicalBlock(scope: !258, file: !17, line: 151, column: 9)
!258 = distinct !DILexicalBlock(scope: !254, file: !17, line: 150, column: 5)
!259 = !DILocation(line: 153, column: 20, scope: !257)
!260 = !DILocation(line: 153, column: 45, scope: !257)
!261 = !DILocation(line: 153, column: 30, scope: !257)
!262 = !DILocalVariable(name: "dest", scope: !257, file: !17, line: 154, type: !6)
!263 = !DILocation(line: 154, column: 20, scope: !257)
!264 = !DILocation(line: 154, column: 42, scope: !257)
!265 = !DILocation(line: 154, column: 49, scope: !257)
!266 = !DILocation(line: 154, column: 35, scope: !257)
!267 = !DILocation(line: 155, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !257, file: !17, line: 155, column: 17)
!269 = !DILocation(line: 155, column: 22, scope: !268)
!270 = !DILocation(line: 155, column: 17, scope: !257)
!271 = !DILocation(line: 155, column: 32, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !17, line: 155, column: 31)
!273 = !DILocation(line: 156, column: 26, scope: !257)
!274 = !DILocation(line: 156, column: 32, scope: !257)
!275 = !DILocation(line: 156, column: 19, scope: !257)
!276 = !DILocation(line: 157, column: 31, scope: !257)
!277 = !DILocation(line: 157, column: 13, scope: !257)
!278 = !DILocation(line: 158, column: 18, scope: !257)
!279 = !DILocation(line: 158, column: 13, scope: !257)
!280 = !DILocation(line: 160, column: 5, scope: !258)
!281 = !DILocation(line: 161, column: 1, scope: !226)
!282 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 164, type: !25, scopeLine: 165, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!283 = !DILocalVariable(name: "data", scope: !282, file: !17, line: 166, type: !6)
!284 = !DILocation(line: 166, column: 12, scope: !282)
!285 = !DILocation(line: 167, column: 10, scope: !282)
!286 = !DILocation(line: 168, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !17, line: 168, column: 8)
!288 = !DILocation(line: 168, column: 8, scope: !282)
!289 = !DILocalVariable(name: "dataGoodBuffer", scope: !290, file: !17, line: 171, type: !11)
!290 = distinct !DILexicalBlock(scope: !291, file: !17, line: 170, column: 9)
!291 = distinct !DILexicalBlock(scope: !287, file: !17, line: 169, column: 5)
!292 = !DILocation(line: 171, column: 20, scope: !290)
!293 = !DILocation(line: 171, column: 45, scope: !290)
!294 = !DILocation(line: 172, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !290, file: !17, line: 172, column: 17)
!296 = !DILocation(line: 172, column: 32, scope: !295)
!297 = !DILocation(line: 172, column: 17, scope: !290)
!298 = !DILocation(line: 172, column: 42, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !17, line: 172, column: 41)
!300 = !DILocation(line: 173, column: 20, scope: !290)
!301 = !DILocation(line: 173, column: 13, scope: !290)
!302 = !DILocation(line: 174, column: 13, scope: !290)
!303 = !DILocation(line: 174, column: 34, scope: !290)
!304 = !DILocation(line: 176, column: 28, scope: !290)
!305 = !DILocation(line: 176, column: 18, scope: !290)
!306 = !DILocation(line: 178, column: 5, scope: !291)
!307 = !DILocation(line: 179, column: 8, scope: !308)
!308 = distinct !DILexicalBlock(scope: !282, file: !17, line: 179, column: 8)
!309 = !DILocation(line: 179, column: 8, scope: !282)
!310 = !DILocalVariable(name: "dataLen", scope: !311, file: !17, line: 183, type: !59)
!311 = distinct !DILexicalBlock(scope: !312, file: !17, line: 181, column: 9)
!312 = distinct !DILexicalBlock(scope: !308, file: !17, line: 180, column: 5)
!313 = !DILocation(line: 183, column: 20, scope: !311)
!314 = !DILocation(line: 183, column: 45, scope: !311)
!315 = !DILocation(line: 183, column: 30, scope: !311)
!316 = !DILocalVariable(name: "dest", scope: !311, file: !17, line: 184, type: !6)
!317 = !DILocation(line: 184, column: 20, scope: !311)
!318 = !DILocation(line: 184, column: 42, scope: !311)
!319 = !DILocation(line: 184, column: 49, scope: !311)
!320 = !DILocation(line: 184, column: 35, scope: !311)
!321 = !DILocation(line: 185, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !311, file: !17, line: 185, column: 17)
!323 = !DILocation(line: 185, column: 22, scope: !322)
!324 = !DILocation(line: 185, column: 17, scope: !311)
!325 = !DILocation(line: 185, column: 32, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !17, line: 185, column: 31)
!327 = !DILocation(line: 186, column: 26, scope: !311)
!328 = !DILocation(line: 186, column: 32, scope: !311)
!329 = !DILocation(line: 186, column: 19, scope: !311)
!330 = !DILocation(line: 187, column: 31, scope: !311)
!331 = !DILocation(line: 187, column: 13, scope: !311)
!332 = !DILocation(line: 188, column: 18, scope: !311)
!333 = !DILocation(line: 188, column: 13, scope: !311)
!334 = !DILocation(line: 190, column: 5, scope: !312)
!335 = !DILocation(line: 191, column: 1, scope: !282)
