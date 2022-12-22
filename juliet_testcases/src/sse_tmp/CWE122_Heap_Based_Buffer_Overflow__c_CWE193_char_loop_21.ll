; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call1 = call i64 @strlen(i8* %arraydecay) #7, !dbg !47
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
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx, align 1, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  store i8 %5, i8* %arrayidx2, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %9), !dbg !71
  %10 = load i8*, i8** %data, align 8, !dbg !72
  call void @free(i8* %10) #8, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i32, i32* @badStatic, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.end2, !dbg !82

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #8, !dbg !83
  store i8* %call, i8** %data.addr, align 8, !dbg !85
  %1 = load i8*, i8** %data.addr, align 8, !dbg !86
  %cmp = icmp eq i8* %1, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !92

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !93
  ret i8* %2, !dbg !94
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_good() #0 !dbg !95 {
entry:
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #8, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #8, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* null, i8** %data, align 8, !dbg !120
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !121
  %0 = load i8*, i8** %data, align 8, !dbg !122
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !123
  store i8* %call, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !132
  %call1 = call i64 @strlen(i8* %arraydecay) #7, !dbg !133
  store i64 %call1, i64* %sourceLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !138
  %3 = load i64, i64* %sourceLen, align 8, !dbg !140
  %add = add i64 %3, 1, !dbg !141
  %cmp = icmp ult i64 %2, %add, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !146
  %5 = load i8, i8* %arrayidx, align 1, !dbg !146
  %6 = load i8*, i8** %data, align 8, !dbg !147
  %7 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !147
  store i8 %5, i8* %arrayidx2, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %8, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* %9), !dbg !156
  %10 = load i8*, i8** %data, align 8, !dbg !157
  call void @free(i8* %10) #8, !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !160 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !163
  %tobool = icmp ne i32 %0, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.else, !dbg !165

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !166
  br label %if.end2, !dbg !168

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !169
  store i8* %call, i8** %data.addr, align 8, !dbg !171
  %1 = load i8*, i8** %data.addr, align 8, !dbg !172
  %cmp = icmp eq i8* %1, null, !dbg !174
  br i1 %cmp, label %if.then1, label %if.end, !dbg !175

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !176
  unreachable, !dbg !176

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !178
  ret i8* %2, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i8* null, i8** %data, align 8, !dbg !183
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !184
  %0 = load i8*, i8** %data, align 8, !dbg !185
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !186
  store i8* %call, i8** %data, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !188, metadata !DIExpression()), !dbg !190
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !190
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %i, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !193, metadata !DIExpression()), !dbg !194
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !195
  %call1 = call i64 @strlen(i8* %arraydecay) #7, !dbg !196
  store i64 %call1, i64* %sourceLen, align 8, !dbg !197
  store i64 0, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !201
  %3 = load i64, i64* %sourceLen, align 8, !dbg !203
  %add = add i64 %3, 1, !dbg !204
  %cmp = icmp ult i64 %2, %add, !dbg !205
  br i1 %cmp, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !209
  %5 = load i8, i8* %arrayidx, align 1, !dbg !209
  %6 = load i8*, i8** %data, align 8, !dbg !210
  %7 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !210
  store i8 %5, i8* %arrayidx2, align 1, !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !214
  %inc = add i64 %8, 1, !dbg !214
  store i64 %inc, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !218
  call void @printLine(i8* %9), !dbg !219
  %10 = load i8*, i8** %data, align 8, !dbg !220
  call void @free(i8* %10) #8, !dbg !221
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !223 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !226
  %tobool = icmp ne i32 %0, 0, !dbg !226
  br i1 %tobool, label %if.then, label %if.end2, !dbg !228

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !229
  store i8* %call, i8** %data.addr, align 8, !dbg !231
  %1 = load i8*, i8** %data.addr, align 8, !dbg !232
  %cmp = icmp eq i8* %1, null, !dbg !234
  br i1 %cmp, label %if.then1, label %if.end, !dbg !235

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !236
  unreachable, !dbg !236

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !238

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !239
  ret i8* %2, !dbg !240
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
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 29, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 68, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 69, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 44, type: !7)
!27 = !DILocation(line: 44, column: 12, scope: !23)
!28 = !DILocation(line: 45, column: 10, scope: !23)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 47, column: 22, scope: !23)
!31 = !DILocation(line: 47, column: 12, scope: !23)
!32 = !DILocation(line: 47, column: 10, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !13, line: 50, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 50, column: 16, scope: !34)
!44 = !DILocalVariable(name: "sourceLen", scope: !34, file: !13, line: 50, type: !40)
!45 = !DILocation(line: 50, column: 19, scope: !34)
!46 = !DILocation(line: 51, column: 28, scope: !34)
!47 = !DILocation(line: 51, column: 21, scope: !34)
!48 = !DILocation(line: 51, column: 19, scope: !34)
!49 = !DILocation(line: 54, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !34, file: !13, line: 54, column: 9)
!51 = !DILocation(line: 54, column: 14, scope: !50)
!52 = !DILocation(line: 54, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !13, line: 54, column: 9)
!54 = !DILocation(line: 54, column: 25, scope: !53)
!55 = !DILocation(line: 54, column: 35, scope: !53)
!56 = !DILocation(line: 54, column: 23, scope: !53)
!57 = !DILocation(line: 54, column: 9, scope: !50)
!58 = !DILocation(line: 56, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !13, line: 55, column: 9)
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
!70 = !DILocation(line: 58, column: 19, scope: !34)
!71 = !DILocation(line: 58, column: 9, scope: !34)
!72 = !DILocation(line: 59, column: 14, scope: !34)
!73 = !DILocation(line: 59, column: 9, scope: !34)
!74 = !DILocation(line: 61, column: 1, scope: !23)
!75 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 31, type: !76, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7}
!78 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !13, line: 31, type: !7)
!79 = !DILocation(line: 31, column: 32, scope: !75)
!80 = !DILocation(line: 33, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !13, line: 33, column: 8)
!82 = !DILocation(line: 33, column: 8, scope: !75)
!83 = !DILocation(line: 36, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !13, line: 34, column: 5)
!85 = !DILocation(line: 36, column: 14, scope: !84)
!86 = !DILocation(line: 37, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !13, line: 37, column: 13)
!88 = !DILocation(line: 37, column: 18, scope: !87)
!89 = !DILocation(line: 37, column: 13, scope: !84)
!90 = !DILocation(line: 37, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 37, column: 27)
!92 = !DILocation(line: 38, column: 5, scope: !84)
!93 = !DILocation(line: 39, column: 12, scope: !75)
!94 = !DILocation(line: 39, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_21_good", scope: !13, file: !13, line: 142, type: !24, scopeLine: 143, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 144, column: 5, scope: !95)
!97 = !DILocation(line: 145, column: 5, scope: !95)
!98 = !DILocation(line: 146, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 158, type: !100, scopeLine: 159, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{!14, !14, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !13, line: 158, type: !14)
!104 = !DILocation(line: 158, column: 14, scope: !99)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !13, line: 158, type: !102)
!106 = !DILocation(line: 158, column: 27, scope: !99)
!107 = !DILocation(line: 161, column: 22, scope: !99)
!108 = !DILocation(line: 161, column: 12, scope: !99)
!109 = !DILocation(line: 161, column: 5, scope: !99)
!110 = !DILocation(line: 163, column: 5, scope: !99)
!111 = !DILocation(line: 164, column: 5, scope: !99)
!112 = !DILocation(line: 165, column: 5, scope: !99)
!113 = !DILocation(line: 168, column: 5, scope: !99)
!114 = !DILocation(line: 169, column: 5, scope: !99)
!115 = !DILocation(line: 170, column: 5, scope: !99)
!116 = !DILocation(line: 172, column: 5, scope: !99)
!117 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 88, type: !24, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !13, line: 90, type: !7)
!119 = !DILocation(line: 90, column: 12, scope: !117)
!120 = !DILocation(line: 91, column: 10, scope: !117)
!121 = !DILocation(line: 92, column: 20, scope: !117)
!122 = !DILocation(line: 93, column: 27, scope: !117)
!123 = !DILocation(line: 93, column: 12, scope: !117)
!124 = !DILocation(line: 93, column: 10, scope: !117)
!125 = !DILocalVariable(name: "source", scope: !126, file: !13, line: 95, type: !35)
!126 = distinct !DILexicalBlock(scope: !117, file: !13, line: 94, column: 5)
!127 = !DILocation(line: 95, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !13, line: 96, type: !40)
!129 = !DILocation(line: 96, column: 16, scope: !126)
!130 = !DILocalVariable(name: "sourceLen", scope: !126, file: !13, line: 96, type: !40)
!131 = !DILocation(line: 96, column: 19, scope: !126)
!132 = !DILocation(line: 97, column: 28, scope: !126)
!133 = !DILocation(line: 97, column: 21, scope: !126)
!134 = !DILocation(line: 97, column: 19, scope: !126)
!135 = !DILocation(line: 100, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !13, line: 100, column: 9)
!137 = !DILocation(line: 100, column: 14, scope: !136)
!138 = !DILocation(line: 100, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !13, line: 100, column: 9)
!140 = !DILocation(line: 100, column: 25, scope: !139)
!141 = !DILocation(line: 100, column: 35, scope: !139)
!142 = !DILocation(line: 100, column: 23, scope: !139)
!143 = !DILocation(line: 100, column: 9, scope: !136)
!144 = !DILocation(line: 102, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !13, line: 101, column: 9)
!146 = !DILocation(line: 102, column: 23, scope: !145)
!147 = !DILocation(line: 102, column: 13, scope: !145)
!148 = !DILocation(line: 102, column: 18, scope: !145)
!149 = !DILocation(line: 102, column: 21, scope: !145)
!150 = !DILocation(line: 103, column: 9, scope: !145)
!151 = !DILocation(line: 100, column: 41, scope: !139)
!152 = !DILocation(line: 100, column: 9, scope: !139)
!153 = distinct !{!153, !143, !154, !69}
!154 = !DILocation(line: 103, column: 9, scope: !136)
!155 = !DILocation(line: 104, column: 19, scope: !126)
!156 = !DILocation(line: 104, column: 9, scope: !126)
!157 = !DILocation(line: 105, column: 14, scope: !126)
!158 = !DILocation(line: 105, column: 9, scope: !126)
!159 = !DILocation(line: 107, column: 1, scope: !117)
!160 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 72, type: !76, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!161 = !DILocalVariable(name: "data", arg: 1, scope: !160, file: !13, line: 72, type: !7)
!162 = !DILocation(line: 72, column: 37, scope: !160)
!163 = !DILocation(line: 74, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 74, column: 8)
!165 = !DILocation(line: 74, column: 8, scope: !160)
!166 = !DILocation(line: 77, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !13, line: 75, column: 5)
!168 = !DILocation(line: 78, column: 5, scope: !167)
!169 = !DILocation(line: 82, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !164, file: !13, line: 80, column: 5)
!171 = !DILocation(line: 82, column: 14, scope: !170)
!172 = !DILocation(line: 83, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !13, line: 83, column: 13)
!174 = !DILocation(line: 83, column: 18, scope: !173)
!175 = !DILocation(line: 83, column: 13, scope: !170)
!176 = !DILocation(line: 83, column: 28, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !13, line: 83, column: 27)
!178 = !DILocation(line: 85, column: 12, scope: !160)
!179 = !DILocation(line: 85, column: 5, scope: !160)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 121, type: !24, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocalVariable(name: "data", scope: !180, file: !13, line: 123, type: !7)
!182 = !DILocation(line: 123, column: 12, scope: !180)
!183 = !DILocation(line: 124, column: 10, scope: !180)
!184 = !DILocation(line: 125, column: 20, scope: !180)
!185 = !DILocation(line: 126, column: 27, scope: !180)
!186 = !DILocation(line: 126, column: 12, scope: !180)
!187 = !DILocation(line: 126, column: 10, scope: !180)
!188 = !DILocalVariable(name: "source", scope: !189, file: !13, line: 128, type: !35)
!189 = distinct !DILexicalBlock(scope: !180, file: !13, line: 127, column: 5)
!190 = !DILocation(line: 128, column: 14, scope: !189)
!191 = !DILocalVariable(name: "i", scope: !189, file: !13, line: 129, type: !40)
!192 = !DILocation(line: 129, column: 16, scope: !189)
!193 = !DILocalVariable(name: "sourceLen", scope: !189, file: !13, line: 129, type: !40)
!194 = !DILocation(line: 129, column: 19, scope: !189)
!195 = !DILocation(line: 130, column: 28, scope: !189)
!196 = !DILocation(line: 130, column: 21, scope: !189)
!197 = !DILocation(line: 130, column: 19, scope: !189)
!198 = !DILocation(line: 133, column: 16, scope: !199)
!199 = distinct !DILexicalBlock(scope: !189, file: !13, line: 133, column: 9)
!200 = !DILocation(line: 133, column: 14, scope: !199)
!201 = !DILocation(line: 133, column: 21, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !13, line: 133, column: 9)
!203 = !DILocation(line: 133, column: 25, scope: !202)
!204 = !DILocation(line: 133, column: 35, scope: !202)
!205 = !DILocation(line: 133, column: 23, scope: !202)
!206 = !DILocation(line: 133, column: 9, scope: !199)
!207 = !DILocation(line: 135, column: 30, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !13, line: 134, column: 9)
!209 = !DILocation(line: 135, column: 23, scope: !208)
!210 = !DILocation(line: 135, column: 13, scope: !208)
!211 = !DILocation(line: 135, column: 18, scope: !208)
!212 = !DILocation(line: 135, column: 21, scope: !208)
!213 = !DILocation(line: 136, column: 9, scope: !208)
!214 = !DILocation(line: 133, column: 41, scope: !202)
!215 = !DILocation(line: 133, column: 9, scope: !202)
!216 = distinct !{!216, !206, !217, !69}
!217 = !DILocation(line: 136, column: 9, scope: !199)
!218 = !DILocation(line: 137, column: 19, scope: !189)
!219 = !DILocation(line: 137, column: 9, scope: !189)
!220 = !DILocation(line: 138, column: 14, scope: !189)
!221 = !DILocation(line: 138, column: 9, scope: !189)
!222 = !DILocation(line: 140, column: 1, scope: !180)
!223 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 110, type: !76, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!224 = !DILocalVariable(name: "data", arg: 1, scope: !223, file: !13, line: 110, type: !7)
!225 = !DILocation(line: 110, column: 37, scope: !223)
!226 = !DILocation(line: 112, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !13, line: 112, column: 8)
!228 = !DILocation(line: 112, column: 8, scope: !223)
!229 = !DILocation(line: 115, column: 24, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !13, line: 113, column: 5)
!231 = !DILocation(line: 115, column: 14, scope: !230)
!232 = !DILocation(line: 116, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !13, line: 116, column: 13)
!234 = !DILocation(line: 116, column: 18, scope: !233)
!235 = !DILocation(line: 116, column: 13, scope: !230)
!236 = !DILocation(line: 116, column: 28, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !13, line: 116, column: 27)
!238 = !DILocation(line: 117, column: 5, scope: !230)
!239 = !DILocation(line: 118, column: 12, scope: !223)
!240 = !DILocation(line: 118, column: 5, scope: !223)
