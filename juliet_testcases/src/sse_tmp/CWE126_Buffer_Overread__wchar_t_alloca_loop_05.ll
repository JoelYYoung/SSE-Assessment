; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %8 = load i32, i32* @staticTrue, align 4, !dbg !42
  %tobool = icmp ne i32 %8, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  store i32* %9, i32** %data, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx4, align 4, !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !66
  store i64 %call6, i64* %destLen, align 8, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !71
  %11 = load i64, i64* %destLen, align 8, !dbg !73
  %cmp = icmp ult i64 %10, %11, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !76
  %13 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !76
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !76
  %15 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !80
  store i32 %14, i32* %arrayidx8, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %16, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx9, align 4, !dbg !89
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* %arraydecay10), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_good() #0 !dbg !93 {
entry:
  call void @goodG2B1(), !dbg !94
  call void @goodG2B2(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = alloca i8, i64 200, align 16, !dbg !122
  %1 = bitcast i8* %0 to i32*, !dbg !123
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %2 = alloca i8, i64 400, align 16, !dbg !126
  %3 = bitcast i8* %2 to i32*, !dbg !127
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !125
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !128
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !129
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !132
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !133
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !134
  store i32 0, i32* %arrayidx2, align 4, !dbg !135
  %8 = load i32, i32* @staticFalse, align 4, !dbg !136
  %tobool = icmp ne i32 %8, 0, !dbg !136
  br i1 %tobool, label %if.then, label %if.else, !dbg !138

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
  %cmp = icmp ult i64 %10, %11, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !167
  %13 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !167
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !167
  %15 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !171
  store i32 %14, i32* %arrayidx8, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %16, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx9, align 4, !dbg !179
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  call void @printWLine(i32* %arraydecay10), !dbg !181
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
  %8 = load i32, i32* @staticTrue, align 4, !dbg !202
  %tobool = icmp ne i32 %8, 0, !dbg !202
  br i1 %tobool, label %if.then, label %if.end, !dbg !204

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !205
  store i32* %9, i32** %data, align 8, !dbg !207
  br label %if.end, !dbg !208

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !214, metadata !DIExpression()), !dbg !215
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !216
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !217
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !218
  store i32 0, i32* %arrayidx4, align 4, !dbg !219
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !220
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !221
  store i64 %call6, i64* %destLen, align 8, !dbg !222
  store i64 0, i64* %i, align 8, !dbg !223
  br label %for.cond, !dbg !225

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !226
  %11 = load i64, i64* %destLen, align 8, !dbg !228
  %cmp = icmp ult i64 %10, %11, !dbg !229
  br i1 %cmp, label %for.body, label %for.end, !dbg !230

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !231
  %13 = load i64, i64* %i, align 8, !dbg !233
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !231
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !231
  %15 = load i64, i64* %i, align 8, !dbg !234
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !235
  store i32 %14, i32* %arrayidx8, align 4, !dbg !236
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !238
  %inc = add i64 %16, 1, !dbg !238
  store i64 %inc, i64* %i, align 8, !dbg !238
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !242
  store i32 0, i32* %arrayidx9, align 4, !dbg !243
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !244
  call void @printWLine(i32* %arraydecay10), !dbg !245
  ret void, !dbg !246
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 42, scope: !21)
!29 = !DILocation(line: 33, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 34, type: !6)
!31 = !DILocation(line: 34, column: 15, scope: !21)
!32 = !DILocation(line: 34, column: 43, scope: !21)
!33 = !DILocation(line: 34, column: 32, scope: !21)
!34 = !DILocation(line: 35, column: 13, scope: !21)
!35 = !DILocation(line: 35, column: 5, scope: !21)
!36 = !DILocation(line: 36, column: 5, scope: !21)
!37 = !DILocation(line: 36, column: 25, scope: !21)
!38 = !DILocation(line: 37, column: 13, scope: !21)
!39 = !DILocation(line: 37, column: 5, scope: !21)
!40 = !DILocation(line: 38, column: 5, scope: !21)
!41 = !DILocation(line: 38, column: 27, scope: !21)
!42 = !DILocation(line: 39, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !21, file: !14, line: 39, column: 8)
!44 = !DILocation(line: 39, column: 8, scope: !21)
!45 = !DILocation(line: 42, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !14, line: 40, column: 5)
!47 = !DILocation(line: 42, column: 14, scope: !46)
!48 = !DILocation(line: 43, column: 5, scope: !46)
!49 = !DILocalVariable(name: "i", scope: !50, file: !14, line: 45, type: !51)
!50 = distinct !DILexicalBlock(scope: !21, file: !14, line: 44, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 45, column: 16, scope: !50)
!54 = !DILocalVariable(name: "destLen", scope: !50, file: !14, line: 45, type: !51)
!55 = !DILocation(line: 45, column: 19, scope: !50)
!56 = !DILocalVariable(name: "dest", scope: !50, file: !14, line: 46, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 46, column: 17, scope: !50)
!61 = !DILocation(line: 47, column: 17, scope: !50)
!62 = !DILocation(line: 47, column: 9, scope: !50)
!63 = !DILocation(line: 48, column: 9, scope: !50)
!64 = !DILocation(line: 48, column: 21, scope: !50)
!65 = !DILocation(line: 49, column: 26, scope: !50)
!66 = !DILocation(line: 49, column: 19, scope: !50)
!67 = !DILocation(line: 49, column: 17, scope: !50)
!68 = !DILocation(line: 52, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !50, file: !14, line: 52, column: 9)
!70 = !DILocation(line: 52, column: 14, scope: !69)
!71 = !DILocation(line: 52, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !14, line: 52, column: 9)
!73 = !DILocation(line: 52, column: 25, scope: !72)
!74 = !DILocation(line: 52, column: 23, scope: !72)
!75 = !DILocation(line: 52, column: 9, scope: !69)
!76 = !DILocation(line: 54, column: 23, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !14, line: 53, column: 9)
!78 = !DILocation(line: 54, column: 28, scope: !77)
!79 = !DILocation(line: 54, column: 18, scope: !77)
!80 = !DILocation(line: 54, column: 13, scope: !77)
!81 = !DILocation(line: 54, column: 21, scope: !77)
!82 = !DILocation(line: 55, column: 9, scope: !77)
!83 = !DILocation(line: 52, column: 35, scope: !72)
!84 = !DILocation(line: 52, column: 9, scope: !72)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 55, column: 9, scope: !69)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 56, column: 9, scope: !50)
!89 = !DILocation(line: 56, column: 21, scope: !50)
!90 = !DILocation(line: 57, column: 20, scope: !50)
!91 = !DILocation(line: 57, column: 9, scope: !50)
!92 = !DILocation(line: 59, column: 1, scope: !21)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_05_good", scope: !14, file: !14, line: 134, type: !22, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocation(line: 136, column: 5, scope: !93)
!95 = !DILocation(line: 137, column: 5, scope: !93)
!96 = !DILocation(line: 138, column: 1, scope: !93)
!97 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 150, type: !98, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{!9, !9, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !14, line: 150, type: !9)
!104 = !DILocation(line: 150, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !14, line: 150, type: !100)
!106 = !DILocation(line: 150, column: 27, scope: !97)
!107 = !DILocation(line: 153, column: 22, scope: !97)
!108 = !DILocation(line: 153, column: 12, scope: !97)
!109 = !DILocation(line: 153, column: 5, scope: !97)
!110 = !DILocation(line: 155, column: 5, scope: !97)
!111 = !DILocation(line: 156, column: 5, scope: !97)
!112 = !DILocation(line: 157, column: 5, scope: !97)
!113 = !DILocation(line: 160, column: 5, scope: !97)
!114 = !DILocation(line: 161, column: 5, scope: !97)
!115 = !DILocation(line: 162, column: 5, scope: !97)
!116 = !DILocation(line: 164, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !14, line: 68, type: !6)
!119 = !DILocation(line: 68, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !14, line: 69, type: !6)
!121 = !DILocation(line: 69, column: 15, scope: !117)
!122 = !DILocation(line: 69, column: 42, scope: !117)
!123 = !DILocation(line: 69, column: 31, scope: !117)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !14, line: 70, type: !6)
!125 = !DILocation(line: 70, column: 15, scope: !117)
!126 = !DILocation(line: 70, column: 43, scope: !117)
!127 = !DILocation(line: 70, column: 32, scope: !117)
!128 = !DILocation(line: 71, column: 13, scope: !117)
!129 = !DILocation(line: 71, column: 5, scope: !117)
!130 = !DILocation(line: 72, column: 5, scope: !117)
!131 = !DILocation(line: 72, column: 25, scope: !117)
!132 = !DILocation(line: 73, column: 13, scope: !117)
!133 = !DILocation(line: 73, column: 5, scope: !117)
!134 = !DILocation(line: 74, column: 5, scope: !117)
!135 = !DILocation(line: 74, column: 27, scope: !117)
!136 = !DILocation(line: 75, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !117, file: !14, line: 75, column: 8)
!138 = !DILocation(line: 75, column: 8, scope: !117)
!139 = !DILocation(line: 78, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !14, line: 76, column: 5)
!141 = !DILocation(line: 79, column: 5, scope: !140)
!142 = !DILocation(line: 83, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !14, line: 81, column: 5)
!144 = !DILocation(line: 83, column: 14, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !14, line: 86, type: !51)
!146 = distinct !DILexicalBlock(scope: !117, file: !14, line: 85, column: 5)
!147 = !DILocation(line: 86, column: 16, scope: !146)
!148 = !DILocalVariable(name: "destLen", scope: !146, file: !14, line: 86, type: !51)
!149 = !DILocation(line: 86, column: 19, scope: !146)
!150 = !DILocalVariable(name: "dest", scope: !146, file: !14, line: 87, type: !57)
!151 = !DILocation(line: 87, column: 17, scope: !146)
!152 = !DILocation(line: 88, column: 17, scope: !146)
!153 = !DILocation(line: 88, column: 9, scope: !146)
!154 = !DILocation(line: 89, column: 9, scope: !146)
!155 = !DILocation(line: 89, column: 21, scope: !146)
!156 = !DILocation(line: 90, column: 26, scope: !146)
!157 = !DILocation(line: 90, column: 19, scope: !146)
!158 = !DILocation(line: 90, column: 17, scope: !146)
!159 = !DILocation(line: 93, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !146, file: !14, line: 93, column: 9)
!161 = !DILocation(line: 93, column: 14, scope: !160)
!162 = !DILocation(line: 93, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !14, line: 93, column: 9)
!164 = !DILocation(line: 93, column: 25, scope: !163)
!165 = !DILocation(line: 93, column: 23, scope: !163)
!166 = !DILocation(line: 93, column: 9, scope: !160)
!167 = !DILocation(line: 95, column: 23, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !14, line: 94, column: 9)
!169 = !DILocation(line: 95, column: 28, scope: !168)
!170 = !DILocation(line: 95, column: 18, scope: !168)
!171 = !DILocation(line: 95, column: 13, scope: !168)
!172 = !DILocation(line: 95, column: 21, scope: !168)
!173 = !DILocation(line: 96, column: 9, scope: !168)
!174 = !DILocation(line: 93, column: 35, scope: !163)
!175 = !DILocation(line: 93, column: 9, scope: !163)
!176 = distinct !{!176, !166, !177, !87}
!177 = !DILocation(line: 96, column: 9, scope: !160)
!178 = !DILocation(line: 97, column: 9, scope: !146)
!179 = !DILocation(line: 97, column: 21, scope: !146)
!180 = !DILocation(line: 98, column: 20, scope: !146)
!181 = !DILocation(line: 98, column: 9, scope: !146)
!182 = !DILocation(line: 100, column: 1, scope: !117)
!183 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 103, type: !22, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!184 = !DILocalVariable(name: "data", scope: !183, file: !14, line: 105, type: !6)
!185 = !DILocation(line: 105, column: 15, scope: !183)
!186 = !DILocalVariable(name: "dataBadBuffer", scope: !183, file: !14, line: 106, type: !6)
!187 = !DILocation(line: 106, column: 15, scope: !183)
!188 = !DILocation(line: 106, column: 42, scope: !183)
!189 = !DILocation(line: 106, column: 31, scope: !183)
!190 = !DILocalVariable(name: "dataGoodBuffer", scope: !183, file: !14, line: 107, type: !6)
!191 = !DILocation(line: 107, column: 15, scope: !183)
!192 = !DILocation(line: 107, column: 43, scope: !183)
!193 = !DILocation(line: 107, column: 32, scope: !183)
!194 = !DILocation(line: 108, column: 13, scope: !183)
!195 = !DILocation(line: 108, column: 5, scope: !183)
!196 = !DILocation(line: 109, column: 5, scope: !183)
!197 = !DILocation(line: 109, column: 25, scope: !183)
!198 = !DILocation(line: 110, column: 13, scope: !183)
!199 = !DILocation(line: 110, column: 5, scope: !183)
!200 = !DILocation(line: 111, column: 5, scope: !183)
!201 = !DILocation(line: 111, column: 27, scope: !183)
!202 = !DILocation(line: 112, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !183, file: !14, line: 112, column: 8)
!204 = !DILocation(line: 112, column: 8, scope: !183)
!205 = !DILocation(line: 115, column: 16, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !14, line: 113, column: 5)
!207 = !DILocation(line: 115, column: 14, scope: !206)
!208 = !DILocation(line: 116, column: 5, scope: !206)
!209 = !DILocalVariable(name: "i", scope: !210, file: !14, line: 118, type: !51)
!210 = distinct !DILexicalBlock(scope: !183, file: !14, line: 117, column: 5)
!211 = !DILocation(line: 118, column: 16, scope: !210)
!212 = !DILocalVariable(name: "destLen", scope: !210, file: !14, line: 118, type: !51)
!213 = !DILocation(line: 118, column: 19, scope: !210)
!214 = !DILocalVariable(name: "dest", scope: !210, file: !14, line: 119, type: !57)
!215 = !DILocation(line: 119, column: 17, scope: !210)
!216 = !DILocation(line: 120, column: 17, scope: !210)
!217 = !DILocation(line: 120, column: 9, scope: !210)
!218 = !DILocation(line: 121, column: 9, scope: !210)
!219 = !DILocation(line: 121, column: 21, scope: !210)
!220 = !DILocation(line: 122, column: 26, scope: !210)
!221 = !DILocation(line: 122, column: 19, scope: !210)
!222 = !DILocation(line: 122, column: 17, scope: !210)
!223 = !DILocation(line: 125, column: 16, scope: !224)
!224 = distinct !DILexicalBlock(scope: !210, file: !14, line: 125, column: 9)
!225 = !DILocation(line: 125, column: 14, scope: !224)
!226 = !DILocation(line: 125, column: 21, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !14, line: 125, column: 9)
!228 = !DILocation(line: 125, column: 25, scope: !227)
!229 = !DILocation(line: 125, column: 23, scope: !227)
!230 = !DILocation(line: 125, column: 9, scope: !224)
!231 = !DILocation(line: 127, column: 23, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !14, line: 126, column: 9)
!233 = !DILocation(line: 127, column: 28, scope: !232)
!234 = !DILocation(line: 127, column: 18, scope: !232)
!235 = !DILocation(line: 127, column: 13, scope: !232)
!236 = !DILocation(line: 127, column: 21, scope: !232)
!237 = !DILocation(line: 128, column: 9, scope: !232)
!238 = !DILocation(line: 125, column: 35, scope: !227)
!239 = !DILocation(line: 125, column: 9, scope: !227)
!240 = distinct !{!240, !230, !241, !87}
!241 = !DILocation(line: 128, column: 9, scope: !224)
!242 = !DILocation(line: 129, column: 9, scope: !210)
!243 = !DILocation(line: 129, column: 21, scope: !210)
!244 = !DILocation(line: 130, column: 20, scope: !210)
!245 = !DILocation(line: 130, column: 9, scope: !210)
!246 = !DILocation(line: 132, column: 1, scope: !183)
