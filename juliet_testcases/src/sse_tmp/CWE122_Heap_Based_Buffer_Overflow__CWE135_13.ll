; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_13_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end4, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !33
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !32
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  %cmp1 = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !38

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !42
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %6 = bitcast i32* %5 to i8*, !dbg !46
  store i8* %6, i8** %data, align 8, !dbg !47
  br label %if.end4, !dbg !48

if.end4:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !49
  %cmp5 = icmp eq i32 %7, 5, !dbg !51
  br i1 %cmp5, label %if.then6, label %if.end13, !dbg !52

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !58
  %8 = load i8*, i8** %data, align 8, !dbg !59
  %call7 = call i64 @strlen(i8* %8) #9, !dbg !60
  store i64 %call7, i64* %dataLen, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !61, metadata !DIExpression()), !dbg !62
  %9 = load i64, i64* %dataLen, align 8, !dbg !63
  %add = add i64 %9, 1, !dbg !64
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !65
  store i8* %call8, i8** %dest, align 8, !dbg !62
  %10 = load i8*, i8** %dest, align 8, !dbg !66
  %cmp9 = icmp eq i8* %10, null, !dbg !68
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !69

if.then10:                                        ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !70
  unreachable, !dbg !70

if.end11:                                         ; preds = %if.then6
  %11 = load i8*, i8** %dest, align 8, !dbg !72
  %12 = bitcast i8* %11 to i32*, !dbg !72
  %13 = load i8*, i8** %data, align 8, !dbg !73
  %14 = bitcast i8* %13 to i32*, !dbg !73
  %call12 = call i32* @wcscpy(i32* %12, i32* %14) #7, !dbg !74
  %15 = load i8*, i8** %dest, align 8, !dbg !75
  call void @printLine(i8* %15), !dbg !76
  %16 = load i8*, i8** %dest, align 8, !dbg !77
  call void @free(i8* %16) #7, !dbg !78
  br label %if.end13, !dbg !79

if.end13:                                         ; preds = %if.end11, %if.end4
  ret void, !dbg !80
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_13_good() #0 !dbg !81 {
entry:
  call void @goodB2G1(), !dbg !82
  call void @goodB2G2(), !dbg !83
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_13_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_13_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i8* null, i8** %data, align 8, !dbg !108
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !109
  %cmp = icmp eq i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end4, !dbg !112

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !117
  %1 = bitcast i8* %call to i32*, !dbg !118
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !116
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !119
  %cmp1 = icmp eq i32* %2, null, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !122

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !125
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !126
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !129
  %6 = bitcast i32* %5 to i8*, !dbg !130
  store i8* %6, i8** %data, align 8, !dbg !131
  br label %if.end4, !dbg !132

if.end4:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !133
  %cmp5 = icmp ne i32 %7, 5, !dbg !135
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !136

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  br label %if.end13, !dbg !139

if.else:                                          ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !140, metadata !DIExpression()), !dbg !143
  %8 = load i8*, i8** %data, align 8, !dbg !144
  %9 = bitcast i8* %8 to i32*, !dbg !145
  %call7 = call i64 @wcslen(i32* %9) #9, !dbg !146
  store i64 %call7, i64* %dataLen, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !147, metadata !DIExpression()), !dbg !148
  %10 = load i64, i64* %dataLen, align 8, !dbg !149
  %add = add i64 %10, 1, !dbg !150
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !151
  store i8* %call8, i8** %dest, align 8, !dbg !148
  %11 = load i8*, i8** %dest, align 8, !dbg !152
  %cmp9 = icmp eq i8* %11, null, !dbg !154
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !155

if.then10:                                        ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !156
  unreachable, !dbg !156

