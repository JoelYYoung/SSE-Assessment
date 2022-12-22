; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %j, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !36, metadata !DIExpression()), !dbg !39
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !40
  %1 = bitcast i8* %call to i32*, !dbg !41
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !39
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  %cmp1 = icmp eq i32* %2, null, !dbg !44
  br i1 %cmp1, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !48
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !49
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !52
  %6 = bitcast i32* %5 to i8*, !dbg !53
  store i8* %6, i8** %data, align 8, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %7, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !61
  br label %for.cond3, !dbg !63

for.cond3:                                        ; preds = %for.inc12, %for.end
  %8 = load i32, i32* %j, align 4, !dbg !64
  %cmp4 = icmp slt i32 %8, 1, !dbg !66
  br i1 %cmp4, label %for.body5, label %for.end14, !dbg !67

for.body5:                                        ; preds = %for.cond3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !68, metadata !DIExpression()), !dbg !73
  %9 = load i8*, i8** %data, align 8, !dbg !74
  %call6 = call i64 @strlen(i8* %9) #9, !dbg !75
  store i64 %call6, i64* %dataLen, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !76, metadata !DIExpression()), !dbg !77
  %10 = load i64, i64* %dataLen, align 8, !dbg !78
  %add = add i64 %10, 1, !dbg !79
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !80
  store i8* %call7, i8** %dest, align 8, !dbg !77
  %11 = load i8*, i8** %dest, align 8, !dbg !81
  %cmp8 = icmp eq i8* %11, null, !dbg !83
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !84

if.then9:                                         ; preds = %for.body5
  call void @exit(i32 -1) #8, !dbg !85
  unreachable, !dbg !85

if.end10:                                         ; preds = %for.body5
  %12 = load i8*, i8** %dest, align 8, !dbg !87
  %13 = bitcast i8* %12 to i32*, !dbg !87
  %14 = load i8*, i8** %data, align 8, !dbg !88
  %15 = bitcast i8* %14 to i32*, !dbg !88
  %call11 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !89
  %16 = load i8*, i8** %dest, align 8, !dbg !90
  call void @printLine(i8* %16), !dbg !91
  %17 = load i8*, i8** %dest, align 8, !dbg !92
  call void @free(i8* %17) #7, !dbg !93
  br label %for.inc12, !dbg !94

for.inc12:                                        ; preds = %if.end10
  %18 = load i32, i32* %j, align 4, !dbg !95
  %inc13 = add nsw i32 %18, 1, !dbg !95
  store i32 %inc13, i32* %j, align 4, !dbg !95
  br label %for.cond3, !dbg !96, !llvm.loop !97

for.end14:                                        ; preds = %for.cond3
  ret void, !dbg !99
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_17_good() #0 !dbg !100 {
entry:
  call void @goodB2G(), !dbg !101
  call void @goodG2B(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* null) #7, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 %conv) #7, !dbg !114
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_17_good(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_17_bad(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !122 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %k, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i8** %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i8* null, i8** %data, align 8, !dbg !129
  store i32 0, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !133
  %cmp = icmp slt i32 %0, 1, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !141
  %1 = bitcast i8* %call to i32*, !dbg !142
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !140
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !143
  %cmp1 = icmp eq i32* %2, null, !dbg !145
  br i1 %cmp1, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !149
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !150
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !151
  store i32 0, i32* %arrayidx, align 4, !dbg !152
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !153
  %6 = bitcast i32* %5 to i8*, !dbg !154
  store i8* %6, i8** %data, align 8, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4, !dbg !157
  %inc = add nsw i32 %7, 1, !dbg !157
  store i32 %inc, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !161
  br label %for.cond3, !dbg !163

for.cond3:                                        ; preds = %for.inc12, %for.end
  %8 = load i32, i32* %k, align 4, !dbg !164
  %cmp4 = icmp slt i32 %8, 1, !dbg !166
  br i1 %cmp4, label %for.body5, label %for.end14, !dbg !167

for.body5:                                        ; preds = %for.cond3
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !168, metadata !DIExpression()), !dbg !171
  %9 = load i8*, i8** %data, align 8, !dbg !172
  %10 = bitcast i8* %9 to i32*, !dbg !173
  %call6 = call i64 @wcslen(i32* %10) #9, !dbg !174
  store i64 %call6, i64* %dataLen, align 8, !dbg !171
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !175, metadata !DIExpression()), !dbg !176
  %11 = load i64, i64* %dataLen, align 8, !dbg !177
  %add = add i64 %11, 1, !dbg !178
  %call7 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !179
  store i8* %call7, i8** %dest, align 8, !dbg !176
  %12 = load i8*, i8** %dest, align 8, !dbg !180
  %cmp8 = icmp eq i8* %12, null, !dbg !182
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !183

