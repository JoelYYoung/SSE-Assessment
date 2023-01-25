; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx, align 1, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !56
  %4 = load i8*, i8** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !57
  store i8 %3, i8* %arrayidx2, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !66
  store i8 0, i8* %arrayidx3, align 1, !dbg !67
  %8 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %8), !dbg !69
  %9 = load i8*, i8** %data, align 8, !dbg !70
  call void @free(i8* %9) #6, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !73 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @badStatic, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.end2, !dbg !80

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !81
  store i8* %call, i8** %data.addr, align 8, !dbg !83
  %1 = load i8*, i8** %data.addr, align 8, !dbg !84
  %cmp = icmp eq i8* %1, null, !dbg !86
  br i1 %cmp, label %if.then1, label %if.end, !dbg !87

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end2, !dbg !92

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !93
  ret i8* %3, !dbg !94
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21_good() #0 !dbg !95 {
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
  %call = call i64 @time(i64* null) #6, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #6, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* null, i8** %data, align 8, !dbg !120
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !121
  %0 = load i8*, i8** %data, align 8, !dbg !122
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !123
  store i8* %call, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %1, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !142
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !142
  %4 = load i8*, i8** %data, align 8, !dbg !143
  %5 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !143
  store i8 %3, i8* %arrayidx2, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %6, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !151
  store i8 0, i8* %arrayidx3, align 1, !dbg !152
  %8 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %8), !dbg !154
  %9 = load i8*, i8** %data, align 8, !dbg !155
  call void @free(i8* %9) #6, !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !158 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !161
  %tobool = icmp ne i32 %0, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.else, !dbg !163

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !164
  br label %if.end2, !dbg !166

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !167
  store i8* %call, i8** %data.addr, align 8, !dbg !169
  %1 = load i8*, i8** %data.addr, align 8, !dbg !170
  %cmp = icmp eq i8* %1, null, !dbg !172
  br i1 %cmp, label %if.then1, label %if.end, !dbg !173

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !174
  unreachable, !dbg !174

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !176
  store i8 0, i8* %arrayidx, align 1, !dbg !177
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !178
  ret i8* %3, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i8* null, i8** %data, align 8, !dbg !183
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !184
  %0 = load i8*, i8** %data, align 8, !dbg !185
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !186
  store i8* %call, i8** %data, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata i64* %i, metadata !188, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !191, metadata !DIExpression()), !dbg !192
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !193
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !194
  store i8 0, i8* %arrayidx, align 1, !dbg !195
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !199
  %cmp = icmp ult i64 %1, 100, !dbg !201
  br i1 %cmp, label %for.body, label %for.end, !dbg !202

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !205
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !205
  %4 = load i8*, i8** %data, align 8, !dbg !206
  %5 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !206
  store i8 %3, i8* %arrayidx2, align 1, !dbg !208
  br label %for.inc, !dbg !209

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !210
  %inc = add i64 %6, 1, !dbg !210
  store i64 %inc, i64* %i, align 8, !dbg !210
  br label %for.cond, !dbg !211, !llvm.loop !212

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !214
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !214
  store i8 0, i8* %arrayidx3, align 1, !dbg !215
  %8 = load i8*, i8** %data, align 8, !dbg !216
  call void @printLine(i8* %8), !dbg !217
  %9 = load i8*, i8** %data, align 8, !dbg !218
  call void @free(i8* %9) #6, !dbg !219
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !221 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !224
  %tobool = icmp ne i32 %0, 0, !dbg !224
  br i1 %tobool, label %if.then, label %if.end2, !dbg !226

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !227
  store i8* %call, i8** %data.addr, align 8, !dbg !229
  %1 = load i8*, i8** %data.addr, align 8, !dbg !230
  %cmp = icmp eq i8* %1, null, !dbg !232
  br i1 %cmp, label %if.then1, label %if.end, !dbg !233

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !234
  unreachable, !dbg !234

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !236
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !236
  store i8 0, i8* %arrayidx, align 1, !dbg !237
  br label %if.end2, !dbg !238

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !239
  ret i8* %3, !dbg !240
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 65, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 66, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21_bad", scope: !13, file: !13, line: 38, type: !24, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 40, type: !7)
!27 = !DILocation(line: 40, column: 12, scope: !23)
!28 = !DILocation(line: 41, column: 10, scope: !23)
!29 = !DILocation(line: 42, column: 15, scope: !23)
!30 = !DILocation(line: 43, column: 22, scope: !23)
!31 = !DILocation(line: 43, column: 12, scope: !23)
!32 = !DILocation(line: 43, column: 10, scope: !23)
!33 = !DILocalVariable(name: "i", scope: !34, file: !13, line: 45, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 44, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 45, column: 16, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 46, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 46, column: 14, scope: !34)
!44 = !DILocation(line: 47, column: 9, scope: !34)
!45 = !DILocation(line: 48, column: 9, scope: !34)
!46 = !DILocation(line: 48, column: 23, scope: !34)
!47 = !DILocation(line: 50, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !13, line: 50, column: 9)
!49 = !DILocation(line: 50, column: 14, scope: !48)
!50 = !DILocation(line: 50, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !13, line: 50, column: 9)
!52 = !DILocation(line: 50, column: 23, scope: !51)
!53 = !DILocation(line: 50, column: 9, scope: !48)
!54 = !DILocation(line: 52, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !13, line: 51, column: 9)
!56 = !DILocation(line: 52, column: 23, scope: !55)
!57 = !DILocation(line: 52, column: 13, scope: !55)
!58 = !DILocation(line: 52, column: 18, scope: !55)
!59 = !DILocation(line: 52, column: 21, scope: !55)
!60 = !DILocation(line: 53, column: 9, scope: !55)
!61 = !DILocation(line: 50, column: 31, scope: !51)
!62 = !DILocation(line: 50, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 53, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 54, column: 9, scope: !34)
!67 = !DILocation(line: 54, column: 21, scope: !34)
!68 = !DILocation(line: 55, column: 19, scope: !34)
!69 = !DILocation(line: 55, column: 9, scope: !34)
!70 = !DILocation(line: 56, column: 14, scope: !34)
!71 = !DILocation(line: 56, column: 9, scope: !34)
!72 = !DILocation(line: 58, column: 1, scope: !23)
!73 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !74, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7}
!76 = !DILocalVariable(name: "data", arg: 1, scope: !73, file: !13, line: 26, type: !7)
!77 = !DILocation(line: 26, column: 32, scope: !73)
!78 = !DILocation(line: 28, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !13, line: 28, column: 8)
!80 = !DILocation(line: 28, column: 8, scope: !73)
!81 = !DILocation(line: 31, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !13, line: 29, column: 5)
!83 = !DILocation(line: 31, column: 14, scope: !82)
!84 = !DILocation(line: 32, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !13, line: 32, column: 13)
!86 = !DILocation(line: 32, column: 18, scope: !85)
!87 = !DILocation(line: 32, column: 13, scope: !82)
!88 = !DILocation(line: 32, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !13, line: 32, column: 27)
!90 = !DILocation(line: 33, column: 9, scope: !82)
!91 = !DILocation(line: 33, column: 17, scope: !82)
!92 = !DILocation(line: 34, column: 5, scope: !82)
!93 = !DILocation(line: 35, column: 12, scope: !73)
!94 = !DILocation(line: 35, column: 5, scope: !73)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_21_good", scope: !13, file: !13, line: 143, type: !24, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 145, column: 5, scope: !95)
!97 = !DILocation(line: 146, column: 5, scope: !95)
!98 = !DILocation(line: 147, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 159, type: !100, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{!14, !14, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !13, line: 159, type: !14)
!104 = !DILocation(line: 159, column: 14, scope: !99)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !13, line: 159, type: !102)
!106 = !DILocation(line: 159, column: 27, scope: !99)
!107 = !DILocation(line: 162, column: 22, scope: !99)
!108 = !DILocation(line: 162, column: 12, scope: !99)
!109 = !DILocation(line: 162, column: 5, scope: !99)
!110 = !DILocation(line: 164, column: 5, scope: !99)
!111 = !DILocation(line: 165, column: 5, scope: !99)
!112 = !DILocation(line: 166, column: 5, scope: !99)
!113 = !DILocation(line: 169, column: 5, scope: !99)
!114 = !DILocation(line: 170, column: 5, scope: !99)
!115 = !DILocation(line: 171, column: 5, scope: !99)
!116 = !DILocation(line: 173, column: 5, scope: !99)
!117 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 86, type: !24, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !13, line: 88, type: !7)
!119 = !DILocation(line: 88, column: 12, scope: !117)
!120 = !DILocation(line: 89, column: 10, scope: !117)
!121 = !DILocation(line: 90, column: 20, scope: !117)
!122 = !DILocation(line: 91, column: 27, scope: !117)
!123 = !DILocation(line: 91, column: 12, scope: !117)
!124 = !DILocation(line: 91, column: 10, scope: !117)
!125 = !DILocalVariable(name: "i", scope: !126, file: !13, line: 93, type: !35)
!126 = distinct !DILexicalBlock(scope: !117, file: !13, line: 92, column: 5)
!127 = !DILocation(line: 93, column: 16, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !126, file: !13, line: 94, type: !40)
!129 = !DILocation(line: 94, column: 14, scope: !126)
!130 = !DILocation(line: 95, column: 9, scope: !126)
!131 = !DILocation(line: 96, column: 9, scope: !126)
!132 = !DILocation(line: 96, column: 23, scope: !126)
!133 = !DILocation(line: 98, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !13, line: 98, column: 9)
!135 = !DILocation(line: 98, column: 14, scope: !134)
!136 = !DILocation(line: 98, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !13, line: 98, column: 9)
!138 = !DILocation(line: 98, column: 23, scope: !137)
!139 = !DILocation(line: 98, column: 9, scope: !134)
!140 = !DILocation(line: 100, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !13, line: 99, column: 9)
!142 = !DILocation(line: 100, column: 23, scope: !141)
!143 = !DILocation(line: 100, column: 13, scope: !141)
!144 = !DILocation(line: 100, column: 18, scope: !141)
!145 = !DILocation(line: 100, column: 21, scope: !141)
!146 = !DILocation(line: 101, column: 9, scope: !141)
!147 = !DILocation(line: 98, column: 31, scope: !137)
!148 = !DILocation(line: 98, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !65}
!150 = !DILocation(line: 101, column: 9, scope: !134)
!151 = !DILocation(line: 102, column: 9, scope: !126)
!152 = !DILocation(line: 102, column: 21, scope: !126)
!153 = !DILocation(line: 103, column: 19, scope: !126)
!154 = !DILocation(line: 103, column: 9, scope: !126)
!155 = !DILocation(line: 104, column: 14, scope: !126)
!156 = !DILocation(line: 104, column: 9, scope: !126)
!157 = !DILocation(line: 106, column: 1, scope: !117)
!158 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 69, type: !74, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", arg: 1, scope: !158, file: !13, line: 69, type: !7)
!160 = !DILocation(line: 69, column: 37, scope: !158)
!161 = !DILocation(line: 71, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !13, line: 71, column: 8)
!163 = !DILocation(line: 71, column: 8, scope: !158)
!164 = !DILocation(line: 74, column: 9, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !13, line: 72, column: 5)
!166 = !DILocation(line: 75, column: 5, scope: !165)
!167 = !DILocation(line: 79, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !162, file: !13, line: 77, column: 5)
!169 = !DILocation(line: 79, column: 14, scope: !168)
!170 = !DILocation(line: 80, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !13, line: 80, column: 13)
!172 = !DILocation(line: 80, column: 18, scope: !171)
!173 = !DILocation(line: 80, column: 13, scope: !168)
!174 = !DILocation(line: 80, column: 28, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !13, line: 80, column: 27)
!176 = !DILocation(line: 81, column: 9, scope: !168)
!177 = !DILocation(line: 81, column: 17, scope: !168)
!178 = !DILocation(line: 83, column: 12, scope: !158)
!179 = !DILocation(line: 83, column: 5, scope: !158)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 121, type: !24, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocalVariable(name: "data", scope: !180, file: !13, line: 123, type: !7)
!182 = !DILocation(line: 123, column: 12, scope: !180)
!183 = !DILocation(line: 124, column: 10, scope: !180)
!184 = !DILocation(line: 125, column: 20, scope: !180)
!185 = !DILocation(line: 126, column: 27, scope: !180)
!186 = !DILocation(line: 126, column: 12, scope: !180)
!187 = !DILocation(line: 126, column: 10, scope: !180)
!188 = !DILocalVariable(name: "i", scope: !189, file: !13, line: 128, type: !35)
!189 = distinct !DILexicalBlock(scope: !180, file: !13, line: 127, column: 5)
!190 = !DILocation(line: 128, column: 16, scope: !189)
!191 = !DILocalVariable(name: "source", scope: !189, file: !13, line: 129, type: !40)
!192 = !DILocation(line: 129, column: 14, scope: !189)
!193 = !DILocation(line: 130, column: 9, scope: !189)
!194 = !DILocation(line: 131, column: 9, scope: !189)
!195 = !DILocation(line: 131, column: 23, scope: !189)
!196 = !DILocation(line: 133, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !189, file: !13, line: 133, column: 9)
!198 = !DILocation(line: 133, column: 14, scope: !197)
!199 = !DILocation(line: 133, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !13, line: 133, column: 9)
!201 = !DILocation(line: 133, column: 23, scope: !200)
!202 = !DILocation(line: 133, column: 9, scope: !197)
!203 = !DILocation(line: 135, column: 30, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !13, line: 134, column: 9)
!205 = !DILocation(line: 135, column: 23, scope: !204)
!206 = !DILocation(line: 135, column: 13, scope: !204)
!207 = !DILocation(line: 135, column: 18, scope: !204)
!208 = !DILocation(line: 135, column: 21, scope: !204)
!209 = !DILocation(line: 136, column: 9, scope: !204)
!210 = !DILocation(line: 133, column: 31, scope: !200)
!211 = !DILocation(line: 133, column: 9, scope: !200)
!212 = distinct !{!212, !202, !213, !65}
!213 = !DILocation(line: 136, column: 9, scope: !197)
!214 = !DILocation(line: 137, column: 9, scope: !189)
!215 = !DILocation(line: 137, column: 21, scope: !189)
!216 = !DILocation(line: 138, column: 19, scope: !189)
!217 = !DILocation(line: 138, column: 9, scope: !189)
!218 = !DILocation(line: 139, column: 14, scope: !189)
!219 = !DILocation(line: 139, column: 9, scope: !189)
!220 = !DILocation(line: 141, column: 1, scope: !180)
!221 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 109, type: !74, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!222 = !DILocalVariable(name: "data", arg: 1, scope: !221, file: !13, line: 109, type: !7)
!223 = !DILocation(line: 109, column: 37, scope: !221)
!224 = !DILocation(line: 111, column: 8, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !13, line: 111, column: 8)
!226 = !DILocation(line: 111, column: 8, scope: !221)
!227 = !DILocation(line: 114, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !13, line: 112, column: 5)
!229 = !DILocation(line: 114, column: 14, scope: !228)
!230 = !DILocation(line: 115, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !13, line: 115, column: 13)
!232 = !DILocation(line: 115, column: 18, scope: !231)
!233 = !DILocation(line: 115, column: 13, scope: !228)
!234 = !DILocation(line: 115, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !13, line: 115, column: 27)
!236 = !DILocation(line: 116, column: 9, scope: !228)
!237 = !DILocation(line: 116, column: 17, scope: !228)
!238 = !DILocation(line: 117, column: 5, scope: !228)
!239 = !DILocation(line: 118, column: 12, scope: !221)
!240 = !DILocation(line: 118, column: 5, scope: !221)
