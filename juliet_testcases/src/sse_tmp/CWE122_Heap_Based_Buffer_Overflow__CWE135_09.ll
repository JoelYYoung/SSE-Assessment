; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_09.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_09_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end3, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !31
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %cmp = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp, label %if.then1, label %if.end, !dbg !37

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !41
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  %6 = bitcast i32* %5 to i8*, !dbg !45
  store i8* %6, i8** %data, align 8, !dbg !46
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !48
  %tobool4 = icmp ne i32 %7, 0, !dbg !48
  br i1 %tobool4, label %if.then5, label %if.end12, !dbg !50

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !56
  %8 = load i8*, i8** %data, align 8, !dbg !57
  %call6 = call i64 @strlen(i8* %8) #9, !dbg !58
  store i64 %call6, i64* %dataLen, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %9 = load i64, i64* %dataLen, align 8, !dbg !61
  %add = add i64 %9, 1, !dbg !62
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !63
  store i8* %call7, i8** %dest, align 8, !dbg !60
  %10 = load i8*, i8** %dest, align 8, !dbg !64
  %cmp8 = icmp eq i8* %10, null, !dbg !66
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !67

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !68
  unreachable, !dbg !68

if.end10:                                         ; preds = %if.then5
  %11 = load i8*, i8** %dest, align 8, !dbg !70
  %12 = bitcast i8* %11 to i32*, !dbg !70
  %13 = load i8*, i8** %data, align 8, !dbg !71
  %14 = bitcast i8* %13 to i32*, !dbg !71
  %call11 = call i32* @wcscpy(i32* %12, i32* %14) #7, !dbg !72
  %15 = load i8*, i8** %dest, align 8, !dbg !73
  call void @printLine(i8* %15), !dbg !74
  %16 = load i8*, i8** %dest, align 8, !dbg !75
  call void @free(i8* %16) #7, !dbg !76
  br label %if.end12, !dbg !77

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !78
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_09_good() #0 !dbg !79 {
entry:
  call void @goodB2G1(), !dbg !80
  call void @goodB2G2(), !dbg !81
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_09_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_09_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.end3, !dbg !109

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !114
  %1 = bitcast i8* %call to i32*, !dbg !115
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !113
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !116
  %cmp = icmp eq i32* %2, null, !dbg !118
  br i1 %cmp, label %if.then1, label %if.end, !dbg !119

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !122
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !123
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !126
  %6 = bitcast i32* %5 to i8*, !dbg !127
  store i8* %6, i8** %data, align 8, !dbg !128
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !130
  %tobool4 = icmp ne i32 %7, 0, !dbg !130
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !132

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !133
  br label %if.end12, !dbg !135

if.else:                                          ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !136, metadata !DIExpression()), !dbg !139
  %8 = load i8*, i8** %data, align 8, !dbg !140
  %9 = bitcast i8* %8 to i32*, !dbg !141
  %call6 = call i64 @wcslen(i32* %9) #9, !dbg !142
  store i64 %call6, i64* %dataLen, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %10 = load i64, i64* %dataLen, align 8, !dbg !145
  %add = add i64 %10, 1, !dbg !146
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !147
  store i8* %call7, i8** %dest, align 8, !dbg !144
  %11 = load i8*, i8** %dest, align 8, !dbg !148
  %cmp8 = icmp eq i8* %11, null, !dbg !150
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !151

if.then9:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !152
  unreachable, !dbg !152

if.end10:                                         ; preds = %if.else
  %12 = load i8*, i8** %dest, align 8, !dbg !154
  %13 = bitcast i8* %12 to i32*, !dbg !154
  %14 = load i8*, i8** %data, align 8, !dbg !155
  %15 = bitcast i8* %14 to i32*, !dbg !155
  %call11 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !156
  %16 = load i8*, i8** %dest, align 8, !dbg !157
  %17 = bitcast i8* %16 to i32*, !dbg !158
  call void @printWLine(i32* %17), !dbg !159
  %18 = load i8*, i8** %dest, align 8, !dbg !160
  call void @free(i8* %18) #7, !dbg !161
  br label %if.end12

