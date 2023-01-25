; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !33
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !37
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %8 = load i32, i32* @staticFive, align 4, !dbg !40
  %cmp = icmp eq i32 %8, 5, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  store i32* %9, i32** %data, align 8, !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !61
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx4, align 4, !dbg !63
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !65
  store i64 %call6, i64* %destLen, align 8, !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !70
  %11 = load i64, i64* %destLen, align 8, !dbg !72
  %cmp7 = icmp ult i64 %10, %11, !dbg !73
  br i1 %cmp7, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !75
  %13 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !75
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !75
  %15 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !79
  store i32 %14, i32* %arrayidx9, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %16, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx10, align 4, !dbg !88
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  call void @printWLine(i32* %arraydecay11), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_07_good() #0 !dbg !92 {
entry:
  call void @goodG2B1(), !dbg !93
  call void @goodG2B2(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_07_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_07_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 200, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 400, align 16, !dbg !125
  %3 = bitcast i8* %2 to i32*, !dbg !126
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !124
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !127
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !128
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !132
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !133
  store i32 0, i32* %arrayidx2, align 4, !dbg !134
  %8 = load i32, i32* @staticFive, align 4, !dbg !135
  %cmp = icmp ne i32 %8, 5, !dbg !137
  br i1 %cmp, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !139
  br label %if.end, !dbg !141

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !142
  store i32* %9, i32** %data, align 8, !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx4, align 4, !dbg !155
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !157
  store i64 %call6, i64* %destLen, align 8, !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !162
  %11 = load i64, i64* %destLen, align 8, !dbg !164
  %cmp7 = icmp ult i64 %10, %11, !dbg !165
  br i1 %cmp7, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !167
  %13 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !167
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !167
  %15 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !171
  store i32 %14, i32* %arrayidx9, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %16, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx10, align 4, !dbg !179
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  call void @printWLine(i32* %arraydecay11), !dbg !181
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !183 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !186, metadata !DIExpression()), !dbg !187
  %0 = alloca i8, i64 200, align 16, !dbg !188
  %1 = bitcast i8* %0 to i32*, !dbg !189
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !190, metadata !DIExpression()), !dbg !191
  %2 = alloca i8, i64 400, align 16, !dbg !192
  %3 = bitcast i8* %2 to i32*, !dbg !193
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !191
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !194
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !195
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !196
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !196
  store i32 0, i32* %arrayidx, align 4, !dbg !197
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !198
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !199
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !200
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !200
  store i32 0, i32* %arrayidx2, align 4, !dbg !201
  %8 = load i32, i32* @staticFive, align 4, !dbg !202
  %cmp = icmp eq i32 %8, 5, !dbg !204
  br i1 %cmp, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !206
  store i32* %9, i32** %data, align 8, !dbg !208
  br label %if.end, !dbg !209

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !210, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !215, metadata !DIExpression()), !dbg !216
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !217
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !218
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !219
  store i32 0, i32* %arrayidx4, align 4, !dbg !220
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !221
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !222
  store i64 %call6, i64* %destLen, align 8, !dbg !223
  store i64 0, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !227
  %11 = load i64, i64* %destLen, align 8, !dbg !229
  %cmp7 = icmp ult i64 %10, %11, !dbg !230
  br i1 %cmp7, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !232
  %13 = load i64, i64* %i, align 8, !dbg !234
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !232
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !232
  %15 = load i64, i64* %i, align 8, !dbg !235
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !236
  store i32 %14, i32* %arrayidx9, align 4, !dbg !237
  br label %for.inc, !dbg !238

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !239
  %inc = add i64 %16, 1, !dbg !239
  store i64 %inc, i64* %i, align 8, !dbg !239
  br label %for.cond, !dbg !240, !llvm.loop !241

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !243
  store i32 0, i32* %arrayidx10, align 4, !dbg !244
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !245
  call void @printWLine(i32* %arraydecay11), !dbg !246
  ret void, !dbg !247
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 42, scope: !19)
!27 = !DILocation(line: 32, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 33, type: !6)
!29 = !DILocation(line: 33, column: 15, scope: !19)
!30 = !DILocation(line: 33, column: 43, scope: !19)
!31 = !DILocation(line: 33, column: 32, scope: !19)
!32 = !DILocation(line: 34, column: 13, scope: !19)
!33 = !DILocation(line: 34, column: 5, scope: !19)
!34 = !DILocation(line: 35, column: 5, scope: !19)
!35 = !DILocation(line: 35, column: 25, scope: !19)
!36 = !DILocation(line: 36, column: 13, scope: !19)
!37 = !DILocation(line: 36, column: 5, scope: !19)
!38 = !DILocation(line: 37, column: 5, scope: !19)
!39 = !DILocation(line: 37, column: 27, scope: !19)
!40 = !DILocation(line: 38, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !19, file: !12, line: 38, column: 8)
!42 = !DILocation(line: 38, column: 18, scope: !41)
!43 = !DILocation(line: 38, column: 8, scope: !19)
!44 = !DILocation(line: 41, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 39, column: 5)
!46 = !DILocation(line: 41, column: 14, scope: !45)
!47 = !DILocation(line: 42, column: 5, scope: !45)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 44, type: !50)
!49 = distinct !DILexicalBlock(scope: !19, file: !12, line: 43, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 44, column: 16, scope: !49)
!53 = !DILocalVariable(name: "destLen", scope: !49, file: !12, line: 44, type: !50)
!54 = !DILocation(line: 44, column: 19, scope: !49)
!55 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 45, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 45, column: 17, scope: !49)
!60 = !DILocation(line: 46, column: 17, scope: !49)
!61 = !DILocation(line: 46, column: 9, scope: !49)
!62 = !DILocation(line: 47, column: 9, scope: !49)
!63 = !DILocation(line: 47, column: 21, scope: !49)
!64 = !DILocation(line: 48, column: 26, scope: !49)
!65 = !DILocation(line: 48, column: 19, scope: !49)
!66 = !DILocation(line: 48, column: 17, scope: !49)
!67 = !DILocation(line: 51, column: 16, scope: !68)
!68 = distinct !DILexicalBlock(scope: !49, file: !12, line: 51, column: 9)
!69 = !DILocation(line: 51, column: 14, scope: !68)
!70 = !DILocation(line: 51, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 51, column: 9)
!72 = !DILocation(line: 51, column: 25, scope: !71)
!73 = !DILocation(line: 51, column: 23, scope: !71)
!74 = !DILocation(line: 51, column: 9, scope: !68)
!75 = !DILocation(line: 53, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !12, line: 52, column: 9)
!77 = !DILocation(line: 53, column: 28, scope: !76)
!78 = !DILocation(line: 53, column: 18, scope: !76)
!79 = !DILocation(line: 53, column: 13, scope: !76)
!80 = !DILocation(line: 53, column: 21, scope: !76)
!81 = !DILocation(line: 54, column: 9, scope: !76)
!82 = !DILocation(line: 51, column: 35, scope: !71)
!83 = !DILocation(line: 51, column: 9, scope: !71)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 54, column: 9, scope: !68)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 55, column: 9, scope: !49)
!88 = !DILocation(line: 55, column: 21, scope: !49)
!89 = !DILocation(line: 56, column: 20, scope: !49)
!90 = !DILocation(line: 56, column: 9, scope: !49)
!91 = !DILocation(line: 58, column: 1, scope: !19)
!92 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_07_good", scope: !12, file: !12, line: 133, type: !20, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 135, column: 5, scope: !92)
!94 = !DILocation(line: 136, column: 5, scope: !92)
!95 = !DILocation(line: 137, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 149, type: !97, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DISubroutineType(types: !98)
!98 = !{!9, !9, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !12, line: 149, type: !9)
!103 = !DILocation(line: 149, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !12, line: 149, type: !99)
!105 = !DILocation(line: 149, column: 27, scope: !96)
!106 = !DILocation(line: 152, column: 22, scope: !96)
!107 = !DILocation(line: 152, column: 12, scope: !96)
!108 = !DILocation(line: 152, column: 5, scope: !96)
!109 = !DILocation(line: 154, column: 5, scope: !96)
!110 = !DILocation(line: 155, column: 5, scope: !96)
!111 = !DILocation(line: 156, column: 5, scope: !96)
!112 = !DILocation(line: 159, column: 5, scope: !96)
!113 = !DILocation(line: 160, column: 5, scope: !96)
!114 = !DILocation(line: 161, column: 5, scope: !96)
!115 = !DILocation(line: 163, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !20, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 67, type: !6)
!118 = !DILocation(line: 67, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 68, type: !6)
!120 = !DILocation(line: 68, column: 15, scope: !116)
!121 = !DILocation(line: 68, column: 42, scope: !116)
!122 = !DILocation(line: 68, column: 31, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 69, type: !6)
!124 = !DILocation(line: 69, column: 15, scope: !116)
!125 = !DILocation(line: 69, column: 43, scope: !116)
!126 = !DILocation(line: 69, column: 32, scope: !116)
!127 = !DILocation(line: 70, column: 13, scope: !116)
!128 = !DILocation(line: 70, column: 5, scope: !116)
!129 = !DILocation(line: 71, column: 5, scope: !116)
!130 = !DILocation(line: 71, column: 25, scope: !116)
!131 = !DILocation(line: 72, column: 13, scope: !116)
!132 = !DILocation(line: 72, column: 5, scope: !116)
!133 = !DILocation(line: 73, column: 5, scope: !116)
!134 = !DILocation(line: 73, column: 27, scope: !116)
!135 = !DILocation(line: 74, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !116, file: !12, line: 74, column: 8)
!137 = !DILocation(line: 74, column: 18, scope: !136)
!138 = !DILocation(line: 74, column: 8, scope: !116)
!139 = !DILocation(line: 77, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 75, column: 5)
!141 = !DILocation(line: 78, column: 5, scope: !140)
!142 = !DILocation(line: 82, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !12, line: 80, column: 5)
!144 = !DILocation(line: 82, column: 14, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 85, type: !50)
!146 = distinct !DILexicalBlock(scope: !116, file: !12, line: 84, column: 5)
!147 = !DILocation(line: 85, column: 16, scope: !146)
!148 = !DILocalVariable(name: "destLen", scope: !146, file: !12, line: 85, type: !50)
!149 = !DILocation(line: 85, column: 19, scope: !146)
!150 = !DILocalVariable(name: "dest", scope: !146, file: !12, line: 86, type: !56)
!151 = !DILocation(line: 86, column: 17, scope: !146)
!152 = !DILocation(line: 87, column: 17, scope: !146)
!153 = !DILocation(line: 87, column: 9, scope: !146)
!154 = !DILocation(line: 88, column: 9, scope: !146)
!155 = !DILocation(line: 88, column: 21, scope: !146)
!156 = !DILocation(line: 89, column: 26, scope: !146)
!157 = !DILocation(line: 89, column: 19, scope: !146)
!158 = !DILocation(line: 89, column: 17, scope: !146)
!159 = !DILocation(line: 92, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !146, file: !12, line: 92, column: 9)
!161 = !DILocation(line: 92, column: 14, scope: !160)
!162 = !DILocation(line: 92, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 92, column: 9)
!164 = !DILocation(line: 92, column: 25, scope: !163)
!165 = !DILocation(line: 92, column: 23, scope: !163)
!166 = !DILocation(line: 92, column: 9, scope: !160)
!167 = !DILocation(line: 94, column: 23, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !12, line: 93, column: 9)
!169 = !DILocation(line: 94, column: 28, scope: !168)
!170 = !DILocation(line: 94, column: 18, scope: !168)
!171 = !DILocation(line: 94, column: 13, scope: !168)
!172 = !DILocation(line: 94, column: 21, scope: !168)
!173 = !DILocation(line: 95, column: 9, scope: !168)
!174 = !DILocation(line: 92, column: 35, scope: !163)
!175 = !DILocation(line: 92, column: 9, scope: !163)
!176 = distinct !{!176, !166, !177, !86}
!177 = !DILocation(line: 95, column: 9, scope: !160)
!178 = !DILocation(line: 96, column: 9, scope: !146)
!179 = !DILocation(line: 96, column: 21, scope: !146)
!180 = !DILocation(line: 97, column: 20, scope: !146)
!181 = !DILocation(line: 97, column: 9, scope: !146)
!182 = !DILocation(line: 99, column: 1, scope: !116)
!183 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 102, type: !20, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!184 = !DILocalVariable(name: "data", scope: !183, file: !12, line: 104, type: !6)
!185 = !DILocation(line: 104, column: 15, scope: !183)
!186 = !DILocalVariable(name: "dataBadBuffer", scope: !183, file: !12, line: 105, type: !6)
!187 = !DILocation(line: 105, column: 15, scope: !183)
!188 = !DILocation(line: 105, column: 42, scope: !183)
!189 = !DILocation(line: 105, column: 31, scope: !183)
!190 = !DILocalVariable(name: "dataGoodBuffer", scope: !183, file: !12, line: 106, type: !6)
!191 = !DILocation(line: 106, column: 15, scope: !183)
!192 = !DILocation(line: 106, column: 43, scope: !183)
!193 = !DILocation(line: 106, column: 32, scope: !183)
!194 = !DILocation(line: 107, column: 13, scope: !183)
!195 = !DILocation(line: 107, column: 5, scope: !183)
!196 = !DILocation(line: 108, column: 5, scope: !183)
!197 = !DILocation(line: 108, column: 25, scope: !183)
!198 = !DILocation(line: 109, column: 13, scope: !183)
!199 = !DILocation(line: 109, column: 5, scope: !183)
!200 = !DILocation(line: 110, column: 5, scope: !183)
!201 = !DILocation(line: 110, column: 27, scope: !183)
!202 = !DILocation(line: 111, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !183, file: !12, line: 111, column: 8)
!204 = !DILocation(line: 111, column: 18, scope: !203)
!205 = !DILocation(line: 111, column: 8, scope: !183)
!206 = !DILocation(line: 114, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !12, line: 112, column: 5)
!208 = !DILocation(line: 114, column: 14, scope: !207)
!209 = !DILocation(line: 115, column: 5, scope: !207)
!210 = !DILocalVariable(name: "i", scope: !211, file: !12, line: 117, type: !50)
!211 = distinct !DILexicalBlock(scope: !183, file: !12, line: 116, column: 5)
!212 = !DILocation(line: 117, column: 16, scope: !211)
!213 = !DILocalVariable(name: "destLen", scope: !211, file: !12, line: 117, type: !50)
!214 = !DILocation(line: 117, column: 19, scope: !211)
!215 = !DILocalVariable(name: "dest", scope: !211, file: !12, line: 118, type: !56)
!216 = !DILocation(line: 118, column: 17, scope: !211)
!217 = !DILocation(line: 119, column: 17, scope: !211)
!218 = !DILocation(line: 119, column: 9, scope: !211)
!219 = !DILocation(line: 120, column: 9, scope: !211)
!220 = !DILocation(line: 120, column: 21, scope: !211)
!221 = !DILocation(line: 121, column: 26, scope: !211)
!222 = !DILocation(line: 121, column: 19, scope: !211)
!223 = !DILocation(line: 121, column: 17, scope: !211)
!224 = !DILocation(line: 124, column: 16, scope: !225)
!225 = distinct !DILexicalBlock(scope: !211, file: !12, line: 124, column: 9)
!226 = !DILocation(line: 124, column: 14, scope: !225)
!227 = !DILocation(line: 124, column: 21, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !12, line: 124, column: 9)
!229 = !DILocation(line: 124, column: 25, scope: !228)
!230 = !DILocation(line: 124, column: 23, scope: !228)
!231 = !DILocation(line: 124, column: 9, scope: !225)
!232 = !DILocation(line: 126, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !12, line: 125, column: 9)
!234 = !DILocation(line: 126, column: 28, scope: !233)
!235 = !DILocation(line: 126, column: 18, scope: !233)
!236 = !DILocation(line: 126, column: 13, scope: !233)
!237 = !DILocation(line: 126, column: 21, scope: !233)
!238 = !DILocation(line: 127, column: 9, scope: !233)
!239 = !DILocation(line: 124, column: 35, scope: !228)
!240 = !DILocation(line: 124, column: 9, scope: !228)
!241 = distinct !{!241, !231, !242, !86}
!242 = !DILocation(line: 127, column: 9, scope: !225)
!243 = !DILocation(line: 128, column: 9, scope: !211)
!244 = !DILocation(line: 128, column: 21, scope: !211)
!245 = !DILocation(line: 129, column: 20, scope: !211)
!246 = !DILocation(line: 129, column: 9, scope: !211)
!247 = !DILocation(line: 131, column: 1, scope: !183)
