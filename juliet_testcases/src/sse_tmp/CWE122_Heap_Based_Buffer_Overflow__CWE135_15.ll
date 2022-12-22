; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !37
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %5 = bitcast i32* %4 to i8*, !dbg !41
  store i8* %5, i8** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !49
  store i64 %call2, i64* %dataLen, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !50, metadata !DIExpression()), !dbg !51
  %7 = load i64, i64* %dataLen, align 8, !dbg !52
  %add = add i64 %7, 1, !dbg !53
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !54
  store i8* %call3, i8** %dest, align 8, !dbg !51
  %8 = load i8*, i8** %dest, align 8, !dbg !55
  %cmp4 = icmp eq i8* %8, null, !dbg !57
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !58

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !59
  unreachable, !dbg !59

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %dest, align 8, !dbg !61
  %10 = bitcast i8* %9 to i32*, !dbg !61
  %11 = load i8*, i8** %data, align 8, !dbg !62
  %12 = bitcast i8* %11 to i32*, !dbg !62
  %call7 = call i32* @wcscpy(i32* %10, i32* %12) #7, !dbg !63
  %13 = load i8*, i8** %dest, align 8, !dbg !64
  call void @printLine(i8* %13), !dbg !65
  %14 = load i8*, i8** %dest, align 8, !dbg !66
  call void @free(i8* %14) #7, !dbg !67
  ret void, !dbg !68
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_15_good() #0 !dbg !69 {
entry:
  call void @goodB2G1(), !dbg !70
  call void @goodB2G2(), !dbg !71
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_15_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_15_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !100
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !99
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !109
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !112
  %5 = bitcast i32* %4 to i8*, !dbg !113
  store i8* %5, i8** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !115, metadata !DIExpression()), !dbg !117
  %6 = load i8*, i8** %data, align 8, !dbg !118
  %7 = bitcast i8* %6 to i32*, !dbg !119
  %call2 = call i64 @wcslen(i32* %7) #9, !dbg !120
  store i64 %call2, i64* %dataLen, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !121, metadata !DIExpression()), !dbg !122
  %8 = load i64, i64* %dataLen, align 8, !dbg !123
  %add = add i64 %8, 1, !dbg !124
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !125
  store i8* %call3, i8** %dest, align 8, !dbg !122
  %9 = load i8*, i8** %dest, align 8, !dbg !126
  %cmp4 = icmp eq i8* %9, null, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !129

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end6:                                          ; preds = %if.end
  %10 = load i8*, i8** %dest, align 8, !dbg !132
  %11 = bitcast i8* %10 to i32*, !dbg !132
  %12 = load i8*, i8** %data, align 8, !dbg !133
  %13 = bitcast i8* %12 to i32*, !dbg !133
  %call7 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !134
  %14 = load i8*, i8** %dest, align 8, !dbg !135
  %15 = bitcast i8* %14 to i32*, !dbg !136
  call void @printWLine(i32* %15), !dbg !137
  %16 = load i8*, i8** %dest, align 8, !dbg !138
  call void @free(i8* %16) #7, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i8* null, i8** %data, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !147
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !148
  %0 = bitcast i8* %call to i32*, !dbg !149
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !147
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !150
  %cmp = icmp eq i32* %1, null, !dbg !152
  br i1 %cmp, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !156
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !157
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !158
  store i32 0, i32* %arrayidx, align 4, !dbg !159
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !160
  %5 = bitcast i32* %4 to i8*, !dbg !161
  store i8* %5, i8** %data, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !163, metadata !DIExpression()), !dbg !165
  %6 = load i8*, i8** %data, align 8, !dbg !166
  %7 = bitcast i8* %6 to i32*, !dbg !167
  %call2 = call i64 @wcslen(i32* %7) #9, !dbg !168
  store i64 %call2, i64* %dataLen, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !169, metadata !DIExpression()), !dbg !170
  %8 = load i64, i64* %dataLen, align 8, !dbg !171
  %add = add i64 %8, 1, !dbg !172
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !173
  store i8* %call3, i8** %dest, align 8, !dbg !170
  %9 = load i8*, i8** %dest, align 8, !dbg !174
  %cmp4 = icmp eq i8* %9, null, !dbg !176
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !177

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !178
  unreachable, !dbg !178