if.then9:                                         ; preds = %for.body5
  call void @exit(i32 -1) #8, !dbg !184
  unreachable, !dbg !184

if.end10:                                         ; preds = %for.body5
  %13 = load i8*, i8** %dest, align 8, !dbg !186
  %14 = bitcast i8* %13 to i32*, !dbg !186
  %15 = load i8*, i8** %data, align 8, !dbg !187
  %16 = bitcast i8* %15 to i32*, !dbg !187
  %call11 = call i32* @wcscpy(i32* %14, i32* %16) #7, !dbg !188
  %17 = load i8*, i8** %dest, align 8, !dbg !189
  %18 = bitcast i8* %17 to i32*, !dbg !190
  call void @printWLine(i32* %18), !dbg !191
  %19 = load i8*, i8** %dest, align 8, !dbg !192
  call void @free(i8* %19) #7, !dbg !193
  br label %for.inc12, !dbg !194

for.inc12:                                        ; preds = %if.end10
  %20 = load i32, i32* %k, align 4, !dbg !195
  %inc13 = add nsw i32 %20, 1, !dbg !195
  store i32 %inc13, i32* %k, align 4, !dbg !195
  br label %for.cond3, !dbg !196, !llvm.loop !197

for.end14:                                        ; preds = %for.cond3
  ret void, !dbg !199
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !200 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i32* %j, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i8** %data, metadata !205, metadata !DIExpression()), !dbg !206
  store i8* null, i8** %data, align 8, !dbg !207
  store i32 0, i32* %h, align 4, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !211
  %cmp = icmp slt i32 %0, 1, !dbg !213
  br i1 %cmp, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !215, metadata !DIExpression()), !dbg !218
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !219
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !218
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !220
  %cmp1 = icmp eq i8* %1, null, !dbg !222
  br i1 %cmp1, label %if.then, label %if.end, !dbg !223

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !224
  unreachable, !dbg !224

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !227
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !228
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !228
  store i8 0, i8* %arrayidx, align 1, !dbg !229
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !230
  store i8* %4, i8** %data, align 8, !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !233
  %inc = add nsw i32 %5, 1, !dbg !233
  store i32 %inc, i32* %h, align 4, !dbg !233
  br label %for.cond, !dbg !234, !llvm.loop !235

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !237
  br label %for.cond2, !dbg !239

for.cond2:                                        ; preds = %for.inc11, %for.end
  %6 = load i32, i32* %j, align 4, !dbg !240
  %cmp3 = icmp slt i32 %6, 1, !dbg !242
  br i1 %cmp3, label %for.body4, label %for.end13, !dbg !243

for.body4:                                        ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !244, metadata !DIExpression()), !dbg !247
  %7 = load i8*, i8** %data, align 8, !dbg !248
  %call5 = call i64 @strlen(i8* %7) #9, !dbg !249
  store i64 %call5, i64* %dataLen, align 8, !dbg !247
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !250, metadata !DIExpression()), !dbg !251
  %8 = load i64, i64* %dataLen, align 8, !dbg !252
  %add = add i64 %8, 1, !dbg !253
  %call6 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !254
  store i8* %call6, i8** %dest, align 8, !dbg !251
  %9 = load i8*, i8** %dest, align 8, !dbg !255
  %cmp7 = icmp eq i8* %9, null, !dbg !257
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !258

if.then8:                                         ; preds = %for.body4
  call void @exit(i32 -1) #8, !dbg !259
  unreachable, !dbg !259

