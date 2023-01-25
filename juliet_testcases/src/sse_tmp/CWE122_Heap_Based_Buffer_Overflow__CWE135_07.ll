; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticFive, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end4, !dbg !31

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !36
  %1 = bitcast i8* %call to i32*, !dbg !37
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !35
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %cmp1 = icmp eq i32* %2, null, !dbg !40
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !41

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !45
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !48
  %6 = bitcast i32* %5 to i8*, !dbg !49
  store i8* %6, i8** %data, align 8, !dbg !50
  br label %if.end4, !dbg !51

if.end4:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @staticFive, align 4, !dbg !52
  %cmp5 = icmp eq i32 %7, 5, !dbg !54
  br i1 %cmp5, label %if.then6, label %if.end13, !dbg !55

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !61
  %8 = load i8*, i8** %data, align 8, !dbg !62
  %call7 = call i64 @strlen(i8* %8) #9, !dbg !63
  store i64 %call7, i64* %dataLen, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !64, metadata !DIExpression()), !dbg !65
  %9 = load i64, i64* %dataLen, align 8, !dbg !66
  %add = add i64 %9, 1, !dbg !67
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !68
  store i8* %call8, i8** %dest, align 8, !dbg !65
  %10 = load i8*, i8** %dest, align 8, !dbg !69
  %cmp9 = icmp eq i8* %10, null, !dbg !71
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !72

if.then10:                                        ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !73
  unreachable, !dbg !73

if.end11:                                         ; preds = %if.then6
  %11 = load i8*, i8** %dest, align 8, !dbg !75
  %12 = bitcast i8* %11 to i32*, !dbg !75
  %13 = load i8*, i8** %data, align 8, !dbg !76
  %14 = bitcast i8* %13 to i32*, !dbg !76
  %call12 = call i32* @wcscpy(i32* %12, i32* %14) #7, !dbg !77
  %15 = load i8*, i8** %dest, align 8, !dbg !78
  call void @printLine(i8* %15), !dbg !79
  %16 = load i8*, i8** %dest, align 8, !dbg !80
  call void @free(i8* %16) #7, !dbg !81
  br label %if.end13, !dbg !82

if.end13:                                         ; preds = %if.end11, %if.end4
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_07_good() #0 !dbg !84 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_07_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_07_bad(), !dbg !105
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end4, !dbg !115

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !120
  %1 = bitcast i8* %call to i32*, !dbg !121
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !119
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !122
  %cmp1 = icmp eq i32* %2, null, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !128
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !129
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !132
  %6 = bitcast i32* %5 to i8*, !dbg !133
  store i8* %6, i8** %data, align 8, !dbg !134
  br label %if.end4, !dbg !135

if.end4:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @staticFive, align 4, !dbg !136
  %cmp5 = icmp ne i32 %7, 5, !dbg !138
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !139

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !140
  br label %if.end13, !dbg !142

if.else:                                          ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !143, metadata !DIExpression()), !dbg !146
  %8 = load i8*, i8** %data, align 8, !dbg !147
  %9 = bitcast i8* %8 to i32*, !dbg !148
  %call7 = call i64 @wcslen(i32* %9) #9, !dbg !149
  store i64 %call7, i64* %dataLen, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !150, metadata !DIExpression()), !dbg !151
  %10 = load i64, i64* %dataLen, align 8, !dbg !152
  %add = add i64 %10, 1, !dbg !153
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !154
  store i8* %call8, i8** %dest, align 8, !dbg !151
  %11 = load i8*, i8** %dest, align 8, !dbg !155
  %cmp9 = icmp eq i8* %11, null, !dbg !157
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !158

if.then10:                                        ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !159
  unreachable, !dbg !159

if.end11:                                         ; preds = %if.else
  %12 = load i8*, i8** %dest, align 8, !dbg !161
  %13 = bitcast i8* %12 to i32*, !dbg !161
  %14 = load i8*, i8** %data, align 8, !dbg !162
  %15 = bitcast i8* %14 to i32*, !dbg !162
  %call12 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !163
  %16 = load i8*, i8** %dest, align 8, !dbg !164
  %17 = bitcast i8* %16 to i32*, !dbg !165
  call void @printWLine(i32* %17), !dbg !166
  %18 = load i8*, i8** %dest, align 8, !dbg !167
  call void @free(i8* %18) #7, !dbg !168
  br label %if.end13

