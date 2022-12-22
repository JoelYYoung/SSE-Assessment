; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end4, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !31
  %call1 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !32
  %0 = bitcast i8* %call1 to i32*, !dbg !33
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !31
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %cmp = icmp eq i32* %1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !41
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  %5 = bitcast i32* %4 to i8*, !dbg !45
  store i8* %5, i8** %data, align 8, !dbg !46
  br label %if.end4, !dbg !47

if.end4:                                          ; preds = %if.end, %entry
  %call5 = call i32 @staticReturnsTrue(), !dbg !48
  %tobool6 = icmp ne i32 %call5, 0, !dbg !48
  br i1 %tobool6, label %if.then7, label %if.end14, !dbg !50

if.then7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !56
  %6 = load i8*, i8** %data, align 8, !dbg !57
  %call8 = call i64 @strlen(i8* %6) #9, !dbg !58
  store i64 %call8, i64* %dataLen, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %7 = load i64, i64* %dataLen, align 8, !dbg !61
  %add = add i64 %7, 1, !dbg !62
  %call9 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !63
  store i8* %call9, i8** %dest, align 8, !dbg !60
  %8 = load i8*, i8** %dest, align 8, !dbg !64
  %cmp10 = icmp eq i8* %8, null, !dbg !66
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !67

if.then11:                                        ; preds = %if.then7
  call void @exit(i32 -1) #8, !dbg !68
  unreachable, !dbg !68

if.end12:                                         ; preds = %if.then7
  %9 = load i8*, i8** %dest, align 8, !dbg !70
  %10 = bitcast i8* %9 to i32*, !dbg !70
  %11 = load i8*, i8** %data, align 8, !dbg !71
  %12 = bitcast i8* %11 to i32*, !dbg !71
  %call13 = call i32* @wcscpy(i32* %10, i32* %12) #7, !dbg !72
  %13 = load i8*, i8** %dest, align 8, !dbg !73
  call void @printLine(i8* %13), !dbg !74
  %14 = load i8*, i8** %dest, align 8, !dbg !75
  call void @free(i8* %14) #7, !dbg !76
  br label %if.end14, !dbg !77

if.end14:                                         ; preds = %if.end12, %if.end4
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_08_good() #0 !dbg !79 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_08_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_08_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !103 {
entry:
  ret i32 1, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %call = call i32 @staticReturnsTrue(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.end4, !dbg !113

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !117
  %call1 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !118
  %0 = bitcast i8* %call1 to i32*, !dbg !119
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !117
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !120
  %cmp = icmp eq i32* %1, null, !dbg !122
  br i1 %cmp, label %if.then2, label %if.end, !dbg !123

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !126
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !127
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !130
  %5 = bitcast i32* %4 to i8*, !dbg !131
  store i8* %5, i8** %data, align 8, !dbg !132
  br label %if.end4, !dbg !133

if.end4:                                          ; preds = %if.end, %entry
  %call5 = call i32 @staticReturnsFalse(), !dbg !134
  %tobool6 = icmp ne i32 %call5, 0, !dbg !134
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !136

if.then7:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  br label %if.end14, !dbg !139

if.else:                                          ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !140, metadata !DIExpression()), !dbg !143
  %6 = load i8*, i8** %data, align 8, !dbg !144
  %7 = bitcast i8* %6 to i32*, !dbg !145
  %call8 = call i64 @wcslen(i32* %7) #9, !dbg !146
  store i64 %call8, i64* %dataLen, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !147, metadata !DIExpression()), !dbg !148
  %8 = load i64, i64* %dataLen, align 8, !dbg !149
  %add = add i64 %8, 1, !dbg !150
  %call9 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !151
  store i8* %call9, i8** %dest, align 8, !dbg !148
  %9 = load i8*, i8** %dest, align 8, !dbg !152
  %cmp10 = icmp eq i8* %9, null, !dbg !154
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !155

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !156
  unreachable, !dbg !156