if.end6:                                          ; preds = %if.end
  %10 = load i8*, i8** %dest, align 8, !dbg !180
  %11 = bitcast i8* %10 to i32*, !dbg !180
  %12 = load i8*, i8** %data, align 8, !dbg !181
  %13 = bitcast i8* %12 to i32*, !dbg !181
  %call7 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !182
  %14 = load i8*, i8** %dest, align 8, !dbg !183
  %15 = bitcast i8* %14 to i32*, !dbg !184
  call void @printWLine(i32* %15), !dbg !185
  %16 = load i8*, i8** %dest, align 8, !dbg !186
  call void @free(i8* %16) #7, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !189 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !190, metadata !DIExpression()), !dbg !191
  store i8* null, i8** %data, align 8, !dbg !192
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !193, metadata !DIExpression()), !dbg !195
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !196
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !195
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !197
  %cmp = icmp eq i8* %0, null, !dbg !199
  br i1 %cmp, label %if.then, label %if.end, !dbg !200

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !201
  unreachable, !dbg !201

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !204
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !205
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !205
  store i8 0, i8* %arrayidx, align 1, !dbg !206
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !207
  store i8* %3, i8** %data, align 8, !dbg !208
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !209, metadata !DIExpression()), !dbg !211
  %4 = load i8*, i8** %data, align 8, !dbg !212
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !213
  store i64 %call1, i64* %dataLen, align 8, !dbg !211
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !214, metadata !DIExpression()), !dbg !215
  %5 = load i64, i64* %dataLen, align 8, !dbg !216
  %add = add i64 %5, 1, !dbg !217
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !218
  store i8* %call2, i8** %dest, align 8, !dbg !215
  %6 = load i8*, i8** %dest, align 8, !dbg !219
  %cmp3 = icmp eq i8* %6, null, !dbg !221
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !222

if.then4:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !223
  unreachable, !dbg !223

if.end5:                                          ; preds = %if.end
  %7 = load i8*, i8** %dest, align 8, !dbg !225
  %8 = load i8*, i8** %data, align 8, !dbg !226
  %call6 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !227
  %9 = load i8*, i8** %dest, align 8, !dbg !228
  call void @printLine(i8* %9), !dbg !229
  %10 = load i8*, i8** %dest, align 8, !dbg !230
  call void @free(i8* %10) #7, !dbg !231
  ret void, !dbg !232
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !233 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !234, metadata !DIExpression()), !dbg !235
  store i8* null, i8** %data, align 8, !dbg !236
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !237, metadata !DIExpression()), !dbg !239
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !240
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !239
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !241
  %cmp = icmp eq i8* %0, null, !dbg !243
  br i1 %cmp, label %if.then, label %if.end, !dbg !244

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !245
  unreachable, !dbg !245

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !247
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !248
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !249
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !249
  store i8 0, i8* %arrayidx, align 1, !dbg !250
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !251
  store i8* %3, i8** %data, align 8, !dbg !252
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !253, metadata !DIExpression()), !dbg !255
  %4 = load i8*, i8** %data, align 8, !dbg !256
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !257
  store i64 %call1, i64* %dataLen, align 8, !dbg !255
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !258, metadata !DIExpression()), !dbg !259
  %5 = load i64, i64* %dataLen, align 8, !dbg !260
  %add = add i64 %5, 1, !dbg !261
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !262
  store i8* %call2, i8** %dest, align 8, !dbg !259
  %6 = load i8*, i8** %dest, align 8, !dbg !263
  %cmp3 = icmp eq i8* %6, null, !dbg !265
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !266

if.then4:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !267
  unreachable, !dbg !267