if.end9:                                          ; preds = %for.body4
  %10 = load i8*, i8** %dest, align 8, !dbg !261
  %11 = load i8*, i8** %data, align 8, !dbg !262
  %call10 = call i8* @strcpy(i8* %10, i8* %11) #7, !dbg !263
  %12 = load i8*, i8** %dest, align 8, !dbg !264
  call void @printLine(i8* %12), !dbg !265
  %13 = load i8*, i8** %dest, align 8, !dbg !266
  call void @free(i8* %13) #7, !dbg !267
  br label %for.inc11, !dbg !268

for.inc11:                                        ; preds = %if.end9
  %14 = load i32, i32* %j, align 4, !dbg !269
  %inc12 = add nsw i32 %14, 1, !dbg !269
  store i32 %inc12, i32* %j, align 4, !dbg !269
  br label %for.cond2, !dbg !270, !llvm.loop !271

for.end13:                                        ; preds = %for.cond2
  ret void, !dbg !273
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_17.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_17_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_17.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "i", scope: !18, file: !19, line: 26, type: !8)
!23 = !DILocation(line: 26, column: 9, scope: !18)
!24 = !DILocalVariable(name: "j", scope: !18, file: !19, line: 26, type: !8)
!25 = !DILocation(line: 26, column: 11, scope: !18)
!26 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 27, type: !4)
!27 = !DILocation(line: 27, column: 12, scope: !18)
!28 = !DILocation(line: 28, column: 10, scope: !18)
!29 = !DILocation(line: 29, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 5)
!31 = !DILocation(line: 29, column: 9, scope: !30)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !19, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 5, scope: !30)
!36 = !DILocalVariable(name: "dataBadBuffer", scope: !37, file: !19, line: 32, type: !5)
!37 = distinct !DILexicalBlock(scope: !38, file: !19, line: 31, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !19, line: 30, column: 5)
!39 = !DILocation(line: 32, column: 23, scope: !37)
!40 = !DILocation(line: 32, column: 50, scope: !37)
!41 = !DILocation(line: 32, column: 39, scope: !37)
!42 = !DILocation(line: 33, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !19, line: 33, column: 17)
!44 = !DILocation(line: 33, column: 31, scope: !43)
!45 = !DILocation(line: 33, column: 17, scope: !37)
!46 = !DILocation(line: 33, column: 41, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !19, line: 33, column: 40)
!48 = !DILocation(line: 34, column: 21, scope: !37)
!49 = !DILocation(line: 34, column: 13, scope: !37)
!50 = !DILocation(line: 35, column: 13, scope: !37)
!51 = !DILocation(line: 35, column: 33, scope: !37)
!52 = !DILocation(line: 37, column: 28, scope: !37)
!53 = !DILocation(line: 37, column: 20, scope: !37)
!54 = !DILocation(line: 37, column: 18, scope: !37)
!55 = !DILocation(line: 39, column: 5, scope: !38)
!56 = !DILocation(line: 29, column: 24, scope: !33)
!57 = !DILocation(line: 29, column: 5, scope: !33)
!58 = distinct !{!58, !35, !59, !60}
!59 = !DILocation(line: 39, column: 5, scope: !30)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 40, column: 11, scope: !62)
!62 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 5)
!63 = !DILocation(line: 40, column: 9, scope: !62)
!64 = !DILocation(line: 40, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !19, line: 40, column: 5)
!66 = !DILocation(line: 40, column: 18, scope: !65)
!67 = !DILocation(line: 40, column: 5, scope: !62)
!68 = !DILocalVariable(name: "dataLen", scope: !69, file: !19, line: 44, type: !71)
!69 = distinct !DILexicalBlock(scope: !70, file: !19, line: 42, column: 9)
!70 = distinct !DILexicalBlock(scope: !65, file: !19, line: 41, column: 5)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !72)
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 44, column: 20, scope: !69)
!74 = !DILocation(line: 44, column: 45, scope: !69)
!75 = !DILocation(line: 44, column: 30, scope: !69)
!76 = !DILocalVariable(name: "dest", scope: !69, file: !19, line: 45, type: !4)
!77 = !DILocation(line: 45, column: 20, scope: !69)
!78 = !DILocation(line: 45, column: 42, scope: !69)
!79 = !DILocation(line: 45, column: 49, scope: !69)
!80 = !DILocation(line: 45, column: 35, scope: !69)
!81 = !DILocation(line: 46, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !69, file: !19, line: 46, column: 17)
!83 = !DILocation(line: 46, column: 22, scope: !82)
!84 = !DILocation(line: 46, column: 17, scope: !69)
!85 = !DILocation(line: 46, column: 32, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !19, line: 46, column: 31)
!87 = !DILocation(line: 47, column: 26, scope: !69)
!88 = !DILocation(line: 47, column: 32, scope: !69)
!89 = !DILocation(line: 47, column: 19, scope: !69)
!90 = !DILocation(line: 48, column: 31, scope: !69)
!91 = !DILocation(line: 48, column: 13, scope: !69)
!92 = !DILocation(line: 49, column: 18, scope: !69)
!93 = !DILocation(line: 49, column: 13, scope: !69)
!94 = !DILocation(line: 51, column: 5, scope: !70)
!95 = !DILocation(line: 40, column: 24, scope: !65)
!96 = !DILocation(line: 40, column: 5, scope: !65)
!97 = distinct !{!97, !67, !98, !60}
!98 = !DILocation(line: 51, column: 5, scope: !62)
!99 = !DILocation(line: 52, column: 1, scope: !18)
!100 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_17_good", scope: !19, file: !19, line: 120, type: !20, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 122, column: 5, scope: !100)
!102 = !DILocation(line: 123, column: 5, scope: !100)
!103 = !DILocation(line: 124, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 135, type: !105, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!8, !8, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !19, line: 135, type: !8)
!109 = !DILocation(line: 135, column: 14, scope: !104)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !19, line: 135, type: !107)
!111 = !DILocation(line: 135, column: 27, scope: !104)
!112 = !DILocation(line: 138, column: 22, scope: !104)
!113 = !DILocation(line: 138, column: 12, scope: !104)
!114 = !DILocation(line: 138, column: 5, scope: !104)
!115 = !DILocation(line: 140, column: 5, scope: !104)
!116 = !DILocation(line: 141, column: 5, scope: !104)
!117 = !DILocation(line: 142, column: 5, scope: !104)
!118 = !DILocation(line: 145, column: 5, scope: !104)
!119 = !DILocation(line: 146, column: 5, scope: !104)
!120 = !DILocation(line: 147, column: 5, scope: !104)
!121 = !DILocation(line: 149, column: 5, scope: !104)
!122 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "i", scope: !122, file: !19, line: 61, type: !8)
!124 = !DILocation(line: 61, column: 9, scope: !122)
!125 = !DILocalVariable(name: "k", scope: !122, file: !19, line: 61, type: !8)
!126 = !DILocation(line: 61, column: 11, scope: !122)
!127 = !DILocalVariable(name: "data", scope: !122, file: !19, line: 62, type: !4)
!128 = !DILocation(line: 62, column: 12, scope: !122)
!129 = !DILocation(line: 63, column: 10, scope: !122)
!130 = !DILocation(line: 64, column: 11, scope: !131)
!131 = distinct !DILexicalBlock(scope: !122, file: !19, line: 64, column: 5)
!132 = !DILocation(line: 64, column: 9, scope: !131)
!133 = !DILocation(line: 64, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !19, line: 64, column: 5)
!135 = !DILocation(line: 64, column: 18, scope: !134)
!136 = !DILocation(line: 64, column: 5, scope: !131)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !19, line: 67, type: !5)
!138 = distinct !DILexicalBlock(scope: !139, file: !19, line: 66, column: 9)
!139 = distinct !DILexicalBlock(scope: !134, file: !19, line: 65, column: 5)
!140 = !DILocation(line: 67, column: 23, scope: !138)
!141 = !DILocation(line: 67, column: 50, scope: !138)
!142 = !DILocation(line: 67, column: 39, scope: !138)
!143 = !DILocation(line: 68, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !19, line: 68, column: 17)
!145 = !DILocation(line: 68, column: 31, scope: !144)
!146 = !DILocation(line: 68, column: 17, scope: !138)
!147 = !DILocation(line: 68, column: 41, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !19, line: 68, column: 40)
!149 = !DILocation(line: 69, column: 21, scope: !138)
!150 = !DILocation(line: 69, column: 13, scope: !138)
!151 = !DILocation(line: 70, column: 13, scope: !138)
!152 = !DILocation(line: 70, column: 33, scope: !138)
!153 = !DILocation(line: 72, column: 28, scope: !138)
!154 = !DILocation(line: 72, column: 20, scope: !138)
!155 = !DILocation(line: 72, column: 18, scope: !138)
!156 = !DILocation(line: 74, column: 5, scope: !139)
!157 = !DILocation(line: 64, column: 24, scope: !134)
!158 = !DILocation(line: 64, column: 5, scope: !134)
!159 = distinct !{!159, !136, !160, !60}
!160 = !DILocation(line: 74, column: 5, scope: !131)
!161 = !DILocation(line: 75, column: 11, scope: !162)
!162 = distinct !DILexicalBlock(scope: !122, file: !19, line: 75, column: 5)
!163 = !DILocation(line: 75, column: 9, scope: !162)
!164 = !DILocation(line: 75, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !19, line: 75, column: 5)
!166 = !DILocation(line: 75, column: 18, scope: !165)
!167 = !DILocation(line: 75, column: 5, scope: !162)
!168 = !DILocalVariable(name: "dataLen", scope: !169, file: !19, line: 79, type: !71)
!169 = distinct !DILexicalBlock(scope: !170, file: !19, line: 77, column: 9)
!170 = distinct !DILexicalBlock(scope: !165, file: !19, line: 76, column: 5)
!171 = !DILocation(line: 79, column: 20, scope: !169)
!172 = !DILocation(line: 79, column: 48, scope: !169)
!173 = !DILocation(line: 79, column: 37, scope: !169)
!174 = !DILocation(line: 79, column: 30, scope: !169)
!175 = !DILocalVariable(name: "dest", scope: !169, file: !19, line: 80, type: !4)
!176 = !DILocation(line: 80, column: 20, scope: !169)
!177 = !DILocation(line: 80, column: 42, scope: !169)
!178 = !DILocation(line: 80, column: 49, scope: !169)
!179 = !DILocation(line: 80, column: 35, scope: !169)
!180 = !DILocation(line: 81, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !169, file: !19, line: 81, column: 17)
!182 = !DILocation(line: 81, column: 22, scope: !181)
!183 = !DILocation(line: 81, column: 17, scope: !169)
!184 = !DILocation(line: 81, column: 32, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !19, line: 81, column: 31)
!186 = !DILocation(line: 82, column: 26, scope: !169)
!187 = !DILocation(line: 82, column: 32, scope: !169)
!188 = !DILocation(line: 82, column: 19, scope: !169)
!189 = !DILocation(line: 83, column: 35, scope: !169)
!190 = !DILocation(line: 83, column: 24, scope: !169)
!191 = !DILocation(line: 83, column: 13, scope: !169)
!192 = !DILocation(line: 84, column: 18, scope: !169)
!193 = !DILocation(line: 84, column: 13, scope: !169)
!194 = !DILocation(line: 86, column: 5, scope: !170)
!195 = !DILocation(line: 75, column: 24, scope: !165)
!196 = !DILocation(line: 75, column: 5, scope: !165)
!197 = distinct !{!197, !167, !198, !60}
!198 = !DILocation(line: 86, column: 5, scope: !162)
!199 = !DILocation(line: 87, column: 1, scope: !122)
!200 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!201 = !DILocalVariable(name: "h", scope: !200, file: !19, line: 92, type: !8)
!202 = !DILocation(line: 92, column: 9, scope: !200)
!203 = !DILocalVariable(name: "j", scope: !200, file: !19, line: 92, type: !8)
!204 = !DILocation(line: 92, column: 11, scope: !200)
!205 = !DILocalVariable(name: "data", scope: !200, file: !19, line: 93, type: !4)
!206 = !DILocation(line: 93, column: 12, scope: !200)
!207 = !DILocation(line: 94, column: 10, scope: !200)
!208 = !DILocation(line: 95, column: 11, scope: !209)
!209 = distinct !DILexicalBlock(scope: !200, file: !19, line: 95, column: 5)
!210 = !DILocation(line: 95, column: 9, scope: !209)
!211 = !DILocation(line: 95, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !19, line: 95, column: 5)
!213 = !DILocation(line: 95, column: 18, scope: !212)
!214 = !DILocation(line: 95, column: 5, scope: !209)
!215 = !DILocalVariable(name: "dataGoodBuffer", scope: !216, file: !19, line: 98, type: !9)
!216 = distinct !DILexicalBlock(scope: !217, file: !19, line: 97, column: 9)
!217 = distinct !DILexicalBlock(scope: !212, file: !19, line: 96, column: 5)
!218 = !DILocation(line: 98, column: 20, scope: !216)
!219 = !DILocation(line: 98, column: 45, scope: !216)
!220 = !DILocation(line: 99, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !216, file: !19, line: 99, column: 17)
!222 = !DILocation(line: 99, column: 32, scope: !221)
!223 = !DILocation(line: 99, column: 17, scope: !216)
!224 = !DILocation(line: 99, column: 42, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !19, line: 99, column: 41)
!226 = !DILocation(line: 100, column: 20, scope: !216)
!227 = !DILocation(line: 100, column: 13, scope: !216)
!228 = !DILocation(line: 101, column: 13, scope: !216)
!229 = !DILocation(line: 101, column: 34, scope: !216)
!230 = !DILocation(line: 103, column: 28, scope: !216)
!231 = !DILocation(line: 103, column: 18, scope: !216)
!232 = !DILocation(line: 105, column: 5, scope: !217)
!233 = !DILocation(line: 95, column: 24, scope: !212)
!234 = !DILocation(line: 95, column: 5, scope: !212)
!235 = distinct !{!235, !214, !236, !60}
!236 = !DILocation(line: 105, column: 5, scope: !209)
!237 = !DILocation(line: 106, column: 11, scope: !238)
!238 = distinct !DILexicalBlock(scope: !200, file: !19, line: 106, column: 5)
!239 = !DILocation(line: 106, column: 9, scope: !238)
!240 = !DILocation(line: 106, column: 16, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !19, line: 106, column: 5)
!242 = !DILocation(line: 106, column: 18, scope: !241)
!243 = !DILocation(line: 106, column: 5, scope: !238)
!244 = !DILocalVariable(name: "dataLen", scope: !245, file: !19, line: 110, type: !71)
!245 = distinct !DILexicalBlock(scope: !246, file: !19, line: 108, column: 9)
!246 = distinct !DILexicalBlock(scope: !241, file: !19, line: 107, column: 5)
!247 = !DILocation(line: 110, column: 20, scope: !245)
!248 = !DILocation(line: 110, column: 45, scope: !245)
!249 = !DILocation(line: 110, column: 30, scope: !245)
!250 = !DILocalVariable(name: "dest", scope: !245, file: !19, line: 111, type: !4)
!251 = !DILocation(line: 111, column: 20, scope: !245)
!252 = !DILocation(line: 111, column: 42, scope: !245)
!253 = !DILocation(line: 111, column: 49, scope: !245)
!254 = !DILocation(line: 111, column: 35, scope: !245)
!255 = !DILocation(line: 112, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !245, file: !19, line: 112, column: 17)
!257 = !DILocation(line: 112, column: 22, scope: !256)
!258 = !DILocation(line: 112, column: 17, scope: !245)
!259 = !DILocation(line: 112, column: 32, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !19, line: 112, column: 31)
!261 = !DILocation(line: 113, column: 26, scope: !245)
!262 = !DILocation(line: 113, column: 32, scope: !245)
!263 = !DILocation(line: 113, column: 19, scope: !245)
!264 = !DILocation(line: 114, column: 31, scope: !245)
!265 = !DILocation(line: 114, column: 13, scope: !245)
!266 = !DILocation(line: 115, column: 18, scope: !245)
!267 = !DILocation(line: 115, column: 13, scope: !245)
!268 = !DILocation(line: 117, column: 5, scope: !246)
!269 = !DILocation(line: 106, column: 24, scope: !241)
!270 = !DILocation(line: 106, column: 5, scope: !241)
!271 = distinct !{!271, !243, !272, !60}
!272 = !DILocation(line: 117, column: 5, scope: !238)
!273 = !DILocation(line: 118, column: 1, scope: !200)