if.end11:                                         ; preds = %if.else
  %12 = load i8*, i8** %dest, align 8, !dbg !158
  %13 = bitcast i8* %12 to i32*, !dbg !158
  %14 = load i8*, i8** %data, align 8, !dbg !159
  %15 = bitcast i8* %14 to i32*, !dbg !159
  %call12 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !160
  %16 = load i8*, i8** %dest, align 8, !dbg !161
  %17 = bitcast i8* %16 to i32*, !dbg !162
  call void @printWLine(i32* %17), !dbg !163
  %18 = load i8*, i8** %dest, align 8, !dbg !164
  call void @free(i8* %18) #7, !dbg !165
  br label %if.end13

if.end13:                                         ; preds = %if.end11, %if.then6
  ret void, !dbg !166
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !167 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !168, metadata !DIExpression()), !dbg !169
  store i8* null, i8** %data, align 8, !dbg !170
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !171
  %cmp = icmp eq i32 %0, 5, !dbg !173
  br i1 %cmp, label %if.then, label %if.end4, !dbg !174

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !175, metadata !DIExpression()), !dbg !178
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !179
  %1 = bitcast i8* %call to i32*, !dbg !180
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !178
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !181
  %cmp1 = icmp eq i32* %2, null, !dbg !183
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !184

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !187
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !188
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !191
  %6 = bitcast i32* %5 to i8*, !dbg !192
  store i8* %6, i8** %data, align 8, !dbg !193
  br label %if.end4, !dbg !194

if.end4:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !195
  %cmp5 = icmp eq i32 %7, 5, !dbg !197
  br i1 %cmp5, label %if.then6, label %if.end13, !dbg !198

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !199, metadata !DIExpression()), !dbg !202
  %8 = load i8*, i8** %data, align 8, !dbg !203
  %9 = bitcast i8* %8 to i32*, !dbg !204
  %call7 = call i64 @wcslen(i32* %9) #9, !dbg !205
  store i64 %call7, i64* %dataLen, align 8, !dbg !202
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !206, metadata !DIExpression()), !dbg !207
  %10 = load i64, i64* %dataLen, align 8, !dbg !208
  %add = add i64 %10, 1, !dbg !209
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !210
  store i8* %call8, i8** %dest, align 8, !dbg !207
  %11 = load i8*, i8** %dest, align 8, !dbg !211
  %cmp9 = icmp eq i8* %11, null, !dbg !213
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !214

if.then10:                                        ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !215
  unreachable, !dbg !215

if.end11:                                         ; preds = %if.then6
  %12 = load i8*, i8** %dest, align 8, !dbg !217
  %13 = bitcast i8* %12 to i32*, !dbg !217
  %14 = load i8*, i8** %data, align 8, !dbg !218
  %15 = bitcast i8* %14 to i32*, !dbg !218
  %call12 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !219
  %16 = load i8*, i8** %dest, align 8, !dbg !220
  %17 = bitcast i8* %16 to i32*, !dbg !221
  call void @printWLine(i32* %17), !dbg !222
  %18 = load i8*, i8** %dest, align 8, !dbg !223
  call void @free(i8* %18) #7, !dbg !224
  br label %if.end13, !dbg !225

if.end13:                                         ; preds = %if.end11, %if.end4
  ret void, !dbg !226
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !227 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !228, metadata !DIExpression()), !dbg !229
  store i8* null, i8** %data, align 8, !dbg !230
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !231
  %cmp = icmp ne i32 %0, 5, !dbg !233
  br i1 %cmp, label %if.then, label %if.else, !dbg !234

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !235
  br label %if.end3, !dbg !237

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !238, metadata !DIExpression()), !dbg !241
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !242
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !241
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !243
  %cmp1 = icmp eq i8* %1, null, !dbg !245
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !246

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !247
  unreachable, !dbg !247

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !249
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !250
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !251
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !251
  store i8 0, i8* %arrayidx, align 1, !dbg !252
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !253
  store i8* %4, i8** %data, align 8, !dbg !254
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !255
  %cmp4 = icmp eq i32 %5, 5, !dbg !257
  br i1 %cmp4, label %if.then5, label %if.end12, !dbg !258

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !259, metadata !DIExpression()), !dbg !262
  %6 = load i8*, i8** %data, align 8, !dbg !263
  %call6 = call i64 @strlen(i8* %6) #9, !dbg !264
  store i64 %call6, i64* %dataLen, align 8, !dbg !262
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !265, metadata !DIExpression()), !dbg !266
  %7 = load i64, i64* %dataLen, align 8, !dbg !267
  %add = add i64 %7, 1, !dbg !268
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !269
  store i8* %call7, i8** %dest, align 8, !dbg !266
  %8 = load i8*, i8** %dest, align 8, !dbg !270
  %cmp8 = icmp eq i8* %8, null, !dbg !272
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !273

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !274
  unreachable, !dbg !274