if.end12:                                         ; preds = %if.else
  %10 = load i8*, i8** %dest, align 8, !dbg !158
  %11 = bitcast i8* %10 to i32*, !dbg !158
  %12 = load i8*, i8** %data, align 8, !dbg !159
  %13 = bitcast i8* %12 to i32*, !dbg !159
  %call13 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !160
  %14 = load i8*, i8** %dest, align 8, !dbg !161
  %15 = bitcast i8* %14 to i32*, !dbg !162
  call void @printWLine(i32* %15), !dbg !163
  %16 = load i8*, i8** %dest, align 8, !dbg !164
  call void @free(i8* %16) #7, !dbg !165
  br label %if.end14

if.end14:                                         ; preds = %if.end12, %if.then7
  ret void, !dbg !166
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !167 {
entry:
  ret i32 0, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !169 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !170, metadata !DIExpression()), !dbg !171
  store i8* null, i8** %data, align 8, !dbg !172
  %call = call i32 @staticReturnsTrue(), !dbg !173
  %tobool = icmp ne i32 %call, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end4, !dbg !175

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !176, metadata !DIExpression()), !dbg !179
  %call1 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !180
  %0 = bitcast i8* %call1 to i32*, !dbg !181
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !179
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !182
  %cmp = icmp eq i32* %1, null, !dbg !184
  br i1 %cmp, label %if.then2, label %if.end, !dbg !185

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !186
  unreachable, !dbg !186

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !188
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !189
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !190
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !190
  store i32 0, i32* %arrayidx, align 4, !dbg !191
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !192
  %5 = bitcast i32* %4 to i8*, !dbg !193
  store i8* %5, i8** %data, align 8, !dbg !194
  br label %if.end4, !dbg !195

if.end4:                                          ; preds = %if.end, %entry
  %call5 = call i32 @staticReturnsTrue(), !dbg !196
  %tobool6 = icmp ne i32 %call5, 0, !dbg !196
  br i1 %tobool6, label %if.then7, label %if.end14, !dbg !198

if.then7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !199, metadata !DIExpression()), !dbg !202
  %6 = load i8*, i8** %data, align 8, !dbg !203
  %7 = bitcast i8* %6 to i32*, !dbg !204
  %call8 = call i64 @wcslen(i32* %7) #9, !dbg !205
  store i64 %call8, i64* %dataLen, align 8, !dbg !202
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !206, metadata !DIExpression()), !dbg !207
  %8 = load i64, i64* %dataLen, align 8, !dbg !208
  %add = add i64 %8, 1, !dbg !209
  %call9 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !210
  store i8* %call9, i8** %dest, align 8, !dbg !207
  %9 = load i8*, i8** %dest, align 8, !dbg !211
  %cmp10 = icmp eq i8* %9, null, !dbg !213
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !214

if.then11:                                        ; preds = %if.then7
  call void @exit(i32 -1) #8, !dbg !215
  unreachable, !dbg !215

if.end12:                                         ; preds = %if.then7
  %10 = load i8*, i8** %dest, align 8, !dbg !217
  %11 = bitcast i8* %10 to i32*, !dbg !217
  %12 = load i8*, i8** %data, align 8, !dbg !218
  %13 = bitcast i8* %12 to i32*, !dbg !218
  %call13 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !219
  %14 = load i8*, i8** %dest, align 8, !dbg !220
  %15 = bitcast i8* %14 to i32*, !dbg !221
  call void @printWLine(i32* %15), !dbg !222
  %16 = load i8*, i8** %dest, align 8, !dbg !223
  call void @free(i8* %16) #7, !dbg !224
  br label %if.end14, !dbg !225

if.end14:                                         ; preds = %if.end12, %if.end4
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
  %call = call i32 @staticReturnsFalse(), !dbg !231
  %tobool = icmp ne i32 %call, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.else, !dbg !233

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !234
  br label %if.end3, !dbg !236

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !237, metadata !DIExpression()), !dbg !240
  %call1 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !241
  store i8* %call1, i8** %dataGoodBuffer, align 8, !dbg !240
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !242
  %cmp = icmp eq i8* %0, null, !dbg !244
  br i1 %cmp, label %if.then2, label %if.end, !dbg !245

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !246
  unreachable, !dbg !246

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !248
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !249
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !250
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !250
  store i8 0, i8* %arrayidx, align 1, !dbg !251
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !252
  store i8* %3, i8** %data, align 8, !dbg !253
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %call4 = call i32 @staticReturnsTrue(), !dbg !254
  %tobool5 = icmp ne i32 %call4, 0, !dbg !254
  br i1 %tobool5, label %if.then6, label %if.end13, !dbg !256