if.end13:                                         ; preds = %if.end11, %if.then6
  ret void, !dbg !169
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !170 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !171, metadata !DIExpression()), !dbg !172
  store i8* null, i8** %data, align 8, !dbg !173
  %0 = load i32, i32* @staticFive, align 4, !dbg !174
  %cmp = icmp eq i32 %0, 5, !dbg !176
  br i1 %cmp, label %if.then, label %if.end4, !dbg !177

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !178, metadata !DIExpression()), !dbg !181
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !182
  %1 = bitcast i8* %call to i32*, !dbg !183
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !181
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !184
  %cmp1 = icmp eq i32* %2, null, !dbg !186
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !187

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !190
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !191
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !192
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !192
  store i32 0, i32* %arrayidx, align 4, !dbg !193
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !194
  %6 = bitcast i32* %5 to i8*, !dbg !195
  store i8* %6, i8** %data, align 8, !dbg !196
  br label %if.end4, !dbg !197

if.end4:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @staticFive, align 4, !dbg !198
  %cmp5 = icmp eq i32 %7, 5, !dbg !200
  br i1 %cmp5, label %if.then6, label %if.end13, !dbg !201

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !202, metadata !DIExpression()), !dbg !205
  %8 = load i8*, i8** %data, align 8, !dbg !206
  %9 = bitcast i8* %8 to i32*, !dbg !207
  %call7 = call i64 @wcslen(i32* %9) #9, !dbg !208
  store i64 %call7, i64* %dataLen, align 8, !dbg !205
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !209, metadata !DIExpression()), !dbg !210
  %10 = load i64, i64* %dataLen, align 8, !dbg !211
  %add = add i64 %10, 1, !dbg !212
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !213
  store i8* %call8, i8** %dest, align 8, !dbg !210
  %11 = load i8*, i8** %dest, align 8, !dbg !214
  %cmp9 = icmp eq i8* %11, null, !dbg !216
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !217

if.then10:                                        ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !218
  unreachable, !dbg !218

if.end11:                                         ; preds = %if.then6
  %12 = load i8*, i8** %dest, align 8, !dbg !220
  %13 = bitcast i8* %12 to i32*, !dbg !220
  %14 = load i8*, i8** %data, align 8, !dbg !221
  %15 = bitcast i8* %14 to i32*, !dbg !221
  %call12 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !222
  %16 = load i8*, i8** %dest, align 8, !dbg !223
  %17 = bitcast i8* %16 to i32*, !dbg !224
  call void @printWLine(i32* %17), !dbg !225
  %18 = load i8*, i8** %dest, align 8, !dbg !226
  call void @free(i8* %18) #7, !dbg !227
  br label %if.end13, !dbg !228

if.end13:                                         ; preds = %if.end11, %if.end4
  ret void, !dbg !229
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !230 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !231, metadata !DIExpression()), !dbg !232
  store i8* null, i8** %data, align 8, !dbg !233
  %0 = load i32, i32* @staticFive, align 4, !dbg !234
  %cmp = icmp ne i32 %0, 5, !dbg !236
  br i1 %cmp, label %if.then, label %if.else, !dbg !237

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !238
  br label %if.end3, !dbg !240

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !241, metadata !DIExpression()), !dbg !244
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !245
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !244
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !246
  %cmp1 = icmp eq i8* %1, null, !dbg !248
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !249

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !250
  unreachable, !dbg !250

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !253
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !254
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !254
  store i8 0, i8* %arrayidx, align 1, !dbg !255
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !256
  store i8* %4, i8** %data, align 8, !dbg !257
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i32, i32* @staticFive, align 4, !dbg !258
  %cmp4 = icmp eq i32 %5, 5, !dbg !260
  br i1 %cmp4, label %if.then5, label %if.end12, !dbg !261

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !262, metadata !DIExpression()), !dbg !265
  %6 = load i8*, i8** %data, align 8, !dbg !266
  %call6 = call i64 @strlen(i8* %6) #9, !dbg !267
  store i64 %call6, i64* %dataLen, align 8, !dbg !265
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !268, metadata !DIExpression()), !dbg !269
  %7 = load i64, i64* %dataLen, align 8, !dbg !270
  %add = add i64 %7, 1, !dbg !271
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !272
  store i8* %call7, i8** %dest, align 8, !dbg !269
  %8 = load i8*, i8** %dest, align 8, !dbg !273
  %cmp8 = icmp eq i8* %8, null, !dbg !275
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !276

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !277
  unreachable, !dbg !277

