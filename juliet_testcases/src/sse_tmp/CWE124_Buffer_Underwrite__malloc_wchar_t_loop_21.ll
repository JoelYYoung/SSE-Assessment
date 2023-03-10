; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %1, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !57
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !58
  store i32 %3, i32* %arrayidx3, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %6, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !67
  store i32 0, i32* %arrayidx4, align 4, !dbg !68
  %8 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %8), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !72 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* @badStatic, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.end3, !dbg !79

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !84
  %1 = bitcast i8* %call to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !93
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !97
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !98
  br label %if.end3, !dbg !99

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !100
  ret i32* %6, !dbg !101
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21_good() #0 !dbg !102 {
entry:
  call void @goodG2B1(), !dbg !103
  call void @goodG2B2(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !106 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call i64 @time(i64* null) #5, !dbg !116
  %conv = trunc i64 %call to i32, !dbg !117
  call void @srand(i32 %conv) #5, !dbg !118
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !119
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21_good(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !122
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21_bad(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !126 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i32* null, i32** %data, align 8, !dbg !129
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !130
  %0 = load i32*, i32** %data, align 8, !dbg !131
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !132
  store i32* %call, i32** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !140
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !146
  %cmp = icmp ult i64 %1, 100, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !152
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !152
  %4 = load i32*, i32** %data, align 8, !dbg !153
  %5 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !153
  store i32 %3, i32* %arrayidx3, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %6, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !161
  store i32 0, i32* %arrayidx4, align 4, !dbg !162
  %8 = load i32*, i32** %data, align 8, !dbg !163
  call void @printWLine(i32* %8), !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !166 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !167, metadata !DIExpression()), !dbg !168
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !169
  %tobool = icmp ne i32 %0, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.else, !dbg !171

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !172
  br label %if.end3, !dbg !174

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !175, metadata !DIExpression()), !dbg !178
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !179
  %1 = bitcast i8* %call to i32*, !dbg !180
  store i32* %1, i32** %dataBuffer, align 8, !dbg !178
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !181
  %cmp = icmp eq i32* %2, null, !dbg !183
  br i1 %cmp, label %if.then1, label %if.end, !dbg !184

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !187
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !188
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !191
  store i32* %5, i32** %data.addr, align 8, !dbg !192
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data.addr, align 8, !dbg !193
  ret i32* %6, !dbg !194
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !195 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !196, metadata !DIExpression()), !dbg !197
  store i32* null, i32** %data, align 8, !dbg !198
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !199
  %0 = load i32*, i32** %data, align 8, !dbg !200
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !201
  store i32* %call, i32** %data, align 8, !dbg !202
  call void @llvm.dbg.declare(metadata i64* %i, metadata !203, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !206, metadata !DIExpression()), !dbg !207
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !208
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !209
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !210
  store i32 0, i32* %arrayidx, align 4, !dbg !211
  store i64 0, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !215
  %cmp = icmp ult i64 %1, 100, !dbg !217
  br i1 %cmp, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !221
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !221
  %4 = load i32*, i32** %data, align 8, !dbg !222
  %5 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !222
  store i32 %3, i32* %arrayidx3, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !226
  %inc = add i64 %6, 1, !dbg !226
  store i64 %inc, i64* %i, align 8, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !230
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !230
  store i32 0, i32* %arrayidx4, align 4, !dbg !231
  %8 = load i32*, i32** %data, align 8, !dbg !232
  call void @printWLine(i32* %8), !dbg !233
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !235 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !236, metadata !DIExpression()), !dbg !237
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !238
  %tobool = icmp ne i32 %0, 0, !dbg !238
  br i1 %tobool, label %if.then, label %if.end3, !dbg !240

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !241, metadata !DIExpression()), !dbg !244
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !245
  %1 = bitcast i8* %call to i32*, !dbg !246
  store i32* %1, i32** %dataBuffer, align 8, !dbg !244
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !247
  %cmp = icmp eq i32* %2, null, !dbg !249
  br i1 %cmp, label %if.then1, label %if.end, !dbg !250

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !251
  unreachable, !dbg !251

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !253
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !254
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !255
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !255
  store i32 0, i32* %arrayidx, align 4, !dbg !256
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !257
  store i32* %5, i32** %data.addr, align 8, !dbg !258
  br label %if.end3, !dbg !259

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !260
  ret i32* %6, !dbg !261
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 71, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 72, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 49, column: 16, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 50, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 50, column: 17, scope: !35)
!44 = !DILocation(line: 51, column: 17, scope: !35)
!45 = !DILocation(line: 51, column: 9, scope: !35)
!46 = !DILocation(line: 52, column: 9, scope: !35)
!47 = !DILocation(line: 52, column: 23, scope: !35)
!48 = !DILocation(line: 54, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !15, line: 54, column: 9)
!50 = !DILocation(line: 54, column: 14, scope: !49)
!51 = !DILocation(line: 54, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 54, column: 9)
!53 = !DILocation(line: 54, column: 23, scope: !52)
!54 = !DILocation(line: 54, column: 9, scope: !49)
!55 = !DILocation(line: 56, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 55, column: 9)
!57 = !DILocation(line: 56, column: 23, scope: !56)
!58 = !DILocation(line: 56, column: 13, scope: !56)
!59 = !DILocation(line: 56, column: 18, scope: !56)
!60 = !DILocation(line: 56, column: 21, scope: !56)
!61 = !DILocation(line: 57, column: 9, scope: !56)
!62 = !DILocation(line: 54, column: 31, scope: !52)
!63 = !DILocation(line: 54, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 57, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 59, column: 9, scope: !35)
!68 = !DILocation(line: 59, column: 21, scope: !35)
!69 = !DILocation(line: 60, column: 20, scope: !35)
!70 = !DILocation(line: 60, column: 9, scope: !35)
!71 = !DILocation(line: 64, column: 1, scope: !24)
!72 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !73, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7}
!75 = !DILocalVariable(name: "data", arg: 1, scope: !72, file: !15, line: 26, type: !7)
!76 = !DILocation(line: 26, column: 38, scope: !72)
!77 = !DILocation(line: 28, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !15, line: 28, column: 8)
!79 = !DILocation(line: 28, column: 8, scope: !72)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !15, line: 31, type: !7)
!81 = distinct !DILexicalBlock(scope: !82, file: !15, line: 30, column: 9)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 29, column: 5)
!83 = !DILocation(line: 31, column: 23, scope: !81)
!84 = !DILocation(line: 31, column: 47, scope: !81)
!85 = !DILocation(line: 31, column: 36, scope: !81)
!86 = !DILocation(line: 32, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !15, line: 32, column: 17)
!88 = !DILocation(line: 32, column: 28, scope: !87)
!89 = !DILocation(line: 32, column: 17, scope: !81)
!90 = !DILocation(line: 32, column: 38, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 32, column: 37)
!92 = !DILocation(line: 33, column: 21, scope: !81)
!93 = !DILocation(line: 33, column: 13, scope: !81)
!94 = !DILocation(line: 34, column: 13, scope: !81)
!95 = !DILocation(line: 34, column: 31, scope: !81)
!96 = !DILocation(line: 36, column: 20, scope: !81)
!97 = !DILocation(line: 36, column: 31, scope: !81)
!98 = !DILocation(line: 36, column: 18, scope: !81)
!99 = !DILocation(line: 38, column: 5, scope: !82)
!100 = !DILocation(line: 39, column: 12, scope: !72)
!101 = !DILocation(line: 39, column: 5, scope: !72)
!102 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_21_good", scope: !15, file: !15, line: 161, type: !25, scopeLine: 162, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocation(line: 163, column: 5, scope: !102)
!104 = !DILocation(line: 164, column: 5, scope: !102)
!105 = !DILocation(line: 165, column: 1, scope: !102)
!106 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 177, type: !107, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DISubroutineType(types: !108)
!108 = !{!10, !10, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !106, file: !15, line: 177, type: !10)
!113 = !DILocation(line: 177, column: 14, scope: !106)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !106, file: !15, line: 177, type: !109)
!115 = !DILocation(line: 177, column: 27, scope: !106)
!116 = !DILocation(line: 180, column: 22, scope: !106)
!117 = !DILocation(line: 180, column: 12, scope: !106)
!118 = !DILocation(line: 180, column: 5, scope: !106)
!119 = !DILocation(line: 182, column: 5, scope: !106)
!120 = !DILocation(line: 183, column: 5, scope: !106)
!121 = !DILocation(line: 184, column: 5, scope: !106)
!122 = !DILocation(line: 187, column: 5, scope: !106)
!123 = !DILocation(line: 188, column: 5, scope: !106)
!124 = !DILocation(line: 189, column: 5, scope: !106)
!125 = !DILocation(line: 191, column: 5, scope: !106)
!126 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 96, type: !25, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 98, type: !7)
!128 = !DILocation(line: 98, column: 15, scope: !126)
!129 = !DILocation(line: 99, column: 10, scope: !126)
!130 = !DILocation(line: 100, column: 20, scope: !126)
!131 = !DILocation(line: 101, column: 27, scope: !126)
!132 = !DILocation(line: 101, column: 12, scope: !126)
!133 = !DILocation(line: 101, column: 10, scope: !126)
!134 = !DILocalVariable(name: "i", scope: !135, file: !15, line: 103, type: !36)
!135 = distinct !DILexicalBlock(scope: !126, file: !15, line: 102, column: 5)
!136 = !DILocation(line: 103, column: 16, scope: !135)
!137 = !DILocalVariable(name: "source", scope: !135, file: !15, line: 104, type: !40)
!138 = !DILocation(line: 104, column: 17, scope: !135)
!139 = !DILocation(line: 105, column: 17, scope: !135)
!140 = !DILocation(line: 105, column: 9, scope: !135)
!141 = !DILocation(line: 106, column: 9, scope: !135)
!142 = !DILocation(line: 106, column: 23, scope: !135)
!143 = !DILocation(line: 108, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !135, file: !15, line: 108, column: 9)
!145 = !DILocation(line: 108, column: 14, scope: !144)
!146 = !DILocation(line: 108, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 108, column: 9)
!148 = !DILocation(line: 108, column: 23, scope: !147)
!149 = !DILocation(line: 108, column: 9, scope: !144)
!150 = !DILocation(line: 110, column: 30, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 109, column: 9)
!152 = !DILocation(line: 110, column: 23, scope: !151)
!153 = !DILocation(line: 110, column: 13, scope: !151)
!154 = !DILocation(line: 110, column: 18, scope: !151)
!155 = !DILocation(line: 110, column: 21, scope: !151)
!156 = !DILocation(line: 111, column: 9, scope: !151)
!157 = !DILocation(line: 108, column: 31, scope: !147)
!158 = !DILocation(line: 108, column: 9, scope: !147)
!159 = distinct !{!159, !149, !160, !66}
!160 = !DILocation(line: 111, column: 9, scope: !144)
!161 = !DILocation(line: 113, column: 9, scope: !135)
!162 = !DILocation(line: 113, column: 21, scope: !135)
!163 = !DILocation(line: 114, column: 20, scope: !135)
!164 = !DILocation(line: 114, column: 9, scope: !135)
!165 = !DILocation(line: 118, column: 1, scope: !126)
!166 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 75, type: !73, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", arg: 1, scope: !166, file: !15, line: 75, type: !7)
!168 = !DILocation(line: 75, column: 43, scope: !166)
!169 = !DILocation(line: 77, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 77, column: 8)
!171 = !DILocation(line: 77, column: 8, scope: !166)
!172 = !DILocation(line: 80, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !15, line: 78, column: 5)
!174 = !DILocation(line: 81, column: 5, scope: !173)
!175 = !DILocalVariable(name: "dataBuffer", scope: !176, file: !15, line: 85, type: !7)
!176 = distinct !DILexicalBlock(scope: !177, file: !15, line: 84, column: 9)
!177 = distinct !DILexicalBlock(scope: !170, file: !15, line: 83, column: 5)
!178 = !DILocation(line: 85, column: 23, scope: !176)
!179 = !DILocation(line: 85, column: 47, scope: !176)
!180 = !DILocation(line: 85, column: 36, scope: !176)
!181 = !DILocation(line: 86, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !15, line: 86, column: 17)
!183 = !DILocation(line: 86, column: 28, scope: !182)
!184 = !DILocation(line: 86, column: 17, scope: !176)
!185 = !DILocation(line: 86, column: 38, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 86, column: 37)
!187 = !DILocation(line: 87, column: 21, scope: !176)
!188 = !DILocation(line: 87, column: 13, scope: !176)
!189 = !DILocation(line: 88, column: 13, scope: !176)
!190 = !DILocation(line: 88, column: 31, scope: !176)
!191 = !DILocation(line: 90, column: 20, scope: !176)
!192 = !DILocation(line: 90, column: 18, scope: !176)
!193 = !DILocation(line: 93, column: 12, scope: !166)
!194 = !DILocation(line: 93, column: 5, scope: !166)
!195 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 137, type: !25, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!196 = !DILocalVariable(name: "data", scope: !195, file: !15, line: 139, type: !7)
!197 = !DILocation(line: 139, column: 15, scope: !195)
!198 = !DILocation(line: 140, column: 10, scope: !195)
!199 = !DILocation(line: 141, column: 20, scope: !195)
!200 = !DILocation(line: 142, column: 27, scope: !195)
!201 = !DILocation(line: 142, column: 12, scope: !195)
!202 = !DILocation(line: 142, column: 10, scope: !195)
!203 = !DILocalVariable(name: "i", scope: !204, file: !15, line: 144, type: !36)
!204 = distinct !DILexicalBlock(scope: !195, file: !15, line: 143, column: 5)
!205 = !DILocation(line: 144, column: 16, scope: !204)
!206 = !DILocalVariable(name: "source", scope: !204, file: !15, line: 145, type: !40)
!207 = !DILocation(line: 145, column: 17, scope: !204)
!208 = !DILocation(line: 146, column: 17, scope: !204)
!209 = !DILocation(line: 146, column: 9, scope: !204)
!210 = !DILocation(line: 147, column: 9, scope: !204)
!211 = !DILocation(line: 147, column: 23, scope: !204)
!212 = !DILocation(line: 149, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !204, file: !15, line: 149, column: 9)
!214 = !DILocation(line: 149, column: 14, scope: !213)
!215 = !DILocation(line: 149, column: 21, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 149, column: 9)
!217 = !DILocation(line: 149, column: 23, scope: !216)
!218 = !DILocation(line: 149, column: 9, scope: !213)
!219 = !DILocation(line: 151, column: 30, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 150, column: 9)
!221 = !DILocation(line: 151, column: 23, scope: !220)
!222 = !DILocation(line: 151, column: 13, scope: !220)
!223 = !DILocation(line: 151, column: 18, scope: !220)
!224 = !DILocation(line: 151, column: 21, scope: !220)
!225 = !DILocation(line: 152, column: 9, scope: !220)
!226 = !DILocation(line: 149, column: 31, scope: !216)
!227 = !DILocation(line: 149, column: 9, scope: !216)
!228 = distinct !{!228, !218, !229, !66}
!229 = !DILocation(line: 152, column: 9, scope: !213)
!230 = !DILocation(line: 154, column: 9, scope: !204)
!231 = !DILocation(line: 154, column: 21, scope: !204)
!232 = !DILocation(line: 155, column: 20, scope: !204)
!233 = !DILocation(line: 155, column: 9, scope: !204)
!234 = !DILocation(line: 159, column: 1, scope: !195)
!235 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 121, type: !73, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DILocalVariable(name: "data", arg: 1, scope: !235, file: !15, line: 121, type: !7)
!237 = !DILocation(line: 121, column: 43, scope: !235)
!238 = !DILocation(line: 123, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 123, column: 8)
!240 = !DILocation(line: 123, column: 8, scope: !235)
!241 = !DILocalVariable(name: "dataBuffer", scope: !242, file: !15, line: 126, type: !7)
!242 = distinct !DILexicalBlock(scope: !243, file: !15, line: 125, column: 9)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 124, column: 5)
!244 = !DILocation(line: 126, column: 23, scope: !242)
!245 = !DILocation(line: 126, column: 47, scope: !242)
!246 = !DILocation(line: 126, column: 36, scope: !242)
!247 = !DILocation(line: 127, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !242, file: !15, line: 127, column: 17)
!249 = !DILocation(line: 127, column: 28, scope: !248)
!250 = !DILocation(line: 127, column: 17, scope: !242)
!251 = !DILocation(line: 127, column: 38, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 127, column: 37)
!253 = !DILocation(line: 128, column: 21, scope: !242)
!254 = !DILocation(line: 128, column: 13, scope: !242)
!255 = !DILocation(line: 129, column: 13, scope: !242)
!256 = !DILocation(line: 129, column: 31, scope: !242)
!257 = !DILocation(line: 131, column: 20, scope: !242)
!258 = !DILocation(line: 131, column: 18, scope: !242)
!259 = !DILocation(line: 133, column: 5, scope: !243)
!260 = !DILocation(line: 134, column: 12, scope: !235)
!261 = !DILocation(line: 134, column: 5, scope: !235)
