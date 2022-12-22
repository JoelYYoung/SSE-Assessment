; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21_bad() #0 !dbg !24 {
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
  %9 = load i32*, i32** %data, align 8, !dbg !71
  %10 = bitcast i32* %9 to i8*, !dbg !71
  call void @free(i8* %10) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !74 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32, i32* @badStatic, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end2, !dbg !81

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !82
  %1 = bitcast i8* %call to i32*, !dbg !84
  store i32* %1, i32** %data.addr, align 8, !dbg !85
  %2 = load i32*, i32** %data.addr, align 8, !dbg !86
  %cmp = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  br label %if.end2, !dbg !94

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !95
  ret i32* %4, !dbg !96
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21_good() #0 !dbg !97 {
entry:
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #5, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #5, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
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
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32* null, i32** %data, align 8, !dbg !124
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !125
  %0 = load i32*, i32** %data, align 8, !dbg !126
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !127
  store i32* %call, i32** %data, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !135
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !141
  %cmp = icmp ult i64 %1, 100, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !147
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !147
  %4 = load i32*, i32** %data, align 8, !dbg !148
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !148
  store i32 %3, i32* %arrayidx3, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %6, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !156
  store i32 0, i32* %arrayidx4, align 4, !dbg !157
  %8 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %8), !dbg !159
  %9 = load i32*, i32** %data, align 8, !dbg !160
  %10 = bitcast i32* %9 to i8*, !dbg !160
  call void @free(i8* %10) #5, !dbg !161
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
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !172
  %1 = bitcast i8* %call to i32*, !dbg !174
  store i32* %1, i32** %data.addr, align 8, !dbg !175
  %2 = load i32*, i32** %data.addr, align 8, !dbg !176
  %cmp = icmp eq i32* %2, null, !dbg !178
  br i1 %cmp, label %if.then1, label %if.end, !dbg !179

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !182
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !182
  store i32 0, i32* %arrayidx, align 4, !dbg !183
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i32*, i32** %data.addr, align 8, !dbg !184
  ret i32* %4, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !186 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32* null, i32** %data, align 8, !dbg !189
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !190
  %0 = load i32*, i32** %data, align 8, !dbg !191
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !192
  store i32* %call, i32** %data, align 8, !dbg !193
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !197, metadata !DIExpression()), !dbg !198
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !199
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !200
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !201
  store i32 0, i32* %arrayidx, align 4, !dbg !202
  store i64 0, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !205

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !206
  %cmp = icmp ult i64 %1, 100, !dbg !208
  br i1 %cmp, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !212
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !212
  %4 = load i32*, i32** %data, align 8, !dbg !213
  %5 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !213
  store i32 %3, i32* %arrayidx3, align 4, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !217
  %inc = add i64 %6, 1, !dbg !217
  store i64 %inc, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !221
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !221
  store i32 0, i32* %arrayidx4, align 4, !dbg !222
  %8 = load i32*, i32** %data, align 8, !dbg !223
  call void @printWLine(i32* %8), !dbg !224
  %9 = load i32*, i32** %data, align 8, !dbg !225
  %10 = bitcast i32* %9 to i8*, !dbg !225
  call void @free(i8* %10) #5, !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !228 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !231
  %tobool = icmp ne i32 %0, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.end2, !dbg !233

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !234
  %1 = bitcast i8* %call to i32*, !dbg !236
  store i32* %1, i32** %data.addr, align 8, !dbg !237
  %2 = load i32*, i32** %data.addr, align 8, !dbg !238
  %cmp = icmp eq i32* %2, null, !dbg !240
  br i1 %cmp, label %if.then1, label %if.end, !dbg !241

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !242
  unreachable, !dbg !242

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !244
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !244
  store i32 0, i32* %arrayidx, align 4, !dbg !245
  br label %if.end2, !dbg !246

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !247
  ret i32* %4, !dbg !248
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 65, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 66, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21_bad", scope: !15, file: !15, line: 38, type: !25, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 40, type: !7)
!28 = !DILocation(line: 40, column: 15, scope: !24)
!29 = !DILocation(line: 41, column: 10, scope: !24)
!30 = !DILocation(line: 42, column: 15, scope: !24)
!31 = !DILocation(line: 43, column: 22, scope: !24)
!32 = !DILocation(line: 43, column: 12, scope: !24)
!33 = !DILocation(line: 43, column: 10, scope: !24)
!34 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 45, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 45, column: 16, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 46, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 46, column: 17, scope: !35)
!44 = !DILocation(line: 47, column: 17, scope: !35)
!45 = !DILocation(line: 47, column: 9, scope: !35)
!46 = !DILocation(line: 48, column: 9, scope: !35)
!47 = !DILocation(line: 48, column: 23, scope: !35)
!48 = !DILocation(line: 50, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !15, line: 50, column: 9)
!50 = !DILocation(line: 50, column: 14, scope: !49)
!51 = !DILocation(line: 50, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 50, column: 9)
!53 = !DILocation(line: 50, column: 23, scope: !52)
!54 = !DILocation(line: 50, column: 9, scope: !49)
!55 = !DILocation(line: 52, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 51, column: 9)
!57 = !DILocation(line: 52, column: 23, scope: !56)
!58 = !DILocation(line: 52, column: 13, scope: !56)
!59 = !DILocation(line: 52, column: 18, scope: !56)
!60 = !DILocation(line: 52, column: 21, scope: !56)
!61 = !DILocation(line: 53, column: 9, scope: !56)
!62 = !DILocation(line: 50, column: 31, scope: !52)
!63 = !DILocation(line: 50, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 53, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 54, column: 9, scope: !35)
!68 = !DILocation(line: 54, column: 21, scope: !35)
!69 = !DILocation(line: 55, column: 20, scope: !35)
!70 = !DILocation(line: 55, column: 9, scope: !35)
!71 = !DILocation(line: 56, column: 14, scope: !35)
!72 = !DILocation(line: 56, column: 9, scope: !35)
!73 = !DILocation(line: 58, column: 1, scope: !24)
!74 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !75, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7}
!77 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !15, line: 26, type: !7)
!78 = !DILocation(line: 26, column: 38, scope: !74)
!79 = !DILocation(line: 28, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !15, line: 28, column: 8)
!81 = !DILocation(line: 28, column: 8, scope: !74)
!82 = !DILocation(line: 31, column: 27, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !15, line: 29, column: 5)
!84 = !DILocation(line: 31, column: 16, scope: !83)
!85 = !DILocation(line: 31, column: 14, scope: !83)
!86 = !DILocation(line: 32, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 32, column: 13)
!88 = !DILocation(line: 32, column: 18, scope: !87)
!89 = !DILocation(line: 32, column: 13, scope: !83)
!90 = !DILocation(line: 32, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 32, column: 27)
!92 = !DILocation(line: 33, column: 9, scope: !83)
!93 = !DILocation(line: 33, column: 17, scope: !83)
!94 = !DILocation(line: 34, column: 5, scope: !83)
!95 = !DILocation(line: 35, column: 12, scope: !74)
!96 = !DILocation(line: 35, column: 5, scope: !74)
!97 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_21_good", scope: !15, file: !15, line: 143, type: !25, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocation(line: 145, column: 5, scope: !97)
!99 = !DILocation(line: 146, column: 5, scope: !97)
!100 = !DILocation(line: 147, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 159, type: !102, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DISubroutineType(types: !103)
!103 = !{!10, !10, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !15, line: 159, type: !10)
!108 = !DILocation(line: 159, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !15, line: 159, type: !104)
!110 = !DILocation(line: 159, column: 27, scope: !101)
!111 = !DILocation(line: 162, column: 22, scope: !101)
!112 = !DILocation(line: 162, column: 12, scope: !101)
!113 = !DILocation(line: 162, column: 5, scope: !101)
!114 = !DILocation(line: 164, column: 5, scope: !101)
!115 = !DILocation(line: 165, column: 5, scope: !101)
!116 = !DILocation(line: 166, column: 5, scope: !101)
!117 = !DILocation(line: 169, column: 5, scope: !101)
!118 = !DILocation(line: 170, column: 5, scope: !101)
!119 = !DILocation(line: 171, column: 5, scope: !101)
!120 = !DILocation(line: 173, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 86, type: !25, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 88, type: !7)
!123 = !DILocation(line: 88, column: 15, scope: !121)
!124 = !DILocation(line: 89, column: 10, scope: !121)
!125 = !DILocation(line: 90, column: 20, scope: !121)
!126 = !DILocation(line: 91, column: 27, scope: !121)
!127 = !DILocation(line: 91, column: 12, scope: !121)
!128 = !DILocation(line: 91, column: 10, scope: !121)
!129 = !DILocalVariable(name: "i", scope: !130, file: !15, line: 93, type: !36)
!130 = distinct !DILexicalBlock(scope: !121, file: !15, line: 92, column: 5)
!131 = !DILocation(line: 93, column: 16, scope: !130)
!132 = !DILocalVariable(name: "source", scope: !130, file: !15, line: 94, type: !40)
!133 = !DILocation(line: 94, column: 17, scope: !130)
!134 = !DILocation(line: 95, column: 17, scope: !130)
!135 = !DILocation(line: 95, column: 9, scope: !130)
!136 = !DILocation(line: 96, column: 9, scope: !130)
!137 = !DILocation(line: 96, column: 23, scope: !130)
!138 = !DILocation(line: 98, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !15, line: 98, column: 9)
!140 = !DILocation(line: 98, column: 14, scope: !139)
!141 = !DILocation(line: 98, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 98, column: 9)
!143 = !DILocation(line: 98, column: 23, scope: !142)
!144 = !DILocation(line: 98, column: 9, scope: !139)
!145 = !DILocation(line: 100, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 99, column: 9)
!147 = !DILocation(line: 100, column: 23, scope: !146)
!148 = !DILocation(line: 100, column: 13, scope: !146)
!149 = !DILocation(line: 100, column: 18, scope: !146)
!150 = !DILocation(line: 100, column: 21, scope: !146)
!151 = !DILocation(line: 101, column: 9, scope: !146)
!152 = !DILocation(line: 98, column: 31, scope: !142)
!153 = !DILocation(line: 98, column: 9, scope: !142)
!154 = distinct !{!154, !144, !155, !66}
!155 = !DILocation(line: 101, column: 9, scope: !139)
!156 = !DILocation(line: 102, column: 9, scope: !130)
!157 = !DILocation(line: 102, column: 21, scope: !130)
!158 = !DILocation(line: 103, column: 20, scope: !130)
!159 = !DILocation(line: 103, column: 9, scope: !130)
!160 = !DILocation(line: 104, column: 14, scope: !130)
!161 = !DILocation(line: 104, column: 9, scope: !130)
!162 = !DILocation(line: 106, column: 1, scope: !121)
!163 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 69, type: !75, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!164 = !DILocalVariable(name: "data", arg: 1, scope: !163, file: !15, line: 69, type: !7)
!165 = !DILocation(line: 69, column: 43, scope: !163)
!166 = !DILocation(line: 71, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 71, column: 8)
!168 = !DILocation(line: 71, column: 8, scope: !163)
!169 = !DILocation(line: 74, column: 9, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 72, column: 5)
!171 = !DILocation(line: 75, column: 5, scope: !170)
!172 = !DILocation(line: 79, column: 27, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !15, line: 77, column: 5)
!174 = !DILocation(line: 79, column: 16, scope: !173)
!175 = !DILocation(line: 79, column: 14, scope: !173)
!176 = !DILocation(line: 80, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 80, column: 13)
!178 = !DILocation(line: 80, column: 18, scope: !177)
!179 = !DILocation(line: 80, column: 13, scope: !173)
!180 = !DILocation(line: 80, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 80, column: 27)
!182 = !DILocation(line: 81, column: 9, scope: !173)
!183 = !DILocation(line: 81, column: 17, scope: !173)
!184 = !DILocation(line: 83, column: 12, scope: !163)
!185 = !DILocation(line: 83, column: 5, scope: !163)
!186 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 121, type: !25, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!187 = !DILocalVariable(name: "data", scope: !186, file: !15, line: 123, type: !7)
!188 = !DILocation(line: 123, column: 15, scope: !186)
!189 = !DILocation(line: 124, column: 10, scope: !186)
!190 = !DILocation(line: 125, column: 20, scope: !186)
!191 = !DILocation(line: 126, column: 27, scope: !186)
!192 = !DILocation(line: 126, column: 12, scope: !186)
!193 = !DILocation(line: 126, column: 10, scope: !186)
!194 = !DILocalVariable(name: "i", scope: !195, file: !15, line: 128, type: !36)
!195 = distinct !DILexicalBlock(scope: !186, file: !15, line: 127, column: 5)
!196 = !DILocation(line: 128, column: 16, scope: !195)
!197 = !DILocalVariable(name: "source", scope: !195, file: !15, line: 129, type: !40)
!198 = !DILocation(line: 129, column: 17, scope: !195)
!199 = !DILocation(line: 130, column: 17, scope: !195)
!200 = !DILocation(line: 130, column: 9, scope: !195)
!201 = !DILocation(line: 131, column: 9, scope: !195)
!202 = !DILocation(line: 131, column: 23, scope: !195)
!203 = !DILocation(line: 133, column: 16, scope: !204)
!204 = distinct !DILexicalBlock(scope: !195, file: !15, line: 133, column: 9)
!205 = !DILocation(line: 133, column: 14, scope: !204)
!206 = !DILocation(line: 133, column: 21, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !15, line: 133, column: 9)
!208 = !DILocation(line: 133, column: 23, scope: !207)
!209 = !DILocation(line: 133, column: 9, scope: !204)
!210 = !DILocation(line: 135, column: 30, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 134, column: 9)
!212 = !DILocation(line: 135, column: 23, scope: !211)
!213 = !DILocation(line: 135, column: 13, scope: !211)
!214 = !DILocation(line: 135, column: 18, scope: !211)
!215 = !DILocation(line: 135, column: 21, scope: !211)
!216 = !DILocation(line: 136, column: 9, scope: !211)
!217 = !DILocation(line: 133, column: 31, scope: !207)
!218 = !DILocation(line: 133, column: 9, scope: !207)
!219 = distinct !{!219, !209, !220, !66}
!220 = !DILocation(line: 136, column: 9, scope: !204)
!221 = !DILocation(line: 137, column: 9, scope: !195)
!222 = !DILocation(line: 137, column: 21, scope: !195)
!223 = !DILocation(line: 138, column: 20, scope: !195)
!224 = !DILocation(line: 138, column: 9, scope: !195)
!225 = !DILocation(line: 139, column: 14, scope: !195)
!226 = !DILocation(line: 139, column: 9, scope: !195)
!227 = !DILocation(line: 141, column: 1, scope: !186)
!228 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 109, type: !75, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!229 = !DILocalVariable(name: "data", arg: 1, scope: !228, file: !15, line: 109, type: !7)
!230 = !DILocation(line: 109, column: 43, scope: !228)
!231 = !DILocation(line: 111, column: 8, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 111, column: 8)
!233 = !DILocation(line: 111, column: 8, scope: !228)
!234 = !DILocation(line: 114, column: 27, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !15, line: 112, column: 5)
!236 = !DILocation(line: 114, column: 16, scope: !235)
!237 = !DILocation(line: 114, column: 14, scope: !235)
!238 = !DILocation(line: 115, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 115, column: 13)
!240 = !DILocation(line: 115, column: 18, scope: !239)
!241 = !DILocation(line: 115, column: 13, scope: !235)
!242 = !DILocation(line: 115, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 115, column: 27)
!244 = !DILocation(line: 116, column: 9, scope: !235)
!245 = !DILocation(line: 116, column: 17, scope: !235)
!246 = !DILocation(line: 117, column: 5, scope: !235)
!247 = !DILocation(line: 118, column: 12, scope: !228)
!248 = !DILocation(line: 118, column: 5, scope: !228)