if.end10:                                         ; preds = %if.then5
  %9 = load i8*, i8** %dest, align 8, !dbg !279
  %10 = load i8*, i8** %data, align 8, !dbg !280
  %call11 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !281
  %11 = load i8*, i8** %dest, align 8, !dbg !282
  call void @printLine(i8* %11), !dbg !283
  %12 = load i8*, i8** %dest, align 8, !dbg !284
  call void @free(i8* %12) #7, !dbg !285
  br label %if.end12, !dbg !286

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !287
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !288 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !289, metadata !DIExpression()), !dbg !290
  store i8* null, i8** %data, align 8, !dbg !291
  %0 = load i32, i32* @staticFive, align 4, !dbg !292
  %cmp = icmp eq i32 %0, 5, !dbg !294
  br i1 %cmp, label %if.then, label %if.end3, !dbg !295

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !296, metadata !DIExpression()), !dbg !299
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !300
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !299
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !301
  %cmp1 = icmp eq i8* %1, null, !dbg !303
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !304

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !305
  unreachable, !dbg !305

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !307
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !308
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !309
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !309
  store i8 0, i8* %arrayidx, align 1, !dbg !310
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !311
  store i8* %4, i8** %data, align 8, !dbg !312
  br label %if.end3, !dbg !313

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFive, align 4, !dbg !314
  %cmp4 = icmp eq i32 %5, 5, !dbg !316
  br i1 %cmp4, label %if.then5, label %if.end12, !dbg !317

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !318, metadata !DIExpression()), !dbg !321
  %6 = load i8*, i8** %data, align 8, !dbg !322
  %call6 = call i64 @strlen(i8* %6) #9, !dbg !323
  store i64 %call6, i64* %dataLen, align 8, !dbg !321
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !324, metadata !DIExpression()), !dbg !325
  %7 = load i64, i64* %dataLen, align 8, !dbg !326
  %add = add i64 %7, 1, !dbg !327
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !328
  store i8* %call7, i8** %dest, align 8, !dbg !325
  %8 = load i8*, i8** %dest, align 8, !dbg !329
  %cmp8 = icmp eq i8* %8, null, !dbg !331
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !332

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !333
  unreachable, !dbg !333