if.end10:                                         ; preds = %if.then5
  %9 = load i8*, i8** %dest, align 8, !dbg !276
  %10 = load i8*, i8** %data, align 8, !dbg !277
  %call11 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !278
  %11 = load i8*, i8** %dest, align 8, !dbg !279
  call void @printLine(i8* %11), !dbg !280
  %12 = load i8*, i8** %dest, align 8, !dbg !281
  call void @free(i8* %12) #7, !dbg !282
  br label %if.end12, !dbg !283

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !284
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !285 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !286, metadata !DIExpression()), !dbg !287
  store i8* null, i8** %data, align 8, !dbg !288
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !289
  %cmp = icmp eq i32 %0, 5, !dbg !291
  br i1 %cmp, label %if.then, label %if.end3, !dbg !292

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !293, metadata !DIExpression()), !dbg !296
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !297
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !296
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !298
  %cmp1 = icmp eq i8* %1, null, !dbg !300
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !301

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !302
  unreachable, !dbg !302

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !305
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !306
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !306
  store i8 0, i8* %arrayidx, align 1, !dbg !307
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !308
  store i8* %4, i8** %data, align 8, !dbg !309
  br label %if.end3, !dbg !310

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !311
  %cmp4 = icmp eq i32 %5, 5, !dbg !313
  br i1 %cmp4, label %if.then5, label %if.end12, !dbg !314

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !315, metadata !DIExpression()), !dbg !318
  %6 = load i8*, i8** %data, align 8, !dbg !319
  %call6 = call i64 @strlen(i8* %6) #9, !dbg !320
  store i64 %call6, i64* %dataLen, align 8, !dbg !318
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !321, metadata !DIExpression()), !dbg !322
  %7 = load i64, i64* %dataLen, align 8, !dbg !323
  %add = add i64 %7, 1, !dbg !324
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !325
  store i8* %call7, i8** %dest, align 8, !dbg !322
  %8 = load i8*, i8** %dest, align 8, !dbg !326
  %cmp8 = icmp eq i8* %8, null, !dbg !328
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !329

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !330
  unreachable, !dbg !330