if.then6:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !257, metadata !DIExpression()), !dbg !260
  %4 = load i8*, i8** %data, align 8, !dbg !261
  %call7 = call i64 @strlen(i8* %4) #9, !dbg !262
  store i64 %call7, i64* %dataLen, align 8, !dbg !260
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !263, metadata !DIExpression()), !dbg !264
  %5 = load i64, i64* %dataLen, align 8, !dbg !265
  %add = add i64 %5, 1, !dbg !266
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !267
  store i8* %call8, i8** %dest, align 8, !dbg !264
  %6 = load i8*, i8** %dest, align 8, !dbg !268
  %cmp9 = icmp eq i8* %6, null, !dbg !270
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !271

if.then10:                                        ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !272
  unreachable, !dbg !272

if.end11:                                         ; preds = %if.then6
  %7 = load i8*, i8** %dest, align 8, !dbg !274
  %8 = load i8*, i8** %data, align 8, !dbg !275
  %call12 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !276
  %9 = load i8*, i8** %dest, align 8, !dbg !277
  call void @printLine(i8* %9), !dbg !278
  %10 = load i8*, i8** %dest, align 8, !dbg !279
  call void @free(i8* %10) #7, !dbg !280
  br label %if.end13, !dbg !281

if.end13:                                         ; preds = %if.end11, %if.end3
  ret void, !dbg !282
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !283 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !284, metadata !DIExpression()), !dbg !285
  store i8* null, i8** %data, align 8, !dbg !286
  %call = call i32 @staticReturnsTrue(), !dbg !287
  %tobool = icmp ne i32 %call, 0, !dbg !287
  br i1 %tobool, label %if.then, label %if.end3, !dbg !289

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !290, metadata !DIExpression()), !dbg !293
  %call1 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !294
  store i8* %call1, i8** %dataGoodBuffer, align 8, !dbg !293
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !295
  %cmp = icmp eq i8* %0, null, !dbg !297
  br i1 %cmp, label %if.then2, label %if.end, !dbg !298

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !299
  unreachable, !dbg !299

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !301
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !302
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !303
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !303
  store i8 0, i8* %arrayidx, align 1, !dbg !304
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !305
  store i8* %3, i8** %data, align 8, !dbg !306
  br label %if.end3, !dbg !307

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsTrue(), !dbg !308
  %tobool5 = icmp ne i32 %call4, 0, !dbg !308
  br i1 %tobool5, label %if.then6, label %if.end13, !dbg !310

if.then6:                                         ; preds = %if.end3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !311, metadata !DIExpression()), !dbg !314
  %4 = load i8*, i8** %data, align 8, !dbg !315
  %call7 = call i64 @strlen(i8* %4) #9, !dbg !316
  store i64 %call7, i64* %dataLen, align 8, !dbg !314
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !317, metadata !DIExpression()), !dbg !318
  %5 = load i64, i64* %dataLen, align 8, !dbg !319
  %add = add i64 %5, 1, !dbg !320
  %call8 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !321
  store i8* %call8, i8** %dest, align 8, !dbg !318
  %6 = load i8*, i8** %dest, align 8, !dbg !322
  %cmp9 = icmp eq i8* %6, null, !dbg !324
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !325

if.then10:                                        ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !326
  unreachable, !dbg !326

if.end11:                                         ; preds = %if.then6
  %7 = load i8*, i8** %dest, align 8, !dbg !328
  %8 = load i8*, i8** %data, align 8, !dbg !329
  %call12 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !330
  %9 = load i8*, i8** %dest, align 8, !dbg !331
  call void @printLine(i8* %9), !dbg !332
  %10 = load i8*, i8** %dest, align 8, !dbg !333
  call void @free(i8* %10) #7, !dbg !334
  br label %if.end13, !dbg !335

