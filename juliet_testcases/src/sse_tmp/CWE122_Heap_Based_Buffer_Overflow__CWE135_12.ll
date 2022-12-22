; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %dataLen20 = alloca i64, align 8
  %dest22 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

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
  br label %if.end9, !dbg !47

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !48, metadata !DIExpression()), !dbg !51
  %call4 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !52
  store i8* %call4, i8** %dataGoodBuffer, align 8, !dbg !51
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !53
  %cmp5 = icmp eq i8* %6, null, !dbg !55
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !56

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !57
  unreachable, !dbg !57

if.end7:                                          ; preds = %if.else
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 1 %7, i8 65, i64 49, i1 false), !dbg !60
  %8 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !61
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 49, !dbg !61
  store i8 0, i8* %arrayidx8, align 1, !dbg !62
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !63
  store i8* %9, i8** %data, align 8, !dbg !64
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  %call10 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !65
  %tobool11 = icmp ne i32 %call10, 0, !dbg !65
  br i1 %tobool11, label %if.then12, label %if.else19, !dbg !67

if.then12:                                        ; preds = %if.end9
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !68, metadata !DIExpression()), !dbg !73
  %10 = load i8*, i8** %data, align 8, !dbg !74
  %call13 = call i64 @strlen(i8* %10) #9, !dbg !75
  store i64 %call13, i64* %dataLen, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !76, metadata !DIExpression()), !dbg !77
  %11 = load i64, i64* %dataLen, align 8, !dbg !78
  %add = add i64 %11, 1, !dbg !79
  %call14 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !80
  store i8* %call14, i8** %dest, align 8, !dbg !77
  %12 = load i8*, i8** %dest, align 8, !dbg !81
  %cmp15 = icmp eq i8* %12, null, !dbg !83
  br i1 %cmp15, label %if.then16, label %if.end17, !dbg !84

if.then16:                                        ; preds = %if.then12
  call void @exit(i32 -1) #8, !dbg !85
  unreachable, !dbg !85

if.end17:                                         ; preds = %if.then12
  %13 = load i8*, i8** %dest, align 8, !dbg !87
  %14 = bitcast i8* %13 to i32*, !dbg !87
  %15 = load i8*, i8** %data, align 8, !dbg !88
  %16 = bitcast i8* %15 to i32*, !dbg !88
  %call18 = call i32* @wcscpy(i32* %14, i32* %16) #7, !dbg !89
  %17 = load i8*, i8** %dest, align 8, !dbg !90
  call void @printLine(i8* %17), !dbg !91
  %18 = load i8*, i8** %dest, align 8, !dbg !92
  call void @free(i8* %18) #7, !dbg !93
  br label %if.end29, !dbg !94

if.else19:                                        ; preds = %if.end9
  call void @llvm.dbg.declare(metadata i64* %dataLen20, metadata !95, metadata !DIExpression()), !dbg !98
  %19 = load i8*, i8** %data, align 8, !dbg !99
  %20 = bitcast i8* %19 to i32*, !dbg !100
  %call21 = call i64 @wcslen(i32* %20) #9, !dbg !101
  store i64 %call21, i64* %dataLen20, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dest22, metadata !102, metadata !DIExpression()), !dbg !103
  %21 = load i64, i64* %dataLen20, align 8, !dbg !104
  %add23 = add i64 %21, 1, !dbg !105
  %call24 = call noalias align 16 i8* @calloc(i64 %add23, i64 4) #7, !dbg !106
  store i8* %call24, i8** %dest22, align 8, !dbg !103
  %22 = load i8*, i8** %dest22, align 8, !dbg !107
  %cmp25 = icmp eq i8* %22, null, !dbg !109
  br i1 %cmp25, label %if.then26, label %if.end27, !dbg !110

if.then26:                                        ; preds = %if.else19
  call void @exit(i32 -1) #8, !dbg !111
  unreachable, !dbg !111

if.end27:                                         ; preds = %if.else19
  %23 = load i8*, i8** %dest22, align 8, !dbg !113
  %24 = bitcast i8* %23 to i32*, !dbg !113
  %25 = load i8*, i8** %data, align 8, !dbg !114
  %26 = bitcast i8* %25 to i32*, !dbg !114
  %call28 = call i32* @wcscpy(i32* %24, i32* %26) #7, !dbg !115
  %27 = load i8*, i8** %dest22, align 8, !dbg !116
  %28 = bitcast i8* %27 to i32*, !dbg !117
  call void @printWLine(i32* %28), !dbg !118
  %29 = load i8*, i8** %dest22, align 8, !dbg !119
  call void @free(i8* %29) #7, !dbg !120
  br label %if.end29

