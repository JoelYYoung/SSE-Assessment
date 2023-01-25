; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_14_bad() #0 !dbg !15 {
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
  %8 = load i32, i32* @globalFive, align 4, !dbg !37
  %cmp = icmp eq i32 %8, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  store i32* %9, i32** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !58
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx4, align 4, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !62
  store i64 %call6, i64* %destLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !67
  %11 = load i64, i64* %destLen, align 8, !dbg !69
  %cmp7 = icmp ult i64 %10, %11, !dbg !70
  br i1 %cmp7, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !72
  %13 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !72
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !72
  %15 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !76
  store i32 %14, i32* %arrayidx9, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %16, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx10, align 4, !dbg !85
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  call void @printWLine(i32* %arraydecay11), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_14_good() #0 !dbg !89 {
entry:
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_14_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_14_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 200, align 16, !dbg !118
  %1 = bitcast i8* %0 to i32*, !dbg !119
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 400, align 16, !dbg !122
  %3 = bitcast i8* %2 to i32*, !dbg !123
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !121
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !124
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !125
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !129
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !130
  store i32 0, i32* %arrayidx2, align 4, !dbg !131
  %8 = load i32, i32* @globalFive, align 4, !dbg !132
  %cmp = icmp ne i32 %8, 5, !dbg !134
  br i1 %cmp, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !136
  br label %if.end, !dbg !138

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !139
  store i32* %9, i32** %data, align 8, !dbg !141
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !150
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx4, align 4, !dbg !152
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !154
  store i64 %call6, i64* %destLen, align 8, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !159
  %11 = load i64, i64* %destLen, align 8, !dbg !161
  %cmp7 = icmp ult i64 %10, %11, !dbg !162
  br i1 %cmp7, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !164
  %13 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !164
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !164
  %15 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !168
  store i32 %14, i32* %arrayidx9, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %16, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !175
  store i32 0, i32* %arrayidx10, align 4, !dbg !176
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !177
  call void @printWLine(i32* %arraydecay11), !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !183, metadata !DIExpression()), !dbg !184
  %0 = alloca i8, i64 200, align 16, !dbg !185
  %1 = bitcast i8* %0 to i32*, !dbg !186
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !184
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !187, metadata !DIExpression()), !dbg !188
  %2 = alloca i8, i64 400, align 16, !dbg !189
  %3 = bitcast i8* %2 to i32*, !dbg !190
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !188
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !191
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !192
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !193
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !193
  store i32 0, i32* %arrayidx, align 4, !dbg !194
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !195
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !196
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !197
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !197
  store i32 0, i32* %arrayidx2, align 4, !dbg !198
  %8 = load i32, i32* @globalFive, align 4, !dbg !199
  %cmp = icmp eq i32 %8, 5, !dbg !201
  br i1 %cmp, label %if.then, label %if.end, !dbg !202

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !203
  store i32* %9, i32** %data, align 8, !dbg !205
  br label %if.end, !dbg !206

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !212, metadata !DIExpression()), !dbg !213
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !214
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !215
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !216
  store i32 0, i32* %arrayidx4, align 4, !dbg !217
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !218
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !219
  store i64 %call6, i64* %destLen, align 8, !dbg !220
  store i64 0, i64* %i, align 8, !dbg !221
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !224
  %11 = load i64, i64* %destLen, align 8, !dbg !226
  %cmp7 = icmp ult i64 %10, %11, !dbg !227
  br i1 %cmp7, label %for.body, label %for.end, !dbg !228

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !229
  %13 = load i64, i64* %i, align 8, !dbg !231
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !229
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !229
  %15 = load i64, i64* %i, align 8, !dbg !232
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !233
  store i32 %14, i32* %arrayidx9, align 4, !dbg !234
  br label %for.inc, !dbg !235

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !236
  %inc = add i64 %16, 1, !dbg !236
  store i64 %inc, i64* %i, align 8, !dbg !236
  br label %for.cond, !dbg !237, !llvm.loop !238

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !240
  store i32 0, i32* %arrayidx10, align 4, !dbg !241
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !242
  call void @printWLine(i32* %arraydecay11), !dbg !243
  ret void, !dbg !244
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!39 = !DILocation(line: 32, column: 18, scope: !38)
!40 = !DILocation(line: 32, column: 8, scope: !15)
!41 = !DILocation(line: 35, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !16, line: 33, column: 5)
!43 = !DILocation(line: 35, column: 14, scope: !42)
!44 = !DILocation(line: 36, column: 5, scope: !42)
!45 = !DILocalVariable(name: "i", scope: !46, file: !16, line: 38, type: !47)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 38, column: 16, scope: !46)
!50 = !DILocalVariable(name: "destLen", scope: !46, file: !16, line: 38, type: !47)
!51 = !DILocation(line: 38, column: 19, scope: !46)
!52 = !DILocalVariable(name: "dest", scope: !46, file: !16, line: 39, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 39, column: 17, scope: !46)
!57 = !DILocation(line: 40, column: 17, scope: !46)
!58 = !DILocation(line: 40, column: 9, scope: !46)
!59 = !DILocation(line: 41, column: 9, scope: !46)
!60 = !DILocation(line: 41, column: 21, scope: !46)
!61 = !DILocation(line: 42, column: 26, scope: !46)
!62 = !DILocation(line: 42, column: 19, scope: !46)
!63 = !DILocation(line: 42, column: 17, scope: !46)
!64 = !DILocation(line: 45, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !46, file: !16, line: 45, column: 9)
!66 = !DILocation(line: 45, column: 14, scope: !65)
!67 = !DILocation(line: 45, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !16, line: 45, column: 9)
!69 = !DILocation(line: 45, column: 25, scope: !68)
!70 = !DILocation(line: 45, column: 23, scope: !68)
!71 = !DILocation(line: 45, column: 9, scope: !65)
!72 = !DILocation(line: 47, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !16, line: 46, column: 9)
!74 = !DILocation(line: 47, column: 28, scope: !73)
!75 = !DILocation(line: 47, column: 18, scope: !73)
!76 = !DILocation(line: 47, column: 13, scope: !73)
!77 = !DILocation(line: 47, column: 21, scope: !73)
!78 = !DILocation(line: 48, column: 9, scope: !73)
!79 = !DILocation(line: 45, column: 35, scope: !68)
!80 = !DILocation(line: 45, column: 9, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 48, column: 9, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 49, column: 9, scope: !46)
!85 = !DILocation(line: 49, column: 21, scope: !46)
!86 = !DILocation(line: 50, column: 20, scope: !46)
!87 = !DILocation(line: 50, column: 9, scope: !46)
!88 = !DILocation(line: 52, column: 1, scope: !15)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_14_good", scope: !16, file: !16, line: 127, type: !17, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 129, column: 5, scope: !89)
!91 = !DILocation(line: 130, column: 5, scope: !89)
!92 = !DILocation(line: 131, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 143, type: !94, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!7, !7, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !16, line: 143, type: !7)
!100 = !DILocation(line: 143, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !16, line: 143, type: !96)
!102 = !DILocation(line: 143, column: 27, scope: !93)
!103 = !DILocation(line: 146, column: 22, scope: !93)
!104 = !DILocation(line: 146, column: 12, scope: !93)
!105 = !DILocation(line: 146, column: 5, scope: !93)
!106 = !DILocation(line: 148, column: 5, scope: !93)
!107 = !DILocation(line: 149, column: 5, scope: !93)
!108 = !DILocation(line: 150, column: 5, scope: !93)
!109 = !DILocation(line: 153, column: 5, scope: !93)
!110 = !DILocation(line: 154, column: 5, scope: !93)
!111 = !DILocation(line: 155, column: 5, scope: !93)
!112 = !DILocation(line: 157, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !16, line: 61, type: !4)
!115 = !DILocation(line: 61, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !16, line: 62, type: !4)
!117 = !DILocation(line: 62, column: 15, scope: !113)
!118 = !DILocation(line: 62, column: 42, scope: !113)
!119 = !DILocation(line: 62, column: 31, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !16, line: 63, type: !4)
!121 = !DILocation(line: 63, column: 15, scope: !113)
!122 = !DILocation(line: 63, column: 43, scope: !113)
!123 = !DILocation(line: 63, column: 32, scope: !113)
!124 = !DILocation(line: 64, column: 13, scope: !113)
!125 = !DILocation(line: 64, column: 5, scope: !113)
!126 = !DILocation(line: 65, column: 5, scope: !113)
!127 = !DILocation(line: 65, column: 25, scope: !113)
!128 = !DILocation(line: 66, column: 13, scope: !113)
!129 = !DILocation(line: 66, column: 5, scope: !113)
!130 = !DILocation(line: 67, column: 5, scope: !113)
!131 = !DILocation(line: 67, column: 27, scope: !113)
!132 = !DILocation(line: 68, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !113, file: !16, line: 68, column: 8)
!134 = !DILocation(line: 68, column: 18, scope: !133)
!135 = !DILocation(line: 68, column: 8, scope: !113)
!136 = !DILocation(line: 71, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !16, line: 69, column: 5)
!138 = !DILocation(line: 72, column: 5, scope: !137)
!139 = !DILocation(line: 76, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !16, line: 74, column: 5)
!141 = !DILocation(line: 76, column: 14, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !16, line: 79, type: !47)
!143 = distinct !DILexicalBlock(scope: !113, file: !16, line: 78, column: 5)
!144 = !DILocation(line: 79, column: 16, scope: !143)
!145 = !DILocalVariable(name: "destLen", scope: !143, file: !16, line: 79, type: !47)
!146 = !DILocation(line: 79, column: 19, scope: !143)
!147 = !DILocalVariable(name: "dest", scope: !143, file: !16, line: 80, type: !53)
!148 = !DILocation(line: 80, column: 17, scope: !143)
!149 = !DILocation(line: 81, column: 17, scope: !143)
!150 = !DILocation(line: 81, column: 9, scope: !143)
!151 = !DILocation(line: 82, column: 9, scope: !143)
!152 = !DILocation(line: 82, column: 21, scope: !143)
!153 = !DILocation(line: 83, column: 26, scope: !143)
!154 = !DILocation(line: 83, column: 19, scope: !143)
!155 = !DILocation(line: 83, column: 17, scope: !143)
!156 = !DILocation(line: 86, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !143, file: !16, line: 86, column: 9)
!158 = !DILocation(line: 86, column: 14, scope: !157)
!159 = !DILocation(line: 86, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !16, line: 86, column: 9)
!161 = !DILocation(line: 86, column: 25, scope: !160)
!162 = !DILocation(line: 86, column: 23, scope: !160)
!163 = !DILocation(line: 86, column: 9, scope: !157)
!164 = !DILocation(line: 88, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !16, line: 87, column: 9)
!166 = !DILocation(line: 88, column: 28, scope: !165)
!167 = !DILocation(line: 88, column: 18, scope: !165)
!168 = !DILocation(line: 88, column: 13, scope: !165)
!169 = !DILocation(line: 88, column: 21, scope: !165)
!170 = !DILocation(line: 89, column: 9, scope: !165)
!171 = !DILocation(line: 86, column: 35, scope: !160)
!172 = !DILocation(line: 86, column: 9, scope: !160)
!173 = distinct !{!173, !163, !174, !83}
!174 = !DILocation(line: 89, column: 9, scope: !157)
!175 = !DILocation(line: 90, column: 9, scope: !143)
!176 = !DILocation(line: 90, column: 21, scope: !143)
!177 = !DILocation(line: 91, column: 20, scope: !143)
!178 = !DILocation(line: 91, column: 9, scope: !143)
!179 = !DILocation(line: 93, column: 1, scope: !113)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 96, type: !17, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "data", scope: !180, file: !16, line: 98, type: !4)
!182 = !DILocation(line: 98, column: 15, scope: !180)
!183 = !DILocalVariable(name: "dataBadBuffer", scope: !180, file: !16, line: 99, type: !4)
!184 = !DILocation(line: 99, column: 15, scope: !180)
!185 = !DILocation(line: 99, column: 42, scope: !180)
!186 = !DILocation(line: 99, column: 31, scope: !180)
!187 = !DILocalVariable(name: "dataGoodBuffer", scope: !180, file: !16, line: 100, type: !4)
!188 = !DILocation(line: 100, column: 15, scope: !180)
!189 = !DILocation(line: 100, column: 43, scope: !180)
!190 = !DILocation(line: 100, column: 32, scope: !180)
!191 = !DILocation(line: 101, column: 13, scope: !180)
!192 = !DILocation(line: 101, column: 5, scope: !180)
!193 = !DILocation(line: 102, column: 5, scope: !180)
!194 = !DILocation(line: 102, column: 25, scope: !180)
!195 = !DILocation(line: 103, column: 13, scope: !180)
!196 = !DILocation(line: 103, column: 5, scope: !180)
!197 = !DILocation(line: 104, column: 5, scope: !180)
!198 = !DILocation(line: 104, column: 27, scope: !180)
!199 = !DILocation(line: 105, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !180, file: !16, line: 105, column: 8)
!201 = !DILocation(line: 105, column: 18, scope: !200)
!202 = !DILocation(line: 105, column: 8, scope: !180)
!203 = !DILocation(line: 108, column: 16, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !16, line: 106, column: 5)
!205 = !DILocation(line: 108, column: 14, scope: !204)
!206 = !DILocation(line: 109, column: 5, scope: !204)
!207 = !DILocalVariable(name: "i", scope: !208, file: !16, line: 111, type: !47)
!208 = distinct !DILexicalBlock(scope: !180, file: !16, line: 110, column: 5)
!209 = !DILocation(line: 111, column: 16, scope: !208)
!210 = !DILocalVariable(name: "destLen", scope: !208, file: !16, line: 111, type: !47)
!211 = !DILocation(line: 111, column: 19, scope: !208)
!212 = !DILocalVariable(name: "dest", scope: !208, file: !16, line: 112, type: !53)
!213 = !DILocation(line: 112, column: 17, scope: !208)
!214 = !DILocation(line: 113, column: 17, scope: !208)
!215 = !DILocation(line: 113, column: 9, scope: !208)
!216 = !DILocation(line: 114, column: 9, scope: !208)
!217 = !DILocation(line: 114, column: 21, scope: !208)
!218 = !DILocation(line: 115, column: 26, scope: !208)
!219 = !DILocation(line: 115, column: 19, scope: !208)
!220 = !DILocation(line: 115, column: 17, scope: !208)
!221 = !DILocation(line: 118, column: 16, scope: !222)
!222 = distinct !DILexicalBlock(scope: !208, file: !16, line: 118, column: 9)
!223 = !DILocation(line: 118, column: 14, scope: !222)
!224 = !DILocation(line: 118, column: 21, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !16, line: 118, column: 9)
!226 = !DILocation(line: 118, column: 25, scope: !225)
!227 = !DILocation(line: 118, column: 23, scope: !225)
!228 = !DILocation(line: 118, column: 9, scope: !222)
!229 = !DILocation(line: 120, column: 23, scope: !230)
!230 = distinct !DILexicalBlock(scope: !225, file: !16, line: 119, column: 9)
!231 = !DILocation(line: 120, column: 28, scope: !230)
!232 = !DILocation(line: 120, column: 18, scope: !230)
!233 = !DILocation(line: 120, column: 13, scope: !230)
!234 = !DILocation(line: 120, column: 21, scope: !230)
!235 = !DILocation(line: 121, column: 9, scope: !230)
!236 = !DILocation(line: 118, column: 35, scope: !225)
!237 = !DILocation(line: 118, column: 9, scope: !225)
!238 = distinct !{!238, !228, !239, !83}
!239 = !DILocation(line: 121, column: 9, scope: !222)
!240 = !DILocation(line: 122, column: 9, scope: !208)
!241 = !DILocation(line: 122, column: 21, scope: !208)
!242 = !DILocation(line: 123, column: 20, scope: !208)
!243 = !DILocation(line: 123, column: 9, scope: !208)
!244 = !DILocation(line: 125, column: 1, scope: !180)