if.end12:                                         ; preds = %if.end10, %if.then5
  ret void, !dbg !162
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !163 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !164, metadata !DIExpression()), !dbg !165
  store i8* null, i8** %data, align 8, !dbg !166
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !167
  %tobool = icmp ne i32 %0, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end3, !dbg !169

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !170, metadata !DIExpression()), !dbg !173
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !174
  %1 = bitcast i8* %call to i32*, !dbg !175
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !173
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !176
  %cmp = icmp eq i32* %2, null, !dbg !178
  br i1 %cmp, label %if.then1, label %if.end, !dbg !179

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !182
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !183
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !184
  store i32 0, i32* %arrayidx, align 4, !dbg !185
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !186
  %6 = bitcast i32* %5 to i8*, !dbg !187
  store i8* %6, i8** %data, align 8, !dbg !188
  br label %if.end3, !dbg !189

if.end3:                                          ; preds = %if.end, %entry
  %7 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !190
  %tobool4 = icmp ne i32 %7, 0, !dbg !190
  br i1 %tobool4, label %if.then5, label %if.end12, !dbg !192

if.then5:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !193, metadata !DIExpression()), !dbg !196
  %8 = load i8*, i8** %data, align 8, !dbg !197
  %9 = bitcast i8* %8 to i32*, !dbg !198
  %call6 = call i64 @wcslen(i32* %9) #9, !dbg !199
  store i64 %call6, i64* %dataLen, align 8, !dbg !196
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !200, metadata !DIExpression()), !dbg !201
  %10 = load i64, i64* %dataLen, align 8, !dbg !202
  %add = add i64 %10, 1, !dbg !203
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !204
  store i8* %call7, i8** %dest, align 8, !dbg !201
  %11 = load i8*, i8** %dest, align 8, !dbg !205
  %cmp8 = icmp eq i8* %11, null, !dbg !207
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !208

if.then9:                                         ; preds = %if.then5
  call void @exit(i32 -1) #8, !dbg !209
  unreachable, !dbg !209

if.end10:                                         ; preds = %if.then5
  %12 = load i8*, i8** %dest, align 8, !dbg !211
  %13 = bitcast i8* %12 to i32*, !dbg !211
  %14 = load i8*, i8** %data, align 8, !dbg !212
  %15 = bitcast i8* %14 to i32*, !dbg !212
  %call11 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !213
  %16 = load i8*, i8** %dest, align 8, !dbg !214
  %17 = bitcast i8* %16 to i32*, !dbg !215
  call void @printWLine(i32* %17), !dbg !216
  %18 = load i8*, i8** %dest, align 8, !dbg !217
  call void @free(i8* %18) #7, !dbg !218
  br label %if.end12, !dbg !219

if.end12:                                         ; preds = %if.end10, %if.end3
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !221 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !222, metadata !DIExpression()), !dbg !223
  store i8* null, i8** %data, align 8, !dbg !224
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !225
  %tobool = icmp ne i32 %0, 0, !dbg !225
  br i1 %tobool, label %if.then, label %if.else, !dbg !227

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !228
  br label %if.end2, !dbg !230

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !231, metadata !DIExpression()), !dbg !234
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !235
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !234
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !236
  %cmp = icmp eq i8* %1, null, !dbg !238
  br i1 %cmp, label %if.then1, label %if.end, !dbg !239

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !240
  unreachable, !dbg !240

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !242
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !243
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !244
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !244
  store i8 0, i8* %arrayidx, align 1, !dbg !245
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !246
  store i8* %4, i8** %data, align 8, !dbg !247
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !248
  %tobool3 = icmp ne i32 %5, 0, !dbg !248
  br i1 %tobool3, label %if.then4, label %if.end11, !dbg !250