if.end10:                                         ; preds = %if.then5
  %9 = load i8*, i8** %dest, align 8, !dbg !332
  %10 = load i8*, i8** %data, align 8, !dbg !333
  %call11 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !334
  %11 = load i8*, i8** %dest, align 8, !dbg !335
  call void @printLine(i8* %11), !dbg !336
  %12 = load i8*, i8** %dest, align 8, !dbg !337
  call void @free(i8* %12) #7, !dbg !338
  br label %if.end12, !dbg !339

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !340
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_13_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_13.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 25, scope: !26)
!28 = !DILocation(line: 28, column: 8, scope: !18)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !30, file: !19, line: 31, type: !5)
!30 = distinct !DILexicalBlock(scope: !31, file: !19, line: 30, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !19, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 23, scope: !30)
!33 = !DILocation(line: 31, column: 50, scope: !30)
!34 = !DILocation(line: 31, column: 39, scope: !30)
!35 = !DILocation(line: 32, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !19, line: 32, column: 17)
!37 = !DILocation(line: 32, column: 31, scope: !36)
!38 = !DILocation(line: 32, column: 17, scope: !30)
!39 = !DILocation(line: 32, column: 41, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 32, column: 40)
!41 = !DILocation(line: 33, column: 21, scope: !30)
!42 = !DILocation(line: 33, column: 13, scope: !30)
!43 = !DILocation(line: 34, column: 13, scope: !30)
!44 = !DILocation(line: 34, column: 33, scope: !30)
!45 = !DILocation(line: 36, column: 28, scope: !30)
!46 = !DILocation(line: 36, column: 20, scope: !30)
!47 = !DILocation(line: 36, column: 18, scope: !30)
!48 = !DILocation(line: 38, column: 5, scope: !31)
!49 = !DILocation(line: 39, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 8)
!51 = !DILocation(line: 39, column: 25, scope: !50)
!52 = !DILocation(line: 39, column: 8, scope: !18)
!53 = !DILocalVariable(name: "dataLen", scope: !54, file: !19, line: 43, type: !56)
!54 = distinct !DILexicalBlock(scope: !55, file: !19, line: 41, column: 9)
!55 = distinct !DILexicalBlock(scope: !50, file: !19, line: 40, column: 5)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !57)
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 43, column: 20, scope: !54)
!59 = !DILocation(line: 43, column: 45, scope: !54)
!60 = !DILocation(line: 43, column: 30, scope: !54)
!61 = !DILocalVariable(name: "dest", scope: !54, file: !19, line: 44, type: !4)
!62 = !DILocation(line: 44, column: 20, scope: !54)
!63 = !DILocation(line: 44, column: 42, scope: !54)
!64 = !DILocation(line: 44, column: 49, scope: !54)
!65 = !DILocation(line: 44, column: 35, scope: !54)
!66 = !DILocation(line: 45, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !54, file: !19, line: 45, column: 17)
!68 = !DILocation(line: 45, column: 22, scope: !67)
!69 = !DILocation(line: 45, column: 17, scope: !54)
!70 = !DILocation(line: 45, column: 32, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !19, line: 45, column: 31)
!72 = !DILocation(line: 46, column: 26, scope: !54)
!73 = !DILocation(line: 46, column: 32, scope: !54)
!74 = !DILocation(line: 46, column: 19, scope: !54)
!75 = !DILocation(line: 47, column: 31, scope: !54)
!76 = !DILocation(line: 47, column: 13, scope: !54)
!77 = !DILocation(line: 48, column: 18, scope: !54)
!78 = !DILocation(line: 48, column: 13, scope: !54)
!79 = !DILocation(line: 50, column: 5, scope: !55)
!80 = !DILocation(line: 51, column: 1, scope: !18)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_13_good", scope: !19, file: !19, line: 187, type: !20, scopeLine: 188, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 189, column: 5, scope: !81)
!83 = !DILocation(line: 190, column: 5, scope: !81)
!84 = !DILocation(line: 191, column: 5, scope: !81)
!85 = !DILocation(line: 192, column: 5, scope: !81)
!86 = !DILocation(line: 193, column: 1, scope: !81)
!87 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 204, type: !88, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!8, !8, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !19, line: 204, type: !8)
!92 = !DILocation(line: 204, column: 14, scope: !87)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !19, line: 204, type: !90)
!94 = !DILocation(line: 204, column: 27, scope: !87)
!95 = !DILocation(line: 207, column: 22, scope: !87)
!96 = !DILocation(line: 207, column: 12, scope: !87)
!97 = !DILocation(line: 207, column: 5, scope: !87)
!98 = !DILocation(line: 209, column: 5, scope: !87)
!99 = !DILocation(line: 210, column: 5, scope: !87)
!100 = !DILocation(line: 211, column: 5, scope: !87)
!101 = !DILocation(line: 214, column: 5, scope: !87)
!102 = !DILocation(line: 215, column: 5, scope: !87)
!103 = !DILocation(line: 216, column: 5, scope: !87)
!104 = !DILocation(line: 218, column: 5, scope: !87)
!105 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !19, line: 60, type: !4)
!107 = !DILocation(line: 60, column: 12, scope: !105)
!108 = !DILocation(line: 61, column: 10, scope: !105)
!109 = !DILocation(line: 62, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !19, line: 62, column: 8)
!111 = !DILocation(line: 62, column: 25, scope: !110)
!112 = !DILocation(line: 62, column: 8, scope: !105)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !19, line: 65, type: !5)
!114 = distinct !DILexicalBlock(scope: !115, file: !19, line: 64, column: 9)
!115 = distinct !DILexicalBlock(scope: !110, file: !19, line: 63, column: 5)
!116 = !DILocation(line: 65, column: 23, scope: !114)
!117 = !DILocation(line: 65, column: 50, scope: !114)
!118 = !DILocation(line: 65, column: 39, scope: !114)
!119 = !DILocation(line: 66, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !19, line: 66, column: 17)
!121 = !DILocation(line: 66, column: 31, scope: !120)
!122 = !DILocation(line: 66, column: 17, scope: !114)
!123 = !DILocation(line: 66, column: 41, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !19, line: 66, column: 40)
!125 = !DILocation(line: 67, column: 21, scope: !114)
!126 = !DILocation(line: 67, column: 13, scope: !114)
!127 = !DILocation(line: 68, column: 13, scope: !114)
!128 = !DILocation(line: 68, column: 33, scope: !114)
!129 = !DILocation(line: 70, column: 28, scope: !114)
!130 = !DILocation(line: 70, column: 20, scope: !114)
!131 = !DILocation(line: 70, column: 18, scope: !114)
!132 = !DILocation(line: 72, column: 5, scope: !115)
!133 = !DILocation(line: 73, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !105, file: !19, line: 73, column: 8)
!135 = !DILocation(line: 73, column: 25, scope: !134)
!136 = !DILocation(line: 73, column: 8, scope: !105)
!137 = !DILocation(line: 76, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !19, line: 74, column: 5)
!139 = !DILocation(line: 77, column: 5, scope: !138)
!140 = !DILocalVariable(name: "dataLen", scope: !141, file: !19, line: 82, type: !56)
!141 = distinct !DILexicalBlock(scope: !142, file: !19, line: 80, column: 9)
!142 = distinct !DILexicalBlock(scope: !134, file: !19, line: 79, column: 5)
!143 = !DILocation(line: 82, column: 20, scope: !141)
!144 = !DILocation(line: 82, column: 48, scope: !141)
!145 = !DILocation(line: 82, column: 37, scope: !141)
!146 = !DILocation(line: 82, column: 30, scope: !141)
!147 = !DILocalVariable(name: "dest", scope: !141, file: !19, line: 83, type: !4)
!148 = !DILocation(line: 83, column: 20, scope: !141)
!149 = !DILocation(line: 83, column: 42, scope: !141)
!150 = !DILocation(line: 83, column: 49, scope: !141)
!151 = !DILocation(line: 83, column: 35, scope: !141)
!152 = !DILocation(line: 84, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !141, file: !19, line: 84, column: 17)
!154 = !DILocation(line: 84, column: 22, scope: !153)
!155 = !DILocation(line: 84, column: 17, scope: !141)
!156 = !DILocation(line: 84, column: 32, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !19, line: 84, column: 31)
!158 = !DILocation(line: 85, column: 26, scope: !141)
!159 = !DILocation(line: 85, column: 32, scope: !141)
!160 = !DILocation(line: 85, column: 19, scope: !141)
!161 = !DILocation(line: 86, column: 35, scope: !141)
!162 = !DILocation(line: 86, column: 24, scope: !141)
!163 = !DILocation(line: 86, column: 13, scope: !141)
!164 = !DILocation(line: 87, column: 18, scope: !141)
!165 = !DILocation(line: 87, column: 13, scope: !141)
!166 = !DILocation(line: 90, column: 1, scope: !105)
!167 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!168 = !DILocalVariable(name: "data", scope: !167, file: !19, line: 95, type: !4)
!169 = !DILocation(line: 95, column: 12, scope: !167)
!170 = !DILocation(line: 96, column: 10, scope: !167)
!171 = !DILocation(line: 97, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !19, line: 97, column: 8)
!173 = !DILocation(line: 97, column: 25, scope: !172)
!174 = !DILocation(line: 97, column: 8, scope: !167)
!175 = !DILocalVariable(name: "dataBadBuffer", scope: !176, file: !19, line: 100, type: !5)
!176 = distinct !DILexicalBlock(scope: !177, file: !19, line: 99, column: 9)
!177 = distinct !DILexicalBlock(scope: !172, file: !19, line: 98, column: 5)
!178 = !DILocation(line: 100, column: 23, scope: !176)
!179 = !DILocation(line: 100, column: 50, scope: !176)
!180 = !DILocation(line: 100, column: 39, scope: !176)
!181 = !DILocation(line: 101, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !19, line: 101, column: 17)
!183 = !DILocation(line: 101, column: 31, scope: !182)
!184 = !DILocation(line: 101, column: 17, scope: !176)
!185 = !DILocation(line: 101, column: 41, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !19, line: 101, column: 40)
!187 = !DILocation(line: 102, column: 21, scope: !176)
!188 = !DILocation(line: 102, column: 13, scope: !176)
!189 = !DILocation(line: 103, column: 13, scope: !176)
!190 = !DILocation(line: 103, column: 33, scope: !176)
!191 = !DILocation(line: 105, column: 28, scope: !176)
!192 = !DILocation(line: 105, column: 20, scope: !176)
!193 = !DILocation(line: 105, column: 18, scope: !176)
!194 = !DILocation(line: 107, column: 5, scope: !177)
!195 = !DILocation(line: 108, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !167, file: !19, line: 108, column: 8)
!197 = !DILocation(line: 108, column: 25, scope: !196)
!198 = !DILocation(line: 108, column: 8, scope: !167)
!199 = !DILocalVariable(name: "dataLen", scope: !200, file: !19, line: 112, type: !56)
!200 = distinct !DILexicalBlock(scope: !201, file: !19, line: 110, column: 9)
!201 = distinct !DILexicalBlock(scope: !196, file: !19, line: 109, column: 5)
!202 = !DILocation(line: 112, column: 20, scope: !200)
!203 = !DILocation(line: 112, column: 48, scope: !200)
!204 = !DILocation(line: 112, column: 37, scope: !200)
!205 = !DILocation(line: 112, column: 30, scope: !200)
!206 = !DILocalVariable(name: "dest", scope: !200, file: !19, line: 113, type: !4)
!207 = !DILocation(line: 113, column: 20, scope: !200)
!208 = !DILocation(line: 113, column: 42, scope: !200)
!209 = !DILocation(line: 113, column: 49, scope: !200)
!210 = !DILocation(line: 113, column: 35, scope: !200)
!211 = !DILocation(line: 114, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !200, file: !19, line: 114, column: 17)
!213 = !DILocation(line: 114, column: 22, scope: !212)
!214 = !DILocation(line: 114, column: 17, scope: !200)
!215 = !DILocation(line: 114, column: 32, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !19, line: 114, column: 31)
!217 = !DILocation(line: 115, column: 26, scope: !200)
!218 = !DILocation(line: 115, column: 32, scope: !200)
!219 = !DILocation(line: 115, column: 19, scope: !200)
!220 = !DILocation(line: 116, column: 35, scope: !200)
!221 = !DILocation(line: 116, column: 24, scope: !200)
!222 = !DILocation(line: 116, column: 13, scope: !200)
!223 = !DILocation(line: 117, column: 18, scope: !200)
!224 = !DILocation(line: 117, column: 13, scope: !200)
!225 = !DILocation(line: 119, column: 5, scope: !201)
!226 = !DILocation(line: 120, column: 1, scope: !167)
!227 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 123, type: !20, scopeLine: 124, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!228 = !DILocalVariable(name: "data", scope: !227, file: !19, line: 125, type: !4)
!229 = !DILocation(line: 125, column: 12, scope: !227)
!230 = !DILocation(line: 126, column: 10, scope: !227)
!231 = !DILocation(line: 127, column: 8, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !19, line: 127, column: 8)
!233 = !DILocation(line: 127, column: 25, scope: !232)
!234 = !DILocation(line: 127, column: 8, scope: !227)
!235 = !DILocation(line: 130, column: 9, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !19, line: 128, column: 5)
!237 = !DILocation(line: 131, column: 5, scope: !236)
!238 = !DILocalVariable(name: "dataGoodBuffer", scope: !239, file: !19, line: 135, type: !9)
!239 = distinct !DILexicalBlock(scope: !240, file: !19, line: 134, column: 9)
!240 = distinct !DILexicalBlock(scope: !232, file: !19, line: 133, column: 5)
!241 = !DILocation(line: 135, column: 20, scope: !239)
!242 = !DILocation(line: 135, column: 45, scope: !239)
!243 = !DILocation(line: 136, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !19, line: 136, column: 17)
!245 = !DILocation(line: 136, column: 32, scope: !244)
!246 = !DILocation(line: 136, column: 17, scope: !239)
!247 = !DILocation(line: 136, column: 42, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !19, line: 136, column: 41)
!249 = !DILocation(line: 137, column: 20, scope: !239)
!250 = !DILocation(line: 137, column: 13, scope: !239)
!251 = !DILocation(line: 138, column: 13, scope: !239)
!252 = !DILocation(line: 138, column: 34, scope: !239)
!253 = !DILocation(line: 140, column: 28, scope: !239)
!254 = !DILocation(line: 140, column: 18, scope: !239)
!255 = !DILocation(line: 143, column: 8, scope: !256)
!256 = distinct !DILexicalBlock(scope: !227, file: !19, line: 143, column: 8)
!257 = !DILocation(line: 143, column: 25, scope: !256)
!258 = !DILocation(line: 143, column: 8, scope: !227)
!259 = !DILocalVariable(name: "dataLen", scope: !260, file: !19, line: 147, type: !56)
!260 = distinct !DILexicalBlock(scope: !261, file: !19, line: 145, column: 9)
!261 = distinct !DILexicalBlock(scope: !256, file: !19, line: 144, column: 5)
!262 = !DILocation(line: 147, column: 20, scope: !260)
!263 = !DILocation(line: 147, column: 45, scope: !260)
!264 = !DILocation(line: 147, column: 30, scope: !260)
!265 = !DILocalVariable(name: "dest", scope: !260, file: !19, line: 148, type: !4)
!266 = !DILocation(line: 148, column: 20, scope: !260)
!267 = !DILocation(line: 148, column: 42, scope: !260)
!268 = !DILocation(line: 148, column: 49, scope: !260)
!269 = !DILocation(line: 148, column: 35, scope: !260)
!270 = !DILocation(line: 149, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !260, file: !19, line: 149, column: 17)
!272 = !DILocation(line: 149, column: 22, scope: !271)
!273 = !DILocation(line: 149, column: 17, scope: !260)
!274 = !DILocation(line: 149, column: 32, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !19, line: 149, column: 31)
!276 = !DILocation(line: 150, column: 26, scope: !260)
!277 = !DILocation(line: 150, column: 32, scope: !260)
!278 = !DILocation(line: 150, column: 19, scope: !260)
!279 = !DILocation(line: 151, column: 31, scope: !260)
!280 = !DILocation(line: 151, column: 13, scope: !260)
!281 = !DILocation(line: 152, column: 18, scope: !260)
!282 = !DILocation(line: 152, column: 13, scope: !260)
!283 = !DILocation(line: 154, column: 5, scope: !261)
!284 = !DILocation(line: 155, column: 1, scope: !227)
!285 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 158, type: !20, scopeLine: 159, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!286 = !DILocalVariable(name: "data", scope: !285, file: !19, line: 160, type: !4)
!287 = !DILocation(line: 160, column: 12, scope: !285)
!288 = !DILocation(line: 161, column: 10, scope: !285)
!289 = !DILocation(line: 162, column: 8, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !19, line: 162, column: 8)
!291 = !DILocation(line: 162, column: 25, scope: !290)
!292 = !DILocation(line: 162, column: 8, scope: !285)
!293 = !DILocalVariable(name: "dataGoodBuffer", scope: !294, file: !19, line: 165, type: !9)
!294 = distinct !DILexicalBlock(scope: !295, file: !19, line: 164, column: 9)
!295 = distinct !DILexicalBlock(scope: !290, file: !19, line: 163, column: 5)
!296 = !DILocation(line: 165, column: 20, scope: !294)
!297 = !DILocation(line: 165, column: 45, scope: !294)
!298 = !DILocation(line: 166, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !294, file: !19, line: 166, column: 17)
!300 = !DILocation(line: 166, column: 32, scope: !299)
!301 = !DILocation(line: 166, column: 17, scope: !294)
!302 = !DILocation(line: 166, column: 42, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !19, line: 166, column: 41)
!304 = !DILocation(line: 167, column: 20, scope: !294)
!305 = !DILocation(line: 167, column: 13, scope: !294)
!306 = !DILocation(line: 168, column: 13, scope: !294)
!307 = !DILocation(line: 168, column: 34, scope: !294)
!308 = !DILocation(line: 170, column: 28, scope: !294)
!309 = !DILocation(line: 170, column: 18, scope: !294)
!310 = !DILocation(line: 172, column: 5, scope: !295)
!311 = !DILocation(line: 173, column: 8, scope: !312)
!312 = distinct !DILexicalBlock(scope: !285, file: !19, line: 173, column: 8)
!313 = !DILocation(line: 173, column: 25, scope: !312)
!314 = !DILocation(line: 173, column: 8, scope: !285)
!315 = !DILocalVariable(name: "dataLen", scope: !316, file: !19, line: 177, type: !56)
!316 = distinct !DILexicalBlock(scope: !317, file: !19, line: 175, column: 9)
!317 = distinct !DILexicalBlock(scope: !312, file: !19, line: 174, column: 5)
!318 = !DILocation(line: 177, column: 20, scope: !316)
!319 = !DILocation(line: 177, column: 45, scope: !316)
!320 = !DILocation(line: 177, column: 30, scope: !316)
!321 = !DILocalVariable(name: "dest", scope: !316, file: !19, line: 178, type: !4)
!322 = !DILocation(line: 178, column: 20, scope: !316)
!323 = !DILocation(line: 178, column: 42, scope: !316)
!324 = !DILocation(line: 178, column: 49, scope: !316)
!325 = !DILocation(line: 178, column: 35, scope: !316)
!326 = !DILocation(line: 179, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !316, file: !19, line: 179, column: 17)
!328 = !DILocation(line: 179, column: 22, scope: !327)
!329 = !DILocation(line: 179, column: 17, scope: !316)
!330 = !DILocation(line: 179, column: 32, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !19, line: 179, column: 31)
!332 = !DILocation(line: 180, column: 26, scope: !316)
!333 = !DILocation(line: 180, column: 32, scope: !316)
!334 = !DILocation(line: 180, column: 19, scope: !316)
!335 = !DILocation(line: 181, column: 31, scope: !316)
!336 = !DILocation(line: 181, column: 13, scope: !316)
!337 = !DILocation(line: 182, column: 18, scope: !316)
!338 = !DILocation(line: 182, column: 13, scope: !316)
!339 = !DILocation(line: 184, column: 5, scope: !317)
!340 = !DILocation(line: 185, column: 1, scope: !285)