if.end29:                                         ; preds = %if.end27, %if.end17
  ret void, !dbg !121
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_12_good() #0 !dbg !122 {
entry:
  call void @goodB2G(), !dbg !123
  call void @goodG2B(), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !126 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !130, metadata !DIExpression()), !dbg !131
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !132, metadata !DIExpression()), !dbg !133
  %call = call i64 @time(i64* null) #7, !dbg !134
  %conv = trunc i64 %call to i32, !dbg !135
  call void @srand(i32 %conv) #7, !dbg !136
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !137
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_12_good(), !dbg !138
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !140
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_12_bad(), !dbg !141
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !142
  ret i32 0, !dbg !143
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !144 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataBadBuffer4 = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %dataLen22 = alloca i64, align 8
  %dest24 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !145, metadata !DIExpression()), !dbg !146
  store i8* null, i8** %data, align 8, !dbg !147
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !148
  %tobool = icmp ne i32 %call, 0, !dbg !148
  br i1 %tobool, label %if.then, label %if.else, !dbg !150

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !151, metadata !DIExpression()), !dbg !154
  %call1 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !155
  %0 = bitcast i8* %call1 to i32*, !dbg !156
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !154
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !157
  %cmp = icmp eq i32* %1, null, !dbg !159
  br i1 %cmp, label %if.then2, label %if.end, !dbg !160

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !161
  unreachable, !dbg !161

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !163
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !164
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !167
  %5 = bitcast i32* %4 to i8*, !dbg !168
  store i8* %5, i8** %data, align 8, !dbg !169
  br label %if.end11, !dbg !170

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer4, metadata !171, metadata !DIExpression()), !dbg !174
  %call5 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !175
  %6 = bitcast i8* %call5 to i32*, !dbg !176
  store i32* %6, i32** %dataBadBuffer4, align 8, !dbg !174
  %7 = load i32*, i32** %dataBadBuffer4, align 8, !dbg !177
  %cmp6 = icmp eq i32* %7, null, !dbg !179
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !180

if.then7:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !181
  unreachable, !dbg !181

if.end8:                                          ; preds = %if.else
  %8 = load i32*, i32** %dataBadBuffer4, align 8, !dbg !183
  %call9 = call i32* @wmemset(i32* %8, i32 65, i64 49) #7, !dbg !184
  %9 = load i32*, i32** %dataBadBuffer4, align 8, !dbg !185
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 49, !dbg !185
  store i32 0, i32* %arrayidx10, align 4, !dbg !186
  %10 = load i32*, i32** %dataBadBuffer4, align 8, !dbg !187
  %11 = bitcast i32* %10 to i8*, !dbg !188
  store i8* %11, i8** %data, align 8, !dbg !189
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  %call12 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !190
  %tobool13 = icmp ne i32 %call12, 0, !dbg !190
  br i1 %tobool13, label %if.then14, label %if.else21, !dbg !192

if.then14:                                        ; preds = %if.end11
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !193, metadata !DIExpression()), !dbg !196
  %12 = load i8*, i8** %data, align 8, !dbg !197
  %13 = bitcast i8* %12 to i32*, !dbg !198
  %call15 = call i64 @wcslen(i32* %13) #9, !dbg !199
  store i64 %call15, i64* %dataLen, align 8, !dbg !196
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !200, metadata !DIExpression()), !dbg !201
  %14 = load i64, i64* %dataLen, align 8, !dbg !202
  %add = add i64 %14, 1, !dbg !203
  %call16 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !204
  store i8* %call16, i8** %dest, align 8, !dbg !201
  %15 = load i8*, i8** %dest, align 8, !dbg !205
  %cmp17 = icmp eq i8* %15, null, !dbg !207
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !208

if.then18:                                        ; preds = %if.then14
  call void @exit(i32 -1) #8, !dbg !209
  unreachable, !dbg !209

if.end19:                                         ; preds = %if.then14
  %16 = load i8*, i8** %dest, align 8, !dbg !211
  %17 = bitcast i8* %16 to i32*, !dbg !211
  %18 = load i8*, i8** %data, align 8, !dbg !212
  %19 = bitcast i8* %18 to i32*, !dbg !212
  %call20 = call i32* @wcscpy(i32* %17, i32* %19) #7, !dbg !213
  %20 = load i8*, i8** %dest, align 8, !dbg !214
  %21 = bitcast i8* %20 to i32*, !dbg !215
  call void @printWLine(i32* %21), !dbg !216
  %22 = load i8*, i8** %dest, align 8, !dbg !217
  call void @free(i8* %22) #7, !dbg !218
  br label %if.end31, !dbg !219

