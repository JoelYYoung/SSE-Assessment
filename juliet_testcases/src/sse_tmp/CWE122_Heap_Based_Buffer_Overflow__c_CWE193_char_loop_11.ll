; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !48
  store i64 %call4, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !53
  %3 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %3, 1, !dbg !56
  %cmp5 = icmp ult i64 %2, %add, !dbg !57
  br i1 %cmp5, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !61
  %5 = load i8, i8* %arrayidx, align 1, !dbg !61
  %6 = load i8*, i8** %data, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !62
  store i8 %5, i8* %arrayidx6, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %9), !dbg !72
  %10 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* %10) #7, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %call = call i32 (...) @globalReturnsFalse(), !dbg !103
  %tobool = icmp ne i32 %call, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end3, !dbg !108

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !109
  store i8* %call1, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then2, label %if.end, !dbg !115

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !125
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !126
  store i64 %call4, i64* %sourceLen, align 8, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !131
  %3 = load i64, i64* %sourceLen, align 8, !dbg !133
  %add = add i64 %3, 1, !dbg !134
  %cmp5 = icmp ult i64 %2, %add, !dbg !135
  br i1 %cmp5, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !139
  %5 = load i8, i8* %arrayidx, align 1, !dbg !139
  %6 = load i8*, i8** %data, align 8, !dbg !140
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !140
  store i8 %5, i8* %arrayidx6, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %8, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %9), !dbg !149
  %10 = load i8*, i8** %data, align 8, !dbg !150
  call void @free(i8* %10) #7, !dbg !151
  ret void, !dbg !152
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  store i8* null, i8** %data, align 8, !dbg !156
  %call = call i32 (...) @globalReturnsTrue(), !dbg !157
  %tobool = icmp ne i32 %call, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end3, !dbg !159

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !160
  store i8* %call1, i8** %data, align 8, !dbg !162
  %0 = load i8*, i8** %data, align 8, !dbg !163
  %cmp = icmp eq i8* %0, null, !dbg !165
  br i1 %cmp, label %if.then2, label %if.end, !dbg !166

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !169

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !170, metadata !DIExpression()), !dbg !172
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !177
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !178
  store i64 %call4, i64* %sourceLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !183
  %3 = load i64, i64* %sourceLen, align 8, !dbg !185
  %add = add i64 %3, 1, !dbg !186
  %cmp5 = icmp ult i64 %2, %add, !dbg !187
  br i1 %cmp5, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !191
  %5 = load i8, i8* %arrayidx, align 1, !dbg !191
  %6 = load i8*, i8** %data, align 8, !dbg !192
  %7 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !192
  store i8 %5, i8* %arrayidx6, align 1, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %8, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !200
  call void @printLine(i8* %9), !dbg !201
  %10 = load i8*, i8** %data, align 8, !dbg !202
  call void @free(i8* %10) #7, !dbg !203
  ret void, !dbg !204
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 8, scope: !14)
!24 = !DILocation(line: 35, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 35, column: 14, scope: !25)
!27 = !DILocation(line: 36, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 13)
!29 = !DILocation(line: 36, column: 18, scope: !28)
!30 = !DILocation(line: 36, column: 13, scope: !25)
!31 = !DILocation(line: 36, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 36, column: 27)
!33 = !DILocation(line: 37, column: 5, scope: !25)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 39, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 39, column: 14, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 40, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 40, column: 16, scope: !35)
!45 = !DILocalVariable(name: "sourceLen", scope: !35, file: !15, line: 40, type: !41)
!46 = !DILocation(line: 40, column: 19, scope: !35)
!47 = !DILocation(line: 41, column: 28, scope: !35)
!48 = !DILocation(line: 41, column: 21, scope: !35)
!49 = !DILocation(line: 41, column: 19, scope: !35)
!50 = !DILocation(line: 44, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !15, line: 44, column: 9)
!52 = !DILocation(line: 44, column: 14, scope: !51)
!53 = !DILocation(line: 44, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 9)
!55 = !DILocation(line: 44, column: 25, scope: !54)
!56 = !DILocation(line: 44, column: 35, scope: !54)
!57 = !DILocation(line: 44, column: 23, scope: !54)
!58 = !DILocation(line: 44, column: 9, scope: !51)
!59 = !DILocation(line: 46, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !15, line: 45, column: 9)
!61 = !DILocation(line: 46, column: 23, scope: !60)
!62 = !DILocation(line: 46, column: 13, scope: !60)
!63 = !DILocation(line: 46, column: 18, scope: !60)
!64 = !DILocation(line: 46, column: 21, scope: !60)
!65 = !DILocation(line: 47, column: 9, scope: !60)
!66 = !DILocation(line: 44, column: 41, scope: !54)
!67 = !DILocation(line: 44, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 47, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 48, column: 19, scope: !35)
!72 = !DILocation(line: 48, column: 9, scope: !35)
!73 = !DILocation(line: 49, column: 14, scope: !35)
!74 = !DILocation(line: 49, column: 9, scope: !35)
!75 = !DILocation(line: 51, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_11_good", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 116, column: 5, scope: !76)
!78 = !DILocation(line: 117, column: 5, scope: !76)
!79 = !DILocation(line: 118, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 130, type: !81, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 130, type: !83)
!86 = !DILocation(line: 130, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 130, type: !84)
!88 = !DILocation(line: 130, column: 27, scope: !80)
!89 = !DILocation(line: 133, column: 22, scope: !80)
!90 = !DILocation(line: 133, column: 12, scope: !80)
!91 = !DILocation(line: 133, column: 5, scope: !80)
!92 = !DILocation(line: 135, column: 5, scope: !80)
!93 = !DILocation(line: 136, column: 5, scope: !80)
!94 = !DILocation(line: 137, column: 5, scope: !80)
!95 = !DILocation(line: 140, column: 5, scope: !80)
!96 = !DILocation(line: 141, column: 5, scope: !80)
!97 = !DILocation(line: 142, column: 5, scope: !80)
!98 = !DILocation(line: 144, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 60, type: !4)
!101 = !DILocation(line: 60, column: 12, scope: !99)
!102 = !DILocation(line: 61, column: 10, scope: !99)
!103 = !DILocation(line: 62, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 62, column: 8)
!105 = !DILocation(line: 62, column: 8, scope: !99)
!106 = !DILocation(line: 65, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !15, line: 63, column: 5)
!108 = !DILocation(line: 66, column: 5, scope: !107)
!109 = !DILocation(line: 70, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 68, column: 5)
!111 = !DILocation(line: 70, column: 14, scope: !110)
!112 = !DILocation(line: 71, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !15, line: 71, column: 13)
!114 = !DILocation(line: 71, column: 18, scope: !113)
!115 = !DILocation(line: 71, column: 13, scope: !110)
!116 = !DILocation(line: 71, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 71, column: 27)
!118 = !DILocalVariable(name: "source", scope: !119, file: !15, line: 74, type: !36)
!119 = distinct !DILexicalBlock(scope: !99, file: !15, line: 73, column: 5)
!120 = !DILocation(line: 74, column: 14, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !15, line: 75, type: !41)
!122 = !DILocation(line: 75, column: 16, scope: !119)
!123 = !DILocalVariable(name: "sourceLen", scope: !119, file: !15, line: 75, type: !41)
!124 = !DILocation(line: 75, column: 19, scope: !119)
!125 = !DILocation(line: 76, column: 28, scope: !119)
!126 = !DILocation(line: 76, column: 21, scope: !119)
!127 = !DILocation(line: 76, column: 19, scope: !119)
!128 = !DILocation(line: 79, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !15, line: 79, column: 9)
!130 = !DILocation(line: 79, column: 14, scope: !129)
!131 = !DILocation(line: 79, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 79, column: 9)
!133 = !DILocation(line: 79, column: 25, scope: !132)
!134 = !DILocation(line: 79, column: 35, scope: !132)
!135 = !DILocation(line: 79, column: 23, scope: !132)
!136 = !DILocation(line: 79, column: 9, scope: !129)
!137 = !DILocation(line: 81, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !15, line: 80, column: 9)
!139 = !DILocation(line: 81, column: 23, scope: !138)
!140 = !DILocation(line: 81, column: 13, scope: !138)
!141 = !DILocation(line: 81, column: 18, scope: !138)
!142 = !DILocation(line: 81, column: 21, scope: !138)
!143 = !DILocation(line: 82, column: 9, scope: !138)
!144 = !DILocation(line: 79, column: 41, scope: !132)
!145 = !DILocation(line: 79, column: 9, scope: !132)
!146 = distinct !{!146, !136, !147, !70}
!147 = !DILocation(line: 82, column: 9, scope: !129)
!148 = !DILocation(line: 83, column: 19, scope: !119)
!149 = !DILocation(line: 83, column: 9, scope: !119)
!150 = !DILocation(line: 84, column: 14, scope: !119)
!151 = !DILocation(line: 84, column: 9, scope: !119)
!152 = !DILocation(line: 86, column: 1, scope: !99)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !15, line: 91, type: !4)
!155 = !DILocation(line: 91, column: 12, scope: !153)
!156 = !DILocation(line: 92, column: 10, scope: !153)
!157 = !DILocation(line: 93, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !15, line: 93, column: 8)
!159 = !DILocation(line: 93, column: 8, scope: !153)
!160 = !DILocation(line: 96, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 94, column: 5)
!162 = !DILocation(line: 96, column: 14, scope: !161)
!163 = !DILocation(line: 97, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 97, column: 13)
!165 = !DILocation(line: 97, column: 18, scope: !164)
!166 = !DILocation(line: 97, column: 13, scope: !161)
!167 = !DILocation(line: 97, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 97, column: 27)
!169 = !DILocation(line: 98, column: 5, scope: !161)
!170 = !DILocalVariable(name: "source", scope: !171, file: !15, line: 100, type: !36)
!171 = distinct !DILexicalBlock(scope: !153, file: !15, line: 99, column: 5)
!172 = !DILocation(line: 100, column: 14, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !15, line: 101, type: !41)
!174 = !DILocation(line: 101, column: 16, scope: !171)
!175 = !DILocalVariable(name: "sourceLen", scope: !171, file: !15, line: 101, type: !41)
!176 = !DILocation(line: 101, column: 19, scope: !171)
!177 = !DILocation(line: 102, column: 28, scope: !171)
!178 = !DILocation(line: 102, column: 21, scope: !171)
!179 = !DILocation(line: 102, column: 19, scope: !171)
!180 = !DILocation(line: 105, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !15, line: 105, column: 9)
!182 = !DILocation(line: 105, column: 14, scope: !181)
!183 = !DILocation(line: 105, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 105, column: 9)
!185 = !DILocation(line: 105, column: 25, scope: !184)
!186 = !DILocation(line: 105, column: 35, scope: !184)
!187 = !DILocation(line: 105, column: 23, scope: !184)
!188 = !DILocation(line: 105, column: 9, scope: !181)
!189 = !DILocation(line: 107, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !15, line: 106, column: 9)
!191 = !DILocation(line: 107, column: 23, scope: !190)
!192 = !DILocation(line: 107, column: 13, scope: !190)
!193 = !DILocation(line: 107, column: 18, scope: !190)
!194 = !DILocation(line: 107, column: 21, scope: !190)
!195 = !DILocation(line: 108, column: 9, scope: !190)
!196 = !DILocation(line: 105, column: 41, scope: !184)
!197 = !DILocation(line: 105, column: 9, scope: !184)
!198 = distinct !{!198, !188, !199, !70}
!199 = !DILocation(line: 108, column: 9, scope: !181)
!200 = !DILocation(line: 109, column: 19, scope: !171)
!201 = !DILocation(line: 109, column: 9, scope: !171)
!202 = !DILocation(line: 110, column: 14, scope: !171)
!203 = !DILocation(line: 110, column: 9, scope: !171)
!204 = !DILocation(line: 112, column: 1, scope: !153)
