; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp1 = icmp eq i32 %1, 5, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !31

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !52
  store i64 %call4, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !57
  %7 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp5 = icmp ult i64 %6, %7, !dbg !60
  br i1 %cmp5, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !62
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !62
  %10 = load i8, i8* %arrayidx6, align 1, !dbg !62
  %11 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !66
  store i8 %10, i8* %arrayidx7, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %12, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx8, align 1, !dbg !75
  %13 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %13), !dbg !77
  %14 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* %14) #7, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13_good() #0 !dbg !81 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %cmp = icmp eq i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !115
  %cmp1 = icmp ne i32 %1, 5, !dbg !117
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !118

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end3, !dbg !121

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !124
  %3 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !133
  %5 = load i8*, i8** %data, align 8, !dbg !134
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !135
  store i64 %call4, i64* %dataLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !140
  %7 = load i64, i64* %dataLen, align 8, !dbg !142
  %cmp5 = icmp ult i64 %6, %7, !dbg !143
  br i1 %cmp5, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !145
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !145
  %10 = load i8, i8* %arrayidx6, align 1, !dbg !145
  %11 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !149
  store i8 %10, i8* %arrayidx7, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %12, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !156
  store i8 0, i8* %arrayidx8, align 1, !dbg !157
  %13 = load i8*, i8** %data, align 8, !dbg !158
  call void @printLine(i8* %13), !dbg !159
  %14 = load i8*, i8** %data, align 8, !dbg !160
  call void @free(i8* %14) #7, !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !163 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !164, metadata !DIExpression()), !dbg !165
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !166
  store i8* %call, i8** %data, align 8, !dbg !167
  %0 = load i8*, i8** %data, align 8, !dbg !168
  %cmp = icmp eq i8* %0, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !174
  %cmp1 = icmp eq i32 %1, 5, !dbg !176
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !177

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !180
  %3 = load i8*, i8** %data, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !181
  store i8 0, i8* %arrayidx, align 1, !dbg !182
  br label %if.end3, !dbg !183

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !184, metadata !DIExpression()), !dbg !186
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %i, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !189, metadata !DIExpression()), !dbg !190
  %5 = load i8*, i8** %data, align 8, !dbg !191
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !192
  store i64 %call4, i64* %dataLen, align 8, !dbg !193
  store i64 0, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !197
  %7 = load i64, i64* %dataLen, align 8, !dbg !199
  %cmp5 = icmp ult i64 %6, %7, !dbg !200
  br i1 %cmp5, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !202
  %9 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !202
  %10 = load i8, i8* %arrayidx6, align 1, !dbg !202
  %11 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !206
  store i8 %10, i8* %arrayidx7, align 1, !dbg !207
  br label %for.inc, !dbg !208

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !209
  %inc = add i64 %12, 1, !dbg !209
  store i64 %inc, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !210, !llvm.loop !211

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !213
  store i8 0, i8* %arrayidx8, align 1, !dbg !214
  %13 = load i8*, i8** %data, align 8, !dbg !215
  call void @printLine(i8* %13), !dbg !216
  %14 = load i8*, i8** %data, align 8, !dbg !217
  call void @free(i8* %14) #7, !dbg !218
  ret void, !dbg !219
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 25, scope: !29)
!31 = !DILocation(line: 28, column: 8, scope: !14)
!32 = !DILocation(line: 31, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 9, scope: !33)
!36 = !DILocation(line: 32, column: 21, scope: !33)
!37 = !DILocation(line: 33, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 14, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !15, line: 36, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 36, column: 16, scope: !39)
!49 = !DILocalVariable(name: "dataLen", scope: !39, file: !15, line: 36, type: !45)
!50 = !DILocation(line: 36, column: 19, scope: !39)
!51 = !DILocation(line: 37, column: 26, scope: !39)
!52 = !DILocation(line: 37, column: 19, scope: !39)
!53 = !DILocation(line: 37, column: 17, scope: !39)
!54 = !DILocation(line: 39, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !15, line: 39, column: 9)
!56 = !DILocation(line: 39, column: 14, scope: !55)
!57 = !DILocation(line: 39, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !15, line: 39, column: 9)
!59 = !DILocation(line: 39, column: 25, scope: !58)
!60 = !DILocation(line: 39, column: 23, scope: !58)
!61 = !DILocation(line: 39, column: 9, scope: !55)
!62 = !DILocation(line: 41, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !15, line: 40, column: 9)
!64 = !DILocation(line: 41, column: 28, scope: !63)
!65 = !DILocation(line: 41, column: 18, scope: !63)
!66 = !DILocation(line: 41, column: 13, scope: !63)
!67 = !DILocation(line: 41, column: 21, scope: !63)
!68 = !DILocation(line: 42, column: 9, scope: !63)
!69 = !DILocation(line: 39, column: 35, scope: !58)
!70 = !DILocation(line: 39, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 42, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 43, column: 9, scope: !39)
!75 = !DILocation(line: 43, column: 20, scope: !39)
!76 = !DILocation(line: 44, column: 19, scope: !39)
!77 = !DILocation(line: 44, column: 9, scope: !39)
!78 = !DILocation(line: 45, column: 14, scope: !39)
!79 = !DILocation(line: 45, column: 9, scope: !39)
!80 = !DILocation(line: 47, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_13_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 114, column: 5, scope: !81)
!83 = !DILocation(line: 115, column: 5, scope: !81)
!84 = !DILocation(line: 116, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 128, type: !86, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 128, type: !88)
!91 = !DILocation(line: 128, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 128, type: !89)
!93 = !DILocation(line: 128, column: 27, scope: !85)
!94 = !DILocation(line: 131, column: 22, scope: !85)
!95 = !DILocation(line: 131, column: 12, scope: !85)
!96 = !DILocation(line: 131, column: 5, scope: !85)
!97 = !DILocation(line: 133, column: 5, scope: !85)
!98 = !DILocation(line: 134, column: 5, scope: !85)
!99 = !DILocation(line: 135, column: 5, scope: !85)
!100 = !DILocation(line: 138, column: 5, scope: !85)
!101 = !DILocation(line: 139, column: 5, scope: !85)
!102 = !DILocation(line: 140, column: 5, scope: !85)
!103 = !DILocation(line: 142, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 56, type: !4)
!106 = !DILocation(line: 56, column: 12, scope: !104)
!107 = !DILocation(line: 57, column: 20, scope: !104)
!108 = !DILocation(line: 57, column: 10, scope: !104)
!109 = !DILocation(line: 58, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 58, column: 9)
!111 = !DILocation(line: 58, column: 14, scope: !110)
!112 = !DILocation(line: 58, column: 9, scope: !104)
!113 = !DILocation(line: 58, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 58, column: 23)
!115 = !DILocation(line: 59, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !15, line: 59, column: 8)
!117 = !DILocation(line: 59, column: 25, scope: !116)
!118 = !DILocation(line: 59, column: 8, scope: !104)
!119 = !DILocation(line: 62, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 60, column: 5)
!121 = !DILocation(line: 63, column: 5, scope: !120)
!122 = !DILocation(line: 67, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !15, line: 65, column: 5)
!124 = !DILocation(line: 67, column: 9, scope: !123)
!125 = !DILocation(line: 68, column: 9, scope: !123)
!126 = !DILocation(line: 68, column: 20, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !15, line: 71, type: !40)
!128 = distinct !DILexicalBlock(scope: !104, file: !15, line: 70, column: 5)
!129 = !DILocation(line: 71, column: 14, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !15, line: 72, type: !45)
!131 = !DILocation(line: 72, column: 16, scope: !128)
!132 = !DILocalVariable(name: "dataLen", scope: !128, file: !15, line: 72, type: !45)
!133 = !DILocation(line: 72, column: 19, scope: !128)
!134 = !DILocation(line: 73, column: 26, scope: !128)
!135 = !DILocation(line: 73, column: 19, scope: !128)
!136 = !DILocation(line: 73, column: 17, scope: !128)
!137 = !DILocation(line: 75, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !15, line: 75, column: 9)
!139 = !DILocation(line: 75, column: 14, scope: !138)
!140 = !DILocation(line: 75, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 75, column: 9)
!142 = !DILocation(line: 75, column: 25, scope: !141)
!143 = !DILocation(line: 75, column: 23, scope: !141)
!144 = !DILocation(line: 75, column: 9, scope: !138)
!145 = !DILocation(line: 77, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !15, line: 76, column: 9)
!147 = !DILocation(line: 77, column: 28, scope: !146)
!148 = !DILocation(line: 77, column: 18, scope: !146)
!149 = !DILocation(line: 77, column: 13, scope: !146)
!150 = !DILocation(line: 77, column: 21, scope: !146)
!151 = !DILocation(line: 78, column: 9, scope: !146)
!152 = !DILocation(line: 75, column: 35, scope: !141)
!153 = !DILocation(line: 75, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !73}
!155 = !DILocation(line: 78, column: 9, scope: !138)
!156 = !DILocation(line: 79, column: 9, scope: !128)
!157 = !DILocation(line: 79, column: 20, scope: !128)
!158 = !DILocation(line: 80, column: 19, scope: !128)
!159 = !DILocation(line: 80, column: 9, scope: !128)
!160 = !DILocation(line: 81, column: 14, scope: !128)
!161 = !DILocation(line: 81, column: 9, scope: !128)
!162 = !DILocation(line: 83, column: 1, scope: !104)
!163 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DILocalVariable(name: "data", scope: !163, file: !15, line: 88, type: !4)
!165 = !DILocation(line: 88, column: 12, scope: !163)
!166 = !DILocation(line: 89, column: 20, scope: !163)
!167 = !DILocation(line: 89, column: 10, scope: !163)
!168 = !DILocation(line: 90, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !15, line: 90, column: 9)
!170 = !DILocation(line: 90, column: 14, scope: !169)
!171 = !DILocation(line: 90, column: 9, scope: !163)
!172 = !DILocation(line: 90, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 90, column: 23)
!174 = !DILocation(line: 91, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !163, file: !15, line: 91, column: 8)
!176 = !DILocation(line: 91, column: 25, scope: !175)
!177 = !DILocation(line: 91, column: 8, scope: !163)
!178 = !DILocation(line: 94, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 92, column: 5)
!180 = !DILocation(line: 94, column: 9, scope: !179)
!181 = !DILocation(line: 95, column: 9, scope: !179)
!182 = !DILocation(line: 95, column: 20, scope: !179)
!183 = !DILocation(line: 96, column: 5, scope: !179)
!184 = !DILocalVariable(name: "dest", scope: !185, file: !15, line: 98, type: !40)
!185 = distinct !DILexicalBlock(scope: !163, file: !15, line: 97, column: 5)
!186 = !DILocation(line: 98, column: 14, scope: !185)
!187 = !DILocalVariable(name: "i", scope: !185, file: !15, line: 99, type: !45)
!188 = !DILocation(line: 99, column: 16, scope: !185)
!189 = !DILocalVariable(name: "dataLen", scope: !185, file: !15, line: 99, type: !45)
!190 = !DILocation(line: 99, column: 19, scope: !185)
!191 = !DILocation(line: 100, column: 26, scope: !185)
!192 = !DILocation(line: 100, column: 19, scope: !185)
!193 = !DILocation(line: 100, column: 17, scope: !185)
!194 = !DILocation(line: 102, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !185, file: !15, line: 102, column: 9)
!196 = !DILocation(line: 102, column: 14, scope: !195)
!197 = !DILocation(line: 102, column: 21, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !15, line: 102, column: 9)
!199 = !DILocation(line: 102, column: 25, scope: !198)
!200 = !DILocation(line: 102, column: 23, scope: !198)
!201 = !DILocation(line: 102, column: 9, scope: !195)
!202 = !DILocation(line: 104, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !15, line: 103, column: 9)
!204 = !DILocation(line: 104, column: 28, scope: !203)
!205 = !DILocation(line: 104, column: 18, scope: !203)
!206 = !DILocation(line: 104, column: 13, scope: !203)
!207 = !DILocation(line: 104, column: 21, scope: !203)
!208 = !DILocation(line: 105, column: 9, scope: !203)
!209 = !DILocation(line: 102, column: 35, scope: !198)
!210 = !DILocation(line: 102, column: 9, scope: !198)
!211 = distinct !{!211, !201, !212, !73}
!212 = !DILocation(line: 105, column: 9, scope: !195)
!213 = !DILocation(line: 106, column: 9, scope: !185)
!214 = !DILocation(line: 106, column: 20, scope: !185)
!215 = !DILocation(line: 107, column: 19, scope: !185)
!216 = !DILocation(line: 107, column: 9, scope: !185)
!217 = !DILocation(line: 108, column: 14, scope: !185)
!218 = !DILocation(line: 108, column: 9, scope: !185)
!219 = !DILocation(line: 110, column: 1, scope: !163)