if.end10:                                         ; preds = %if.then5
  %9 = load i8*, i8** %dest, align 8, !dbg !335
  %10 = load i8*, i8** %data, align 8, !dbg !336
  %call11 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !337
  %11 = load i8*, i8** %dest, align 8, !dbg !338
  call void @printLine(i8* %11), !dbg !339
  %12 = load i8*, i8** %dest, align 8, !dbg !340
  call void @free(i8* %12) #7, !dbg !341
  br label %if.end12, !dbg !342

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !343
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
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !15, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0}
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_07.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_07_bad", scope: !15, file: !15, line: 29, type: !23, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 31, type: !6)
!26 = !DILocation(line: 31, column: 12, scope: !22)
!27 = !DILocation(line: 32, column: 10, scope: !22)
!28 = !DILocation(line: 33, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 8)
!30 = !DILocation(line: 33, column: 18, scope: !29)
!31 = !DILocation(line: 33, column: 8, scope: !22)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !33, file: !15, line: 36, type: !7)
!33 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !15, line: 34, column: 5)
!35 = !DILocation(line: 36, column: 23, scope: !33)
!36 = !DILocation(line: 36, column: 50, scope: !33)
!37 = !DILocation(line: 36, column: 39, scope: !33)
!38 = !DILocation(line: 37, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !15, line: 37, column: 17)
!40 = !DILocation(line: 37, column: 31, scope: !39)
!41 = !DILocation(line: 37, column: 17, scope: !33)
!42 = !DILocation(line: 37, column: 41, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 37, column: 40)
!44 = !DILocation(line: 38, column: 21, scope: !33)
!45 = !DILocation(line: 38, column: 13, scope: !33)
!46 = !DILocation(line: 39, column: 13, scope: !33)
!47 = !DILocation(line: 39, column: 33, scope: !33)
!48 = !DILocation(line: 41, column: 28, scope: !33)
!49 = !DILocation(line: 41, column: 20, scope: !33)
!50 = !DILocation(line: 41, column: 18, scope: !33)
!51 = !DILocation(line: 43, column: 5, scope: !34)
!52 = !DILocation(line: 44, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !22, file: !15, line: 44, column: 8)
!54 = !DILocation(line: 44, column: 18, scope: !53)
!55 = !DILocation(line: 44, column: 8, scope: !22)
!56 = !DILocalVariable(name: "dataLen", scope: !57, file: !15, line: 48, type: !59)
!57 = distinct !DILexicalBlock(scope: !58, file: !15, line: 46, column: 9)
!58 = distinct !DILexicalBlock(scope: !53, file: !15, line: 45, column: 5)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !60)
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 48, column: 20, scope: !57)
!62 = !DILocation(line: 48, column: 45, scope: !57)
!63 = !DILocation(line: 48, column: 30, scope: !57)
!64 = !DILocalVariable(name: "dest", scope: !57, file: !15, line: 49, type: !6)
!65 = !DILocation(line: 49, column: 20, scope: !57)
!66 = !DILocation(line: 49, column: 42, scope: !57)
!67 = !DILocation(line: 49, column: 49, scope: !57)
!68 = !DILocation(line: 49, column: 35, scope: !57)
!69 = !DILocation(line: 50, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !57, file: !15, line: 50, column: 17)
!71 = !DILocation(line: 50, column: 22, scope: !70)
!72 = !DILocation(line: 50, column: 17, scope: !57)
!73 = !DILocation(line: 50, column: 32, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 50, column: 31)
!75 = !DILocation(line: 51, column: 26, scope: !57)
!76 = !DILocation(line: 51, column: 32, scope: !57)
!77 = !DILocation(line: 51, column: 19, scope: !57)
!78 = !DILocation(line: 52, column: 31, scope: !57)
!79 = !DILocation(line: 52, column: 13, scope: !57)
!80 = !DILocation(line: 53, column: 18, scope: !57)
!81 = !DILocation(line: 53, column: 13, scope: !57)
!82 = !DILocation(line: 55, column: 5, scope: !58)
!83 = !DILocation(line: 56, column: 1, scope: !22)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_07_good", scope: !15, file: !15, line: 192, type: !23, scopeLine: 193, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 194, column: 5, scope: !84)
!86 = !DILocation(line: 195, column: 5, scope: !84)
!87 = !DILocation(line: 196, column: 5, scope: !84)
!88 = !DILocation(line: 197, column: 5, scope: !84)
!89 = !DILocation(line: 198, column: 1, scope: !84)
!90 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 209, type: !91, scopeLine: 210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!10, !10, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !15, line: 209, type: !10)
!95 = !DILocation(line: 209, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !15, line: 209, type: !93)
!97 = !DILocation(line: 209, column: 27, scope: !90)
!98 = !DILocation(line: 212, column: 22, scope: !90)
!99 = !DILocation(line: 212, column: 12, scope: !90)
!100 = !DILocation(line: 212, column: 5, scope: !90)
!101 = !DILocation(line: 214, column: 5, scope: !90)
!102 = !DILocation(line: 215, column: 5, scope: !90)
!103 = !DILocation(line: 216, column: 5, scope: !90)
!104 = !DILocation(line: 219, column: 5, scope: !90)
!105 = !DILocation(line: 220, column: 5, scope: !90)
!106 = !DILocation(line: 221, column: 5, scope: !90)
!107 = !DILocation(line: 223, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 63, type: !23, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 65, type: !6)
!110 = !DILocation(line: 65, column: 12, scope: !108)
!111 = !DILocation(line: 66, column: 10, scope: !108)
!112 = !DILocation(line: 67, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 67, column: 8)
!114 = !DILocation(line: 67, column: 18, scope: !113)
!115 = !DILocation(line: 67, column: 8, scope: !108)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !15, line: 70, type: !7)
!117 = distinct !DILexicalBlock(scope: !118, file: !15, line: 69, column: 9)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 68, column: 5)
!119 = !DILocation(line: 70, column: 23, scope: !117)
!120 = !DILocation(line: 70, column: 50, scope: !117)
!121 = !DILocation(line: 70, column: 39, scope: !117)
!122 = !DILocation(line: 71, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !15, line: 71, column: 17)
!124 = !DILocation(line: 71, column: 31, scope: !123)
!125 = !DILocation(line: 71, column: 17, scope: !117)
!126 = !DILocation(line: 71, column: 41, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 71, column: 40)
!128 = !DILocation(line: 72, column: 21, scope: !117)
!129 = !DILocation(line: 72, column: 13, scope: !117)
!130 = !DILocation(line: 73, column: 13, scope: !117)
!131 = !DILocation(line: 73, column: 33, scope: !117)
!132 = !DILocation(line: 75, column: 28, scope: !117)
!133 = !DILocation(line: 75, column: 20, scope: !117)
!134 = !DILocation(line: 75, column: 18, scope: !117)
!135 = !DILocation(line: 77, column: 5, scope: !118)
!136 = !DILocation(line: 78, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !108, file: !15, line: 78, column: 8)
!138 = !DILocation(line: 78, column: 18, scope: !137)
!139 = !DILocation(line: 78, column: 8, scope: !108)
!140 = !DILocation(line: 81, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 79, column: 5)
!142 = !DILocation(line: 82, column: 5, scope: !141)
!143 = !DILocalVariable(name: "dataLen", scope: !144, file: !15, line: 87, type: !59)
!144 = distinct !DILexicalBlock(scope: !145, file: !15, line: 85, column: 9)
!145 = distinct !DILexicalBlock(scope: !137, file: !15, line: 84, column: 5)
!146 = !DILocation(line: 87, column: 20, scope: !144)
!147 = !DILocation(line: 87, column: 48, scope: !144)
!148 = !DILocation(line: 87, column: 37, scope: !144)
!149 = !DILocation(line: 87, column: 30, scope: !144)
!150 = !DILocalVariable(name: "dest", scope: !144, file: !15, line: 88, type: !6)
!151 = !DILocation(line: 88, column: 20, scope: !144)
!152 = !DILocation(line: 88, column: 42, scope: !144)
!153 = !DILocation(line: 88, column: 49, scope: !144)
!154 = !DILocation(line: 88, column: 35, scope: !144)
!155 = !DILocation(line: 89, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !144, file: !15, line: 89, column: 17)
!157 = !DILocation(line: 89, column: 22, scope: !156)
!158 = !DILocation(line: 89, column: 17, scope: !144)
!159 = !DILocation(line: 89, column: 32, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 89, column: 31)
!161 = !DILocation(line: 90, column: 26, scope: !144)
!162 = !DILocation(line: 90, column: 32, scope: !144)
!163 = !DILocation(line: 90, column: 19, scope: !144)
!164 = !DILocation(line: 91, column: 35, scope: !144)
!165 = !DILocation(line: 91, column: 24, scope: !144)
!166 = !DILocation(line: 91, column: 13, scope: !144)
!167 = !DILocation(line: 92, column: 18, scope: !144)
!168 = !DILocation(line: 92, column: 13, scope: !144)
!169 = !DILocation(line: 95, column: 1, scope: !108)
!170 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 98, type: !23, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", scope: !170, file: !15, line: 100, type: !6)
!172 = !DILocation(line: 100, column: 12, scope: !170)
!173 = !DILocation(line: 101, column: 10, scope: !170)
!174 = !DILocation(line: 102, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !15, line: 102, column: 8)
!176 = !DILocation(line: 102, column: 18, scope: !175)
!177 = !DILocation(line: 102, column: 8, scope: !170)
!178 = !DILocalVariable(name: "dataBadBuffer", scope: !179, file: !15, line: 105, type: !7)
!179 = distinct !DILexicalBlock(scope: !180, file: !15, line: 104, column: 9)
!180 = distinct !DILexicalBlock(scope: !175, file: !15, line: 103, column: 5)
!181 = !DILocation(line: 105, column: 23, scope: !179)
!182 = !DILocation(line: 105, column: 50, scope: !179)
!183 = !DILocation(line: 105, column: 39, scope: !179)
!184 = !DILocation(line: 106, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !179, file: !15, line: 106, column: 17)
!186 = !DILocation(line: 106, column: 31, scope: !185)
!187 = !DILocation(line: 106, column: 17, scope: !179)
!188 = !DILocation(line: 106, column: 41, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 106, column: 40)
!190 = !DILocation(line: 107, column: 21, scope: !179)
!191 = !DILocation(line: 107, column: 13, scope: !179)
!192 = !DILocation(line: 108, column: 13, scope: !179)
!193 = !DILocation(line: 108, column: 33, scope: !179)
!194 = !DILocation(line: 110, column: 28, scope: !179)
!195 = !DILocation(line: 110, column: 20, scope: !179)
!196 = !DILocation(line: 110, column: 18, scope: !179)
!197 = !DILocation(line: 112, column: 5, scope: !180)
!198 = !DILocation(line: 113, column: 8, scope: !199)
!199 = distinct !DILexicalBlock(scope: !170, file: !15, line: 113, column: 8)
!200 = !DILocation(line: 113, column: 18, scope: !199)
!201 = !DILocation(line: 113, column: 8, scope: !170)
!202 = !DILocalVariable(name: "dataLen", scope: !203, file: !15, line: 117, type: !59)
!203 = distinct !DILexicalBlock(scope: !204, file: !15, line: 115, column: 9)
!204 = distinct !DILexicalBlock(scope: !199, file: !15, line: 114, column: 5)
!205 = !DILocation(line: 117, column: 20, scope: !203)
!206 = !DILocation(line: 117, column: 48, scope: !203)
!207 = !DILocation(line: 117, column: 37, scope: !203)
!208 = !DILocation(line: 117, column: 30, scope: !203)
!209 = !DILocalVariable(name: "dest", scope: !203, file: !15, line: 118, type: !6)
!210 = !DILocation(line: 118, column: 20, scope: !203)
!211 = !DILocation(line: 118, column: 42, scope: !203)
!212 = !DILocation(line: 118, column: 49, scope: !203)
!213 = !DILocation(line: 118, column: 35, scope: !203)
!214 = !DILocation(line: 119, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !203, file: !15, line: 119, column: 17)
!216 = !DILocation(line: 119, column: 22, scope: !215)
!217 = !DILocation(line: 119, column: 17, scope: !203)
!218 = !DILocation(line: 119, column: 32, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 119, column: 31)
!220 = !DILocation(line: 120, column: 26, scope: !203)
!221 = !DILocation(line: 120, column: 32, scope: !203)
!222 = !DILocation(line: 120, column: 19, scope: !203)
!223 = !DILocation(line: 121, column: 35, scope: !203)
!224 = !DILocation(line: 121, column: 24, scope: !203)
!225 = !DILocation(line: 121, column: 13, scope: !203)
!226 = !DILocation(line: 122, column: 18, scope: !203)
!227 = !DILocation(line: 122, column: 13, scope: !203)
!228 = !DILocation(line: 124, column: 5, scope: !204)
!229 = !DILocation(line: 125, column: 1, scope: !170)
!230 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 128, type: !23, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!231 = !DILocalVariable(name: "data", scope: !230, file: !15, line: 130, type: !6)
!232 = !DILocation(line: 130, column: 12, scope: !230)
!233 = !DILocation(line: 131, column: 10, scope: !230)
!234 = !DILocation(line: 132, column: 8, scope: !235)
!235 = distinct !DILexicalBlock(scope: !230, file: !15, line: 132, column: 8)
!236 = !DILocation(line: 132, column: 18, scope: !235)
!237 = !DILocation(line: 132, column: 8, scope: !230)
!238 = !DILocation(line: 135, column: 9, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 133, column: 5)
!240 = !DILocation(line: 136, column: 5, scope: !239)
!241 = !DILocalVariable(name: "dataGoodBuffer", scope: !242, file: !15, line: 140, type: !11)
!242 = distinct !DILexicalBlock(scope: !243, file: !15, line: 139, column: 9)
!243 = distinct !DILexicalBlock(scope: !235, file: !15, line: 138, column: 5)
!244 = !DILocation(line: 140, column: 20, scope: !242)
!245 = !DILocation(line: 140, column: 45, scope: !242)
!246 = !DILocation(line: 141, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !242, file: !15, line: 141, column: 17)
!248 = !DILocation(line: 141, column: 32, scope: !247)
!249 = !DILocation(line: 141, column: 17, scope: !242)
!250 = !DILocation(line: 141, column: 42, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !15, line: 141, column: 41)
!252 = !DILocation(line: 142, column: 20, scope: !242)
!253 = !DILocation(line: 142, column: 13, scope: !242)
!254 = !DILocation(line: 143, column: 13, scope: !242)
!255 = !DILocation(line: 143, column: 34, scope: !242)
!256 = !DILocation(line: 145, column: 28, scope: !242)
!257 = !DILocation(line: 145, column: 18, scope: !242)
!258 = !DILocation(line: 148, column: 8, scope: !259)
!259 = distinct !DILexicalBlock(scope: !230, file: !15, line: 148, column: 8)
!260 = !DILocation(line: 148, column: 18, scope: !259)
!261 = !DILocation(line: 148, column: 8, scope: !230)
!262 = !DILocalVariable(name: "dataLen", scope: !263, file: !15, line: 152, type: !59)
!263 = distinct !DILexicalBlock(scope: !264, file: !15, line: 150, column: 9)
!264 = distinct !DILexicalBlock(scope: !259, file: !15, line: 149, column: 5)
!265 = !DILocation(line: 152, column: 20, scope: !263)
!266 = !DILocation(line: 152, column: 45, scope: !263)
!267 = !DILocation(line: 152, column: 30, scope: !263)
!268 = !DILocalVariable(name: "dest", scope: !263, file: !15, line: 153, type: !6)
!269 = !DILocation(line: 153, column: 20, scope: !263)
!270 = !DILocation(line: 153, column: 42, scope: !263)
!271 = !DILocation(line: 153, column: 49, scope: !263)
!272 = !DILocation(line: 153, column: 35, scope: !263)
!273 = !DILocation(line: 154, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !263, file: !15, line: 154, column: 17)
!275 = !DILocation(line: 154, column: 22, scope: !274)
!276 = !DILocation(line: 154, column: 17, scope: !263)
!277 = !DILocation(line: 154, column: 32, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !15, line: 154, column: 31)
!279 = !DILocation(line: 155, column: 26, scope: !263)
!280 = !DILocation(line: 155, column: 32, scope: !263)
!281 = !DILocation(line: 155, column: 19, scope: !263)
!282 = !DILocation(line: 156, column: 31, scope: !263)
!283 = !DILocation(line: 156, column: 13, scope: !263)
!284 = !DILocation(line: 157, column: 18, scope: !263)
!285 = !DILocation(line: 157, column: 13, scope: !263)
!286 = !DILocation(line: 159, column: 5, scope: !264)
!287 = !DILocation(line: 160, column: 1, scope: !230)
!288 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 163, type: !23, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!289 = !DILocalVariable(name: "data", scope: !288, file: !15, line: 165, type: !6)
!290 = !DILocation(line: 165, column: 12, scope: !288)
!291 = !DILocation(line: 166, column: 10, scope: !288)
!292 = !DILocation(line: 167, column: 8, scope: !293)
!293 = distinct !DILexicalBlock(scope: !288, file: !15, line: 167, column: 8)
!294 = !DILocation(line: 167, column: 18, scope: !293)
!295 = !DILocation(line: 167, column: 8, scope: !288)
!296 = !DILocalVariable(name: "dataGoodBuffer", scope: !297, file: !15, line: 170, type: !11)
!297 = distinct !DILexicalBlock(scope: !298, file: !15, line: 169, column: 9)
!298 = distinct !DILexicalBlock(scope: !293, file: !15, line: 168, column: 5)
!299 = !DILocation(line: 170, column: 20, scope: !297)
!300 = !DILocation(line: 170, column: 45, scope: !297)
!301 = !DILocation(line: 171, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !297, file: !15, line: 171, column: 17)
!303 = !DILocation(line: 171, column: 32, scope: !302)
!304 = !DILocation(line: 171, column: 17, scope: !297)
!305 = !DILocation(line: 171, column: 42, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !15, line: 171, column: 41)
!307 = !DILocation(line: 172, column: 20, scope: !297)
!308 = !DILocation(line: 172, column: 13, scope: !297)
!309 = !DILocation(line: 173, column: 13, scope: !297)
!310 = !DILocation(line: 173, column: 34, scope: !297)
!311 = !DILocation(line: 175, column: 28, scope: !297)
!312 = !DILocation(line: 175, column: 18, scope: !297)
!313 = !DILocation(line: 177, column: 5, scope: !298)
!314 = !DILocation(line: 178, column: 8, scope: !315)
!315 = distinct !DILexicalBlock(scope: !288, file: !15, line: 178, column: 8)
!316 = !DILocation(line: 178, column: 18, scope: !315)
!317 = !DILocation(line: 178, column: 8, scope: !288)
!318 = !DILocalVariable(name: "dataLen", scope: !319, file: !15, line: 182, type: !59)
!319 = distinct !DILexicalBlock(scope: !320, file: !15, line: 180, column: 9)
!320 = distinct !DILexicalBlock(scope: !315, file: !15, line: 179, column: 5)
!321 = !DILocation(line: 182, column: 20, scope: !319)
!322 = !DILocation(line: 182, column: 45, scope: !319)
!323 = !DILocation(line: 182, column: 30, scope: !319)
!324 = !DILocalVariable(name: "dest", scope: !319, file: !15, line: 183, type: !6)
!325 = !DILocation(line: 183, column: 20, scope: !319)
!326 = !DILocation(line: 183, column: 42, scope: !319)
!327 = !DILocation(line: 183, column: 49, scope: !319)
!328 = !DILocation(line: 183, column: 35, scope: !319)
!329 = !DILocation(line: 184, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !319, file: !15, line: 184, column: 17)
!331 = !DILocation(line: 184, column: 22, scope: !330)
!332 = !DILocation(line: 184, column: 17, scope: !319)
!333 = !DILocation(line: 184, column: 32, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !15, line: 184, column: 31)
!335 = !DILocation(line: 185, column: 26, scope: !319)
!336 = !DILocation(line: 185, column: 32, scope: !319)
!337 = !DILocation(line: 185, column: 19, scope: !319)
!338 = !DILocation(line: 186, column: 31, scope: !319)
!339 = !DILocation(line: 186, column: 13, scope: !319)
!340 = !DILocation(line: 187, column: 18, scope: !319)
!341 = !DILocation(line: 187, column: 13, scope: !319)
!342 = !DILocation(line: 189, column: 5, scope: !320)
!343 = !DILocation(line: 190, column: 1, scope: !288)
