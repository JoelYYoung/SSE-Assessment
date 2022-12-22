; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_08_bad() #0 !dbg !15 {
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
  %call3 = call i32 @staticReturnsTrue(), !dbg !37
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_08_good() #0 !dbg !88 {
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
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_08_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_08_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !112 {
entry:
  ret i32 1, !dbg !115
}

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
  %call3 = call i32 @staticReturnsFalse(), !dbg !135
  %tobool = icmp ne i32 %call3, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !138
  br label %if.end, !dbg !140

if.else:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !141
  store i32* %8, i32** %data, align 8, !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !152
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !156
  store i64 %call7, i64* %destLen, align 8, !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !161
  %10 = load i64, i64* %destLen, align 8, !dbg !163
  %cmp = icmp ult i64 %9, %10, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !166
  %12 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !166
  %13 = load i32, i32* %arrayidx8, align 4, !dbg !166
  %14 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !170
  store i32 %13, i32* %arrayidx9, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %15, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx10, align 4, !dbg !178
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !179
  call void @printWLine(i32* %arraydecay11), !dbg !180
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !182 {
entry:
  ret i32 0, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !184 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !187, metadata !DIExpression()), !dbg !188
  %0 = alloca i8, i64 200, align 16, !dbg !189
  %1 = bitcast i8* %0 to i32*, !dbg !190
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !188
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !191, metadata !DIExpression()), !dbg !192
  %2 = alloca i8, i64 400, align 16, !dbg !193
  %3 = bitcast i8* %2 to i32*, !dbg !194
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !192
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !195
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !196
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !197
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !197
  store i32 0, i32* %arrayidx, align 4, !dbg !198
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !199
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !200
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !201
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !201
  store i32 0, i32* %arrayidx2, align 4, !dbg !202
  %call3 = call i32 @staticReturnsTrue(), !dbg !203
  %tobool = icmp ne i32 %call3, 0, !dbg !203
  br i1 %tobool, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !206
  store i32* %8, i32** %data, align 8, !dbg !208
  br label %if.end, !dbg !209

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !210, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !215, metadata !DIExpression()), !dbg !216
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !217
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !218
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !219
  store i32 0, i32* %arrayidx5, align 4, !dbg !220
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !221
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !222
  store i64 %call7, i64* %destLen, align 8, !dbg !223
  store i64 0, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !227
  %10 = load i64, i64* %destLen, align 8, !dbg !229
  %cmp = icmp ult i64 %9, %10, !dbg !230
  br i1 %cmp, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !232
  %12 = load i64, i64* %i, align 8, !dbg !234
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !232
  %13 = load i32, i32* %arrayidx8, align 4, !dbg !232
  %14 = load i64, i64* %i, align 8, !dbg !235
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !236
  store i32 %13, i32* %arrayidx9, align 4, !dbg !237
  br label %for.inc, !dbg !238

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !239
  %inc = add i64 %15, 1, !dbg !239
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 42, scope: !15)
!24 = !DILocation(line: 40, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!26 = !DILocation(line: 41, column: 15, scope: !15)
!27 = !DILocation(line: 41, column: 43, scope: !15)
!28 = !DILocation(line: 41, column: 32, scope: !15)
!29 = !DILocation(line: 42, column: 13, scope: !15)
!30 = !DILocation(line: 42, column: 5, scope: !15)
!31 = !DILocation(line: 43, column: 5, scope: !15)
!32 = !DILocation(line: 43, column: 25, scope: !15)
!33 = !DILocation(line: 44, column: 13, scope: !15)
!34 = !DILocation(line: 44, column: 5, scope: !15)
!35 = !DILocation(line: 45, column: 5, scope: !15)
!36 = !DILocation(line: 45, column: 27, scope: !15)
!37 = !DILocation(line: 46, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 8)
!39 = !DILocation(line: 46, column: 8, scope: !15)
!40 = !DILocation(line: 49, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 47, column: 5)
!42 = !DILocation(line: 49, column: 14, scope: !41)
!43 = !DILocation(line: 50, column: 5, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !16, line: 52, type: !46)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 51, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 52, column: 16, scope: !45)
!49 = !DILocalVariable(name: "destLen", scope: !45, file: !16, line: 52, type: !46)
!50 = !DILocation(line: 52, column: 19, scope: !45)
!51 = !DILocalVariable(name: "dest", scope: !45, file: !16, line: 53, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 53, column: 17, scope: !45)
!56 = !DILocation(line: 54, column: 17, scope: !45)
!57 = !DILocation(line: 54, column: 9, scope: !45)
!58 = !DILocation(line: 55, column: 9, scope: !45)
!59 = !DILocation(line: 55, column: 21, scope: !45)
!60 = !DILocation(line: 56, column: 26, scope: !45)
!61 = !DILocation(line: 56, column: 19, scope: !45)
!62 = !DILocation(line: 56, column: 17, scope: !45)
!63 = !DILocation(line: 59, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !45, file: !16, line: 59, column: 9)
!65 = !DILocation(line: 59, column: 14, scope: !64)
!66 = !DILocation(line: 59, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !16, line: 59, column: 9)
!68 = !DILocation(line: 59, column: 25, scope: !67)
!69 = !DILocation(line: 59, column: 23, scope: !67)
!70 = !DILocation(line: 59, column: 9, scope: !64)
!71 = !DILocation(line: 61, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !16, line: 60, column: 9)
!73 = !DILocation(line: 61, column: 28, scope: !72)
!74 = !DILocation(line: 61, column: 18, scope: !72)
!75 = !DILocation(line: 61, column: 13, scope: !72)
!76 = !DILocation(line: 61, column: 21, scope: !72)
!77 = !DILocation(line: 62, column: 9, scope: !72)
!78 = !DILocation(line: 59, column: 35, scope: !67)
!79 = !DILocation(line: 59, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 62, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 63, column: 9, scope: !45)
!84 = !DILocation(line: 63, column: 21, scope: !45)
!85 = !DILocation(line: 64, column: 20, scope: !45)
!86 = !DILocation(line: 64, column: 9, scope: !45)
!87 = !DILocation(line: 66, column: 1, scope: !15)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_08_good", scope: !16, file: !16, line: 141, type: !17, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 143, column: 5, scope: !88)
!90 = !DILocation(line: 144, column: 5, scope: !88)
!91 = !DILocation(line: 145, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 157, type: !93, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !16, line: 157, type: !7)
!99 = !DILocation(line: 157, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !16, line: 157, type: !95)
!101 = !DILocation(line: 157, column: 27, scope: !92)
!102 = !DILocation(line: 160, column: 22, scope: !92)
!103 = !DILocation(line: 160, column: 12, scope: !92)
!104 = !DILocation(line: 160, column: 5, scope: !92)
!105 = !DILocation(line: 162, column: 5, scope: !92)
!106 = !DILocation(line: 163, column: 5, scope: !92)
!107 = !DILocation(line: 164, column: 5, scope: !92)
!108 = !DILocation(line: 167, column: 5, scope: !92)
!109 = !DILocation(line: 168, column: 5, scope: !92)
!110 = !DILocation(line: 169, column: 5, scope: !92)
!111 = !DILocation(line: 171, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !113, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!7}
!115 = !DILocation(line: 27, column: 5, scope: !112)
!116 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !16, line: 75, type: !4)
!118 = !DILocation(line: 75, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !16, line: 76, type: !4)
!120 = !DILocation(line: 76, column: 15, scope: !116)
!121 = !DILocation(line: 76, column: 42, scope: !116)
!122 = !DILocation(line: 76, column: 31, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !16, line: 77, type: !4)
!124 = !DILocation(line: 77, column: 15, scope: !116)
!125 = !DILocation(line: 77, column: 43, scope: !116)
!126 = !DILocation(line: 77, column: 32, scope: !116)
!127 = !DILocation(line: 78, column: 13, scope: !116)
!128 = !DILocation(line: 78, column: 5, scope: !116)
!129 = !DILocation(line: 79, column: 5, scope: !116)
!130 = !DILocation(line: 79, column: 25, scope: !116)
!131 = !DILocation(line: 80, column: 13, scope: !116)
!132 = !DILocation(line: 80, column: 5, scope: !116)
!133 = !DILocation(line: 81, column: 5, scope: !116)
!134 = !DILocation(line: 81, column: 27, scope: !116)
!135 = !DILocation(line: 82, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !116, file: !16, line: 82, column: 8)
!137 = !DILocation(line: 82, column: 8, scope: !116)
!138 = !DILocation(line: 85, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !16, line: 83, column: 5)
!140 = !DILocation(line: 86, column: 5, scope: !139)
!141 = !DILocation(line: 90, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !16, line: 88, column: 5)
!143 = !DILocation(line: 90, column: 14, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !16, line: 93, type: !46)
!145 = distinct !DILexicalBlock(scope: !116, file: !16, line: 92, column: 5)
!146 = !DILocation(line: 93, column: 16, scope: !145)
!147 = !DILocalVariable(name: "destLen", scope: !145, file: !16, line: 93, type: !46)
!148 = !DILocation(line: 93, column: 19, scope: !145)
!149 = !DILocalVariable(name: "dest", scope: !145, file: !16, line: 94, type: !52)
!150 = !DILocation(line: 94, column: 17, scope: !145)
!151 = !DILocation(line: 95, column: 17, scope: !145)
!152 = !DILocation(line: 95, column: 9, scope: !145)
!153 = !DILocation(line: 96, column: 9, scope: !145)
!154 = !DILocation(line: 96, column: 21, scope: !145)
!155 = !DILocation(line: 97, column: 26, scope: !145)
!156 = !DILocation(line: 97, column: 19, scope: !145)
!157 = !DILocation(line: 97, column: 17, scope: !145)
!158 = !DILocation(line: 100, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !145, file: !16, line: 100, column: 9)
!160 = !DILocation(line: 100, column: 14, scope: !159)
!161 = !DILocation(line: 100, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !16, line: 100, column: 9)
!163 = !DILocation(line: 100, column: 25, scope: !162)
!164 = !DILocation(line: 100, column: 23, scope: !162)
!165 = !DILocation(line: 100, column: 9, scope: !159)
!166 = !DILocation(line: 102, column: 23, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !16, line: 101, column: 9)
!168 = !DILocation(line: 102, column: 28, scope: !167)
!169 = !DILocation(line: 102, column: 18, scope: !167)
!170 = !DILocation(line: 102, column: 13, scope: !167)
!171 = !DILocation(line: 102, column: 21, scope: !167)
!172 = !DILocation(line: 103, column: 9, scope: !167)
!173 = !DILocation(line: 100, column: 35, scope: !162)
!174 = !DILocation(line: 100, column: 9, scope: !162)
!175 = distinct !{!175, !165, !176, !82}
!176 = !DILocation(line: 103, column: 9, scope: !159)
!177 = !DILocation(line: 104, column: 9, scope: !145)
!178 = !DILocation(line: 104, column: 21, scope: !145)
!179 = !DILocation(line: 105, column: 20, scope: !145)
!180 = !DILocation(line: 105, column: 9, scope: !145)
!181 = !DILocation(line: 107, column: 1, scope: !116)
!182 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !113, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!183 = !DILocation(line: 32, column: 5, scope: !182)
!184 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 110, type: !17, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocalVariable(name: "data", scope: !184, file: !16, line: 112, type: !4)
!186 = !DILocation(line: 112, column: 15, scope: !184)
!187 = !DILocalVariable(name: "dataBadBuffer", scope: !184, file: !16, line: 113, type: !4)
!188 = !DILocation(line: 113, column: 15, scope: !184)
!189 = !DILocation(line: 113, column: 42, scope: !184)
!190 = !DILocation(line: 113, column: 31, scope: !184)
!191 = !DILocalVariable(name: "dataGoodBuffer", scope: !184, file: !16, line: 114, type: !4)
!192 = !DILocation(line: 114, column: 15, scope: !184)
!193 = !DILocation(line: 114, column: 43, scope: !184)
!194 = !DILocation(line: 114, column: 32, scope: !184)
!195 = !DILocation(line: 115, column: 13, scope: !184)
!196 = !DILocation(line: 115, column: 5, scope: !184)
!197 = !DILocation(line: 116, column: 5, scope: !184)
!198 = !DILocation(line: 116, column: 25, scope: !184)
!199 = !DILocation(line: 117, column: 13, scope: !184)
!200 = !DILocation(line: 117, column: 5, scope: !184)
!201 = !DILocation(line: 118, column: 5, scope: !184)
!202 = !DILocation(line: 118, column: 27, scope: !184)
!203 = !DILocation(line: 119, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !184, file: !16, line: 119, column: 8)
!205 = !DILocation(line: 119, column: 8, scope: !184)
!206 = !DILocation(line: 122, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !16, line: 120, column: 5)
!208 = !DILocation(line: 122, column: 14, scope: !207)
!209 = !DILocation(line: 123, column: 5, scope: !207)
!210 = !DILocalVariable(name: "i", scope: !211, file: !16, line: 125, type: !46)
!211 = distinct !DILexicalBlock(scope: !184, file: !16, line: 124, column: 5)
!212 = !DILocation(line: 125, column: 16, scope: !211)
!213 = !DILocalVariable(name: "destLen", scope: !211, file: !16, line: 125, type: !46)
!214 = !DILocation(line: 125, column: 19, scope: !211)
!215 = !DILocalVariable(name: "dest", scope: !211, file: !16, line: 126, type: !52)
!216 = !DILocation(line: 126, column: 17, scope: !211)
!217 = !DILocation(line: 127, column: 17, scope: !211)
!218 = !DILocation(line: 127, column: 9, scope: !211)
!219 = !DILocation(line: 128, column: 9, scope: !211)
!220 = !DILocation(line: 128, column: 21, scope: !211)
!221 = !DILocation(line: 129, column: 26, scope: !211)
!222 = !DILocation(line: 129, column: 19, scope: !211)
!223 = !DILocation(line: 129, column: 17, scope: !211)
!224 = !DILocation(line: 132, column: 16, scope: !225)
!225 = distinct !DILexicalBlock(scope: !211, file: !16, line: 132, column: 9)
!226 = !DILocation(line: 132, column: 14, scope: !225)
!227 = !DILocation(line: 132, column: 21, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !16, line: 132, column: 9)
!229 = !DILocation(line: 132, column: 25, scope: !228)
!230 = !DILocation(line: 132, column: 23, scope: !228)
!231 = !DILocation(line: 132, column: 9, scope: !225)
!232 = !DILocation(line: 134, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !16, line: 133, column: 9)
!234 = !DILocation(line: 134, column: 28, scope: !233)
!235 = !DILocation(line: 134, column: 18, scope: !233)
!236 = !DILocation(line: 134, column: 13, scope: !233)
!237 = !DILocation(line: 134, column: 21, scope: !233)
!238 = !DILocation(line: 135, column: 9, scope: !233)
!239 = !DILocation(line: 132, column: 35, scope: !228)
!240 = !DILocation(line: 132, column: 9, scope: !228)
!241 = distinct !{!241, !231, !242, !82}
!242 = !DILocation(line: 135, column: 9, scope: !225)
!243 = !DILocation(line: 136, column: 9, scope: !211)
!244 = !DILocation(line: 136, column: 21, scope: !211)
!245 = !DILocation(line: 137, column: 20, scope: !211)
!246 = !DILocation(line: 137, column: 9, scope: !211)
!247 = !DILocation(line: 139, column: 1, scope: !184)