if.else21:                                        ; preds = %if.end11
  call void @llvm.dbg.declare(metadata i64* %dataLen22, metadata !220, metadata !DIExpression()), !dbg !223
  %23 = load i8*, i8** %data, align 8, !dbg !224
  %24 = bitcast i8* %23 to i32*, !dbg !225
  %call23 = call i64 @wcslen(i32* %24) #9, !dbg !226
  store i64 %call23, i64* %dataLen22, align 8, !dbg !223
  call void @llvm.dbg.declare(metadata i8** %dest24, metadata !227, metadata !DIExpression()), !dbg !228
  %25 = load i64, i64* %dataLen22, align 8, !dbg !229
  %add25 = add i64 %25, 1, !dbg !230
  %call26 = call noalias align 16 i8* @calloc(i64 %add25, i64 4) #7, !dbg !231
  store i8* %call26, i8** %dest24, align 8, !dbg !228
  %26 = load i8*, i8** %dest24, align 8, !dbg !232
  %cmp27 = icmp eq i8* %26, null, !dbg !234
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !235

if.then28:                                        ; preds = %if.else21
  call void @exit(i32 -1) #8, !dbg !236
  unreachable, !dbg !236

if.end29:                                         ; preds = %if.else21
  %27 = load i8*, i8** %dest24, align 8, !dbg !238
  %28 = bitcast i8* %27 to i32*, !dbg !238
  %29 = load i8*, i8** %data, align 8, !dbg !239
  %30 = bitcast i8* %29 to i32*, !dbg !239
  %call30 = call i32* @wcscpy(i32* %28, i32* %30) #7, !dbg !240
  %31 = load i8*, i8** %dest24, align 8, !dbg !241
  %32 = bitcast i8* %31 to i32*, !dbg !242
  call void @printWLine(i32* %32), !dbg !243
  %33 = load i8*, i8** %dest24, align 8, !dbg !244
  call void @free(i8* %33) #7, !dbg !245
  br label %if.end31

if.end31:                                         ; preds = %if.end29, %if.end19
  ret void, !dbg !246
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !247 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataGoodBuffer3 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %dataLen20 = alloca i64, align 8
  %dest22 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !248, metadata !DIExpression()), !dbg !249
  store i8* null, i8** %data, align 8, !dbg !250
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !251
  %tobool = icmp ne i32 %call, 0, !dbg !251
  br i1 %tobool, label %if.then, label %if.else, !dbg !253

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !254, metadata !DIExpression()), !dbg !257
  %call1 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !258
  store i8* %call1, i8** %dataGoodBuffer, align 8, !dbg !257
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !259
  %cmp = icmp eq i8* %0, null, !dbg !261
  br i1 %cmp, label %if.then2, label %if.end, !dbg !262

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !263
  unreachable, !dbg !263

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !265
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !266
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !267
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !267
  store i8 0, i8* %arrayidx, align 1, !dbg !268
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !269
  store i8* %3, i8** %data, align 8, !dbg !270
  br label %if.end9, !dbg !271

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer3, metadata !272, metadata !DIExpression()), !dbg !275
  %call4 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !276
  store i8* %call4, i8** %dataGoodBuffer3, align 8, !dbg !275
  %4 = load i8*, i8** %dataGoodBuffer3, align 8, !dbg !277
  %cmp5 = icmp eq i8* %4, null, !dbg !279
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !280

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !281
  unreachable, !dbg !281

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataGoodBuffer3, align 8, !dbg !283
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 49, i1 false), !dbg !284
  %6 = load i8*, i8** %dataGoodBuffer3, align 8, !dbg !285
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 49, !dbg !285
  store i8 0, i8* %arrayidx8, align 1, !dbg !286
  %7 = load i8*, i8** %dataGoodBuffer3, align 8, !dbg !287
  store i8* %7, i8** %data, align 8, !dbg !288
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  %call10 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !289
  %tobool11 = icmp ne i32 %call10, 0, !dbg !289
  br i1 %tobool11, label %if.then12, label %if.else19, !dbg !291