if.then4:                                         ; preds = %if.end2
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !251, metadata !DIExpression()), !dbg !254
  %6 = load i8*, i8** %data, align 8, !dbg !255
  %call5 = call i64 @strlen(i8* %6) #9, !dbg !256
  store i64 %call5, i64* %dataLen, align 8, !dbg !254
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !257, metadata !DIExpression()), !dbg !258
  %7 = load i64, i64* %dataLen, align 8, !dbg !259
  %add = add i64 %7, 1, !dbg !260
  %call6 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !261
  store i8* %call6, i8** %dest, align 8, !dbg !258
  %8 = load i8*, i8** %dest, align 8, !dbg !262
  %cmp7 = icmp eq i8* %8, null, !dbg !264
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !265

if.then8:                                         ; preds = %if.then4
  call void @exit(i32 -1) #8, !dbg !266
  unreachable, !dbg !266

if.end9:                                          ; preds = %if.then4
  %9 = load i8*, i8** %dest, align 8, !dbg !268
  %10 = load i8*, i8** %data, align 8, !dbg !269
  %call10 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !270
  %11 = load i8*, i8** %dest, align 8, !dbg !271
  call void @printLine(i8* %11), !dbg !272
  %12 = load i8*, i8** %dest, align 8, !dbg !273
  call void @free(i8* %12) #7, !dbg !274
  br label %if.end11, !dbg !275

if.end11:                                         ; preds = %if.end9, %if.end2
  ret void, !dbg !276
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !277 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !278, metadata !DIExpression()), !dbg !279
  store i8* null, i8** %data, align 8, !dbg !280
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !281
  %tobool = icmp ne i32 %0, 0, !dbg !281
  br i1 %tobool, label %if.then, label %if.end2, !dbg !283

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !284, metadata !DIExpression()), !dbg !287
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !288
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !287
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !289
  %cmp = icmp eq i8* %1, null, !dbg !291
  br i1 %cmp, label %if.then1, label %if.end, !dbg !292

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !293
  unreachable, !dbg !293

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !295
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !296
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !297
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !297
  store i8 0, i8* %arrayidx, align 1, !dbg !298
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !299
  store i8* %4, i8** %data, align 8, !dbg !300
  br label %if.end2, !dbg !301

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !302
  %tobool3 = icmp ne i32 %5, 0, !dbg !302
  br i1 %tobool3, label %if.then4, label %if.end11, !dbg !304

if.then4:                                         ; preds = %if.end2
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !305, metadata !DIExpression()), !dbg !308
  %6 = load i8*, i8** %data, align 8, !dbg !309
  %call5 = call i64 @strlen(i8* %6) #9, !dbg !310
  store i64 %call5, i64* %dataLen, align 8, !dbg !308
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !311, metadata !DIExpression()), !dbg !312
  %7 = load i64, i64* %dataLen, align 8, !dbg !313
  %add = add i64 %7, 1, !dbg !314
  %call6 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !315
  store i8* %call6, i8** %dest, align 8, !dbg !312
  %8 = load i8*, i8** %dest, align 8, !dbg !316
  %cmp7 = icmp eq i8* %8, null, !dbg !318
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !319

if.then8:                                         ; preds = %if.then4
  call void @exit(i32 -1) #8, !dbg !320
  unreachable, !dbg !320

if.end9:                                          ; preds = %if.then4
  %9 = load i8*, i8** %dest, align 8, !dbg !322
  %10 = load i8*, i8** %data, align 8, !dbg !323
  %call10 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !324
  %11 = load i8*, i8** %dest, align 8, !dbg !325
  call void @printLine(i8* %11), !dbg !326
  %12 = load i8*, i8** %dest, align 8, !dbg !327
  call void @free(i8* %12) #7, !dbg !328
  br label %if.end11, !dbg !329