if.end5:                                          ; preds = %if.end
  %7 = load i8*, i8** %dest, align 8, !dbg !269
  %8 = load i8*, i8** %data, align 8, !dbg !270
  %call6 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !271
  %9 = load i8*, i8** %dest, align 8, !dbg !272
  call void @printLine(i8* %9), !dbg !273
  %10 = load i8*, i8** %dest, align 8, !dbg !274
  call void @free(i8* %10) #7, !dbg !275
  ret void, !dbg !276
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_15.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_15_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_15.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !26, file: !19, line: 32, type: !5)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!27 = !DILocation(line: 32, column: 19, scope: !26)
!28 = !DILocation(line: 32, column: 46, scope: !26)
!29 = !DILocation(line: 32, column: 35, scope: !26)
!30 = !DILocation(line: 33, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !19, line: 33, column: 13)
!32 = !DILocation(line: 33, column: 27, scope: !31)
!33 = !DILocation(line: 33, column: 13, scope: !26)
!34 = !DILocation(line: 33, column: 37, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 33, column: 36)
!36 = !DILocation(line: 34, column: 17, scope: !26)
!37 = !DILocation(line: 34, column: 9, scope: !26)
!38 = !DILocation(line: 35, column: 9, scope: !26)
!39 = !DILocation(line: 35, column: 29, scope: !26)
!40 = !DILocation(line: 37, column: 24, scope: !26)
!41 = !DILocation(line: 37, column: 16, scope: !26)
!42 = !DILocation(line: 37, column: 14, scope: !26)
!43 = !DILocalVariable(name: "dataLen", scope: !44, file: !19, line: 50, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !19, line: 48, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 50, column: 16, scope: !44)
!48 = !DILocation(line: 50, column: 41, scope: !44)
!49 = !DILocation(line: 50, column: 26, scope: !44)
!50 = !DILocalVariable(name: "dest", scope: !44, file: !19, line: 51, type: !4)
!51 = !DILocation(line: 51, column: 16, scope: !44)
!52 = !DILocation(line: 51, column: 38, scope: !44)
!53 = !DILocation(line: 51, column: 45, scope: !44)
!54 = !DILocation(line: 51, column: 31, scope: !44)
!55 = !DILocation(line: 52, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !44, file: !19, line: 52, column: 13)
!57 = !DILocation(line: 52, column: 18, scope: !56)
!58 = !DILocation(line: 52, column: 13, scope: !44)
!59 = !DILocation(line: 52, column: 28, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !19, line: 52, column: 27)
!61 = !DILocation(line: 53, column: 22, scope: !44)
!62 = !DILocation(line: 53, column: 28, scope: !44)
!63 = !DILocation(line: 53, column: 15, scope: !44)
!64 = !DILocation(line: 54, column: 27, scope: !44)
!65 = !DILocation(line: 54, column: 9, scope: !44)
!66 = !DILocation(line: 55, column: 14, scope: !44)
!67 = !DILocation(line: 55, column: 9, scope: !44)
!68 = !DILocation(line: 63, column: 1, scope: !18)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_15_good", scope: !19, file: !19, line: 237, type: !20, scopeLine: 238, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 239, column: 5, scope: !69)
!71 = !DILocation(line: 240, column: 5, scope: !69)
!72 = !DILocation(line: 241, column: 5, scope: !69)
!73 = !DILocation(line: 242, column: 5, scope: !69)
!74 = !DILocation(line: 243, column: 1, scope: !69)
!75 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 254, type: !76, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!8, !8, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !19, line: 254, type: !8)
!80 = !DILocation(line: 254, column: 14, scope: !75)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !19, line: 254, type: !78)
!82 = !DILocation(line: 254, column: 27, scope: !75)
!83 = !DILocation(line: 257, column: 22, scope: !75)
!84 = !DILocation(line: 257, column: 12, scope: !75)
!85 = !DILocation(line: 257, column: 5, scope: !75)
!86 = !DILocation(line: 259, column: 5, scope: !75)
!87 = !DILocation(line: 260, column: 5, scope: !75)
!88 = !DILocation(line: 261, column: 5, scope: !75)
!89 = !DILocation(line: 264, column: 5, scope: !75)
!90 = !DILocation(line: 265, column: 5, scope: !75)
!91 = !DILocation(line: 266, column: 5, scope: !75)
!92 = !DILocation(line: 268, column: 5, scope: !75)
!93 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !19, line: 72, type: !4)
!95 = !DILocation(line: 72, column: 12, scope: !93)
!96 = !DILocation(line: 73, column: 10, scope: !93)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !19, line: 78, type: !5)
!98 = distinct !DILexicalBlock(scope: !93, file: !19, line: 77, column: 5)
!99 = !DILocation(line: 78, column: 19, scope: !98)
!100 = !DILocation(line: 78, column: 46, scope: !98)
!101 = !DILocation(line: 78, column: 35, scope: !98)
!102 = !DILocation(line: 79, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !19, line: 79, column: 13)
!104 = !DILocation(line: 79, column: 27, scope: !103)
!105 = !DILocation(line: 79, column: 13, scope: !98)
!106 = !DILocation(line: 79, column: 37, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !19, line: 79, column: 36)
!108 = !DILocation(line: 80, column: 17, scope: !98)
!109 = !DILocation(line: 80, column: 9, scope: !98)
!110 = !DILocation(line: 81, column: 9, scope: !98)
!111 = !DILocation(line: 81, column: 29, scope: !98)
!112 = !DILocation(line: 83, column: 24, scope: !98)
!113 = !DILocation(line: 83, column: 16, scope: !98)
!114 = !DILocation(line: 83, column: 14, scope: !98)
!115 = !DILocalVariable(name: "dataLen", scope: !116, file: !19, line: 100, type: !45)
!116 = distinct !DILexicalBlock(scope: !93, file: !19, line: 98, column: 5)
!117 = !DILocation(line: 100, column: 16, scope: !116)
!118 = !DILocation(line: 100, column: 44, scope: !116)
!119 = !DILocation(line: 100, column: 33, scope: !116)
!120 = !DILocation(line: 100, column: 26, scope: !116)
!121 = !DILocalVariable(name: "dest", scope: !116, file: !19, line: 101, type: !4)
!122 = !DILocation(line: 101, column: 16, scope: !116)
!123 = !DILocation(line: 101, column: 38, scope: !116)
!124 = !DILocation(line: 101, column: 45, scope: !116)
!125 = !DILocation(line: 101, column: 31, scope: !116)
!126 = !DILocation(line: 102, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !116, file: !19, line: 102, column: 13)
!128 = !DILocation(line: 102, column: 18, scope: !127)
!129 = !DILocation(line: 102, column: 13, scope: !116)
!130 = !DILocation(line: 102, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !19, line: 102, column: 27)
!132 = !DILocation(line: 103, column: 22, scope: !116)
!133 = !DILocation(line: 103, column: 28, scope: !116)
!134 = !DILocation(line: 103, column: 15, scope: !116)
!135 = !DILocation(line: 104, column: 31, scope: !116)
!136 = !DILocation(line: 104, column: 20, scope: !116)
!137 = !DILocation(line: 104, column: 9, scope: !116)
!138 = !DILocation(line: 105, column: 14, scope: !116)
!139 = !DILocation(line: 105, column: 9, scope: !116)
!140 = !DILocation(line: 109, column: 1, scope: !93)
!141 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 112, type: !20, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !19, line: 114, type: !4)
!143 = !DILocation(line: 114, column: 12, scope: !141)
!144 = !DILocation(line: 115, column: 10, scope: !141)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !146, file: !19, line: 120, type: !5)
!146 = distinct !DILexicalBlock(scope: !141, file: !19, line: 119, column: 5)
!147 = !DILocation(line: 120, column: 19, scope: !146)
!148 = !DILocation(line: 120, column: 46, scope: !146)
!149 = !DILocation(line: 120, column: 35, scope: !146)
!150 = !DILocation(line: 121, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !19, line: 121, column: 13)
!152 = !DILocation(line: 121, column: 27, scope: !151)
!153 = !DILocation(line: 121, column: 13, scope: !146)
!154 = !DILocation(line: 121, column: 37, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !19, line: 121, column: 36)
!156 = !DILocation(line: 122, column: 17, scope: !146)
!157 = !DILocation(line: 122, column: 9, scope: !146)
!158 = !DILocation(line: 123, column: 9, scope: !146)
!159 = !DILocation(line: 123, column: 29, scope: !146)
!160 = !DILocation(line: 125, column: 24, scope: !146)
!161 = !DILocation(line: 125, column: 16, scope: !146)
!162 = !DILocation(line: 125, column: 14, scope: !146)
!163 = !DILocalVariable(name: "dataLen", scope: !164, file: !19, line: 138, type: !45)
!164 = distinct !DILexicalBlock(scope: !141, file: !19, line: 136, column: 5)
!165 = !DILocation(line: 138, column: 16, scope: !164)
!166 = !DILocation(line: 138, column: 44, scope: !164)
!167 = !DILocation(line: 138, column: 33, scope: !164)
!168 = !DILocation(line: 138, column: 26, scope: !164)
!169 = !DILocalVariable(name: "dest", scope: !164, file: !19, line: 139, type: !4)
!170 = !DILocation(line: 139, column: 16, scope: !164)
!171 = !DILocation(line: 139, column: 38, scope: !164)
!172 = !DILocation(line: 139, column: 45, scope: !164)
!173 = !DILocation(line: 139, column: 31, scope: !164)
!174 = !DILocation(line: 140, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !164, file: !19, line: 140, column: 13)
!176 = !DILocation(line: 140, column: 18, scope: !175)
!177 = !DILocation(line: 140, column: 13, scope: !164)
!178 = !DILocation(line: 140, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !19, line: 140, column: 27)
!180 = !DILocation(line: 141, column: 22, scope: !164)
!181 = !DILocation(line: 141, column: 28, scope: !164)
!182 = !DILocation(line: 141, column: 15, scope: !164)
!183 = !DILocation(line: 142, column: 31, scope: !164)
!184 = !DILocation(line: 142, column: 20, scope: !164)
!185 = !DILocation(line: 142, column: 9, scope: !164)
!186 = !DILocation(line: 143, column: 14, scope: !164)
!187 = !DILocation(line: 143, column: 9, scope: !164)
!188 = !DILocation(line: 151, column: 1, scope: !141)
!189 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 154, type: !20, scopeLine: 155, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!190 = !DILocalVariable(name: "data", scope: !189, file: !19, line: 156, type: !4)
!191 = !DILocation(line: 156, column: 12, scope: !189)
!192 = !DILocation(line: 157, column: 10, scope: !189)
!193 = !DILocalVariable(name: "dataGoodBuffer", scope: !194, file: !19, line: 166, type: !9)
!194 = distinct !DILexicalBlock(scope: !189, file: !19, line: 165, column: 5)
!195 = !DILocation(line: 166, column: 16, scope: !194)
!196 = !DILocation(line: 166, column: 41, scope: !194)
!197 = !DILocation(line: 167, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !19, line: 167, column: 13)
!199 = !DILocation(line: 167, column: 28, scope: !198)
!200 = !DILocation(line: 167, column: 13, scope: !194)
!201 = !DILocation(line: 167, column: 38, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !19, line: 167, column: 37)
!203 = !DILocation(line: 168, column: 16, scope: !194)
!204 = !DILocation(line: 168, column: 9, scope: !194)
!205 = !DILocation(line: 169, column: 9, scope: !194)
!206 = !DILocation(line: 169, column: 30, scope: !194)
!207 = !DILocation(line: 171, column: 24, scope: !194)
!208 = !DILocation(line: 171, column: 14, scope: !194)
!209 = !DILocalVariable(name: "dataLen", scope: !210, file: !19, line: 180, type: !45)
!210 = distinct !DILexicalBlock(scope: !189, file: !19, line: 178, column: 5)
!211 = !DILocation(line: 180, column: 16, scope: !210)
!212 = !DILocation(line: 180, column: 41, scope: !210)
!213 = !DILocation(line: 180, column: 26, scope: !210)
!214 = !DILocalVariable(name: "dest", scope: !210, file: !19, line: 181, type: !4)
!215 = !DILocation(line: 181, column: 16, scope: !210)
!216 = !DILocation(line: 181, column: 38, scope: !210)
!217 = !DILocation(line: 181, column: 45, scope: !210)
!218 = !DILocation(line: 181, column: 31, scope: !210)
!219 = !DILocation(line: 182, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !210, file: !19, line: 182, column: 13)
!221 = !DILocation(line: 182, column: 18, scope: !220)
!222 = !DILocation(line: 182, column: 13, scope: !210)
!223 = !DILocation(line: 182, column: 28, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !19, line: 182, column: 27)
!225 = !DILocation(line: 183, column: 22, scope: !210)
!226 = !DILocation(line: 183, column: 28, scope: !210)
!227 = !DILocation(line: 183, column: 15, scope: !210)
!228 = !DILocation(line: 184, column: 27, scope: !210)
!229 = !DILocation(line: 184, column: 9, scope: !210)
!230 = !DILocation(line: 185, column: 14, scope: !210)
!231 = !DILocation(line: 185, column: 9, scope: !210)
!232 = !DILocation(line: 193, column: 1, scope: !189)
!233 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 196, type: !20, scopeLine: 197, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!234 = !DILocalVariable(name: "data", scope: !233, file: !19, line: 198, type: !4)
!235 = !DILocation(line: 198, column: 12, scope: !233)
!236 = !DILocation(line: 199, column: 10, scope: !233)
!237 = !DILocalVariable(name: "dataGoodBuffer", scope: !238, file: !19, line: 204, type: !9)
!238 = distinct !DILexicalBlock(scope: !233, file: !19, line: 203, column: 5)
!239 = !DILocation(line: 204, column: 16, scope: !238)
!240 = !DILocation(line: 204, column: 41, scope: !238)
!241 = !DILocation(line: 205, column: 13, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !19, line: 205, column: 13)
!243 = !DILocation(line: 205, column: 28, scope: !242)
!244 = !DILocation(line: 205, column: 13, scope: !238)
!245 = !DILocation(line: 205, column: 38, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !19, line: 205, column: 37)
!247 = !DILocation(line: 206, column: 16, scope: !238)
!248 = !DILocation(line: 206, column: 9, scope: !238)
!249 = !DILocation(line: 207, column: 9, scope: !238)
!250 = !DILocation(line: 207, column: 30, scope: !238)
!251 = !DILocation(line: 209, column: 24, scope: !238)
!252 = !DILocation(line: 209, column: 14, scope: !238)
!253 = !DILocalVariable(name: "dataLen", scope: !254, file: !19, line: 222, type: !45)
!254 = distinct !DILexicalBlock(scope: !233, file: !19, line: 220, column: 5)
!255 = !DILocation(line: 222, column: 16, scope: !254)
!256 = !DILocation(line: 222, column: 41, scope: !254)
!257 = !DILocation(line: 222, column: 26, scope: !254)
!258 = !DILocalVariable(name: "dest", scope: !254, file: !19, line: 223, type: !4)
!259 = !DILocation(line: 223, column: 16, scope: !254)
!260 = !DILocation(line: 223, column: 38, scope: !254)
!261 = !DILocation(line: 223, column: 45, scope: !254)
!262 = !DILocation(line: 223, column: 31, scope: !254)
!263 = !DILocation(line: 224, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !254, file: !19, line: 224, column: 13)
!265 = !DILocation(line: 224, column: 18, scope: !264)
!266 = !DILocation(line: 224, column: 13, scope: !254)
!267 = !DILocation(line: 224, column: 28, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !19, line: 224, column: 27)
!269 = !DILocation(line: 225, column: 22, scope: !254)
!270 = !DILocation(line: 225, column: 28, scope: !254)
!271 = !DILocation(line: 225, column: 15, scope: !254)
!272 = !DILocation(line: 226, column: 27, scope: !254)
!273 = !DILocation(line: 226, column: 9, scope: !254)
!274 = !DILocation(line: 227, column: 14, scope: !254)
!275 = !DILocation(line: 227, column: 9, scope: !254)
!276 = !DILocation(line: 235, column: 1, scope: !233)
