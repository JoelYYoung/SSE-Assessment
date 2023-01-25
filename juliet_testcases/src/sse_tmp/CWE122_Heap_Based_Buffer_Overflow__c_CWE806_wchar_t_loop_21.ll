; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32* @badSource(i32* %2), !dbg !40
  store i32* %call1, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !55
  store i64 %call2, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !60
  %6 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp3 = icmp ult i64 %5, %6, !dbg !63
  br i1 %cmp3, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !65
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !65
  %9 = load i32, i32* %arrayidx, align 4, !dbg !65
  %10 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !69
  store i32 %9, i32* %arrayidx4, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %11, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx5, align 4, !dbg !78
  %12 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %12), !dbg !80
  %13 = load i32*, i32** %data, align 8, !dbg !81
  %14 = bitcast i32* %13 to i8*, !dbg !81
  call void @free(i8* %14) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = load i32, i32* @badStatic, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !94
  %2 = load i32*, i32** %data.addr, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end, !dbg !97

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !98
  ret i32* %3, !dbg !99
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21_good() #0 !dbg !100 {
entry:
  call void @goodG2B1(), !dbg !101
  call void @goodG2B2(), !dbg !102
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #7, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #7, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !127
  %0 = bitcast i8* %call to i32*, !dbg !128
  store i32* %0, i32** %data, align 8, !dbg !129
  %1 = load i32*, i32** %data, align 8, !dbg !130
  %cmp = icmp eq i32* %1, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !136
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %call1 = call i32* @goodG2B1Source(i32* %2), !dbg !138
  store i32* %call1, i32** %data, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !140, metadata !DIExpression()), !dbg !142
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !145, metadata !DIExpression()), !dbg !146
  %4 = load i32*, i32** %data, align 8, !dbg !147
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !148
  store i64 %call2, i64* %dataLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !153
  %6 = load i64, i64* %dataLen, align 8, !dbg !155
  %cmp3 = icmp ult i64 %5, %6, !dbg !156
  br i1 %cmp3, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !158
  %8 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !158
  %9 = load i32, i32* %arrayidx, align 4, !dbg !158
  %10 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !162
  store i32 %9, i32* %arrayidx4, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %11, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !169
  store i32 0, i32* %arrayidx5, align 4, !dbg !170
  %12 = load i32*, i32** %data, align 8, !dbg !171
  call void @printWLine(i32* %12), !dbg !172
  %13 = load i32*, i32** %data, align 8, !dbg !173
  %14 = bitcast i32* %13 to i8*, !dbg !173
  call void @free(i8* %14) #7, !dbg !174
  ret void, !dbg !175
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !176 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !179
  %tobool = icmp ne i32 %0, 0, !dbg !179
  br i1 %tobool, label %if.then, label %if.else, !dbg !181

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !182
  br label %if.end, !dbg !184

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !185
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !187
  %2 = load i32*, i32** %data.addr, align 8, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !189
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !190
  ret i32* %3, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !192 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !193, metadata !DIExpression()), !dbg !194
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !195
  %0 = bitcast i8* %call to i32*, !dbg !196
  store i32* %0, i32** %data, align 8, !dbg !197
  %1 = load i32*, i32** %data, align 8, !dbg !198
  %cmp = icmp eq i32* %1, null, !dbg !200
  br i1 %cmp, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !202
  unreachable, !dbg !202

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !204
  %2 = load i32*, i32** %data, align 8, !dbg !205
  %call1 = call i32* @goodG2B2Source(i32* %2), !dbg !206
  store i32* %call1, i32** %data, align 8, !dbg !207
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !208, metadata !DIExpression()), !dbg !210
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !210
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !210
  call void @llvm.dbg.declare(metadata i64* %i, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !213, metadata !DIExpression()), !dbg !214
  %4 = load i32*, i32** %data, align 8, !dbg !215
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !216
  store i64 %call2, i64* %dataLen, align 8, !dbg !217
  store i64 0, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !221
  %6 = load i64, i64* %dataLen, align 8, !dbg !223
  %cmp3 = icmp ult i64 %5, %6, !dbg !224
  br i1 %cmp3, label %for.body, label %for.end, !dbg !225

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !226
  %8 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !226
  %9 = load i32, i32* %arrayidx, align 4, !dbg !226
  %10 = load i64, i64* %i, align 8, !dbg !229
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !230
  store i32 %9, i32* %arrayidx4, align 4, !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !233
  %inc = add i64 %11, 1, !dbg !233
  store i64 %inc, i64* %i, align 8, !dbg !233
  br label %for.cond, !dbg !234, !llvm.loop !235

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !237
  store i32 0, i32* %arrayidx5, align 4, !dbg !238
  %12 = load i32*, i32** %data, align 8, !dbg !239
  call void @printWLine(i32* %12), !dbg !240
  %13 = load i32*, i32** %data, align 8, !dbg !241
  %14 = bitcast i32* %13 to i8*, !dbg !241
  call void @free(i8* %14) #7, !dbg !242
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !244 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !245, metadata !DIExpression()), !dbg !246
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !247
  %tobool = icmp ne i32 %0, 0, !dbg !247
  br i1 %tobool, label %if.then, label %if.end, !dbg !249

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !250
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !252
  %2 = load i32*, i32** %data.addr, align 8, !dbg !253
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !253
  store i32 0, i32* %arrayidx, align 4, !dbg !254
  br label %if.end, !dbg !255

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !256
  ret i32* %3, !dbg !257
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 64, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 65, type: !9, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21_bad", scope: !15, file: !15, line: 37, type: !25, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 39, type: !6)
!28 = !DILocation(line: 39, column: 15, scope: !24)
!29 = !DILocation(line: 40, column: 23, scope: !24)
!30 = !DILocation(line: 40, column: 12, scope: !24)
!31 = !DILocation(line: 40, column: 10, scope: !24)
!32 = !DILocation(line: 41, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !15, line: 41, column: 9)
!34 = !DILocation(line: 41, column: 14, scope: !33)
!35 = !DILocation(line: 41, column: 9, scope: !24)
!36 = !DILocation(line: 41, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 41, column: 23)
!38 = !DILocation(line: 42, column: 15, scope: !24)
!39 = !DILocation(line: 43, column: 22, scope: !24)
!40 = !DILocation(line: 43, column: 12, scope: !24)
!41 = !DILocation(line: 43, column: 10, scope: !24)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !15, line: 45, type: !44)
!43 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 45, column: 17, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !15, line: 46, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 46, column: 16, scope: !43)
!52 = !DILocalVariable(name: "dataLen", scope: !43, file: !15, line: 46, type: !49)
!53 = !DILocation(line: 46, column: 19, scope: !43)
!54 = !DILocation(line: 47, column: 26, scope: !43)
!55 = !DILocation(line: 47, column: 19, scope: !43)
!56 = !DILocation(line: 47, column: 17, scope: !43)
!57 = !DILocation(line: 49, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !15, line: 49, column: 9)
!59 = !DILocation(line: 49, column: 14, scope: !58)
!60 = !DILocation(line: 49, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 49, column: 9)
!62 = !DILocation(line: 49, column: 25, scope: !61)
!63 = !DILocation(line: 49, column: 23, scope: !61)
!64 = !DILocation(line: 49, column: 9, scope: !58)
!65 = !DILocation(line: 51, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !15, line: 50, column: 9)
!67 = !DILocation(line: 51, column: 28, scope: !66)
!68 = !DILocation(line: 51, column: 18, scope: !66)
!69 = !DILocation(line: 51, column: 13, scope: !66)
!70 = !DILocation(line: 51, column: 21, scope: !66)
!71 = !DILocation(line: 52, column: 9, scope: !66)
!72 = !DILocation(line: 49, column: 35, scope: !61)
!73 = !DILocation(line: 49, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 52, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 53, column: 9, scope: !43)
!78 = !DILocation(line: 53, column: 20, scope: !43)
!79 = !DILocation(line: 54, column: 20, scope: !43)
!80 = !DILocation(line: 54, column: 9, scope: !43)
!81 = !DILocation(line: 55, column: 14, scope: !43)
!82 = !DILocation(line: 55, column: 9, scope: !43)
!83 = !DILocation(line: 57, column: 1, scope: !24)
!84 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !85, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!6, !6}
!87 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !15, line: 26, type: !6)
!88 = !DILocation(line: 26, column: 38, scope: !84)
!89 = !DILocation(line: 28, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !15, line: 28, column: 8)
!91 = !DILocation(line: 28, column: 8, scope: !84)
!92 = !DILocation(line: 31, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 29, column: 5)
!94 = !DILocation(line: 31, column: 9, scope: !93)
!95 = !DILocation(line: 32, column: 9, scope: !93)
!96 = !DILocation(line: 32, column: 21, scope: !93)
!97 = !DILocation(line: 33, column: 5, scope: !93)
!98 = !DILocation(line: 34, column: 12, scope: !84)
!99 = !DILocation(line: 34, column: 5, scope: !84)
!100 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_21_good", scope: !15, file: !15, line: 140, type: !25, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocation(line: 142, column: 5, scope: !100)
!102 = !DILocation(line: 143, column: 5, scope: !100)
!103 = !DILocation(line: 144, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 156, type: !105, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!9, !9, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !15, line: 156, type: !9)
!111 = !DILocation(line: 156, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !15, line: 156, type: !107)
!113 = !DILocation(line: 156, column: 27, scope: !104)
!114 = !DILocation(line: 159, column: 22, scope: !104)
!115 = !DILocation(line: 159, column: 12, scope: !104)
!116 = !DILocation(line: 159, column: 5, scope: !104)
!117 = !DILocation(line: 161, column: 5, scope: !104)
!118 = !DILocation(line: 162, column: 5, scope: !104)
!119 = !DILocation(line: 163, column: 5, scope: !104)
!120 = !DILocation(line: 166, column: 5, scope: !104)
!121 = !DILocation(line: 167, column: 5, scope: !104)
!122 = !DILocation(line: 168, column: 5, scope: !104)
!123 = !DILocation(line: 170, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 84, type: !25, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !15, line: 86, type: !6)
!126 = !DILocation(line: 86, column: 15, scope: !124)
!127 = !DILocation(line: 87, column: 23, scope: !124)
!128 = !DILocation(line: 87, column: 12, scope: !124)
!129 = !DILocation(line: 87, column: 10, scope: !124)
!130 = !DILocation(line: 88, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !15, line: 88, column: 9)
!132 = !DILocation(line: 88, column: 14, scope: !131)
!133 = !DILocation(line: 88, column: 9, scope: !124)
!134 = !DILocation(line: 88, column: 24, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 88, column: 23)
!136 = !DILocation(line: 89, column: 20, scope: !124)
!137 = !DILocation(line: 90, column: 27, scope: !124)
!138 = !DILocation(line: 90, column: 12, scope: !124)
!139 = !DILocation(line: 90, column: 10, scope: !124)
!140 = !DILocalVariable(name: "dest", scope: !141, file: !15, line: 92, type: !44)
!141 = distinct !DILexicalBlock(scope: !124, file: !15, line: 91, column: 5)
!142 = !DILocation(line: 92, column: 17, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !141, file: !15, line: 93, type: !49)
!144 = !DILocation(line: 93, column: 16, scope: !141)
!145 = !DILocalVariable(name: "dataLen", scope: !141, file: !15, line: 93, type: !49)
!146 = !DILocation(line: 93, column: 19, scope: !141)
!147 = !DILocation(line: 94, column: 26, scope: !141)
!148 = !DILocation(line: 94, column: 19, scope: !141)
!149 = !DILocation(line: 94, column: 17, scope: !141)
!150 = !DILocation(line: 96, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !141, file: !15, line: 96, column: 9)
!152 = !DILocation(line: 96, column: 14, scope: !151)
!153 = !DILocation(line: 96, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !15, line: 96, column: 9)
!155 = !DILocation(line: 96, column: 25, scope: !154)
!156 = !DILocation(line: 96, column: 23, scope: !154)
!157 = !DILocation(line: 96, column: 9, scope: !151)
!158 = !DILocation(line: 98, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !15, line: 97, column: 9)
!160 = !DILocation(line: 98, column: 28, scope: !159)
!161 = !DILocation(line: 98, column: 18, scope: !159)
!162 = !DILocation(line: 98, column: 13, scope: !159)
!163 = !DILocation(line: 98, column: 21, scope: !159)
!164 = !DILocation(line: 99, column: 9, scope: !159)
!165 = !DILocation(line: 96, column: 35, scope: !154)
!166 = !DILocation(line: 96, column: 9, scope: !154)
!167 = distinct !{!167, !157, !168, !76}
!168 = !DILocation(line: 99, column: 9, scope: !151)
!169 = !DILocation(line: 100, column: 9, scope: !141)
!170 = !DILocation(line: 100, column: 20, scope: !141)
!171 = !DILocation(line: 101, column: 20, scope: !141)
!172 = !DILocation(line: 101, column: 9, scope: !141)
!173 = !DILocation(line: 102, column: 14, scope: !141)
!174 = !DILocation(line: 102, column: 9, scope: !141)
!175 = !DILocation(line: 104, column: 1, scope: !124)
!176 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 68, type: !85, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DILocalVariable(name: "data", arg: 1, scope: !176, file: !15, line: 68, type: !6)
!178 = !DILocation(line: 68, column: 43, scope: !176)
!179 = !DILocation(line: 70, column: 8, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 70, column: 8)
!181 = !DILocation(line: 70, column: 8, scope: !176)
!182 = !DILocation(line: 73, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !15, line: 71, column: 5)
!184 = !DILocation(line: 74, column: 5, scope: !183)
!185 = !DILocation(line: 78, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !180, file: !15, line: 76, column: 5)
!187 = !DILocation(line: 78, column: 9, scope: !186)
!188 = !DILocation(line: 79, column: 9, scope: !186)
!189 = !DILocation(line: 79, column: 20, scope: !186)
!190 = !DILocation(line: 81, column: 12, scope: !176)
!191 = !DILocation(line: 81, column: 5, scope: !176)
!192 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 118, type: !25, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!193 = !DILocalVariable(name: "data", scope: !192, file: !15, line: 120, type: !6)
!194 = !DILocation(line: 120, column: 15, scope: !192)
!195 = !DILocation(line: 121, column: 23, scope: !192)
!196 = !DILocation(line: 121, column: 12, scope: !192)
!197 = !DILocation(line: 121, column: 10, scope: !192)
!198 = !DILocation(line: 122, column: 9, scope: !199)
!199 = distinct !DILexicalBlock(scope: !192, file: !15, line: 122, column: 9)
!200 = !DILocation(line: 122, column: 14, scope: !199)
!201 = !DILocation(line: 122, column: 9, scope: !192)
!202 = !DILocation(line: 122, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !15, line: 122, column: 23)
!204 = !DILocation(line: 123, column: 20, scope: !192)
!205 = !DILocation(line: 124, column: 27, scope: !192)
!206 = !DILocation(line: 124, column: 12, scope: !192)
!207 = !DILocation(line: 124, column: 10, scope: !192)
!208 = !DILocalVariable(name: "dest", scope: !209, file: !15, line: 126, type: !44)
!209 = distinct !DILexicalBlock(scope: !192, file: !15, line: 125, column: 5)
!210 = !DILocation(line: 126, column: 17, scope: !209)
!211 = !DILocalVariable(name: "i", scope: !209, file: !15, line: 127, type: !49)
!212 = !DILocation(line: 127, column: 16, scope: !209)
!213 = !DILocalVariable(name: "dataLen", scope: !209, file: !15, line: 127, type: !49)
!214 = !DILocation(line: 127, column: 19, scope: !209)
!215 = !DILocation(line: 128, column: 26, scope: !209)
!216 = !DILocation(line: 128, column: 19, scope: !209)
!217 = !DILocation(line: 128, column: 17, scope: !209)
!218 = !DILocation(line: 130, column: 16, scope: !219)
!219 = distinct !DILexicalBlock(scope: !209, file: !15, line: 130, column: 9)
!220 = !DILocation(line: 130, column: 14, scope: !219)
!221 = !DILocation(line: 130, column: 21, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !15, line: 130, column: 9)
!223 = !DILocation(line: 130, column: 25, scope: !222)
!224 = !DILocation(line: 130, column: 23, scope: !222)
!225 = !DILocation(line: 130, column: 9, scope: !219)
!226 = !DILocation(line: 132, column: 23, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !15, line: 131, column: 9)
!228 = !DILocation(line: 132, column: 28, scope: !227)
!229 = !DILocation(line: 132, column: 18, scope: !227)
!230 = !DILocation(line: 132, column: 13, scope: !227)
!231 = !DILocation(line: 132, column: 21, scope: !227)
!232 = !DILocation(line: 133, column: 9, scope: !227)
!233 = !DILocation(line: 130, column: 35, scope: !222)
!234 = !DILocation(line: 130, column: 9, scope: !222)
!235 = distinct !{!235, !225, !236, !76}
!236 = !DILocation(line: 133, column: 9, scope: !219)
!237 = !DILocation(line: 134, column: 9, scope: !209)
!238 = !DILocation(line: 134, column: 20, scope: !209)
!239 = !DILocation(line: 135, column: 20, scope: !209)
!240 = !DILocation(line: 135, column: 9, scope: !209)
!241 = !DILocation(line: 136, column: 14, scope: !209)
!242 = !DILocation(line: 136, column: 9, scope: !209)
!243 = !DILocation(line: 138, column: 1, scope: !192)
!244 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 107, type: !85, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!245 = !DILocalVariable(name: "data", arg: 1, scope: !244, file: !15, line: 107, type: !6)
!246 = !DILocation(line: 107, column: 43, scope: !244)
!247 = !DILocation(line: 109, column: 8, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !15, line: 109, column: 8)
!249 = !DILocation(line: 109, column: 8, scope: !244)
!250 = !DILocation(line: 112, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !15, line: 110, column: 5)
!252 = !DILocation(line: 112, column: 9, scope: !251)
!253 = !DILocation(line: 113, column: 9, scope: !251)
!254 = !DILocation(line: 113, column: 20, scope: !251)
!255 = !DILocation(line: 114, column: 5, scope: !251)
!256 = !DILocation(line: 115, column: 12, scope: !244)
!257 = !DILocation(line: 115, column: 5, scope: !244)
