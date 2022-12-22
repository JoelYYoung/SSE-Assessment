; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  store i32 1, i32* @badStatic, align 4, !dbg !28
  %0 = load i32*, i32** %data, align 8, !dbg !29
  %call = call i32* @badSource(i32* %0), !dbg !30
  store i32* %call, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %2, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !53
  %4 = load i32, i32* %arrayidx, align 4, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !54
  store i32 %4, i32* %arrayidx1, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %7, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !63
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !63
  call void @printIntLine(i32 %9), !dbg !64
  %10 = load i32*, i32** %data, align 8, !dbg !65
  %11 = bitcast i32* %10 to i8*, !dbg !65
  call void @free(i8* %11) #6, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !68 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i32, i32* @badStatic, align 4, !dbg !73
  %tobool = icmp ne i32 %0, 0, !dbg !73
  br i1 %tobool, label %if.then, label %if.end2, !dbg !75

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !76
  %1 = bitcast i8* %call to i32*, !dbg !78
  store i32* %1, i32** %data.addr, align 8, !dbg !79
  %2 = load i32*, i32** %data.addr, align 8, !dbg !80
  %cmp = icmp eq i32* %2, null, !dbg !82
  br i1 %cmp, label %if.then1, label %if.end, !dbg !83

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !86

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !87
  ret i32* %3, !dbg !88
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21_good() #0 !dbg !89 {
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
  %call = call i64 @time(i64* null) #6, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #6, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
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
define internal void @goodG2B1() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !117
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !119
  store i32* %call, i32** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %2, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !136
  %4 = load i32, i32* %arrayidx, align 4, !dbg !136
  %5 = load i32*, i32** %data, align 8, !dbg !137
  %6 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !137
  store i32 %4, i32* %arrayidx1, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %7, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !145
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !145
  call void @printIntLine(i32 %9), !dbg !146
  %10 = load i32*, i32** %data, align 8, !dbg !147
  %11 = bitcast i32* %10 to i8*, !dbg !147
  call void @free(i8* %11) #6, !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !156
  br label %if.end2, !dbg !158

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !159
  %1 = bitcast i8* %call to i32*, !dbg !161
  store i32* %1, i32** %data.addr, align 8, !dbg !162
  %2 = load i32*, i32** %data.addr, align 8, !dbg !163
  %cmp = icmp eq i32* %2, null, !dbg !165
  br i1 %cmp, label %if.then1, label %if.end, !dbg !166

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !169
  ret i32* %3, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !171 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !172, metadata !DIExpression()), !dbg !173
  store i32* null, i32** %data, align 8, !dbg !174
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !175
  %0 = load i32*, i32** %data, align 8, !dbg !176
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !177
  store i32* %call, i32** %data, align 8, !dbg !178
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !179, metadata !DIExpression()), !dbg !181
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !DIExpression()), !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !188
  %cmp = icmp ult i64 %2, 100, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !194
  %4 = load i32, i32* %arrayidx, align 4, !dbg !194
  %5 = load i32*, i32** %data, align 8, !dbg !195
  %6 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !195
  store i32 %4, i32* %arrayidx1, align 4, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %7, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !203
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !203
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !203
  call void @printIntLine(i32 %9), !dbg !204
  %10 = load i32*, i32** %data, align 8, !dbg !205
  %11 = bitcast i32* %10 to i8*, !dbg !205
  call void @free(i8* %11) #6, !dbg !206
  ret void, !dbg !207
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !208 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !209, metadata !DIExpression()), !dbg !210
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !211
  %tobool = icmp ne i32 %0, 0, !dbg !211
  br i1 %tobool, label %if.then, label %if.end2, !dbg !213

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !214
  %1 = bitcast i8* %call to i32*, !dbg !216
  store i32* %1, i32** %data.addr, align 8, !dbg !217
  %2 = load i32*, i32** %data.addr, align 8, !dbg !218
  %cmp = icmp eq i32* %2, null, !dbg !220
  br i1 %cmp, label %if.then1, label %if.end, !dbg !221

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !222
  unreachable, !dbg !222

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !224

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !225
  ret i32* %3, !dbg !226
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
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 22, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 61, type: !8, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21.c", directory: "/root/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 62, type: !8, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21_bad", scope: !13, file: !13, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 37, type: !7)
!26 = !DILocation(line: 37, column: 11, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 39, column: 15, scope: !22)
!29 = !DILocation(line: 40, column: 22, scope: !22)
!30 = !DILocation(line: 40, column: 12, scope: !22)
!31 = !DILocation(line: 40, column: 10, scope: !22)
!32 = !DILocalVariable(name: "source", scope: !33, file: !13, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !22, file: !13, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 42, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !13, line: 44, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 43, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 44, column: 20, scope: !39)
!44 = !DILocation(line: 46, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !13, line: 46, column: 13)
!46 = !DILocation(line: 46, column: 18, scope: !45)
!47 = !DILocation(line: 46, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !13, line: 46, column: 13)
!49 = !DILocation(line: 46, column: 27, scope: !48)
!50 = !DILocation(line: 46, column: 13, scope: !45)
!51 = !DILocation(line: 48, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 47, column: 13)
!53 = !DILocation(line: 48, column: 27, scope: !52)
!54 = !DILocation(line: 48, column: 17, scope: !52)
!55 = !DILocation(line: 48, column: 22, scope: !52)
!56 = !DILocation(line: 48, column: 25, scope: !52)
!57 = !DILocation(line: 49, column: 13, scope: !52)
!58 = !DILocation(line: 46, column: 35, scope: !48)
!59 = !DILocation(line: 46, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 49, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 50, column: 26, scope: !39)
!64 = !DILocation(line: 50, column: 13, scope: !39)
!65 = !DILocation(line: 51, column: 18, scope: !39)
!66 = !DILocation(line: 51, column: 13, scope: !39)
!67 = !DILocation(line: 54, column: 1, scope: !22)
!68 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 24, type: !69, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7}
!71 = !DILocalVariable(name: "data", arg: 1, scope: !68, file: !13, line: 24, type: !7)
!72 = !DILocation(line: 24, column: 30, scope: !68)
!73 = !DILocation(line: 26, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !13, line: 26, column: 8)
!75 = !DILocation(line: 26, column: 8, scope: !68)
!76 = !DILocation(line: 29, column: 23, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !13, line: 27, column: 5)
!78 = !DILocation(line: 29, column: 16, scope: !77)
!79 = !DILocation(line: 29, column: 14, scope: !77)
!80 = !DILocation(line: 30, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !13, line: 30, column: 13)
!82 = !DILocation(line: 30, column: 18, scope: !81)
!83 = !DILocation(line: 30, column: 13, scope: !77)
!84 = !DILocation(line: 30, column: 28, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !13, line: 30, column: 27)
!86 = !DILocation(line: 31, column: 5, scope: !77)
!87 = !DILocation(line: 32, column: 12, scope: !68)
!88 = !DILocation(line: 32, column: 5, scope: !68)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_21_good", scope: !13, file: !13, line: 135, type: !23, scopeLine: 136, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocation(line: 137, column: 5, scope: !89)
!91 = !DILocation(line: 138, column: 5, scope: !89)
!92 = !DILocation(line: 139, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 151, type: !94, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!8, !8, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !13, line: 151, type: !8)
!100 = !DILocation(line: 151, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !13, line: 151, type: !96)
!102 = !DILocation(line: 151, column: 27, scope: !93)
!103 = !DILocation(line: 154, column: 22, scope: !93)
!104 = !DILocation(line: 154, column: 12, scope: !93)
!105 = !DILocation(line: 154, column: 5, scope: !93)
!106 = !DILocation(line: 156, column: 5, scope: !93)
!107 = !DILocation(line: 157, column: 5, scope: !93)
!108 = !DILocation(line: 158, column: 5, scope: !93)
!109 = !DILocation(line: 161, column: 5, scope: !93)
!110 = !DILocation(line: 162, column: 5, scope: !93)
!111 = !DILocation(line: 163, column: 5, scope: !93)
!112 = !DILocation(line: 165, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 81, type: !23, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !13, line: 83, type: !7)
!115 = !DILocation(line: 83, column: 11, scope: !113)
!116 = !DILocation(line: 84, column: 10, scope: !113)
!117 = !DILocation(line: 85, column: 20, scope: !113)
!118 = !DILocation(line: 86, column: 27, scope: !113)
!119 = !DILocation(line: 86, column: 12, scope: !113)
!120 = !DILocation(line: 86, column: 10, scope: !113)
!121 = !DILocalVariable(name: "source", scope: !122, file: !13, line: 88, type: !34)
!122 = distinct !DILexicalBlock(scope: !113, file: !13, line: 87, column: 5)
!123 = !DILocation(line: 88, column: 13, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !13, line: 90, type: !40)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 89, column: 9)
!126 = !DILocation(line: 90, column: 20, scope: !125)
!127 = !DILocation(line: 92, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !13, line: 92, column: 13)
!129 = !DILocation(line: 92, column: 18, scope: !128)
!130 = !DILocation(line: 92, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !13, line: 92, column: 13)
!132 = !DILocation(line: 92, column: 27, scope: !131)
!133 = !DILocation(line: 92, column: 13, scope: !128)
!134 = !DILocation(line: 94, column: 34, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !13, line: 93, column: 13)
!136 = !DILocation(line: 94, column: 27, scope: !135)
!137 = !DILocation(line: 94, column: 17, scope: !135)
!138 = !DILocation(line: 94, column: 22, scope: !135)
!139 = !DILocation(line: 94, column: 25, scope: !135)
!140 = !DILocation(line: 95, column: 13, scope: !135)
!141 = !DILocation(line: 92, column: 35, scope: !131)
!142 = !DILocation(line: 92, column: 13, scope: !131)
!143 = distinct !{!143, !133, !144, !62}
!144 = !DILocation(line: 95, column: 13, scope: !128)
!145 = !DILocation(line: 96, column: 26, scope: !125)
!146 = !DILocation(line: 96, column: 13, scope: !125)
!147 = !DILocation(line: 97, column: 18, scope: !125)
!148 = !DILocation(line: 97, column: 13, scope: !125)
!149 = !DILocation(line: 100, column: 1, scope: !113)
!150 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 65, type: !69, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !13, line: 65, type: !7)
!152 = !DILocation(line: 65, column: 35, scope: !150)
!153 = !DILocation(line: 67, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !13, line: 67, column: 8)
!155 = !DILocation(line: 67, column: 8, scope: !150)
!156 = !DILocation(line: 70, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !13, line: 68, column: 5)
!158 = !DILocation(line: 71, column: 5, scope: !157)
!159 = !DILocation(line: 75, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !13, line: 73, column: 5)
!161 = !DILocation(line: 75, column: 16, scope: !160)
!162 = !DILocation(line: 75, column: 14, scope: !160)
!163 = !DILocation(line: 76, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 76, column: 13)
!165 = !DILocation(line: 76, column: 18, scope: !164)
!166 = !DILocation(line: 76, column: 13, scope: !160)
!167 = !DILocation(line: 76, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 76, column: 27)
!169 = !DILocation(line: 78, column: 12, scope: !150)
!170 = !DILocation(line: 78, column: 5, scope: !150)
!171 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 114, type: !23, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!172 = !DILocalVariable(name: "data", scope: !171, file: !13, line: 116, type: !7)
!173 = !DILocation(line: 116, column: 11, scope: !171)
!174 = !DILocation(line: 117, column: 10, scope: !171)
!175 = !DILocation(line: 118, column: 20, scope: !171)
!176 = !DILocation(line: 119, column: 27, scope: !171)
!177 = !DILocation(line: 119, column: 12, scope: !171)
!178 = !DILocation(line: 119, column: 10, scope: !171)
!179 = !DILocalVariable(name: "source", scope: !180, file: !13, line: 121, type: !34)
!180 = distinct !DILexicalBlock(scope: !171, file: !13, line: 120, column: 5)
!181 = !DILocation(line: 121, column: 13, scope: !180)
!182 = !DILocalVariable(name: "i", scope: !183, file: !13, line: 123, type: !40)
!183 = distinct !DILexicalBlock(scope: !180, file: !13, line: 122, column: 9)
!184 = !DILocation(line: 123, column: 20, scope: !183)
!185 = !DILocation(line: 125, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !13, line: 125, column: 13)
!187 = !DILocation(line: 125, column: 18, scope: !186)
!188 = !DILocation(line: 125, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !13, line: 125, column: 13)
!190 = !DILocation(line: 125, column: 27, scope: !189)
!191 = !DILocation(line: 125, column: 13, scope: !186)
!192 = !DILocation(line: 127, column: 34, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !13, line: 126, column: 13)
!194 = !DILocation(line: 127, column: 27, scope: !193)
!195 = !DILocation(line: 127, column: 17, scope: !193)
!196 = !DILocation(line: 127, column: 22, scope: !193)
!197 = !DILocation(line: 127, column: 25, scope: !193)
!198 = !DILocation(line: 128, column: 13, scope: !193)
!199 = !DILocation(line: 125, column: 35, scope: !189)
!200 = !DILocation(line: 125, column: 13, scope: !189)
!201 = distinct !{!201, !191, !202, !62}
!202 = !DILocation(line: 128, column: 13, scope: !186)
!203 = !DILocation(line: 129, column: 26, scope: !183)
!204 = !DILocation(line: 129, column: 13, scope: !183)
!205 = !DILocation(line: 130, column: 18, scope: !183)
!206 = !DILocation(line: 130, column: 13, scope: !183)
!207 = !DILocation(line: 133, column: 1, scope: !171)
!208 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 103, type: !69, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!209 = !DILocalVariable(name: "data", arg: 1, scope: !208, file: !13, line: 103, type: !7)
!210 = !DILocation(line: 103, column: 35, scope: !208)
!211 = !DILocation(line: 105, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !13, line: 105, column: 8)
!213 = !DILocation(line: 105, column: 8, scope: !208)
!214 = !DILocation(line: 108, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !13, line: 106, column: 5)
!216 = !DILocation(line: 108, column: 16, scope: !215)
!217 = !DILocation(line: 108, column: 14, scope: !215)
!218 = !DILocation(line: 109, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !13, line: 109, column: 13)
!220 = !DILocation(line: 109, column: 18, scope: !219)
!221 = !DILocation(line: 109, column: 13, scope: !215)
!222 = !DILocation(line: 109, column: 28, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !13, line: 109, column: 27)
!224 = !DILocation(line: 110, column: 5, scope: !215)
!225 = !DILocation(line: 111, column: 12, scope: !208)
!226 = !DILocation(line: 111, column: 5, scope: !208)
