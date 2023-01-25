; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !19

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21_bad() #0 !dbg !27 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i64* null, i64** %data, align 8, !dbg !32
  store i32 1, i32* @badStatic, align 4, !dbg !33
  %0 = load i64*, i64** %data, align 8, !dbg !34
  %call = call i64* @badSource(i64* %0), !dbg !35
  store i64* %call, i64** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %2, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !58
  %4 = load i64, i64* %arrayidx, align 8, !dbg !58
  %5 = load i64*, i64** %data, align 8, !dbg !59
  %6 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !59
  store i64 %4, i64* %arrayidx1, align 8, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %7, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !68
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !68
  call void @printLongLongLine(i64 %9), !dbg !69
  %10 = load i64*, i64** %data, align 8, !dbg !70
  %11 = bitcast i64* %10 to i8*, !dbg !70
  call void @free(i8* %11) #6, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64* @badSource(i64* %data) #0 !dbg !73 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @badStatic, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.end2, !dbg !80

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !81
  %1 = bitcast i8* %call to i64*, !dbg !83
  store i64* %1, i64** %data.addr, align 8, !dbg !84
  %2 = load i64*, i64** %data.addr, align 8, !dbg !85
  %cmp = icmp eq i64* %2, null, !dbg !87
  br i1 %cmp, label %if.then1, label %if.end, !dbg !88

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !91

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data.addr, align 8, !dbg !92
  ret i64* %3, !dbg !93
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21_good() #0 !dbg !94 {
entry:
  call void @goodG2B1(), !dbg !95
  call void @goodG2B2(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #6, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #6, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !118 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i64* null, i64** %data, align 8, !dbg !121
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !122
  %0 = load i64*, i64** %data, align 8, !dbg !123
  %call = call i64* @goodG2B1Source(i64* %0), !dbg !124
  store i64* %call, i64** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %2, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !141
  %4 = load i64, i64* %arrayidx, align 8, !dbg !141
  %5 = load i64*, i64** %data, align 8, !dbg !142
  %6 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !142
  store i64 %4, i64* %arrayidx1, align 8, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %7, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !150
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !150
  call void @printLongLongLine(i64 %9), !dbg !151
  %10 = load i64*, i64** %data, align 8, !dbg !152
  %11 = bitcast i64* %10 to i8*, !dbg !152
  call void @free(i8* %11) #6, !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2B1Source(i64* %data) #0 !dbg !155 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !158
  %tobool = icmp ne i32 %0, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.else, !dbg !160

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !161
  br label %if.end2, !dbg !163

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !164
  %1 = bitcast i8* %call to i64*, !dbg !166
  store i64* %1, i64** %data.addr, align 8, !dbg !167
  %2 = load i64*, i64** %data.addr, align 8, !dbg !168
  %cmp = icmp eq i64* %2, null, !dbg !170
  br i1 %cmp, label %if.then1, label %if.end, !dbg !171

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !174
  ret i64* %3, !dbg !175
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !176 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !177, metadata !DIExpression()), !dbg !178
  store i64* null, i64** %data, align 8, !dbg !179
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !180
  %0 = load i64*, i64** %data, align 8, !dbg !181
  %call = call i64* @goodG2B2Source(i64* %0), !dbg !182
  store i64* %call, i64** %data, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !184, metadata !DIExpression()), !dbg !186
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %i, metadata !187, metadata !DIExpression()), !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !193
  %cmp = icmp ult i64 %2, 100, !dbg !195
  br i1 %cmp, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !199
  %4 = load i64, i64* %arrayidx, align 8, !dbg !199
  %5 = load i64*, i64** %data, align 8, !dbg !200
  %6 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !200
  store i64 %4, i64* %arrayidx1, align 8, !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !204
  %inc = add i64 %7, 1, !dbg !204
  store i64 %inc, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !208
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !208
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !208
  call void @printLongLongLine(i64 %9), !dbg !209
  %10 = load i64*, i64** %data, align 8, !dbg !210
  %11 = bitcast i64* %10 to i8*, !dbg !210
  call void @free(i8* %11) #6, !dbg !211
  ret void, !dbg !212
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2B2Source(i64* %data) #0 !dbg !213 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !214, metadata !DIExpression()), !dbg !215
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !216
  %tobool = icmp ne i32 %0, 0, !dbg !216
  br i1 %tobool, label %if.then, label %if.end2, !dbg !218

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !219
  %1 = bitcast i8* %call to i64*, !dbg !221
  store i64* %1, i64** %data.addr, align 8, !dbg !222
  %2 = load i64*, i64** %data.addr, align 8, !dbg !223
  %cmp = icmp eq i64* %2, null, !dbg !225
  br i1 %cmp, label %if.then1, label %if.end, !dbg !226

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !227
  unreachable, !dbg !227

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !229

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data.addr, align 8, !dbg !230
  ret i64* %3, !dbg !231
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
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !17, line: 22, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !13}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!0, !15, !19}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !17, line: 61, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !17, line: 62, type: !18, isLocal: true, isDefinition: true)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"clang version 13.0.0"}
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21_bad", scope: !17, file: !17, line: 35, type: !28, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "data", scope: !27, file: !17, line: 37, type: !7)
!31 = !DILocation(line: 37, column: 15, scope: !27)
!32 = !DILocation(line: 38, column: 10, scope: !27)
!33 = !DILocation(line: 39, column: 15, scope: !27)
!34 = !DILocation(line: 40, column: 22, scope: !27)
!35 = !DILocation(line: 40, column: 12, scope: !27)
!36 = !DILocation(line: 40, column: 10, scope: !27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 42, type: !39)
!38 = distinct !DILexicalBlock(scope: !27, file: !17, line: 41, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 42, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !17, line: 44, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !17, line: 43, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 44, column: 20, scope: !44)
!49 = !DILocation(line: 46, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !17, line: 46, column: 13)
!51 = !DILocation(line: 46, column: 18, scope: !50)
!52 = !DILocation(line: 46, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !17, line: 46, column: 13)
!54 = !DILocation(line: 46, column: 27, scope: !53)
!55 = !DILocation(line: 46, column: 13, scope: !50)
!56 = !DILocation(line: 48, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !17, line: 47, column: 13)
!58 = !DILocation(line: 48, column: 27, scope: !57)
!59 = !DILocation(line: 48, column: 17, scope: !57)
!60 = !DILocation(line: 48, column: 22, scope: !57)
!61 = !DILocation(line: 48, column: 25, scope: !57)
!62 = !DILocation(line: 49, column: 13, scope: !57)
!63 = !DILocation(line: 46, column: 35, scope: !53)
!64 = !DILocation(line: 46, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 49, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 50, column: 31, scope: !44)
!69 = !DILocation(line: 50, column: 13, scope: !44)
!70 = !DILocation(line: 51, column: 18, scope: !44)
!71 = !DILocation(line: 51, column: 13, scope: !44)
!72 = !DILocation(line: 54, column: 1, scope: !27)
!73 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 24, type: !74, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7}
!76 = !DILocalVariable(name: "data", arg: 1, scope: !73, file: !17, line: 24, type: !7)
!77 = !DILocation(line: 24, column: 38, scope: !73)
!78 = !DILocation(line: 26, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !17, line: 26, column: 8)
!80 = !DILocation(line: 26, column: 8, scope: !73)
!81 = !DILocation(line: 29, column: 27, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !17, line: 27, column: 5)
!83 = !DILocation(line: 29, column: 16, scope: !82)
!84 = !DILocation(line: 29, column: 14, scope: !82)
!85 = !DILocation(line: 30, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 30, column: 13)
!87 = !DILocation(line: 30, column: 18, scope: !86)
!88 = !DILocation(line: 30, column: 13, scope: !82)
!89 = !DILocation(line: 30, column: 28, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !17, line: 30, column: 27)
!91 = !DILocation(line: 31, column: 5, scope: !82)
!92 = !DILocation(line: 32, column: 12, scope: !73)
!93 = !DILocation(line: 32, column: 5, scope: !73)
!94 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_21_good", scope: !17, file: !17, line: 135, type: !28, scopeLine: 136, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 137, column: 5, scope: !94)
!96 = !DILocation(line: 138, column: 5, scope: !94)
!97 = !DILocation(line: 139, column: 1, scope: !94)
!98 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 151, type: !99, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{!18, !18, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !17, line: 151, type: !18)
!105 = !DILocation(line: 151, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !17, line: 151, type: !101)
!107 = !DILocation(line: 151, column: 27, scope: !98)
!108 = !DILocation(line: 154, column: 22, scope: !98)
!109 = !DILocation(line: 154, column: 12, scope: !98)
!110 = !DILocation(line: 154, column: 5, scope: !98)
!111 = !DILocation(line: 156, column: 5, scope: !98)
!112 = !DILocation(line: 157, column: 5, scope: !98)
!113 = !DILocation(line: 158, column: 5, scope: !98)
!114 = !DILocation(line: 161, column: 5, scope: !98)
!115 = !DILocation(line: 162, column: 5, scope: !98)
!116 = !DILocation(line: 163, column: 5, scope: !98)
!117 = !DILocation(line: 165, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 81, type: !28, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 83, type: !7)
!120 = !DILocation(line: 83, column: 15, scope: !118)
!121 = !DILocation(line: 84, column: 10, scope: !118)
!122 = !DILocation(line: 85, column: 20, scope: !118)
!123 = !DILocation(line: 86, column: 27, scope: !118)
!124 = !DILocation(line: 86, column: 12, scope: !118)
!125 = !DILocation(line: 86, column: 10, scope: !118)
!126 = !DILocalVariable(name: "source", scope: !127, file: !17, line: 88, type: !39)
!127 = distinct !DILexicalBlock(scope: !118, file: !17, line: 87, column: 5)
!128 = !DILocation(line: 88, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !130, file: !17, line: 90, type: !45)
!130 = distinct !DILexicalBlock(scope: !127, file: !17, line: 89, column: 9)
!131 = !DILocation(line: 90, column: 20, scope: !130)
!132 = !DILocation(line: 92, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !17, line: 92, column: 13)
!134 = !DILocation(line: 92, column: 18, scope: !133)
!135 = !DILocation(line: 92, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !17, line: 92, column: 13)
!137 = !DILocation(line: 92, column: 27, scope: !136)
!138 = !DILocation(line: 92, column: 13, scope: !133)
!139 = !DILocation(line: 94, column: 34, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 93, column: 13)
!141 = !DILocation(line: 94, column: 27, scope: !140)
!142 = !DILocation(line: 94, column: 17, scope: !140)
!143 = !DILocation(line: 94, column: 22, scope: !140)
!144 = !DILocation(line: 94, column: 25, scope: !140)
!145 = !DILocation(line: 95, column: 13, scope: !140)
!146 = !DILocation(line: 92, column: 35, scope: !136)
!147 = !DILocation(line: 92, column: 13, scope: !136)
!148 = distinct !{!148, !138, !149, !67}
!149 = !DILocation(line: 95, column: 13, scope: !133)
!150 = !DILocation(line: 96, column: 31, scope: !130)
!151 = !DILocation(line: 96, column: 13, scope: !130)
!152 = !DILocation(line: 97, column: 18, scope: !130)
!153 = !DILocation(line: 97, column: 13, scope: !130)
!154 = !DILocation(line: 100, column: 1, scope: !118)
!155 = distinct !DISubprogram(name: "goodG2B1Source", scope: !17, file: !17, line: 65, type: !74, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", arg: 1, scope: !155, file: !17, line: 65, type: !7)
!157 = !DILocation(line: 65, column: 43, scope: !155)
!158 = !DILocation(line: 67, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 67, column: 8)
!160 = !DILocation(line: 67, column: 8, scope: !155)
!161 = !DILocation(line: 70, column: 9, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !17, line: 68, column: 5)
!163 = !DILocation(line: 71, column: 5, scope: !162)
!164 = !DILocation(line: 75, column: 27, scope: !165)
!165 = distinct !DILexicalBlock(scope: !159, file: !17, line: 73, column: 5)
!166 = !DILocation(line: 75, column: 16, scope: !165)
!167 = !DILocation(line: 75, column: 14, scope: !165)
!168 = !DILocation(line: 76, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !17, line: 76, column: 13)
!170 = !DILocation(line: 76, column: 18, scope: !169)
!171 = !DILocation(line: 76, column: 13, scope: !165)
!172 = !DILocation(line: 76, column: 28, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !17, line: 76, column: 27)
!174 = !DILocation(line: 78, column: 12, scope: !155)
!175 = !DILocation(line: 78, column: 5, scope: !155)
!176 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 114, type: !28, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DILocalVariable(name: "data", scope: !176, file: !17, line: 116, type: !7)
!178 = !DILocation(line: 116, column: 15, scope: !176)
!179 = !DILocation(line: 117, column: 10, scope: !176)
!180 = !DILocation(line: 118, column: 20, scope: !176)
!181 = !DILocation(line: 119, column: 27, scope: !176)
!182 = !DILocation(line: 119, column: 12, scope: !176)
!183 = !DILocation(line: 119, column: 10, scope: !176)
!184 = !DILocalVariable(name: "source", scope: !185, file: !17, line: 121, type: !39)
!185 = distinct !DILexicalBlock(scope: !176, file: !17, line: 120, column: 5)
!186 = !DILocation(line: 121, column: 17, scope: !185)
!187 = !DILocalVariable(name: "i", scope: !188, file: !17, line: 123, type: !45)
!188 = distinct !DILexicalBlock(scope: !185, file: !17, line: 122, column: 9)
!189 = !DILocation(line: 123, column: 20, scope: !188)
!190 = !DILocation(line: 125, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !17, line: 125, column: 13)
!192 = !DILocation(line: 125, column: 18, scope: !191)
!193 = !DILocation(line: 125, column: 25, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !17, line: 125, column: 13)
!195 = !DILocation(line: 125, column: 27, scope: !194)
!196 = !DILocation(line: 125, column: 13, scope: !191)
!197 = !DILocation(line: 127, column: 34, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !17, line: 126, column: 13)
!199 = !DILocation(line: 127, column: 27, scope: !198)
!200 = !DILocation(line: 127, column: 17, scope: !198)
!201 = !DILocation(line: 127, column: 22, scope: !198)
!202 = !DILocation(line: 127, column: 25, scope: !198)
!203 = !DILocation(line: 128, column: 13, scope: !198)
!204 = !DILocation(line: 125, column: 35, scope: !194)
!205 = !DILocation(line: 125, column: 13, scope: !194)
!206 = distinct !{!206, !196, !207, !67}
!207 = !DILocation(line: 128, column: 13, scope: !191)
!208 = !DILocation(line: 129, column: 31, scope: !188)
!209 = !DILocation(line: 129, column: 13, scope: !188)
!210 = !DILocation(line: 130, column: 18, scope: !188)
!211 = !DILocation(line: 130, column: 13, scope: !188)
!212 = !DILocation(line: 133, column: 1, scope: !176)
!213 = distinct !DISubprogram(name: "goodG2B2Source", scope: !17, file: !17, line: 103, type: !74, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!214 = !DILocalVariable(name: "data", arg: 1, scope: !213, file: !17, line: 103, type: !7)
!215 = !DILocation(line: 103, column: 43, scope: !213)
!216 = !DILocation(line: 105, column: 8, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !17, line: 105, column: 8)
!218 = !DILocation(line: 105, column: 8, scope: !213)
!219 = !DILocation(line: 108, column: 27, scope: !220)
!220 = distinct !DILexicalBlock(scope: !217, file: !17, line: 106, column: 5)
!221 = !DILocation(line: 108, column: 16, scope: !220)
!222 = !DILocation(line: 108, column: 14, scope: !220)
!223 = !DILocation(line: 109, column: 13, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !17, line: 109, column: 13)
!225 = !DILocation(line: 109, column: 18, scope: !224)
!226 = !DILocation(line: 109, column: 13, scope: !220)
!227 = !DILocation(line: 109, column: 28, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !17, line: 109, column: 27)
!229 = !DILocation(line: 110, column: 5, scope: !220)
!230 = !DILocation(line: 111, column: 12, scope: !213)
!231 = !DILocation(line: 111, column: 5, scope: !213)
