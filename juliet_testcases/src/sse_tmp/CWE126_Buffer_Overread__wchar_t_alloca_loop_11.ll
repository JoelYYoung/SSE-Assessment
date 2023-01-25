; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_11_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %call3 = call i32 (...) @globalReturnsTrue(), !dbg !37
  %tobool = icmp ne i32 %call3, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !57
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx5, align 4, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !61
  store i64 %call7, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !66
  %10 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp = icmp ult i64 %9, %10, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !71
  %12 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !71
  %13 = load i32, i32* %arrayidx8, align 4, !dbg !71
  %14 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !75
  store i32 %13, i32* %arrayidx9, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %15, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx10, align 4, !dbg !84
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  call void @printWLine(i32* %arraydecay11), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_11_good() #0 !dbg !88 {
entry:
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_11_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_11_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 200, align 16, !dbg !117
  %1 = bitcast i8* %0 to i32*, !dbg !118
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = alloca i8, i64 400, align 16, !dbg !121
  %3 = bitcast i8* %2 to i32*, !dbg !122
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !120
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !123
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !124
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !127
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !128
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !129
  store i32 0, i32* %arrayidx2, align 4, !dbg !130
  %call3 = call i32 (...) @globalReturnsFalse(), !dbg !131
  %tobool = icmp ne i32 %call3, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.else, !dbg !133

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !134
  br label %if.end, !dbg !136