if.end11:                                         ; preds = %if.end9, %if.end2
  ret void, !dbg !330
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_09_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_09.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !18)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !29, file: !19, line: 31, type: !5)
!29 = distinct !DILexicalBlock(scope: !30, file: !19, line: 30, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !19, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 23, scope: !29)
!32 = !DILocation(line: 31, column: 50, scope: !29)
!33 = !DILocation(line: 31, column: 39, scope: !29)
!34 = !DILocation(line: 32, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !19, line: 32, column: 17)
!36 = !DILocation(line: 32, column: 31, scope: !35)
!37 = !DILocation(line: 32, column: 17, scope: !29)
!38 = !DILocation(line: 32, column: 41, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !19, line: 32, column: 40)
!40 = !DILocation(line: 33, column: 21, scope: !29)
!41 = !DILocation(line: 33, column: 13, scope: !29)
!42 = !DILocation(line: 34, column: 13, scope: !29)
!43 = !DILocation(line: 34, column: 33, scope: !29)
!44 = !DILocation(line: 36, column: 28, scope: !29)
!45 = !DILocation(line: 36, column: 20, scope: !29)
!46 = !DILocation(line: 36, column: 18, scope: !29)
!47 = !DILocation(line: 38, column: 5, scope: !30)
!48 = !DILocation(line: 39, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 8)
!50 = !DILocation(line: 39, column: 8, scope: !18)
!51 = !DILocalVariable(name: "dataLen", scope: !52, file: !19, line: 43, type: !54)
!52 = distinct !DILexicalBlock(scope: !53, file: !19, line: 41, column: 9)
!53 = distinct !DILexicalBlock(scope: !49, file: !19, line: 40, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 43, column: 20, scope: !52)
!57 = !DILocation(line: 43, column: 45, scope: !52)
!58 = !DILocation(line: 43, column: 30, scope: !52)
!59 = !DILocalVariable(name: "dest", scope: !52, file: !19, line: 44, type: !4)
!60 = !DILocation(line: 44, column: 20, scope: !52)
!61 = !DILocation(line: 44, column: 42, scope: !52)
!62 = !DILocation(line: 44, column: 49, scope: !52)
!63 = !DILocation(line: 44, column: 35, scope: !52)
!64 = !DILocation(line: 45, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !52, file: !19, line: 45, column: 17)
!66 = !DILocation(line: 45, column: 22, scope: !65)
!67 = !DILocation(line: 45, column: 17, scope: !52)
!68 = !DILocation(line: 45, column: 32, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !19, line: 45, column: 31)
!70 = !DILocation(line: 46, column: 26, scope: !52)
!71 = !DILocation(line: 46, column: 32, scope: !52)
!72 = !DILocation(line: 46, column: 19, scope: !52)
!73 = !DILocation(line: 47, column: 31, scope: !52)
!74 = !DILocation(line: 47, column: 13, scope: !52)
!75 = !DILocation(line: 48, column: 18, scope: !52)
!76 = !DILocation(line: 48, column: 13, scope: !52)
!77 = !DILocation(line: 50, column: 5, scope: !53)
!78 = !DILocation(line: 51, column: 1, scope: !18)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_09_good", scope: !19, file: !19, line: 187, type: !20, scopeLine: 188, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 189, column: 5, scope: !79)
!81 = !DILocation(line: 190, column: 5, scope: !79)
!82 = !DILocation(line: 191, column: 5, scope: !79)
!83 = !DILocation(line: 192, column: 5, scope: !79)
!84 = !DILocation(line: 193, column: 1, scope: !79)
!85 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 204, type: !86, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!8, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !19, line: 204, type: !8)
!90 = !DILocation(line: 204, column: 14, scope: !85)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !19, line: 204, type: !88)
!92 = !DILocation(line: 204, column: 27, scope: !85)
!93 = !DILocation(line: 207, column: 22, scope: !85)
!94 = !DILocation(line: 207, column: 12, scope: !85)
!95 = !DILocation(line: 207, column: 5, scope: !85)
!96 = !DILocation(line: 209, column: 5, scope: !85)
!97 = !DILocation(line: 210, column: 5, scope: !85)
!98 = !DILocation(line: 211, column: 5, scope: !85)
!99 = !DILocation(line: 214, column: 5, scope: !85)
!100 = !DILocation(line: 215, column: 5, scope: !85)
!101 = !DILocation(line: 216, column: 5, scope: !85)
!102 = !DILocation(line: 218, column: 5, scope: !85)
!103 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !19, line: 60, type: !4)
!105 = !DILocation(line: 60, column: 12, scope: !103)
!106 = !DILocation(line: 61, column: 10, scope: !103)
!107 = !DILocation(line: 62, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !19, line: 62, column: 8)
!109 = !DILocation(line: 62, column: 8, scope: !103)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !19, line: 65, type: !5)
!111 = distinct !DILexicalBlock(scope: !112, file: !19, line: 64, column: 9)
!112 = distinct !DILexicalBlock(scope: !108, file: !19, line: 63, column: 5)
!113 = !DILocation(line: 65, column: 23, scope: !111)
!114 = !DILocation(line: 65, column: 50, scope: !111)
!115 = !DILocation(line: 65, column: 39, scope: !111)
!116 = !DILocation(line: 66, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !19, line: 66, column: 17)
!118 = !DILocation(line: 66, column: 31, scope: !117)
!119 = !DILocation(line: 66, column: 17, scope: !111)
!120 = !DILocation(line: 66, column: 41, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 66, column: 40)
!122 = !DILocation(line: 67, column: 21, scope: !111)
!123 = !DILocation(line: 67, column: 13, scope: !111)
!124 = !DILocation(line: 68, column: 13, scope: !111)
!125 = !DILocation(line: 68, column: 33, scope: !111)
!126 = !DILocation(line: 70, column: 28, scope: !111)
!127 = !DILocation(line: 70, column: 20, scope: !111)
!128 = !DILocation(line: 70, column: 18, scope: !111)
!129 = !DILocation(line: 72, column: 5, scope: !112)
!130 = !DILocation(line: 73, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !103, file: !19, line: 73, column: 8)
!132 = !DILocation(line: 73, column: 8, scope: !103)
!133 = !DILocation(line: 76, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !19, line: 74, column: 5)
!135 = !DILocation(line: 77, column: 5, scope: !134)
!136 = !DILocalVariable(name: "dataLen", scope: !137, file: !19, line: 82, type: !54)
!137 = distinct !DILexicalBlock(scope: !138, file: !19, line: 80, column: 9)
!138 = distinct !DILexicalBlock(scope: !131, file: !19, line: 79, column: 5)
!139 = !DILocation(line: 82, column: 20, scope: !137)
!140 = !DILocation(line: 82, column: 48, scope: !137)
!141 = !DILocation(line: 82, column: 37, scope: !137)
!142 = !DILocation(line: 82, column: 30, scope: !137)
!143 = !DILocalVariable(name: "dest", scope: !137, file: !19, line: 83, type: !4)
!144 = !DILocation(line: 83, column: 20, scope: !137)
!145 = !DILocation(line: 83, column: 42, scope: !137)
!146 = !DILocation(line: 83, column: 49, scope: !137)
!147 = !DILocation(line: 83, column: 35, scope: !137)
!148 = !DILocation(line: 84, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !137, file: !19, line: 84, column: 17)
!150 = !DILocation(line: 84, column: 22, scope: !149)
!151 = !DILocation(line: 84, column: 17, scope: !137)
!152 = !DILocation(line: 84, column: 32, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !19, line: 84, column: 31)
!154 = !DILocation(line: 85, column: 26, scope: !137)
!155 = !DILocation(line: 85, column: 32, scope: !137)
!156 = !DILocation(line: 85, column: 19, scope: !137)
!157 = !DILocation(line: 86, column: 35, scope: !137)
!158 = !DILocation(line: 86, column: 24, scope: !137)
!159 = !DILocation(line: 86, column: 13, scope: !137)
!160 = !DILocation(line: 87, column: 18, scope: !137)
!161 = !DILocation(line: 87, column: 13, scope: !137)
!162 = !DILocation(line: 90, column: 1, scope: !103)
!163 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DILocalVariable(name: "data", scope: !163, file: !19, line: 95, type: !4)
!165 = !DILocation(line: 95, column: 12, scope: !163)
!166 = !DILocation(line: 96, column: 10, scope: !163)
!167 = !DILocation(line: 97, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !19, line: 97, column: 8)
!169 = !DILocation(line: 97, column: 8, scope: !163)
!170 = !DILocalVariable(name: "dataBadBuffer", scope: !171, file: !19, line: 100, type: !5)
!171 = distinct !DILexicalBlock(scope: !172, file: !19, line: 99, column: 9)
!172 = distinct !DILexicalBlock(scope: !168, file: !19, line: 98, column: 5)
!173 = !DILocation(line: 100, column: 23, scope: !171)
!174 = !DILocation(line: 100, column: 50, scope: !171)
!175 = !DILocation(line: 100, column: 39, scope: !171)
!176 = !DILocation(line: 101, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !19, line: 101, column: 17)
!178 = !DILocation(line: 101, column: 31, scope: !177)
!179 = !DILocation(line: 101, column: 17, scope: !171)
!180 = !DILocation(line: 101, column: 41, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !19, line: 101, column: 40)
!182 = !DILocation(line: 102, column: 21, scope: !171)
!183 = !DILocation(line: 102, column: 13, scope: !171)
!184 = !DILocation(line: 103, column: 13, scope: !171)
!185 = !DILocation(line: 103, column: 33, scope: !171)
!186 = !DILocation(line: 105, column: 28, scope: !171)
!187 = !DILocation(line: 105, column: 20, scope: !171)
!188 = !DILocation(line: 105, column: 18, scope: !171)
!189 = !DILocation(line: 107, column: 5, scope: !172)
!190 = !DILocation(line: 108, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !163, file: !19, line: 108, column: 8)
!192 = !DILocation(line: 108, column: 8, scope: !163)
!193 = !DILocalVariable(name: "dataLen", scope: !194, file: !19, line: 112, type: !54)
!194 = distinct !DILexicalBlock(scope: !195, file: !19, line: 110, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !19, line: 109, column: 5)
!196 = !DILocation(line: 112, column: 20, scope: !194)
!197 = !DILocation(line: 112, column: 48, scope: !194)
!198 = !DILocation(line: 112, column: 37, scope: !194)
!199 = !DILocation(line: 112, column: 30, scope: !194)
!200 = !DILocalVariable(name: "dest", scope: !194, file: !19, line: 113, type: !4)
!201 = !DILocation(line: 113, column: 20, scope: !194)
!202 = !DILocation(line: 113, column: 42, scope: !194)
!203 = !DILocation(line: 113, column: 49, scope: !194)
!204 = !DILocation(line: 113, column: 35, scope: !194)
!205 = !DILocation(line: 114, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !194, file: !19, line: 114, column: 17)
!207 = !DILocation(line: 114, column: 22, scope: !206)
!208 = !DILocation(line: 114, column: 17, scope: !194)
!209 = !DILocation(line: 114, column: 32, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !19, line: 114, column: 31)
!211 = !DILocation(line: 115, column: 26, scope: !194)
!212 = !DILocation(line: 115, column: 32, scope: !194)
!213 = !DILocation(line: 115, column: 19, scope: !194)
!214 = !DILocation(line: 116, column: 35, scope: !194)
!215 = !DILocation(line: 116, column: 24, scope: !194)
!216 = !DILocation(line: 116, column: 13, scope: !194)
!217 = !DILocation(line: 117, column: 18, scope: !194)
!218 = !DILocation(line: 117, column: 13, scope: !194)
!219 = !DILocation(line: 119, column: 5, scope: !195)
!220 = !DILocation(line: 120, column: 1, scope: !163)
!221 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 123, type: !20, scopeLine: 124, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!222 = !DILocalVariable(name: "data", scope: !221, file: !19, line: 125, type: !4)
!223 = !DILocation(line: 125, column: 12, scope: !221)
!224 = !DILocation(line: 126, column: 10, scope: !221)
!225 = !DILocation(line: 127, column: 8, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !19, line: 127, column: 8)
!227 = !DILocation(line: 127, column: 8, scope: !221)
!228 = !DILocation(line: 130, column: 9, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !19, line: 128, column: 5)
!230 = !DILocation(line: 131, column: 5, scope: !229)
!231 = !DILocalVariable(name: "dataGoodBuffer", scope: !232, file: !19, line: 135, type: !9)
!232 = distinct !DILexicalBlock(scope: !233, file: !19, line: 134, column: 9)
!233 = distinct !DILexicalBlock(scope: !226, file: !19, line: 133, column: 5)
!234 = !DILocation(line: 135, column: 20, scope: !232)
!235 = !DILocation(line: 135, column: 45, scope: !232)
!236 = !DILocation(line: 136, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !232, file: !19, line: 136, column: 17)
!238 = !DILocation(line: 136, column: 32, scope: !237)
!239 = !DILocation(line: 136, column: 17, scope: !232)
!240 = !DILocation(line: 136, column: 42, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !19, line: 136, column: 41)
!242 = !DILocation(line: 137, column: 20, scope: !232)
!243 = !DILocation(line: 137, column: 13, scope: !232)
!244 = !DILocation(line: 138, column: 13, scope: !232)
!245 = !DILocation(line: 138, column: 34, scope: !232)
!246 = !DILocation(line: 140, column: 28, scope: !232)
!247 = !DILocation(line: 140, column: 18, scope: !232)
!248 = !DILocation(line: 143, column: 8, scope: !249)
!249 = distinct !DILexicalBlock(scope: !221, file: !19, line: 143, column: 8)
!250 = !DILocation(line: 143, column: 8, scope: !221)
!251 = !DILocalVariable(name: "dataLen", scope: !252, file: !19, line: 147, type: !54)
!252 = distinct !DILexicalBlock(scope: !253, file: !19, line: 145, column: 9)
!253 = distinct !DILexicalBlock(scope: !249, file: !19, line: 144, column: 5)
!254 = !DILocation(line: 147, column: 20, scope: !252)
!255 = !DILocation(line: 147, column: 45, scope: !252)
!256 = !DILocation(line: 147, column: 30, scope: !252)
!257 = !DILocalVariable(name: "dest", scope: !252, file: !19, line: 148, type: !4)
!258 = !DILocation(line: 148, column: 20, scope: !252)
!259 = !DILocation(line: 148, column: 42, scope: !252)
!260 = !DILocation(line: 148, column: 49, scope: !252)
!261 = !DILocation(line: 148, column: 35, scope: !252)
!262 = !DILocation(line: 149, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !252, file: !19, line: 149, column: 17)
!264 = !DILocation(line: 149, column: 22, scope: !263)
!265 = !DILocation(line: 149, column: 17, scope: !252)
!266 = !DILocation(line: 149, column: 32, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !19, line: 149, column: 31)
!268 = !DILocation(line: 150, column: 26, scope: !252)
!269 = !DILocation(line: 150, column: 32, scope: !252)
!270 = !DILocation(line: 150, column: 19, scope: !252)
!271 = !DILocation(line: 151, column: 31, scope: !252)
!272 = !DILocation(line: 151, column: 13, scope: !252)
!273 = !DILocation(line: 152, column: 18, scope: !252)
!274 = !DILocation(line: 152, column: 13, scope: !252)
!275 = !DILocation(line: 154, column: 5, scope: !253)
!276 = !DILocation(line: 155, column: 1, scope: !221)
!277 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 158, type: !20, scopeLine: 159, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!278 = !DILocalVariable(name: "data", scope: !277, file: !19, line: 160, type: !4)
!279 = !DILocation(line: 160, column: 12, scope: !277)
!280 = !DILocation(line: 161, column: 10, scope: !277)
!281 = !DILocation(line: 162, column: 8, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !19, line: 162, column: 8)
!283 = !DILocation(line: 162, column: 8, scope: !277)
!284 = !DILocalVariable(name: "dataGoodBuffer", scope: !285, file: !19, line: 165, type: !9)
!285 = distinct !DILexicalBlock(scope: !286, file: !19, line: 164, column: 9)
!286 = distinct !DILexicalBlock(scope: !282, file: !19, line: 163, column: 5)
!287 = !DILocation(line: 165, column: 20, scope: !285)
!288 = !DILocation(line: 165, column: 45, scope: !285)
!289 = !DILocation(line: 166, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !19, line: 166, column: 17)
!291 = !DILocation(line: 166, column: 32, scope: !290)
!292 = !DILocation(line: 166, column: 17, scope: !285)
!293 = !DILocation(line: 166, column: 42, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !19, line: 166, column: 41)
!295 = !DILocation(line: 167, column: 20, scope: !285)
!296 = !DILocation(line: 167, column: 13, scope: !285)
!297 = !DILocation(line: 168, column: 13, scope: !285)
!298 = !DILocation(line: 168, column: 34, scope: !285)
!299 = !DILocation(line: 170, column: 28, scope: !285)
!300 = !DILocation(line: 170, column: 18, scope: !285)
!301 = !DILocation(line: 172, column: 5, scope: !286)
!302 = !DILocation(line: 173, column: 8, scope: !303)
!303 = distinct !DILexicalBlock(scope: !277, file: !19, line: 173, column: 8)
!304 = !DILocation(line: 173, column: 8, scope: !277)
!305 = !DILocalVariable(name: "dataLen", scope: !306, file: !19, line: 177, type: !54)
!306 = distinct !DILexicalBlock(scope: !307, file: !19, line: 175, column: 9)
!307 = distinct !DILexicalBlock(scope: !303, file: !19, line: 174, column: 5)
!308 = !DILocation(line: 177, column: 20, scope: !306)
!309 = !DILocation(line: 177, column: 45, scope: !306)
!310 = !DILocation(line: 177, column: 30, scope: !306)
!311 = !DILocalVariable(name: "dest", scope: !306, file: !19, line: 178, type: !4)
!312 = !DILocation(line: 178, column: 20, scope: !306)
!313 = !DILocation(line: 178, column: 42, scope: !306)
!314 = !DILocation(line: 178, column: 49, scope: !306)
!315 = !DILocation(line: 178, column: 35, scope: !306)
!316 = !DILocation(line: 179, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !306, file: !19, line: 179, column: 17)
!318 = !DILocation(line: 179, column: 22, scope: !317)
!319 = !DILocation(line: 179, column: 17, scope: !306)
!320 = !DILocation(line: 179, column: 32, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !19, line: 179, column: 31)
!322 = !DILocation(line: 180, column: 26, scope: !306)
!323 = !DILocation(line: 180, column: 32, scope: !306)
!324 = !DILocation(line: 180, column: 19, scope: !306)
!325 = !DILocation(line: 181, column: 31, scope: !306)
!326 = !DILocation(line: 181, column: 13, scope: !306)
!327 = !DILocation(line: 182, column: 18, scope: !306)
!328 = !DILocation(line: 182, column: 13, scope: !306)
!329 = !DILocation(line: 184, column: 5, scope: !307)
!330 = !DILocation(line: 185, column: 1, scope: !277)
