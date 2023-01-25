; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !52
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !53
  store i64 %call4, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !58
  %4 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %4, 1, !dbg !61
  %cmp5 = icmp ult i64 %3, %add, !dbg !62
  br i1 %cmp5, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !66
  %6 = load i8, i8* %arrayidx, align 1, !dbg !66
  %7 = load i8*, i8** %data, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !67
  store i8 %6, i8* %arrayidx6, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %9, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %10), !dbg !77
  %11 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* %11) #7, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %0 = load i32, i32* @staticFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end3, !dbg !113

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %cmp1 = icmp eq i8* %1, null, !dbg !119
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !130
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !131
  store i64 %call4, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !136
  %4 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %4, 1, !dbg !139
  %cmp5 = icmp ult i64 %3, %add, !dbg !140
  br i1 %cmp5, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !144
  %6 = load i8, i8* %arrayidx, align 1, !dbg !144
  %7 = load i8*, i8** %data, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !145
  store i8 %6, i8* %arrayidx6, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %9, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %10), !dbg !154
  %11 = load i8*, i8** %data, align 8, !dbg !155
  call void @free(i8* %11) #7, !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i8* null, i8** %data, align 8, !dbg !161
  %0 = load i32, i32* @staticFive, align 4, !dbg !162
  %cmp = icmp eq i32 %0, 5, !dbg !164
  br i1 %cmp, label %if.then, label %if.end3, !dbg !165

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !166
  store i8* %call, i8** %data, align 8, !dbg !168
  %1 = load i8*, i8** %data, align 8, !dbg !169
  %cmp1 = icmp eq i8* %1, null, !dbg !171
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !172

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !175

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !176, metadata !DIExpression()), !dbg !178
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !181, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !183
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !184
  store i64 %call4, i64* %sourceLen, align 8, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !189
  %4 = load i64, i64* %sourceLen, align 8, !dbg !191
  %add = add i64 %4, 1, !dbg !192
  %cmp5 = icmp ult i64 %3, %add, !dbg !193
  br i1 %cmp5, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !197
  %6 = load i8, i8* %arrayidx, align 1, !dbg !197
  %7 = load i8*, i8** %data, align 8, !dbg !198
  %8 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !198
  store i8 %6, i8* %arrayidx6, align 1, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %9, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !206
  call void @printLine(i8* %10), !dbg !207
  %11 = load i8*, i8** %data, align 8, !dbg !208
  call void @free(i8* %11) #7, !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 30, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_bad", scope: !11, file: !11, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 12, scope: !19)