if.else:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  store i32* %8, i32** %data, align 8, !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx5, align 4, !dbg !150
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !152
  store i64 %call7, i64* %destLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !157
  %10 = load i64, i64* %destLen, align 8, !dbg !159
  %cmp = icmp ult i64 %9, %10, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !162
  %12 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !162
  %13 = load i32, i32* %arrayidx8, align 4, !dbg !162
  %14 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !166
  store i32 %13, i32* %arrayidx9, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %15, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx10, align 4, !dbg !174
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay11), !dbg !176
  ret void, !dbg !177
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !178 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  %0 = alloca i8, i64 200, align 16, !dbg !183
  %1 = bitcast i8* %0 to i32*, !dbg !184
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !185, metadata !DIExpression()), !dbg !186
  %2 = alloca i8, i64 400, align 16, !dbg !187
  %3 = bitcast i8* %2 to i32*, !dbg !188
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !186
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !189
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !190
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !191
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !191
  store i32 0, i32* %arrayidx, align 4, !dbg !192
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !193
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !194
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !195
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !195
  store i32 0, i32* %arrayidx2, align 4, !dbg !196
  %call3 = call i32 (...) @globalReturnsTrue(), !dbg !197
  %tobool = icmp ne i32 %call3, 0, !dbg !197
  br i1 %tobool, label %if.then, label %if.end, !dbg !199

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !200
  store i32* %8, i32** %data, align 8, !dbg !202
  br label %if.end, !dbg !203

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !204, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !209, metadata !DIExpression()), !dbg !210
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !211
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !212
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !213
  store i32 0, i32* %arrayidx5, align 4, !dbg !214
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !215
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !216
  store i64 %call7, i64* %destLen, align 8, !dbg !217
  store i64 0, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !221
  %10 = load i64, i64* %destLen, align 8, !dbg !223
  %cmp = icmp ult i64 %9, %10, !dbg !224
  br i1 %cmp, label %for.body, label %for.end, !dbg !225

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !226
  %12 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !226
  %13 = load i32, i32* %arrayidx8, align 4, !dbg !226
  %14 = load i64, i64* %i, align 8, !dbg !229
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !230
  store i32 %13, i32* %arrayidx9, align 4, !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !233
  %inc = add i64 %15, 1, !dbg !233
  store i64 %inc, i64* %i, align 8, !dbg !233
  br label %for.cond, !dbg !234, !llvm.loop !235

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !237
  store i32 0, i32* %arrayidx10, align 4, !dbg !238
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !239
  call void @printWLine(i32* %arraydecay11), !dbg !240
  ret void, !dbg !241
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_11_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 8, scope: !15)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 5, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !16, line: 38, type: !46)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 38, column: 16, scope: !45)
!49 = !DILocalVariable(name: "destLen", scope: !45, file: !16, line: 38, type: !46)
!50 = !DILocation(line: 38, column: 19, scope: !45)
!51 = !DILocalVariable(name: "dest", scope: !45, file: !16, line: 39, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 39, column: 17, scope: !45)
!56 = !DILocation(line: 40, column: 17, scope: !45)
!57 = !DILocation(line: 40, column: 9, scope: !45)
!58 = !DILocation(line: 41, column: 9, scope: !45)
!59 = !DILocation(line: 41, column: 21, scope: !45)
!60 = !DILocation(line: 42, column: 26, scope: !45)
!61 = !DILocation(line: 42, column: 19, scope: !45)
!62 = !DILocation(line: 42, column: 17, scope: !45)
!63 = !DILocation(line: 45, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !45, file: !16, line: 45, column: 9)
!65 = !DILocation(line: 45, column: 14, scope: !64)
!66 = !DILocation(line: 45, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !16, line: 45, column: 9)
!68 = !DILocation(line: 45, column: 25, scope: !67)
!69 = !DILocation(line: 45, column: 23, scope: !67)
!70 = !DILocation(line: 45, column: 9, scope: !64)
!71 = !DILocation(line: 47, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !16, line: 46, column: 9)
!73 = !DILocation(line: 47, column: 28, scope: !72)
!74 = !DILocation(line: 47, column: 18, scope: !72)
!75 = !DILocation(line: 47, column: 13, scope: !72)
!76 = !DILocation(line: 47, column: 21, scope: !72)
!77 = !DILocation(line: 48, column: 9, scope: !72)
!78 = !DILocation(line: 45, column: 35, scope: !67)
!79 = !DILocation(line: 45, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 48, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 49, column: 9, scope: !45)
!84 = !DILocation(line: 49, column: 21, scope: !45)
!85 = !DILocation(line: 50, column: 20, scope: !45)
!86 = !DILocation(line: 50, column: 9, scope: !45)
!87 = !DILocation(line: 52, column: 1, scope: !15)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_11_good", scope: !16, file: !16, line: 127, type: !17, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 129, column: 5, scope: !88)
!90 = !DILocation(line: 130, column: 5, scope: !88)
!91 = !DILocation(line: 131, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 143, type: !93, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !16, line: 143, type: !7)
!99 = !DILocation(line: 143, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !16, line: 143, type: !95)
!101 = !DILocation(line: 143, column: 27, scope: !92)
!102 = !DILocation(line: 146, column: 22, scope: !92)
!103 = !DILocation(line: 146, column: 12, scope: !92)
!104 = !DILocation(line: 146, column: 5, scope: !92)
!105 = !DILocation(line: 148, column: 5, scope: !92)
!106 = !DILocation(line: 149, column: 5, scope: !92)
!107 = !DILocation(line: 150, column: 5, scope: !92)
!108 = !DILocation(line: 153, column: 5, scope: !92)
!109 = !DILocation(line: 154, column: 5, scope: !92)
!110 = !DILocation(line: 155, column: 5, scope: !92)
!111 = !DILocation(line: 157, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !16, line: 61, type: !4)
!114 = !DILocation(line: 61, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !16, line: 62, type: !4)
!116 = !DILocation(line: 62, column: 15, scope: !112)
!117 = !DILocation(line: 62, column: 42, scope: !112)
!118 = !DILocation(line: 62, column: 31, scope: !112)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !16, line: 63, type: !4)
!120 = !DILocation(line: 63, column: 15, scope: !112)
!121 = !DILocation(line: 63, column: 43, scope: !112)
!122 = !DILocation(line: 63, column: 32, scope: !112)
!123 = !DILocation(line: 64, column: 13, scope: !112)
!124 = !DILocation(line: 64, column: 5, scope: !112)
!125 = !DILocation(line: 65, column: 5, scope: !112)
!126 = !DILocation(line: 65, column: 25, scope: !112)
!127 = !DILocation(line: 66, column: 13, scope: !112)
!128 = !DILocation(line: 66, column: 5, scope: !112)
!129 = !DILocation(line: 67, column: 5, scope: !112)
!130 = !DILocation(line: 67, column: 27, scope: !112)
!131 = !DILocation(line: 68, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !112, file: !16, line: 68, column: 8)
!133 = !DILocation(line: 68, column: 8, scope: !112)
!134 = !DILocation(line: 71, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !16, line: 69, column: 5)
!136 = !DILocation(line: 72, column: 5, scope: !135)
!137 = !DILocation(line: 76, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !16, line: 74, column: 5)
!139 = !DILocation(line: 76, column: 14, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !16, line: 79, type: !46)
!141 = distinct !DILexicalBlock(scope: !112, file: !16, line: 78, column: 5)
!142 = !DILocation(line: 79, column: 16, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !16, line: 79, type: !46)
!144 = !DILocation(line: 79, column: 19, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !16, line: 80, type: !52)
!146 = !DILocation(line: 80, column: 17, scope: !141)
!147 = !DILocation(line: 81, column: 17, scope: !141)
!148 = !DILocation(line: 81, column: 9, scope: !141)
!149 = !DILocation(line: 82, column: 9, scope: !141)
!150 = !DILocation(line: 82, column: 21, scope: !141)
!151 = !DILocation(line: 83, column: 26, scope: !141)
!152 = !DILocation(line: 83, column: 19, scope: !141)
!153 = !DILocation(line: 83, column: 17, scope: !141)
!154 = !DILocation(line: 86, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !16, line: 86, column: 9)
!156 = !DILocation(line: 86, column: 14, scope: !155)
!157 = !DILocation(line: 86, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !16, line: 86, column: 9)
!159 = !DILocation(line: 86, column: 25, scope: !158)
!160 = !DILocation(line: 86, column: 23, scope: !158)
!161 = !DILocation(line: 86, column: 9, scope: !155)
!162 = !DILocation(line: 88, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !16, line: 87, column: 9)
!164 = !DILocation(line: 88, column: 28, scope: !163)
!165 = !DILocation(line: 88, column: 18, scope: !163)
!166 = !DILocation(line: 88, column: 13, scope: !163)
!167 = !DILocation(line: 88, column: 21, scope: !163)
!168 = !DILocation(line: 89, column: 9, scope: !163)
!169 = !DILocation(line: 86, column: 35, scope: !158)
!170 = !DILocation(line: 86, column: 9, scope: !158)
!171 = distinct !{!171, !161, !172, !82}
!172 = !DILocation(line: 89, column: 9, scope: !155)
!173 = !DILocation(line: 90, column: 9, scope: !141)
!174 = !DILocation(line: 90, column: 21, scope: !141)
!175 = !DILocation(line: 91, column: 20, scope: !141)
!176 = !DILocation(line: 91, column: 9, scope: !141)
!177 = !DILocation(line: 93, column: 1, scope: !112)
!178 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 96, type: !17, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!179 = !DILocalVariable(name: "data", scope: !178, file: !16, line: 98, type: !4)
!180 = !DILocation(line: 98, column: 15, scope: !178)
!181 = !DILocalVariable(name: "dataBadBuffer", scope: !178, file: !16, line: 99, type: !4)
!182 = !DILocation(line: 99, column: 15, scope: !178)
!183 = !DILocation(line: 99, column: 42, scope: !178)
!184 = !DILocation(line: 99, column: 31, scope: !178)
!185 = !DILocalVariable(name: "dataGoodBuffer", scope: !178, file: !16, line: 100, type: !4)
!186 = !DILocation(line: 100, column: 15, scope: !178)
!187 = !DILocation(line: 100, column: 43, scope: !178)
!188 = !DILocation(line: 100, column: 32, scope: !178)
!189 = !DILocation(line: 101, column: 13, scope: !178)
!190 = !DILocation(line: 101, column: 5, scope: !178)
!191 = !DILocation(line: 102, column: 5, scope: !178)
!192 = !DILocation(line: 102, column: 25, scope: !178)
!193 = !DILocation(line: 103, column: 13, scope: !178)
!194 = !DILocation(line: 103, column: 5, scope: !178)
!195 = !DILocation(line: 104, column: 5, scope: !178)
!196 = !DILocation(line: 104, column: 27, scope: !178)
!197 = !DILocation(line: 105, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !178, file: !16, line: 105, column: 8)
!199 = !DILocation(line: 105, column: 8, scope: !178)
!200 = !DILocation(line: 108, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !16, line: 106, column: 5)
!202 = !DILocation(line: 108, column: 14, scope: !201)
!203 = !DILocation(line: 109, column: 5, scope: !201)
!204 = !DILocalVariable(name: "i", scope: !205, file: !16, line: 111, type: !46)
!205 = distinct !DILexicalBlock(scope: !178, file: !16, line: 110, column: 5)
!206 = !DILocation(line: 111, column: 16, scope: !205)
!207 = !DILocalVariable(name: "destLen", scope: !205, file: !16, line: 111, type: !46)
!208 = !DILocation(line: 111, column: 19, scope: !205)
!209 = !DILocalVariable(name: "dest", scope: !205, file: !16, line: 112, type: !52)
!210 = !DILocation(line: 112, column: 17, scope: !205)
!211 = !DILocation(line: 113, column: 17, scope: !205)
!212 = !DILocation(line: 113, column: 9, scope: !205)
!213 = !DILocation(line: 114, column: 9, scope: !205)
!214 = !DILocation(line: 114, column: 21, scope: !205)
!215 = !DILocation(line: 115, column: 26, scope: !205)
!216 = !DILocation(line: 115, column: 19, scope: !205)
!217 = !DILocation(line: 115, column: 17, scope: !205)
!218 = !DILocation(line: 118, column: 16, scope: !219)
!219 = distinct !DILexicalBlock(scope: !205, file: !16, line: 118, column: 9)
!220 = !DILocation(line: 118, column: 14, scope: !219)
!221 = !DILocation(line: 118, column: 21, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !16, line: 118, column: 9)
!223 = !DILocation(line: 118, column: 25, scope: !222)
!224 = !DILocation(line: 118, column: 23, scope: !222)
!225 = !DILocation(line: 118, column: 9, scope: !219)
!226 = !DILocation(line: 120, column: 23, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !16, line: 119, column: 9)
!228 = !DILocation(line: 120, column: 28, scope: !227)
!229 = !DILocation(line: 120, column: 18, scope: !227)
!230 = !DILocation(line: 120, column: 13, scope: !227)
!231 = !DILocation(line: 120, column: 21, scope: !227)
!232 = !DILocation(line: 121, column: 9, scope: !227)
!233 = !DILocation(line: 118, column: 35, scope: !222)
!234 = !DILocation(line: 118, column: 9, scope: !222)
!235 = distinct !{!235, !225, !236, !82}
!236 = !DILocation(line: 121, column: 9, scope: !219)
!237 = !DILocation(line: 122, column: 9, scope: !205)
!238 = !DILocation(line: 122, column: 21, scope: !205)
!239 = !DILocation(line: 123, column: 20, scope: !205)
!240 = !DILocation(line: 123, column: 9, scope: !205)
!241 = !DILocation(line: 125, column: 1, scope: !178)
