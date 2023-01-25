; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp1 = icmp eq i32 %1, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !35

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !56
  store i64 %call4, i64* %dataLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !61
  %7 = load i64, i64* %dataLen, align 8, !dbg !63
  %cmp5 = icmp ult i64 %6, %7, !dbg !64
  br i1 %cmp5, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !66
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !66
  %10 = load i8, i8* %arrayidx6, align 1, !dbg !66
  %11 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !70
  store i8 %10, i8* %arrayidx7, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %12, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !78
  store i8 0, i8* %arrayidx8, align 1, !dbg !79
  %13 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* %13), !dbg !81
  %14 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* %14) #7, !dbg !83
  ret void, !dbg !84
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07_good() #0 !dbg !85 {
entry:
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp1 = icmp ne i32 %1, 5, !dbg !120
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !121

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end3, !dbg !124

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !135, metadata !DIExpression()), !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !138
  store i64 %call4, i64* %dataLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !143
  %7 = load i64, i64* %dataLen, align 8, !dbg !145
  %cmp5 = icmp ult i64 %6, %7, !dbg !146
  br i1 %cmp5, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !148
  %9 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !148
  %10 = load i8, i8* %arrayidx6, align 1, !dbg !148
  %11 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !152
  store i8 %10, i8* %arrayidx7, align 1, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %12, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !159
  store i8 0, i8* %arrayidx8, align 1, !dbg !160
  %13 = load i8*, i8** %data, align 8, !dbg !161
  call void @printLine(i8* %13), !dbg !162
  %14 = load i8*, i8** %data, align 8, !dbg !163
  call void @free(i8* %14) #7, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !166 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !167, metadata !DIExpression()), !dbg !168
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !169
  store i8* %call, i8** %data, align 8, !dbg !170
  %0 = load i8*, i8** %data, align 8, !dbg !171
  %cmp = icmp eq i8* %0, null, !dbg !173
  br i1 %cmp, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !177
  %cmp1 = icmp eq i32 %1, 5, !dbg !179
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !180

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !183
  %3 = load i8*, i8** %data, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !184
  store i8 0, i8* %arrayidx, align 1, !dbg !185
  br label %if.end3, !dbg !186

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !187, metadata !DIExpression()), !dbg !189
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !189
  call void @llvm.dbg.declare(metadata i64* %i, metadata !190, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !192, metadata !DIExpression()), !dbg !193
  %5 = load i8*, i8** %data, align 8, !dbg !194
  %call4 = call i64 @strlen(i8* %5) #9, !dbg !195
  store i64 %call4, i64* %dataLen, align 8, !dbg !196
  store i64 0, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !199

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load i64, i64* %i, align 8, !dbg !200
  %7 = load i64, i64* %dataLen, align 8, !dbg !202
  %cmp5 = icmp ult i64 %6, %7, !dbg !203
  br i1 %cmp5, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !205
  %9 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !205
  %10 = load i8, i8* %arrayidx6, align 1, !dbg !205
  %11 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !209
  store i8 %10, i8* %arrayidx7, align 1, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !212
  %inc = add i64 %12, 1, !dbg !212
  store i64 %inc, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !216
  store i8 0, i8* %arrayidx8, align 1, !dbg !217
  %13 = load i8*, i8** %data, align 8, !dbg !218
  call void @printLine(i8* %13), !dbg !219
  %14 = load i8*, i8** %data, align 8, !dbg !220
  call void @free(i8* %14) #7, !dbg !221
  ret void, !dbg !222
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
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 20, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocation(line: 33, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 9)
!28 = !DILocation(line: 33, column: 14, scope: !27)
!29 = !DILocation(line: 33, column: 9, scope: !19)
!30 = !DILocation(line: 33, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !11, line: 33, column: 23)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !11, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 8, scope: !19)
!36 = !DILocation(line: 37, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 35, column: 5)
!38 = !DILocation(line: 37, column: 9, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !37)
!40 = !DILocation(line: 38, column: 21, scope: !37)
!41 = !DILocation(line: 39, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !11, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !11, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 14, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !11, line: 42, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 42, column: 16, scope: !43)
!53 = !DILocalVariable(name: "dataLen", scope: !43, file: !11, line: 42, type: !49)
!54 = !DILocation(line: 42, column: 19, scope: !43)
!55 = !DILocation(line: 43, column: 26, scope: !43)
!56 = !DILocation(line: 43, column: 19, scope: !43)
!57 = !DILocation(line: 43, column: 17, scope: !43)
!58 = !DILocation(line: 45, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !43, file: !11, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 14, scope: !59)
!61 = !DILocation(line: 45, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !11, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 25, scope: !62)
!64 = !DILocation(line: 45, column: 23, scope: !62)
!65 = !DILocation(line: 45, column: 9, scope: !59)
!66 = !DILocation(line: 47, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !11, line: 46, column: 9)
!68 = !DILocation(line: 47, column: 28, scope: !67)
!69 = !DILocation(line: 47, column: 18, scope: !67)
!70 = !DILocation(line: 47, column: 13, scope: !67)
!71 = !DILocation(line: 47, column: 21, scope: !67)
!72 = !DILocation(line: 48, column: 9, scope: !67)
!73 = !DILocation(line: 45, column: 35, scope: !62)
!74 = !DILocation(line: 45, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 48, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 49, column: 9, scope: !43)
!79 = !DILocation(line: 49, column: 20, scope: !43)
!80 = !DILocation(line: 50, column: 19, scope: !43)
!81 = !DILocation(line: 50, column: 9, scope: !43)
!82 = !DILocation(line: 51, column: 14, scope: !43)
!83 = !DILocation(line: 51, column: 9, scope: !43)
!84 = !DILocation(line: 53, column: 1, scope: !19)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_07_good", scope: !11, file: !11, line: 118, type: !20, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocation(line: 120, column: 5, scope: !85)
!87 = !DILocation(line: 121, column: 5, scope: !85)
!88 = !DILocation(line: 122, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 134, type: !90, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DISubroutineType(types: !91)
!91 = !{!12, !12, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !11, line: 134, type: !12)
!94 = !DILocation(line: 134, column: 14, scope: !89)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !11, line: 134, type: !92)
!96 = !DILocation(line: 134, column: 27, scope: !89)
!97 = !DILocation(line: 137, column: 22, scope: !89)
!98 = !DILocation(line: 137, column: 12, scope: !89)
!99 = !DILocation(line: 137, column: 5, scope: !89)
!100 = !DILocation(line: 139, column: 5, scope: !89)
!101 = !DILocation(line: 140, column: 5, scope: !89)
!102 = !DILocation(line: 141, column: 5, scope: !89)
!103 = !DILocation(line: 144, column: 5, scope: !89)
!104 = !DILocation(line: 145, column: 5, scope: !89)
!105 = !DILocation(line: 146, column: 5, scope: !89)
!106 = !DILocation(line: 148, column: 5, scope: !89)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !11, line: 62, type: !6)
!109 = !DILocation(line: 62, column: 12, scope: !107)
!110 = !DILocation(line: 63, column: 20, scope: !107)
!111 = !DILocation(line: 63, column: 10, scope: !107)
!112 = !DILocation(line: 64, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !11, line: 64, column: 9)
!114 = !DILocation(line: 64, column: 14, scope: !113)
!115 = !DILocation(line: 64, column: 9, scope: !107)
!116 = !DILocation(line: 64, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !11, line: 64, column: 23)
!118 = !DILocation(line: 65, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !11, line: 65, column: 8)
!120 = !DILocation(line: 65, column: 18, scope: !119)
!121 = !DILocation(line: 65, column: 8, scope: !107)
!122 = !DILocation(line: 68, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !11, line: 66, column: 5)
!124 = !DILocation(line: 69, column: 5, scope: !123)
!125 = !DILocation(line: 73, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !11, line: 71, column: 5)
!127 = !DILocation(line: 73, column: 9, scope: !126)
!128 = !DILocation(line: 74, column: 9, scope: !126)
!129 = !DILocation(line: 74, column: 20, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !11, line: 77, type: !44)
!131 = distinct !DILexicalBlock(scope: !107, file: !11, line: 76, column: 5)
!132 = !DILocation(line: 77, column: 14, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !11, line: 78, type: !49)
!134 = !DILocation(line: 78, column: 16, scope: !131)
!135 = !DILocalVariable(name: "dataLen", scope: !131, file: !11, line: 78, type: !49)
!136 = !DILocation(line: 78, column: 19, scope: !131)
!137 = !DILocation(line: 79, column: 26, scope: !131)
!138 = !DILocation(line: 79, column: 19, scope: !131)
!139 = !DILocation(line: 79, column: 17, scope: !131)
!140 = !DILocation(line: 81, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !11, line: 81, column: 9)
!142 = !DILocation(line: 81, column: 14, scope: !141)
!143 = !DILocation(line: 81, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !11, line: 81, column: 9)
!145 = !DILocation(line: 81, column: 25, scope: !144)
!146 = !DILocation(line: 81, column: 23, scope: !144)
!147 = !DILocation(line: 81, column: 9, scope: !141)
!148 = !DILocation(line: 83, column: 23, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !11, line: 82, column: 9)
!150 = !DILocation(line: 83, column: 28, scope: !149)
!151 = !DILocation(line: 83, column: 18, scope: !149)
!152 = !DILocation(line: 83, column: 13, scope: !149)
!153 = !DILocation(line: 83, column: 21, scope: !149)
!154 = !DILocation(line: 84, column: 9, scope: !149)
!155 = !DILocation(line: 81, column: 35, scope: !144)
!156 = !DILocation(line: 81, column: 9, scope: !144)
!157 = distinct !{!157, !147, !158, !77}
!158 = !DILocation(line: 84, column: 9, scope: !141)
!159 = !DILocation(line: 85, column: 9, scope: !131)
!160 = !DILocation(line: 85, column: 20, scope: !131)
!161 = !DILocation(line: 86, column: 19, scope: !131)
!162 = !DILocation(line: 86, column: 9, scope: !131)
!163 = !DILocation(line: 87, column: 14, scope: !131)
!164 = !DILocation(line: 87, column: 9, scope: !131)
!165 = !DILocation(line: 89, column: 1, scope: !107)
!166 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", scope: !166, file: !11, line: 94, type: !6)
!168 = !DILocation(line: 94, column: 12, scope: !166)
!169 = !DILocation(line: 95, column: 20, scope: !166)
!170 = !DILocation(line: 95, column: 10, scope: !166)
!171 = !DILocation(line: 96, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !11, line: 96, column: 9)
!173 = !DILocation(line: 96, column: 14, scope: !172)
!174 = !DILocation(line: 96, column: 9, scope: !166)
!175 = !DILocation(line: 96, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !11, line: 96, column: 23)
!177 = !DILocation(line: 97, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !166, file: !11, line: 97, column: 8)
!179 = !DILocation(line: 97, column: 18, scope: !178)
!180 = !DILocation(line: 97, column: 8, scope: !166)
!181 = !DILocation(line: 100, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !11, line: 98, column: 5)
!183 = !DILocation(line: 100, column: 9, scope: !182)
!184 = !DILocation(line: 101, column: 9, scope: !182)
!185 = !DILocation(line: 101, column: 20, scope: !182)
!186 = !DILocation(line: 102, column: 5, scope: !182)
!187 = !DILocalVariable(name: "dest", scope: !188, file: !11, line: 104, type: !44)
!188 = distinct !DILexicalBlock(scope: !166, file: !11, line: 103, column: 5)
!189 = !DILocation(line: 104, column: 14, scope: !188)
!190 = !DILocalVariable(name: "i", scope: !188, file: !11, line: 105, type: !49)
!191 = !DILocation(line: 105, column: 16, scope: !188)
!192 = !DILocalVariable(name: "dataLen", scope: !188, file: !11, line: 105, type: !49)
!193 = !DILocation(line: 105, column: 19, scope: !188)
!194 = !DILocation(line: 106, column: 26, scope: !188)
!195 = !DILocation(line: 106, column: 19, scope: !188)
!196 = !DILocation(line: 106, column: 17, scope: !188)
!197 = !DILocation(line: 108, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !188, file: !11, line: 108, column: 9)
!199 = !DILocation(line: 108, column: 14, scope: !198)
!200 = !DILocation(line: 108, column: 21, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !11, line: 108, column: 9)
!202 = !DILocation(line: 108, column: 25, scope: !201)
!203 = !DILocation(line: 108, column: 23, scope: !201)
!204 = !DILocation(line: 108, column: 9, scope: !198)
!205 = !DILocation(line: 110, column: 23, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !11, line: 109, column: 9)
!207 = !DILocation(line: 110, column: 28, scope: !206)
!208 = !DILocation(line: 110, column: 18, scope: !206)
!209 = !DILocation(line: 110, column: 13, scope: !206)
!210 = !DILocation(line: 110, column: 21, scope: !206)
!211 = !DILocation(line: 111, column: 9, scope: !206)
!212 = !DILocation(line: 108, column: 35, scope: !201)
!213 = !DILocation(line: 108, column: 9, scope: !201)
!214 = distinct !{!214, !204, !215, !77}
!215 = !DILocation(line: 111, column: 9, scope: !198)
!216 = !DILocation(line: 112, column: 9, scope: !188)
!217 = !DILocation(line: 112, column: 20, scope: !188)
!218 = !DILocation(line: 113, column: 19, scope: !188)
!219 = !DILocation(line: 113, column: 9, scope: !188)
!220 = !DILocation(line: 114, column: 14, scope: !188)
!221 = !DILocation(line: 114, column: 9, scope: !188)
!222 = !DILocation(line: 116, column: 1, scope: !166)