!24 = !DILocation(line: 37, column: 10, scope: !19)
!25 = !DILocation(line: 38, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 38, column: 8)
!27 = !DILocation(line: 38, column: 18, scope: !26)
!28 = !DILocation(line: 38, column: 8, scope: !19)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 39, column: 5)
!31 = !DILocation(line: 41, column: 14, scope: !30)
!32 = !DILocation(line: 42, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 42, column: 13)
!34 = !DILocation(line: 42, column: 18, scope: !33)
!35 = !DILocation(line: 42, column: 13, scope: !30)
!36 = !DILocation(line: 42, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 42, column: 27)
!38 = !DILocation(line: 43, column: 5, scope: !30)
!39 = !DILocalVariable(name: "source", scope: !40, file: !11, line: 45, type: !41)
!40 = distinct !DILexicalBlock(scope: !19, file: !11, line: 44, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 45, column: 14, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !11, line: 46, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 46, column: 16, scope: !40)
!50 = !DILocalVariable(name: "sourceLen", scope: !40, file: !11, line: 46, type: !46)
!51 = !DILocation(line: 46, column: 19, scope: !40)
!52 = !DILocation(line: 47, column: 28, scope: !40)
!53 = !DILocation(line: 47, column: 21, scope: !40)
!54 = !DILocation(line: 47, column: 19, scope: !40)
!55 = !DILocation(line: 50, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !11, line: 50, column: 9)
!57 = !DILocation(line: 50, column: 14, scope: !56)
!58 = !DILocation(line: 50, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !11, line: 50, column: 9)
!60 = !DILocation(line: 50, column: 25, scope: !59)
!61 = !DILocation(line: 50, column: 35, scope: !59)
!62 = !DILocation(line: 50, column: 23, scope: !59)
!63 = !DILocation(line: 50, column: 9, scope: !56)
!64 = !DILocation(line: 52, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !11, line: 51, column: 9)
!66 = !DILocation(line: 52, column: 23, scope: !65)
!67 = !DILocation(line: 52, column: 13, scope: !65)
!68 = !DILocation(line: 52, column: 18, scope: !65)
!69 = !DILocation(line: 52, column: 21, scope: !65)
!70 = !DILocation(line: 53, column: 9, scope: !65)
!71 = !DILocation(line: 50, column: 41, scope: !59)
!72 = !DILocation(line: 50, column: 9, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 53, column: 9, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 54, column: 19, scope: !40)
!77 = !DILocation(line: 54, column: 9, scope: !40)
!78 = !DILocation(line: 55, column: 14, scope: !40)
!79 = !DILocation(line: 55, column: 9, scope: !40)
!80 = !DILocation(line: 57, column: 1, scope: !19)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_07_good", scope: !11, file: !11, line: 120, type: !20, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 122, column: 5, scope: !81)
!83 = !DILocation(line: 123, column: 5, scope: !81)
!84 = !DILocation(line: 124, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 136, type: !86, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!12, !12, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !11, line: 136, type: !12)
!90 = !DILocation(line: 136, column: 14, scope: !85)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !11, line: 136, type: !88)
!92 = !DILocation(line: 136, column: 27, scope: !85)
!93 = !DILocation(line: 139, column: 22, scope: !85)
!94 = !DILocation(line: 139, column: 12, scope: !85)
!95 = !DILocation(line: 139, column: 5, scope: !85)
!96 = !DILocation(line: 141, column: 5, scope: !85)
!97 = !DILocation(line: 142, column: 5, scope: !85)
!98 = !DILocation(line: 143, column: 5, scope: !85)
!99 = !DILocation(line: 146, column: 5, scope: !85)
!100 = !DILocation(line: 147, column: 5, scope: !85)
!101 = !DILocation(line: 148, column: 5, scope: !85)
!102 = !DILocation(line: 150, column: 5, scope: !85)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 64, type: !20, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !11, line: 66, type: !6)
!105 = !DILocation(line: 66, column: 12, scope: !103)
!106 = !DILocation(line: 67, column: 10, scope: !103)
!107 = !DILocation(line: 68, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !11, line: 68, column: 8)
!109 = !DILocation(line: 68, column: 18, scope: !108)
!110 = !DILocation(line: 68, column: 8, scope: !103)
!111 = !DILocation(line: 71, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !11, line: 69, column: 5)
!113 = !DILocation(line: 72, column: 5, scope: !112)
!114 = !DILocation(line: 76, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !11, line: 74, column: 5)
!116 = !DILocation(line: 76, column: 14, scope: !115)
!117 = !DILocation(line: 77, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !11, line: 77, column: 13)
!119 = !DILocation(line: 77, column: 18, scope: !118)
!120 = !DILocation(line: 77, column: 13, scope: !115)
!121 = !DILocation(line: 77, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !11, line: 77, column: 27)
!123 = !DILocalVariable(name: "source", scope: !124, file: !11, line: 80, type: !41)
!124 = distinct !DILexicalBlock(scope: !103, file: !11, line: 79, column: 5)
!125 = !DILocation(line: 80, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !11, line: 81, type: !46)
!127 = !DILocation(line: 81, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !11, line: 81, type: !46)
!129 = !DILocation(line: 81, column: 19, scope: !124)
!130 = !DILocation(line: 82, column: 28, scope: !124)
!131 = !DILocation(line: 82, column: 21, scope: !124)
!132 = !DILocation(line: 82, column: 19, scope: !124)
!133 = !DILocation(line: 85, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !11, line: 85, column: 9)
!135 = !DILocation(line: 85, column: 14, scope: !134)
!136 = !DILocation(line: 85, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !11, line: 85, column: 9)
!138 = !DILocation(line: 85, column: 25, scope: !137)
!139 = !DILocation(line: 85, column: 35, scope: !137)
!140 = !DILocation(line: 85, column: 23, scope: !137)
!141 = !DILocation(line: 85, column: 9, scope: !134)
!142 = !DILocation(line: 87, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !11, line: 86, column: 9)
!144 = !DILocation(line: 87, column: 23, scope: !143)
!145 = !DILocation(line: 87, column: 13, scope: !143)
!146 = !DILocation(line: 87, column: 18, scope: !143)
!147 = !DILocation(line: 87, column: 21, scope: !143)
!148 = !DILocation(line: 88, column: 9, scope: !143)
!149 = !DILocation(line: 85, column: 41, scope: !137)
!150 = !DILocation(line: 85, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !75}
!152 = !DILocation(line: 88, column: 9, scope: !134)
!153 = !DILocation(line: 89, column: 19, scope: !124)
!154 = !DILocation(line: 89, column: 9, scope: !124)
!155 = !DILocation(line: 90, column: 14, scope: !124)
!156 = !DILocation(line: 90, column: 9, scope: !124)
!157 = !DILocation(line: 92, column: 1, scope: !103)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 95, type: !20, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !11, line: 97, type: !6)
!160 = !DILocation(line: 97, column: 12, scope: !158)
!161 = !DILocation(line: 98, column: 10, scope: !158)
!162 = !DILocation(line: 99, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !11, line: 99, column: 8)
!164 = !DILocation(line: 99, column: 18, scope: !163)
!165 = !DILocation(line: 99, column: 8, scope: !158)
!166 = !DILocation(line: 102, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !11, line: 100, column: 5)
!168 = !DILocation(line: 102, column: 14, scope: !167)
!169 = !DILocation(line: 103, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !11, line: 103, column: 13)
!171 = !DILocation(line: 103, column: 18, scope: !170)
!172 = !DILocation(line: 103, column: 13, scope: !167)
!173 = !DILocation(line: 103, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !11, line: 103, column: 27)
!175 = !DILocation(line: 104, column: 5, scope: !167)
!176 = !DILocalVariable(name: "source", scope: !177, file: !11, line: 106, type: !41)
!177 = distinct !DILexicalBlock(scope: !158, file: !11, line: 105, column: 5)
!178 = !DILocation(line: 106, column: 14, scope: !177)
!179 = !DILocalVariable(name: "i", scope: !177, file: !11, line: 107, type: !46)
!180 = !DILocation(line: 107, column: 16, scope: !177)
!181 = !DILocalVariable(name: "sourceLen", scope: !177, file: !11, line: 107, type: !46)
!182 = !DILocation(line: 107, column: 19, scope: !177)
!183 = !DILocation(line: 108, column: 28, scope: !177)
!184 = !DILocation(line: 108, column: 21, scope: !177)
!185 = !DILocation(line: 108, column: 19, scope: !177)
!186 = !DILocation(line: 111, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !177, file: !11, line: 111, column: 9)
!188 = !DILocation(line: 111, column: 14, scope: !187)
!189 = !DILocation(line: 111, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !11, line: 111, column: 9)
!191 = !DILocation(line: 111, column: 25, scope: !190)
!192 = !DILocation(line: 111, column: 35, scope: !190)
!193 = !DILocation(line: 111, column: 23, scope: !190)
!194 = !DILocation(line: 111, column: 9, scope: !187)
!195 = !DILocation(line: 113, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !190, file: !11, line: 112, column: 9)
!197 = !DILocation(line: 113, column: 23, scope: !196)
!198 = !DILocation(line: 113, column: 13, scope: !196)
!199 = !DILocation(line: 113, column: 18, scope: !196)
!200 = !DILocation(line: 113, column: 21, scope: !196)
!201 = !DILocation(line: 114, column: 9, scope: !196)
!202 = !DILocation(line: 111, column: 41, scope: !190)
!203 = !DILocation(line: 111, column: 9, scope: !190)
!204 = distinct !{!204, !194, !205, !75}
!205 = !DILocation(line: 114, column: 9, scope: !187)
!206 = !DILocation(line: 115, column: 19, scope: !177)
!207 = !DILocation(line: 115, column: 9, scope: !177)
!208 = !DILocation(line: 116, column: 14, scope: !177)
!209 = !DILocation(line: 116, column: 9, scope: !177)
!210 = !DILocation(line: 118, column: 1, scope: !158)