if.end13:                                         ; preds = %if.end11, %if.end3
  ret void, !dbg !336
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_08.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_08_bad", scope: !19, file: !19, line: 37, type: !20, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_08.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 39, type: !4)
!23 = !DILocation(line: 39, column: 12, scope: !18)
!24 = !DILocation(line: 40, column: 10, scope: !18)
!25 = !DILocation(line: 41, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 8)
!27 = !DILocation(line: 41, column: 8, scope: !18)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !29, file: !19, line: 44, type: !5)
!29 = distinct !DILexicalBlock(scope: !30, file: !19, line: 43, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !19, line: 42, column: 5)
!31 = !DILocation(line: 44, column: 23, scope: !29)
!32 = !DILocation(line: 44, column: 50, scope: !29)
!33 = !DILocation(line: 44, column: 39, scope: !29)
!34 = !DILocation(line: 45, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !19, line: 45, column: 17)
!36 = !DILocation(line: 45, column: 31, scope: !35)
!37 = !DILocation(line: 45, column: 17, scope: !29)
!38 = !DILocation(line: 45, column: 41, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !19, line: 45, column: 40)
!40 = !DILocation(line: 46, column: 21, scope: !29)
!41 = !DILocation(line: 46, column: 13, scope: !29)
!42 = !DILocation(line: 47, column: 13, scope: !29)
!43 = !DILocation(line: 47, column: 33, scope: !29)
!44 = !DILocation(line: 49, column: 28, scope: !29)
!45 = !DILocation(line: 49, column: 20, scope: !29)
!46 = !DILocation(line: 49, column: 18, scope: !29)
!47 = !DILocation(line: 51, column: 5, scope: !30)
!48 = !DILocation(line: 52, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !18, file: !19, line: 52, column: 8)
!50 = !DILocation(line: 52, column: 8, scope: !18)
!51 = !DILocalVariable(name: "dataLen", scope: !52, file: !19, line: 56, type: !54)
!52 = distinct !DILexicalBlock(scope: !53, file: !19, line: 54, column: 9)
!53 = distinct !DILexicalBlock(scope: !49, file: !19, line: 53, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 56, column: 20, scope: !52)
!57 = !DILocation(line: 56, column: 45, scope: !52)
!58 = !DILocation(line: 56, column: 30, scope: !52)
!59 = !DILocalVariable(name: "dest", scope: !52, file: !19, line: 57, type: !4)
!60 = !DILocation(line: 57, column: 20, scope: !52)
!61 = !DILocation(line: 57, column: 42, scope: !52)
!62 = !DILocation(line: 57, column: 49, scope: !52)
!63 = !DILocation(line: 57, column: 35, scope: !52)
!64 = !DILocation(line: 58, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !52, file: !19, line: 58, column: 17)
!66 = !DILocation(line: 58, column: 22, scope: !65)
!67 = !DILocation(line: 58, column: 17, scope: !52)
!68 = !DILocation(line: 58, column: 32, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !19, line: 58, column: 31)
!70 = !DILocation(line: 59, column: 26, scope: !52)
!71 = !DILocation(line: 59, column: 32, scope: !52)
!72 = !DILocation(line: 59, column: 19, scope: !52)
!73 = !DILocation(line: 60, column: 31, scope: !52)
!74 = !DILocation(line: 60, column: 13, scope: !52)
!75 = !DILocation(line: 61, column: 18, scope: !52)
!76 = !DILocation(line: 61, column: 13, scope: !52)
!77 = !DILocation(line: 63, column: 5, scope: !53)
!78 = !DILocation(line: 64, column: 1, scope: !18)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_08_good", scope: !19, file: !19, line: 200, type: !20, scopeLine: 201, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 202, column: 5, scope: !79)
!81 = !DILocation(line: 203, column: 5, scope: !79)
!82 = !DILocation(line: 204, column: 5, scope: !79)
!83 = !DILocation(line: 205, column: 5, scope: !79)
!84 = !DILocation(line: 206, column: 1, scope: !79)
!85 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 217, type: !86, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!8, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !19, line: 217, type: !8)
!90 = !DILocation(line: 217, column: 14, scope: !85)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !19, line: 217, type: !88)
!92 = !DILocation(line: 217, column: 27, scope: !85)
!93 = !DILocation(line: 220, column: 22, scope: !85)
!94 = !DILocation(line: 220, column: 12, scope: !85)
!95 = !DILocation(line: 220, column: 5, scope: !85)
!96 = !DILocation(line: 222, column: 5, scope: !85)
!97 = !DILocation(line: 223, column: 5, scope: !85)
!98 = !DILocation(line: 224, column: 5, scope: !85)
!99 = !DILocation(line: 227, column: 5, scope: !85)
!100 = !DILocation(line: 228, column: 5, scope: !85)
!101 = !DILocation(line: 229, column: 5, scope: !85)
!102 = !DILocation(line: 231, column: 5, scope: !85)
!103 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !19, file: !19, line: 25, type: !104, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!8}
!106 = !DILocation(line: 27, column: 5, scope: !103)
!107 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !19, line: 73, type: !4)
!109 = !DILocation(line: 73, column: 12, scope: !107)
!110 = !DILocation(line: 74, column: 10, scope: !107)
!111 = !DILocation(line: 75, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !19, line: 75, column: 8)
!113 = !DILocation(line: 75, column: 8, scope: !107)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !19, line: 78, type: !5)
!115 = distinct !DILexicalBlock(scope: !116, file: !19, line: 77, column: 9)
!116 = distinct !DILexicalBlock(scope: !112, file: !19, line: 76, column: 5)
!117 = !DILocation(line: 78, column: 23, scope: !115)
!118 = !DILocation(line: 78, column: 50, scope: !115)
!119 = !DILocation(line: 78, column: 39, scope: !115)
!120 = !DILocation(line: 79, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !19, line: 79, column: 17)
!122 = !DILocation(line: 79, column: 31, scope: !121)
!123 = !DILocation(line: 79, column: 17, scope: !115)
!124 = !DILocation(line: 79, column: 41, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !19, line: 79, column: 40)
!126 = !DILocation(line: 80, column: 21, scope: !115)
!127 = !DILocation(line: 80, column: 13, scope: !115)
!128 = !DILocation(line: 81, column: 13, scope: !115)
!129 = !DILocation(line: 81, column: 33, scope: !115)
!130 = !DILocation(line: 83, column: 28, scope: !115)
!131 = !DILocation(line: 83, column: 20, scope: !115)
!132 = !DILocation(line: 83, column: 18, scope: !115)
!133 = !DILocation(line: 85, column: 5, scope: !116)
!134 = !DILocation(line: 86, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !107, file: !19, line: 86, column: 8)
!136 = !DILocation(line: 86, column: 8, scope: !107)
!137 = !DILocation(line: 89, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !19, line: 87, column: 5)
!139 = !DILocation(line: 90, column: 5, scope: !138)
!140 = !DILocalVariable(name: "dataLen", scope: !141, file: !19, line: 95, type: !54)
!141 = distinct !DILexicalBlock(scope: !142, file: !19, line: 93, column: 9)
!142 = distinct !DILexicalBlock(scope: !135, file: !19, line: 92, column: 5)
!143 = !DILocation(line: 95, column: 20, scope: !141)
!144 = !DILocation(line: 95, column: 48, scope: !141)
!145 = !DILocation(line: 95, column: 37, scope: !141)
!146 = !DILocation(line: 95, column: 30, scope: !141)
!147 = !DILocalVariable(name: "dest", scope: !141, file: !19, line: 96, type: !4)
!148 = !DILocation(line: 96, column: 20, scope: !141)
!149 = !DILocation(line: 96, column: 42, scope: !141)
!150 = !DILocation(line: 96, column: 49, scope: !141)
!151 = !DILocation(line: 96, column: 35, scope: !141)
!152 = !DILocation(line: 97, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !141, file: !19, line: 97, column: 17)
!154 = !DILocation(line: 97, column: 22, scope: !153)
!155 = !DILocation(line: 97, column: 17, scope: !141)
!156 = !DILocation(line: 97, column: 32, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !19, line: 97, column: 31)
!158 = !DILocation(line: 98, column: 26, scope: !141)
!159 = !DILocation(line: 98, column: 32, scope: !141)
!160 = !DILocation(line: 98, column: 19, scope: !141)
!161 = !DILocation(line: 99, column: 35, scope: !141)
!162 = !DILocation(line: 99, column: 24, scope: !141)
!163 = !DILocation(line: 99, column: 13, scope: !141)
!164 = !DILocation(line: 100, column: 18, scope: !141)
!165 = !DILocation(line: 100, column: 13, scope: !141)
!166 = !DILocation(line: 103, column: 1, scope: !107)
!167 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !19, file: !19, line: 30, type: !104, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!168 = !DILocation(line: 32, column: 5, scope: !167)
!169 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 106, type: !20, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = !DILocalVariable(name: "data", scope: !169, file: !19, line: 108, type: !4)
!171 = !DILocation(line: 108, column: 12, scope: !169)
!172 = !DILocation(line: 109, column: 10, scope: !169)
!173 = !DILocation(line: 110, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !169, file: !19, line: 110, column: 8)
!175 = !DILocation(line: 110, column: 8, scope: !169)
!176 = !DILocalVariable(name: "dataBadBuffer", scope: !177, file: !19, line: 113, type: !5)
!177 = distinct !DILexicalBlock(scope: !178, file: !19, line: 112, column: 9)
!178 = distinct !DILexicalBlock(scope: !174, file: !19, line: 111, column: 5)
!179 = !DILocation(line: 113, column: 23, scope: !177)
!180 = !DILocation(line: 113, column: 50, scope: !177)
!181 = !DILocation(line: 113, column: 39, scope: !177)
!182 = !DILocation(line: 114, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !177, file: !19, line: 114, column: 17)
!184 = !DILocation(line: 114, column: 31, scope: !183)
!185 = !DILocation(line: 114, column: 17, scope: !177)
!186 = !DILocation(line: 114, column: 41, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !19, line: 114, column: 40)
!188 = !DILocation(line: 115, column: 21, scope: !177)
!189 = !DILocation(line: 115, column: 13, scope: !177)
!190 = !DILocation(line: 116, column: 13, scope: !177)
!191 = !DILocation(line: 116, column: 33, scope: !177)
!192 = !DILocation(line: 118, column: 28, scope: !177)
!193 = !DILocation(line: 118, column: 20, scope: !177)
!194 = !DILocation(line: 118, column: 18, scope: !177)
!195 = !DILocation(line: 120, column: 5, scope: !178)
!196 = !DILocation(line: 121, column: 8, scope: !197)
!197 = distinct !DILexicalBlock(scope: !169, file: !19, line: 121, column: 8)
!198 = !DILocation(line: 121, column: 8, scope: !169)
!199 = !DILocalVariable(name: "dataLen", scope: !200, file: !19, line: 125, type: !54)
!200 = distinct !DILexicalBlock(scope: !201, file: !19, line: 123, column: 9)
!201 = distinct !DILexicalBlock(scope: !197, file: !19, line: 122, column: 5)
!202 = !DILocation(line: 125, column: 20, scope: !200)
!203 = !DILocation(line: 125, column: 48, scope: !200)
!204 = !DILocation(line: 125, column: 37, scope: !200)
!205 = !DILocation(line: 125, column: 30, scope: !200)
!206 = !DILocalVariable(name: "dest", scope: !200, file: !19, line: 126, type: !4)
!207 = !DILocation(line: 126, column: 20, scope: !200)
!208 = !DILocation(line: 126, column: 42, scope: !200)
!209 = !DILocation(line: 126, column: 49, scope: !200)
!210 = !DILocation(line: 126, column: 35, scope: !200)
!211 = !DILocation(line: 127, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !200, file: !19, line: 127, column: 17)
!213 = !DILocation(line: 127, column: 22, scope: !212)
!214 = !DILocation(line: 127, column: 17, scope: !200)
!215 = !DILocation(line: 127, column: 32, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !19, line: 127, column: 31)
!217 = !DILocation(line: 128, column: 26, scope: !200)
!218 = !DILocation(line: 128, column: 32, scope: !200)
!219 = !DILocation(line: 128, column: 19, scope: !200)
!220 = !DILocation(line: 129, column: 35, scope: !200)
!221 = !DILocation(line: 129, column: 24, scope: !200)
!222 = !DILocation(line: 129, column: 13, scope: !200)
!223 = !DILocation(line: 130, column: 18, scope: !200)
!224 = !DILocation(line: 130, column: 13, scope: !200)
!225 = !DILocation(line: 132, column: 5, scope: !201)
!226 = !DILocation(line: 133, column: 1, scope: !169)
!227 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 136, type: !20, scopeLine: 137, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!228 = !DILocalVariable(name: "data", scope: !227, file: !19, line: 138, type: !4)
!229 = !DILocation(line: 138, column: 12, scope: !227)
!230 = !DILocation(line: 139, column: 10, scope: !227)
!231 = !DILocation(line: 140, column: 8, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !19, line: 140, column: 8)
!233 = !DILocation(line: 140, column: 8, scope: !227)
!234 = !DILocation(line: 143, column: 9, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !19, line: 141, column: 5)
!236 = !DILocation(line: 144, column: 5, scope: !235)
!237 = !DILocalVariable(name: "dataGoodBuffer", scope: !238, file: !19, line: 148, type: !9)
!238 = distinct !DILexicalBlock(scope: !239, file: !19, line: 147, column: 9)
!239 = distinct !DILexicalBlock(scope: !232, file: !19, line: 146, column: 5)
!240 = !DILocation(line: 148, column: 20, scope: !238)
!241 = !DILocation(line: 148, column: 45, scope: !238)
!242 = !DILocation(line: 149, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !238, file: !19, line: 149, column: 17)
!244 = !DILocation(line: 149, column: 32, scope: !243)
!245 = !DILocation(line: 149, column: 17, scope: !238)
!246 = !DILocation(line: 149, column: 42, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !19, line: 149, column: 41)
!248 = !DILocation(line: 150, column: 20, scope: !238)
!249 = !DILocation(line: 150, column: 13, scope: !238)
!250 = !DILocation(line: 151, column: 13, scope: !238)
!251 = !DILocation(line: 151, column: 34, scope: !238)
!252 = !DILocation(line: 153, column: 28, scope: !238)
!253 = !DILocation(line: 153, column: 18, scope: !238)
!254 = !DILocation(line: 156, column: 8, scope: !255)
!255 = distinct !DILexicalBlock(scope: !227, file: !19, line: 156, column: 8)
!256 = !DILocation(line: 156, column: 8, scope: !227)
!257 = !DILocalVariable(name: "dataLen", scope: !258, file: !19, line: 160, type: !54)
!258 = distinct !DILexicalBlock(scope: !259, file: !19, line: 158, column: 9)
!259 = distinct !DILexicalBlock(scope: !255, file: !19, line: 157, column: 5)
!260 = !DILocation(line: 160, column: 20, scope: !258)
!261 = !DILocation(line: 160, column: 45, scope: !258)
!262 = !DILocation(line: 160, column: 30, scope: !258)
!263 = !DILocalVariable(name: "dest", scope: !258, file: !19, line: 161, type: !4)
!264 = !DILocation(line: 161, column: 20, scope: !258)
!265 = !DILocation(line: 161, column: 42, scope: !258)
!266 = !DILocation(line: 161, column: 49, scope: !258)
!267 = !DILocation(line: 161, column: 35, scope: !258)
!268 = !DILocation(line: 162, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !258, file: !19, line: 162, column: 17)
!270 = !DILocation(line: 162, column: 22, scope: !269)
!271 = !DILocation(line: 162, column: 17, scope: !258)
!272 = !DILocation(line: 162, column: 32, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !19, line: 162, column: 31)
!274 = !DILocation(line: 163, column: 26, scope: !258)
!275 = !DILocation(line: 163, column: 32, scope: !258)
!276 = !DILocation(line: 163, column: 19, scope: !258)
!277 = !DILocation(line: 164, column: 31, scope: !258)
!278 = !DILocation(line: 164, column: 13, scope: !258)
!279 = !DILocation(line: 165, column: 18, scope: !258)
!280 = !DILocation(line: 165, column: 13, scope: !258)
!281 = !DILocation(line: 167, column: 5, scope: !259)
!282 = !DILocation(line: 168, column: 1, scope: !227)
!283 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 171, type: !20, scopeLine: 172, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!284 = !DILocalVariable(name: "data", scope: !283, file: !19, line: 173, type: !4)
!285 = !DILocation(line: 173, column: 12, scope: !283)
!286 = !DILocation(line: 174, column: 10, scope: !283)
!287 = !DILocation(line: 175, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !19, line: 175, column: 8)
!289 = !DILocation(line: 175, column: 8, scope: !283)
!290 = !DILocalVariable(name: "dataGoodBuffer", scope: !291, file: !19, line: 178, type: !9)
!291 = distinct !DILexicalBlock(scope: !292, file: !19, line: 177, column: 9)
!292 = distinct !DILexicalBlock(scope: !288, file: !19, line: 176, column: 5)
!293 = !DILocation(line: 178, column: 20, scope: !291)
!294 = !DILocation(line: 178, column: 45, scope: !291)
!295 = !DILocation(line: 179, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !19, line: 179, column: 17)
!297 = !DILocation(line: 179, column: 32, scope: !296)
!298 = !DILocation(line: 179, column: 17, scope: !291)
!299 = !DILocation(line: 179, column: 42, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !19, line: 179, column: 41)
!301 = !DILocation(line: 180, column: 20, scope: !291)
!302 = !DILocation(line: 180, column: 13, scope: !291)
!303 = !DILocation(line: 181, column: 13, scope: !291)
!304 = !DILocation(line: 181, column: 34, scope: !291)
!305 = !DILocation(line: 183, column: 28, scope: !291)
!306 = !DILocation(line: 183, column: 18, scope: !291)
!307 = !DILocation(line: 185, column: 5, scope: !292)
!308 = !DILocation(line: 186, column: 8, scope: !309)
!309 = distinct !DILexicalBlock(scope: !283, file: !19, line: 186, column: 8)
!310 = !DILocation(line: 186, column: 8, scope: !283)
!311 = !DILocalVariable(name: "dataLen", scope: !312, file: !19, line: 190, type: !54)
!312 = distinct !DILexicalBlock(scope: !313, file: !19, line: 188, column: 9)
!313 = distinct !DILexicalBlock(scope: !309, file: !19, line: 187, column: 5)
!314 = !DILocation(line: 190, column: 20, scope: !312)
!315 = !DILocation(line: 190, column: 45, scope: !312)
!316 = !DILocation(line: 190, column: 30, scope: !312)
!317 = !DILocalVariable(name: "dest", scope: !312, file: !19, line: 191, type: !4)
!318 = !DILocation(line: 191, column: 20, scope: !312)
!319 = !DILocation(line: 191, column: 42, scope: !312)
!320 = !DILocation(line: 191, column: 49, scope: !312)
!321 = !DILocation(line: 191, column: 35, scope: !312)
!322 = !DILocation(line: 192, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !312, file: !19, line: 192, column: 17)
!324 = !DILocation(line: 192, column: 22, scope: !323)
!325 = !DILocation(line: 192, column: 17, scope: !312)
!326 = !DILocation(line: 192, column: 32, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !19, line: 192, column: 31)
!328 = !DILocation(line: 193, column: 26, scope: !312)
!329 = !DILocation(line: 193, column: 32, scope: !312)
!330 = !DILocation(line: 193, column: 19, scope: !312)
!331 = !DILocation(line: 194, column: 31, scope: !312)
!332 = !DILocation(line: 194, column: 13, scope: !312)
!333 = !DILocation(line: 195, column: 18, scope: !312)
!334 = !DILocation(line: 195, column: 13, scope: !312)
!335 = !DILocation(line: 197, column: 5, scope: !313)
!336 = !DILocation(line: 198, column: 1, scope: !283)