if.then12:                                        ; preds = %if.end9
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !292, metadata !DIExpression()), !dbg !295
  %8 = load i8*, i8** %data, align 8, !dbg !296
  %call13 = call i64 @strlen(i8* %8) #9, !dbg !297
  store i64 %call13, i64* %dataLen, align 8, !dbg !295
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !298, metadata !DIExpression()), !dbg !299
  %9 = load i64, i64* %dataLen, align 8, !dbg !300
  %add = add i64 %9, 1, !dbg !301
  %call14 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !302
  store i8* %call14, i8** %dest, align 8, !dbg !299
  %10 = load i8*, i8** %dest, align 8, !dbg !303
  %cmp15 = icmp eq i8* %10, null, !dbg !305
  br i1 %cmp15, label %if.then16, label %if.end17, !dbg !306

if.then16:                                        ; preds = %if.then12
  call void @exit(i32 -1) #8, !dbg !307
  unreachable, !dbg !307

if.end17:                                         ; preds = %if.then12
  %11 = load i8*, i8** %dest, align 8, !dbg !309
  %12 = load i8*, i8** %data, align 8, !dbg !310
  %call18 = call i8* @strcpy(i8* %11, i8* %12) #7, !dbg !311
  %13 = load i8*, i8** %dest, align 8, !dbg !312
  call void @printLine(i8* %13), !dbg !313
  %14 = load i8*, i8** %dest, align 8, !dbg !314
  call void @free(i8* %14) #7, !dbg !315
  br label %if.end29, !dbg !316

if.else19:                                        ; preds = %if.end9
  call void @llvm.dbg.declare(metadata i64* %dataLen20, metadata !317, metadata !DIExpression()), !dbg !320
  %15 = load i8*, i8** %data, align 8, !dbg !321
  %call21 = call i64 @strlen(i8* %15) #9, !dbg !322
  store i64 %call21, i64* %dataLen20, align 8, !dbg !320
  call void @llvm.dbg.declare(metadata i8** %dest22, metadata !323, metadata !DIExpression()), !dbg !324
  %16 = load i64, i64* %dataLen20, align 8, !dbg !325
  %add23 = add i64 %16, 1, !dbg !326
  %call24 = call noalias align 16 i8* @calloc(i64 %add23, i64 1) #7, !dbg !327
  store i8* %call24, i8** %dest22, align 8, !dbg !324
  %17 = load i8*, i8** %dest22, align 8, !dbg !328
  %cmp25 = icmp eq i8* %17, null, !dbg !330
  br i1 %cmp25, label %if.then26, label %if.end27, !dbg !331

if.then26:                                        ; preds = %if.else19
  call void @exit(i32 -1) #8, !dbg !332
  unreachable, !dbg !332

if.end27:                                         ; preds = %if.else19
  %18 = load i8*, i8** %dest22, align 8, !dbg !334
  %19 = load i8*, i8** %data, align 8, !dbg !335
  %call28 = call i8* @strcpy(i8* %18, i8* %19) #7, !dbg !336
  %20 = load i8*, i8** %dest22, align 8, !dbg !337
  call void @printLine(i8* %20), !dbg !338
  %21 = load i8*, i8** %dest22, align 8, !dbg !339
  call void @free(i8* %21) #7, !dbg !340
  br label %if.end29

