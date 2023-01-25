; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !49
  store i64 %call4, i64* %sourceLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !54
  %4 = load i64, i64* %sourceLen, align 8, !dbg !56
  %add = add i64 %4, 1, !dbg !57
  %cmp5 = icmp ult i64 %3, %add, !dbg !58
  br i1 %cmp5, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !62
  %6 = load i8, i8* %arrayidx, align 1, !dbg !62
  %7 = load i8*, i8** %data, align 8, !dbg !63
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !63
  store i8 %6, i8* %arrayidx6, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %9, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %10), !dbg !73
  %11 = load i8*, i8** %data, align 8, !dbg !74
  call void @free(i8* %11) #7, !dbg !75
  ret void, !dbg !76
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !104
  %cmp = icmp ne i32 %0, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end3, !dbg !110

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %cmp1 = icmp eq i8* %1, null, !dbg !116
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !127
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !128
  store i64 %call4, i64* %sourceLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !133
  %4 = load i64, i64* %sourceLen, align 8, !dbg !135
  %add = add i64 %4, 1, !dbg !136
  %cmp5 = icmp ult i64 %3, %add, !dbg !137
  br i1 %cmp5, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !141
  %6 = load i8, i8* %arrayidx, align 1, !dbg !141
  %7 = load i8*, i8** %data, align 8, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !142
  store i8 %6, i8* %arrayidx6, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %9, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %10), !dbg !151
  %11 = load i8*, i8** %data, align 8, !dbg !152
  call void @free(i8* %11) #7, !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  store i8* null, i8** %data, align 8, !dbg !158
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !159
  %cmp = icmp eq i32 %0, 5, !dbg !161
  br i1 %cmp, label %if.then, label %if.end3, !dbg !162

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !163
  store i8* %call, i8** %data, align 8, !dbg !165
  %1 = load i8*, i8** %data, align 8, !dbg !166
  %cmp1 = icmp eq i8* %1, null, !dbg !168
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !169

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !170
  unreachable, !dbg !170

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !172

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !173, metadata !DIExpression()), !dbg !175
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !180
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !181
  store i64 %call4, i64* %sourceLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !186
  %4 = load i64, i64* %sourceLen, align 8, !dbg !188
  %add = add i64 %4, 1, !dbg !189
  %cmp5 = icmp ult i64 %3, %add, !dbg !190
  br i1 %cmp5, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !194
  %6 = load i8, i8* %arrayidx, align 1, !dbg !194
  %7 = load i8*, i8** %data, align 8, !dbg !195
  %8 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !195
  store i8 %6, i8* %arrayidx6, align 1, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %9, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !203
  call void @printLine(i8* %10), !dbg !204
  %11 = load i8*, i8** %data, align 8, !dbg !205
  call void @free(i8* %11) #7, !dbg !206
  ret void, !dbg !207
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 25, scope: !22)
!24 = !DILocation(line: 32, column: 8, scope: !14)
!25 = !DILocation(line: 35, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!27 = !DILocation(line: 35, column: 14, scope: !26)
!28 = !DILocation(line: 36, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 36, column: 13)
!30 = !DILocation(line: 36, column: 18, scope: !29)
!31 = !DILocation(line: 36, column: 13, scope: !26)
!32 = !DILocation(line: 36, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 27)
!34 = !DILocation(line: 37, column: 5, scope: !26)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 39, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 39, column: 14, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !15, line: 40, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 40, column: 16, scope: !36)
!46 = !DILocalVariable(name: "sourceLen", scope: !36, file: !15, line: 40, type: !42)
!47 = !DILocation(line: 40, column: 19, scope: !36)
!48 = !DILocation(line: 41, column: 28, scope: !36)
!49 = !DILocation(line: 41, column: 21, scope: !36)
!50 = !DILocation(line: 41, column: 19, scope: !36)
!51 = !DILocation(line: 44, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !36, file: !15, line: 44, column: 9)
!53 = !DILocation(line: 44, column: 14, scope: !52)
!54 = !DILocation(line: 44, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !15, line: 44, column: 9)
!56 = !DILocation(line: 44, column: 25, scope: !55)
!57 = !DILocation(line: 44, column: 35, scope: !55)
!58 = !DILocation(line: 44, column: 23, scope: !55)
!59 = !DILocation(line: 44, column: 9, scope: !52)
!60 = !DILocation(line: 46, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !15, line: 45, column: 9)
!62 = !DILocation(line: 46, column: 23, scope: !61)
!63 = !DILocation(line: 46, column: 13, scope: !61)
!64 = !DILocation(line: 46, column: 18, scope: !61)
!65 = !DILocation(line: 46, column: 21, scope: !61)
!66 = !DILocation(line: 47, column: 9, scope: !61)
!67 = !DILocation(line: 44, column: 41, scope: !55)
!68 = !DILocation(line: 44, column: 9, scope: !55)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 47, column: 9, scope: !52)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 48, column: 19, scope: !36)
!73 = !DILocation(line: 48, column: 9, scope: !36)
!74 = !DILocation(line: 49, column: 14, scope: !36)
!75 = !DILocation(line: 49, column: 9, scope: !36)
!76 = !DILocation(line: 51, column: 1, scope: !14)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_13_good", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 116, column: 5, scope: !77)
!79 = !DILocation(line: 117, column: 5, scope: !77)
!80 = !DILocation(line: 118, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 130, type: !82, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !15, line: 130, type: !84)
!87 = !DILocation(line: 130, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !15, line: 130, type: !85)
!89 = !DILocation(line: 130, column: 27, scope: !81)
!90 = !DILocation(line: 133, column: 22, scope: !81)
!91 = !DILocation(line: 133, column: 12, scope: !81)
!92 = !DILocation(line: 133, column: 5, scope: !81)
!93 = !DILocation(line: 135, column: 5, scope: !81)
!94 = !DILocation(line: 136, column: 5, scope: !81)
!95 = !DILocation(line: 137, column: 5, scope: !81)
!96 = !DILocation(line: 140, column: 5, scope: !81)
!97 = !DILocation(line: 141, column: 5, scope: !81)
!98 = !DILocation(line: 142, column: 5, scope: !81)
!99 = !DILocation(line: 144, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 60, type: !4)
!102 = !DILocation(line: 60, column: 12, scope: !100)
!103 = !DILocation(line: 61, column: 10, scope: !100)
!104 = !DILocation(line: 62, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !15, line: 62, column: 8)
!106 = !DILocation(line: 62, column: 25, scope: !105)
!107 = !DILocation(line: 62, column: 8, scope: !100)
!108 = !DILocation(line: 65, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 63, column: 5)
!110 = !DILocation(line: 66, column: 5, scope: !109)
!111 = !DILocation(line: 70, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !15, line: 68, column: 5)
!113 = !DILocation(line: 70, column: 14, scope: !112)
!114 = !DILocation(line: 71, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 71, column: 13)
!116 = !DILocation(line: 71, column: 18, scope: !115)
!117 = !DILocation(line: 71, column: 13, scope: !112)
!118 = !DILocation(line: 71, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 71, column: 27)
!120 = !DILocalVariable(name: "source", scope: !121, file: !15, line: 74, type: !37)
!121 = distinct !DILexicalBlock(scope: !100, file: !15, line: 73, column: 5)
!122 = !DILocation(line: 74, column: 14, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !15, line: 75, type: !42)
!124 = !DILocation(line: 75, column: 16, scope: !121)
!125 = !DILocalVariable(name: "sourceLen", scope: !121, file: !15, line: 75, type: !42)
!126 = !DILocation(line: 75, column: 19, scope: !121)
!127 = !DILocation(line: 76, column: 28, scope: !121)
!128 = !DILocation(line: 76, column: 21, scope: !121)
!129 = !DILocation(line: 76, column: 19, scope: !121)
!130 = !DILocation(line: 79, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !15, line: 79, column: 9)
!132 = !DILocation(line: 79, column: 14, scope: !131)
!133 = !DILocation(line: 79, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 79, column: 9)
!135 = !DILocation(line: 79, column: 25, scope: !134)
!136 = !DILocation(line: 79, column: 35, scope: !134)
!137 = !DILocation(line: 79, column: 23, scope: !134)
!138 = !DILocation(line: 79, column: 9, scope: !131)
!139 = !DILocation(line: 81, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !15, line: 80, column: 9)
!141 = !DILocation(line: 81, column: 23, scope: !140)
!142 = !DILocation(line: 81, column: 13, scope: !140)
!143 = !DILocation(line: 81, column: 18, scope: !140)
!144 = !DILocation(line: 81, column: 21, scope: !140)
!145 = !DILocation(line: 82, column: 9, scope: !140)
!146 = !DILocation(line: 79, column: 41, scope: !134)
!147 = !DILocation(line: 79, column: 9, scope: !134)
!148 = distinct !{!148, !138, !149, !71}
!149 = !DILocation(line: 82, column: 9, scope: !131)
!150 = !DILocation(line: 83, column: 19, scope: !121)
!151 = !DILocation(line: 83, column: 9, scope: !121)
!152 = !DILocation(line: 84, column: 14, scope: !121)
!153 = !DILocation(line: 84, column: 9, scope: !121)
!154 = !DILocation(line: 86, column: 1, scope: !100)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !15, line: 91, type: !4)
!157 = !DILocation(line: 91, column: 12, scope: !155)
!158 = !DILocation(line: 92, column: 10, scope: !155)
!159 = !DILocation(line: 93, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !15, line: 93, column: 8)
!161 = !DILocation(line: 93, column: 25, scope: !160)
!162 = !DILocation(line: 93, column: 8, scope: !155)
!163 = !DILocation(line: 96, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 94, column: 5)
!165 = !DILocation(line: 96, column: 14, scope: !164)
!166 = !DILocation(line: 97, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 97, column: 13)
!168 = !DILocation(line: 97, column: 18, scope: !167)
!169 = !DILocation(line: 97, column: 13, scope: !164)
!170 = !DILocation(line: 97, column: 28, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 97, column: 27)
!172 = !DILocation(line: 98, column: 5, scope: !164)
!173 = !DILocalVariable(name: "source", scope: !174, file: !15, line: 100, type: !37)
!174 = distinct !DILexicalBlock(scope: !155, file: !15, line: 99, column: 5)
!175 = !DILocation(line: 100, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !15, line: 101, type: !42)
!177 = !DILocation(line: 101, column: 16, scope: !174)
!178 = !DILocalVariable(name: "sourceLen", scope: !174, file: !15, line: 101, type: !42)
!179 = !DILocation(line: 101, column: 19, scope: !174)
!180 = !DILocation(line: 102, column: 28, scope: !174)
!181 = !DILocation(line: 102, column: 21, scope: !174)
!182 = !DILocation(line: 102, column: 19, scope: !174)
!183 = !DILocation(line: 105, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !15, line: 105, column: 9)
!185 = !DILocation(line: 105, column: 14, scope: !184)
!186 = !DILocation(line: 105, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !15, line: 105, column: 9)
!188 = !DILocation(line: 105, column: 25, scope: !187)
!189 = !DILocation(line: 105, column: 35, scope: !187)
!190 = !DILocation(line: 105, column: 23, scope: !187)
!191 = !DILocation(line: 105, column: 9, scope: !184)
!192 = !DILocation(line: 107, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !15, line: 106, column: 9)
!194 = !DILocation(line: 107, column: 23, scope: !193)
!195 = !DILocation(line: 107, column: 13, scope: !193)
!196 = !DILocation(line: 107, column: 18, scope: !193)
!197 = !DILocation(line: 107, column: 21, scope: !193)
!198 = !DILocation(line: 108, column: 9, scope: !193)
!199 = !DILocation(line: 105, column: 41, scope: !187)
!200 = !DILocation(line: 105, column: 9, scope: !187)
!201 = distinct !{!201, !191, !202, !71}
!202 = !DILocation(line: 108, column: 9, scope: !184)
!203 = !DILocation(line: 109, column: 19, scope: !174)
!204 = !DILocation(line: 109, column: 9, scope: !174)
!205 = !DILocation(line: 110, column: 14, scope: !174)
!206 = !DILocation(line: 110, column: 9, scope: !174)
!207 = !DILocation(line: 112, column: 1, scope: !155)
