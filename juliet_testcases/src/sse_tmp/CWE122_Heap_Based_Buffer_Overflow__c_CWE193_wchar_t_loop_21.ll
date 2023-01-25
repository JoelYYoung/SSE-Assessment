; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_bad.source to i8*), i64 44, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call1 = call i64 @wcslen(i32* %arraydecay) #7, !dbg !47
  store i64 %call1, i64* %sourceLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !52
  %3 = load i64, i64* %sourceLen, align 8, !dbg !54
  %add = add i64 %3, 1, !dbg !55
  %cmp = icmp ult i64 %2, %add, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i32, i32* %arrayidx, align 4, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !61
  store i32 %5, i32* %arrayidx2, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %9), !dbg !71
  %10 = load i32*, i32** %data, align 8, !dbg !72
  %11 = bitcast i32* %10 to i8*, !dbg !72
  call void @free(i8* %11) #8, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i32, i32* @badStatic, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.end2, !dbg !82

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !83
  %1 = bitcast i8* %call to i32*, !dbg !85
  store i32* %1, i32** %data.addr, align 8, !dbg !86
  %2 = load i32*, i32** %data.addr, align 8, !dbg !87
  %cmp = icmp eq i32* %2, null, !dbg !89
  br i1 %cmp, label %if.then1, label %if.end, !dbg !90

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !93

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !94
  ret i32* %3, !dbg !95
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_good() #0 !dbg !96 {
entry:
  call void @goodG2B1(), !dbg !97
  call void @goodG2B2(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #8, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #8, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32* null, i32** %data, align 8, !dbg !123
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !124
  %0 = load i32*, i32** %data, align 8, !dbg !125
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !126
  store i32* %call, i32** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call1 = call i64 @wcslen(i32* %arraydecay) #7, !dbg !136
  store i64 %call1, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !141
  %3 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %3, 1, !dbg !144
  %cmp = icmp ult i64 %2, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !149
  %5 = load i32, i32* %arrayidx, align 4, !dbg !149
  %6 = load i32*, i32** %data, align 8, !dbg !150
  %7 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !150
  store i32 %5, i32* %arrayidx2, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %8, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %9), !dbg !159
  %10 = load i32*, i32** %data, align 8, !dbg !160
  %11 = bitcast i32* %10 to i8*, !dbg !160
  call void @free(i8* %11) #8, !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !163 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !166
  %tobool = icmp ne i32 %0, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.else, !dbg !168

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !169
  br label %if.end2, !dbg !171

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !172
  %1 = bitcast i8* %call to i32*, !dbg !174
  store i32* %1, i32** %data.addr, align 8, !dbg !175
  %2 = load i32*, i32** %data.addr, align 8, !dbg !176
  %cmp = icmp eq i32* %2, null, !dbg !178
  br i1 %cmp, label %if.then1, label %if.end, !dbg !179

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !182
  ret i32* %3, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !184 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !185, metadata !DIExpression()), !dbg !186
  store i32* null, i32** %data, align 8, !dbg !187
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !188
  %0 = load i32*, i32** %data, align 8, !dbg !189
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !190
  store i32* %call, i32** %data, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !192, metadata !DIExpression()), !dbg !194
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !194
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !194
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !197, metadata !DIExpression()), !dbg !198
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !199
  %call1 = call i64 @wcslen(i32* %arraydecay) #7, !dbg !200
  store i64 %call1, i64* %sourceLen, align 8, !dbg !201
  store i64 0, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !204

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !205
  %3 = load i64, i64* %sourceLen, align 8, !dbg !207
  %add = add i64 %3, 1, !dbg !208
  %cmp = icmp ult i64 %2, %add, !dbg !209
  br i1 %cmp, label %for.body, label %for.end, !dbg !210

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !213
  %5 = load i32, i32* %arrayidx, align 4, !dbg !213
  %6 = load i32*, i32** %data, align 8, !dbg !214
  %7 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !214
  store i32 %5, i32* %arrayidx2, align 4, !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !218
  %inc = add i64 %8, 1, !dbg !218
  store i64 %inc, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !222
  call void @printWLine(i32* %9), !dbg !223
  %10 = load i32*, i32** %data, align 8, !dbg !224
  %11 = bitcast i32* %10 to i8*, !dbg !224
  call void @free(i8* %11) #8, !dbg !225
  ret void, !dbg !226
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !227 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !228, metadata !DIExpression()), !dbg !229
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !230
  %tobool = icmp ne i32 %0, 0, !dbg !230
  br i1 %tobool, label %if.then, label %if.end2, !dbg !232

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !233
  %1 = bitcast i8* %call to i32*, !dbg !235
  store i32* %1, i32** %data.addr, align 8, !dbg !236
  %2 = load i32*, i32** %data.addr, align 8, !dbg !237
  %cmp = icmp eq i32* %2, null, !dbg !239
  br i1 %cmp, label %if.then1, label %if.end, !dbg !240

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !241
  unreachable, !dbg !241

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !243

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !244
  ret i32* %3, !dbg !245
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 29, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 68, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 69, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 352, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 50, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 50, column: 16, scope: !35)
!44 = !DILocalVariable(name: "sourceLen", scope: !35, file: !15, line: 50, type: !41)
!45 = !DILocation(line: 50, column: 19, scope: !35)
!46 = !DILocation(line: 51, column: 28, scope: !35)
!47 = !DILocation(line: 51, column: 21, scope: !35)
!48 = !DILocation(line: 51, column: 19, scope: !35)
!49 = !DILocation(line: 54, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !15, line: 54, column: 9)
!51 = !DILocation(line: 54, column: 14, scope: !50)
!52 = !DILocation(line: 54, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !15, line: 54, column: 9)
!54 = !DILocation(line: 54, column: 25, scope: !53)
!55 = !DILocation(line: 54, column: 35, scope: !53)
!56 = !DILocation(line: 54, column: 23, scope: !53)
!57 = !DILocation(line: 54, column: 9, scope: !50)
!58 = !DILocation(line: 56, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !15, line: 55, column: 9)
!60 = !DILocation(line: 56, column: 23, scope: !59)
!61 = !DILocation(line: 56, column: 13, scope: !59)
!62 = !DILocation(line: 56, column: 18, scope: !59)
!63 = !DILocation(line: 56, column: 21, scope: !59)
!64 = !DILocation(line: 57, column: 9, scope: !59)
!65 = !DILocation(line: 54, column: 41, scope: !53)
!66 = !DILocation(line: 54, column: 9, scope: !53)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 57, column: 9, scope: !50)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 58, column: 20, scope: !35)
!71 = !DILocation(line: 58, column: 9, scope: !35)
!72 = !DILocation(line: 59, column: 14, scope: !35)
!73 = !DILocation(line: 59, column: 9, scope: !35)
!74 = !DILocation(line: 61, column: 1, scope: !24)
!75 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 31, type: !76, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7}
!78 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !15, line: 31, type: !7)
!79 = !DILocation(line: 31, column: 38, scope: !75)
!80 = !DILocation(line: 33, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 33, column: 8)
!82 = !DILocation(line: 33, column: 8, scope: !75)
!83 = !DILocation(line: 36, column: 27, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 34, column: 5)
!85 = !DILocation(line: 36, column: 16, scope: !84)
!86 = !DILocation(line: 36, column: 14, scope: !84)
!87 = !DILocation(line: 37, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 37, column: 13)
!89 = !DILocation(line: 37, column: 18, scope: !88)
!90 = !DILocation(line: 37, column: 13, scope: !84)
!91 = !DILocation(line: 37, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 37, column: 27)
!93 = !DILocation(line: 38, column: 5, scope: !84)
!94 = !DILocation(line: 39, column: 12, scope: !75)
!95 = !DILocation(line: 39, column: 5, scope: !75)
!96 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_21_good", scope: !15, file: !15, line: 142, type: !25, scopeLine: 143, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocation(line: 144, column: 5, scope: !96)
!98 = !DILocation(line: 145, column: 5, scope: !96)
!99 = !DILocation(line: 146, column: 1, scope: !96)
!100 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 158, type: !101, scopeLine: 159, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{!10, !10, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !15, line: 158, type: !10)
!107 = !DILocation(line: 158, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !15, line: 158, type: !103)
!109 = !DILocation(line: 158, column: 27, scope: !100)
!110 = !DILocation(line: 161, column: 22, scope: !100)
!111 = !DILocation(line: 161, column: 12, scope: !100)
!112 = !DILocation(line: 161, column: 5, scope: !100)
!113 = !DILocation(line: 163, column: 5, scope: !100)
!114 = !DILocation(line: 164, column: 5, scope: !100)
!115 = !DILocation(line: 165, column: 5, scope: !100)
!116 = !DILocation(line: 168, column: 5, scope: !100)
!117 = !DILocation(line: 169, column: 5, scope: !100)
!118 = !DILocation(line: 170, column: 5, scope: !100)
!119 = !DILocation(line: 172, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 88, type: !25, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 90, type: !7)
!122 = !DILocation(line: 90, column: 15, scope: !120)
!123 = !DILocation(line: 91, column: 10, scope: !120)
!124 = !DILocation(line: 92, column: 20, scope: !120)
!125 = !DILocation(line: 93, column: 27, scope: !120)
!126 = !DILocation(line: 93, column: 12, scope: !120)
!127 = !DILocation(line: 93, column: 10, scope: !120)
!128 = !DILocalVariable(name: "source", scope: !129, file: !15, line: 95, type: !36)
!129 = distinct !DILexicalBlock(scope: !120, file: !15, line: 94, column: 5)
!130 = !DILocation(line: 95, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !15, line: 96, type: !41)
!132 = !DILocation(line: 96, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !15, line: 96, type: !41)
!134 = !DILocation(line: 96, column: 19, scope: !129)
!135 = !DILocation(line: 97, column: 28, scope: !129)
!136 = !DILocation(line: 97, column: 21, scope: !129)
!137 = !DILocation(line: 97, column: 19, scope: !129)
!138 = !DILocation(line: 100, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !15, line: 100, column: 9)
!140 = !DILocation(line: 100, column: 14, scope: !139)
!141 = !DILocation(line: 100, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 100, column: 9)
!143 = !DILocation(line: 100, column: 25, scope: !142)
!144 = !DILocation(line: 100, column: 35, scope: !142)
!145 = !DILocation(line: 100, column: 23, scope: !142)
!146 = !DILocation(line: 100, column: 9, scope: !139)
!147 = !DILocation(line: 102, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !15, line: 101, column: 9)
!149 = !DILocation(line: 102, column: 23, scope: !148)
!150 = !DILocation(line: 102, column: 13, scope: !148)
!151 = !DILocation(line: 102, column: 18, scope: !148)
!152 = !DILocation(line: 102, column: 21, scope: !148)
!153 = !DILocation(line: 103, column: 9, scope: !148)
!154 = !DILocation(line: 100, column: 41, scope: !142)
!155 = !DILocation(line: 100, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !69}
!157 = !DILocation(line: 103, column: 9, scope: !139)
!158 = !DILocation(line: 104, column: 20, scope: !129)
!159 = !DILocation(line: 104, column: 9, scope: !129)
!160 = !DILocation(line: 105, column: 14, scope: !129)
!161 = !DILocation(line: 105, column: 9, scope: !129)
!162 = !DILocation(line: 107, column: 1, scope: !120)
!163 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 72, type: !76, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!164 = !DILocalVariable(name: "data", arg: 1, scope: !163, file: !15, line: 72, type: !7)
!165 = !DILocation(line: 72, column: 43, scope: !163)
!166 = !DILocation(line: 74, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 74, column: 8)
!168 = !DILocation(line: 74, column: 8, scope: !163)
!169 = !DILocation(line: 77, column: 9, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 75, column: 5)
!171 = !DILocation(line: 78, column: 5, scope: !170)
!172 = !DILocation(line: 82, column: 27, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !15, line: 80, column: 5)
!174 = !DILocation(line: 82, column: 16, scope: !173)
!175 = !DILocation(line: 82, column: 14, scope: !173)
!176 = !DILocation(line: 83, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 83, column: 13)
!178 = !DILocation(line: 83, column: 18, scope: !177)
!179 = !DILocation(line: 83, column: 13, scope: !173)
!180 = !DILocation(line: 83, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 83, column: 27)
!182 = !DILocation(line: 85, column: 12, scope: !163)
!183 = !DILocation(line: 85, column: 5, scope: !163)
!184 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 121, type: !25, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!185 = !DILocalVariable(name: "data", scope: !184, file: !15, line: 123, type: !7)
!186 = !DILocation(line: 123, column: 15, scope: !184)
!187 = !DILocation(line: 124, column: 10, scope: !184)
!188 = !DILocation(line: 125, column: 20, scope: !184)
!189 = !DILocation(line: 126, column: 27, scope: !184)
!190 = !DILocation(line: 126, column: 12, scope: !184)
!191 = !DILocation(line: 126, column: 10, scope: !184)
!192 = !DILocalVariable(name: "source", scope: !193, file: !15, line: 128, type: !36)
!193 = distinct !DILexicalBlock(scope: !184, file: !15, line: 127, column: 5)
!194 = !DILocation(line: 128, column: 17, scope: !193)
!195 = !DILocalVariable(name: "i", scope: !193, file: !15, line: 129, type: !41)
!196 = !DILocation(line: 129, column: 16, scope: !193)
!197 = !DILocalVariable(name: "sourceLen", scope: !193, file: !15, line: 129, type: !41)
!198 = !DILocation(line: 129, column: 19, scope: !193)
!199 = !DILocation(line: 130, column: 28, scope: !193)
!200 = !DILocation(line: 130, column: 21, scope: !193)
!201 = !DILocation(line: 130, column: 19, scope: !193)
!202 = !DILocation(line: 133, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !193, file: !15, line: 133, column: 9)
!204 = !DILocation(line: 133, column: 14, scope: !203)
!205 = !DILocation(line: 133, column: 21, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !15, line: 133, column: 9)
!207 = !DILocation(line: 133, column: 25, scope: !206)
!208 = !DILocation(line: 133, column: 35, scope: !206)
!209 = !DILocation(line: 133, column: 23, scope: !206)
!210 = !DILocation(line: 133, column: 9, scope: !203)
!211 = !DILocation(line: 135, column: 30, scope: !212)
!212 = distinct !DILexicalBlock(scope: !206, file: !15, line: 134, column: 9)
!213 = !DILocation(line: 135, column: 23, scope: !212)
!214 = !DILocation(line: 135, column: 13, scope: !212)
!215 = !DILocation(line: 135, column: 18, scope: !212)
!216 = !DILocation(line: 135, column: 21, scope: !212)
!217 = !DILocation(line: 136, column: 9, scope: !212)
!218 = !DILocation(line: 133, column: 41, scope: !206)
!219 = !DILocation(line: 133, column: 9, scope: !206)
!220 = distinct !{!220, !210, !221, !69}
!221 = !DILocation(line: 136, column: 9, scope: !203)
!222 = !DILocation(line: 137, column: 20, scope: !193)
!223 = !DILocation(line: 137, column: 9, scope: !193)
!224 = !DILocation(line: 138, column: 14, scope: !193)
!225 = !DILocation(line: 138, column: 9, scope: !193)
!226 = !DILocation(line: 140, column: 1, scope: !184)
!227 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 110, type: !76, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!228 = !DILocalVariable(name: "data", arg: 1, scope: !227, file: !15, line: 110, type: !7)
!229 = !DILocation(line: 110, column: 43, scope: !227)
!230 = !DILocation(line: 112, column: 8, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !15, line: 112, column: 8)
!232 = !DILocation(line: 112, column: 8, scope: !227)
!233 = !DILocation(line: 115, column: 27, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !15, line: 113, column: 5)
!235 = !DILocation(line: 115, column: 16, scope: !234)
!236 = !DILocation(line: 115, column: 14, scope: !234)
!237 = !DILocation(line: 116, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 116, column: 13)
!239 = !DILocation(line: 116, column: 18, scope: !238)
!240 = !DILocation(line: 116, column: 13, scope: !234)
!241 = !DILocation(line: 116, column: 28, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !15, line: 116, column: 27)
!243 = !DILocation(line: 117, column: 5, scope: !234)
!244 = !DILocation(line: 118, column: 12, scope: !227)
!245 = !DILocation(line: 118, column: 5, scope: !227)