if.end29:                                         ; preds = %if.end27, %if.end17
  ret void, !dbg !341
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_12.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_12_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_12.c", directory: "/root/SSE-Assessment")
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
!48 = !DILocalVariable(name: "dataGoodBuffer", scope: !49, file: !19, line: 42, type: !9)
!49 = distinct !DILexicalBlock(scope: !50, file: !19, line: 41, column: 9)
!50 = distinct !DILexicalBlock(scope: !26, file: !19, line: 40, column: 5)
!51 = !DILocation(line: 42, column: 20, scope: !49)
!52 = !DILocation(line: 42, column: 45, scope: !49)
!53 = !DILocation(line: 43, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !19, line: 43, column: 17)
!55 = !DILocation(line: 43, column: 32, scope: !54)
!56 = !DILocation(line: 43, column: 17, scope: !49)
!57 = !DILocation(line: 43, column: 42, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !19, line: 43, column: 41)
!59 = !DILocation(line: 44, column: 20, scope: !49)
!60 = !DILocation(line: 44, column: 13, scope: !49)
!61 = !DILocation(line: 45, column: 13, scope: !49)
!62 = !DILocation(line: 45, column: 34, scope: !49)
!63 = !DILocation(line: 47, column: 28, scope: !49)
!64 = !DILocation(line: 47, column: 18, scope: !49)
!65 = !DILocation(line: 50, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !18, file: !19, line: 50, column: 8)
!67 = !DILocation(line: 50, column: 8, scope: !18)
!68 = !DILocalVariable(name: "dataLen", scope: !69, file: !19, line: 54, type: !71)
!69 = distinct !DILexicalBlock(scope: !70, file: !19, line: 52, column: 9)
!70 = distinct !DILexicalBlock(scope: !66, file: !19, line: 51, column: 5)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !72)
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 54, column: 20, scope: !69)
!74 = !DILocation(line: 54, column: 45, scope: !69)
!75 = !DILocation(line: 54, column: 30, scope: !69)
!76 = !DILocalVariable(name: "dest", scope: !69, file: !19, line: 55, type: !4)
!77 = !DILocation(line: 55, column: 20, scope: !69)
!78 = !DILocation(line: 55, column: 42, scope: !69)
!79 = !DILocation(line: 55, column: 49, scope: !69)
!80 = !DILocation(line: 55, column: 35, scope: !69)
!81 = !DILocation(line: 56, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !69, file: !19, line: 56, column: 17)
!83 = !DILocation(line: 56, column: 22, scope: !82)
!84 = !DILocation(line: 56, column: 17, scope: !69)
!85 = !DILocation(line: 56, column: 32, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !19, line: 56, column: 31)
!87 = !DILocation(line: 57, column: 26, scope: !69)
!88 = !DILocation(line: 57, column: 32, scope: !69)
!89 = !DILocation(line: 57, column: 19, scope: !69)
!90 = !DILocation(line: 58, column: 31, scope: !69)
!91 = !DILocation(line: 58, column: 13, scope: !69)
!92 = !DILocation(line: 59, column: 18, scope: !69)
!93 = !DILocation(line: 59, column: 13, scope: !69)
!94 = !DILocation(line: 61, column: 5, scope: !70)
!95 = !DILocalVariable(name: "dataLen", scope: !96, file: !19, line: 66, type: !71)
!96 = distinct !DILexicalBlock(scope: !97, file: !19, line: 64, column: 9)
!97 = distinct !DILexicalBlock(scope: !66, file: !19, line: 63, column: 5)
!98 = !DILocation(line: 66, column: 20, scope: !96)
!99 = !DILocation(line: 66, column: 48, scope: !96)
!100 = !DILocation(line: 66, column: 37, scope: !96)
!101 = !DILocation(line: 66, column: 30, scope: !96)
!102 = !DILocalVariable(name: "dest", scope: !96, file: !19, line: 67, type: !4)
!103 = !DILocation(line: 67, column: 20, scope: !96)
!104 = !DILocation(line: 67, column: 42, scope: !96)
!105 = !DILocation(line: 67, column: 49, scope: !96)
!106 = !DILocation(line: 67, column: 35, scope: !96)
!107 = !DILocation(line: 68, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !19, line: 68, column: 17)
!109 = !DILocation(line: 68, column: 22, scope: !108)
!110 = !DILocation(line: 68, column: 17, scope: !96)
!111 = !DILocation(line: 68, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !19, line: 68, column: 31)
!113 = !DILocation(line: 69, column: 26, scope: !96)
!114 = !DILocation(line: 69, column: 32, scope: !96)
!115 = !DILocation(line: 69, column: 19, scope: !96)
!116 = !DILocation(line: 70, column: 35, scope: !96)
!117 = !DILocation(line: 70, column: 24, scope: !96)
!118 = !DILocation(line: 70, column: 13, scope: !96)
!119 = !DILocation(line: 71, column: 18, scope: !96)
!120 = !DILocation(line: 71, column: 13, scope: !96)
!121 = !DILocation(line: 74, column: 1, scope: !18)
!122 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_12_good", scope: !19, file: !19, line: 190, type: !20, scopeLine: 191, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 192, column: 5, scope: !122)
!124 = !DILocation(line: 193, column: 5, scope: !122)
!125 = !DILocation(line: 194, column: 1, scope: !122)
!126 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 205, type: !127, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DISubroutineType(types: !128)
!128 = !{!8, !8, !129}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!130 = !DILocalVariable(name: "argc", arg: 1, scope: !126, file: !19, line: 205, type: !8)
!131 = !DILocation(line: 205, column: 14, scope: !126)
!132 = !DILocalVariable(name: "argv", arg: 2, scope: !126, file: !19, line: 205, type: !129)
!133 = !DILocation(line: 205, column: 27, scope: !126)
!134 = !DILocation(line: 208, column: 22, scope: !126)
!135 = !DILocation(line: 208, column: 12, scope: !126)
!136 = !DILocation(line: 208, column: 5, scope: !126)
!137 = !DILocation(line: 210, column: 5, scope: !126)
!138 = !DILocation(line: 211, column: 5, scope: !126)
!139 = !DILocation(line: 212, column: 5, scope: !126)
!140 = !DILocation(line: 215, column: 5, scope: !126)
!141 = !DILocation(line: 216, column: 5, scope: !126)
!142 = !DILocation(line: 217, column: 5, scope: !126)
!143 = !DILocation(line: 219, column: 5, scope: !126)
!144 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", scope: !144, file: !19, line: 85, type: !4)
!146 = !DILocation(line: 85, column: 12, scope: !144)
!147 = !DILocation(line: 86, column: 10, scope: !144)
!148 = !DILocation(line: 87, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !19, line: 87, column: 8)
!150 = !DILocation(line: 87, column: 8, scope: !144)
!151 = !DILocalVariable(name: "dataBadBuffer", scope: !152, file: !19, line: 90, type: !5)
!152 = distinct !DILexicalBlock(scope: !153, file: !19, line: 89, column: 9)
!153 = distinct !DILexicalBlock(scope: !149, file: !19, line: 88, column: 5)
!154 = !DILocation(line: 90, column: 23, scope: !152)
!155 = !DILocation(line: 90, column: 50, scope: !152)
!156 = !DILocation(line: 90, column: 39, scope: !152)
!157 = !DILocation(line: 91, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !19, line: 91, column: 17)
!159 = !DILocation(line: 91, column: 31, scope: !158)
!160 = !DILocation(line: 91, column: 17, scope: !152)
!161 = !DILocation(line: 91, column: 41, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !19, line: 91, column: 40)
!163 = !DILocation(line: 92, column: 21, scope: !152)
!164 = !DILocation(line: 92, column: 13, scope: !152)
!165 = !DILocation(line: 93, column: 13, scope: !152)
!166 = !DILocation(line: 93, column: 33, scope: !152)
!167 = !DILocation(line: 95, column: 28, scope: !152)
!168 = !DILocation(line: 95, column: 20, scope: !152)
!169 = !DILocation(line: 95, column: 18, scope: !152)
!170 = !DILocation(line: 97, column: 5, scope: !153)
!171 = !DILocalVariable(name: "dataBadBuffer", scope: !172, file: !19, line: 101, type: !5)
!172 = distinct !DILexicalBlock(scope: !173, file: !19, line: 100, column: 9)
!173 = distinct !DILexicalBlock(scope: !149, file: !19, line: 99, column: 5)
!174 = !DILocation(line: 101, column: 23, scope: !172)
!175 = !DILocation(line: 101, column: 50, scope: !172)
!176 = !DILocation(line: 101, column: 39, scope: !172)
!177 = !DILocation(line: 102, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !172, file: !19, line: 102, column: 17)
!179 = !DILocation(line: 102, column: 31, scope: !178)
!180 = !DILocation(line: 102, column: 17, scope: !172)
!181 = !DILocation(line: 102, column: 41, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !19, line: 102, column: 40)
!183 = !DILocation(line: 103, column: 21, scope: !172)
!184 = !DILocation(line: 103, column: 13, scope: !172)
!185 = !DILocation(line: 104, column: 13, scope: !172)
!186 = !DILocation(line: 104, column: 33, scope: !172)
!187 = !DILocation(line: 106, column: 28, scope: !172)
!188 = !DILocation(line: 106, column: 20, scope: !172)
!189 = !DILocation(line: 106, column: 18, scope: !172)
!190 = !DILocation(line: 109, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !144, file: !19, line: 109, column: 8)
!192 = !DILocation(line: 109, column: 8, scope: !144)
!193 = !DILocalVariable(name: "dataLen", scope: !194, file: !19, line: 113, type: !71)
!194 = distinct !DILexicalBlock(scope: !195, file: !19, line: 111, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !19, line: 110, column: 5)
!196 = !DILocation(line: 113, column: 20, scope: !194)
!197 = !DILocation(line: 113, column: 48, scope: !194)
!198 = !DILocation(line: 113, column: 37, scope: !194)
!199 = !DILocation(line: 113, column: 30, scope: !194)
!200 = !DILocalVariable(name: "dest", scope: !194, file: !19, line: 114, type: !4)
!201 = !DILocation(line: 114, column: 20, scope: !194)
!202 = !DILocation(line: 114, column: 42, scope: !194)
!203 = !DILocation(line: 114, column: 49, scope: !194)
!204 = !DILocation(line: 114, column: 35, scope: !194)
!205 = !DILocation(line: 115, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !194, file: !19, line: 115, column: 17)
!207 = !DILocation(line: 115, column: 22, scope: !206)
!208 = !DILocation(line: 115, column: 17, scope: !194)
!209 = !DILocation(line: 115, column: 32, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !19, line: 115, column: 31)
!211 = !DILocation(line: 116, column: 26, scope: !194)
!212 = !DILocation(line: 116, column: 32, scope: !194)
!213 = !DILocation(line: 116, column: 19, scope: !194)
!214 = !DILocation(line: 117, column: 35, scope: !194)
!215 = !DILocation(line: 117, column: 24, scope: !194)
!216 = !DILocation(line: 117, column: 13, scope: !194)
!217 = !DILocation(line: 118, column: 18, scope: !194)
!218 = !DILocation(line: 118, column: 13, scope: !194)
!219 = !DILocation(line: 120, column: 5, scope: !195)
!220 = !DILocalVariable(name: "dataLen", scope: !221, file: !19, line: 125, type: !71)
!221 = distinct !DILexicalBlock(scope: !222, file: !19, line: 123, column: 9)
!222 = distinct !DILexicalBlock(scope: !191, file: !19, line: 122, column: 5)
!223 = !DILocation(line: 125, column: 20, scope: !221)
!224 = !DILocation(line: 125, column: 48, scope: !221)
!225 = !DILocation(line: 125, column: 37, scope: !221)
!226 = !DILocation(line: 125, column: 30, scope: !221)
!227 = !DILocalVariable(name: "dest", scope: !221, file: !19, line: 126, type: !4)
!228 = !DILocation(line: 126, column: 20, scope: !221)
!229 = !DILocation(line: 126, column: 42, scope: !221)
!230 = !DILocation(line: 126, column: 49, scope: !221)
!231 = !DILocation(line: 126, column: 35, scope: !221)
!232 = !DILocation(line: 127, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !221, file: !19, line: 127, column: 17)
!234 = !DILocation(line: 127, column: 22, scope: !233)
!235 = !DILocation(line: 127, column: 17, scope: !221)
!236 = !DILocation(line: 127, column: 32, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !19, line: 127, column: 31)
!238 = !DILocation(line: 128, column: 26, scope: !221)
!239 = !DILocation(line: 128, column: 32, scope: !221)
!240 = !DILocation(line: 128, column: 19, scope: !221)
!241 = !DILocation(line: 129, column: 35, scope: !221)
!242 = !DILocation(line: 129, column: 24, scope: !221)
!243 = !DILocation(line: 129, column: 13, scope: !221)
!244 = !DILocation(line: 130, column: 18, scope: !221)
!245 = !DILocation(line: 130, column: 13, scope: !221)
!246 = !DILocation(line: 133, column: 1, scope: !144)
!247 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 138, type: !20, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!248 = !DILocalVariable(name: "data", scope: !247, file: !19, line: 140, type: !4)
!249 = !DILocation(line: 140, column: 12, scope: !247)
!250 = !DILocation(line: 141, column: 10, scope: !247)
!251 = !DILocation(line: 142, column: 8, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !19, line: 142, column: 8)
!253 = !DILocation(line: 142, column: 8, scope: !247)
!254 = !DILocalVariable(name: "dataGoodBuffer", scope: !255, file: !19, line: 145, type: !9)
!255 = distinct !DILexicalBlock(scope: !256, file: !19, line: 144, column: 9)
!256 = distinct !DILexicalBlock(scope: !252, file: !19, line: 143, column: 5)
!257 = !DILocation(line: 145, column: 20, scope: !255)
!258 = !DILocation(line: 145, column: 45, scope: !255)
!259 = !DILocation(line: 146, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !19, line: 146, column: 17)
!261 = !DILocation(line: 146, column: 32, scope: !260)
!262 = !DILocation(line: 146, column: 17, scope: !255)
!263 = !DILocation(line: 146, column: 42, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !19, line: 146, column: 41)
!265 = !DILocation(line: 147, column: 20, scope: !255)
!266 = !DILocation(line: 147, column: 13, scope: !255)
!267 = !DILocation(line: 148, column: 13, scope: !255)
!268 = !DILocation(line: 148, column: 34, scope: !255)
!269 = !DILocation(line: 150, column: 28, scope: !255)
!270 = !DILocation(line: 150, column: 18, scope: !255)
!271 = !DILocation(line: 152, column: 5, scope: !256)
!272 = !DILocalVariable(name: "dataGoodBuffer", scope: !273, file: !19, line: 156, type: !9)
!273 = distinct !DILexicalBlock(scope: !274, file: !19, line: 155, column: 9)
!274 = distinct !DILexicalBlock(scope: !252, file: !19, line: 154, column: 5)
!275 = !DILocation(line: 156, column: 20, scope: !273)
!276 = !DILocation(line: 156, column: 45, scope: !273)
!277 = !DILocation(line: 157, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !273, file: !19, line: 157, column: 17)
!279 = !DILocation(line: 157, column: 32, scope: !278)
!280 = !DILocation(line: 157, column: 17, scope: !273)
!281 = !DILocation(line: 157, column: 42, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !19, line: 157, column: 41)
!283 = !DILocation(line: 158, column: 20, scope: !273)
!284 = !DILocation(line: 158, column: 13, scope: !273)
!285 = !DILocation(line: 159, column: 13, scope: !273)
!286 = !DILocation(line: 159, column: 34, scope: !273)
!287 = !DILocation(line: 161, column: 28, scope: !273)
!288 = !DILocation(line: 161, column: 18, scope: !273)
!289 = !DILocation(line: 164, column: 8, scope: !290)
!290 = distinct !DILexicalBlock(scope: !247, file: !19, line: 164, column: 8)
!291 = !DILocation(line: 164, column: 8, scope: !247)
!292 = !DILocalVariable(name: "dataLen", scope: !293, file: !19, line: 168, type: !71)
!293 = distinct !DILexicalBlock(scope: !294, file: !19, line: 166, column: 9)
!294 = distinct !DILexicalBlock(scope: !290, file: !19, line: 165, column: 5)
!295 = !DILocation(line: 168, column: 20, scope: !293)
!296 = !DILocation(line: 168, column: 45, scope: !293)
!297 = !DILocation(line: 168, column: 30, scope: !293)
!298 = !DILocalVariable(name: "dest", scope: !293, file: !19, line: 169, type: !4)
!299 = !DILocation(line: 169, column: 20, scope: !293)
!300 = !DILocation(line: 169, column: 42, scope: !293)
!301 = !DILocation(line: 169, column: 49, scope: !293)
!302 = !DILocation(line: 169, column: 35, scope: !293)
!303 = !DILocation(line: 170, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !293, file: !19, line: 170, column: 17)
!305 = !DILocation(line: 170, column: 22, scope: !304)
!306 = !DILocation(line: 170, column: 17, scope: !293)
!307 = !DILocation(line: 170, column: 32, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !19, line: 170, column: 31)
!309 = !DILocation(line: 171, column: 26, scope: !293)
!310 = !DILocation(line: 171, column: 32, scope: !293)
!311 = !DILocation(line: 171, column: 19, scope: !293)
!312 = !DILocation(line: 172, column: 31, scope: !293)
!313 = !DILocation(line: 172, column: 13, scope: !293)
!314 = !DILocation(line: 173, column: 18, scope: !293)
!315 = !DILocation(line: 173, column: 13, scope: !293)
!316 = !DILocation(line: 175, column: 5, scope: !294)
!317 = !DILocalVariable(name: "dataLen", scope: !318, file: !19, line: 180, type: !71)
!318 = distinct !DILexicalBlock(scope: !319, file: !19, line: 178, column: 9)
!319 = distinct !DILexicalBlock(scope: !290, file: !19, line: 177, column: 5)
!320 = !DILocation(line: 180, column: 20, scope: !318)
!321 = !DILocation(line: 180, column: 45, scope: !318)
!322 = !DILocation(line: 180, column: 30, scope: !318)
!323 = !DILocalVariable(name: "dest", scope: !318, file: !19, line: 181, type: !4)
!324 = !DILocation(line: 181, column: 20, scope: !318)
!325 = !DILocation(line: 181, column: 42, scope: !318)
!326 = !DILocation(line: 181, column: 49, scope: !318)
!327 = !DILocation(line: 181, column: 35, scope: !318)
!328 = !DILocation(line: 182, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !318, file: !19, line: 182, column: 17)
!330 = !DILocation(line: 182, column: 22, scope: !329)
!331 = !DILocation(line: 182, column: 17, scope: !318)
!332 = !DILocation(line: 182, column: 32, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !19, line: 182, column: 31)
!334 = !DILocation(line: 183, column: 26, scope: !318)
!335 = !DILocation(line: 183, column: 32, scope: !318)
!336 = !DILocation(line: 183, column: 19, scope: !318)
!337 = !DILocation(line: 184, column: 31, scope: !318)
!338 = !DILocation(line: 184, column: 13, scope: !318)
!339 = !DILocation(line: 185, column: 18, scope: !318)
!340 = !DILocation(line: 185, column: 13, scope: !318)
!341 = !DILocation(line: 188, column: 1, scope: !247)
