; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !39

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call3 = call i64 @strlen(i8* %arraydecay) #9, !dbg !54
  store i64 %call3, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !59
  %4 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %4, 1, !dbg !62
  %cmp4 = icmp ult i64 %3, %add, !dbg !63
  br i1 %cmp4, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !67
  %6 = load i8, i8* %arrayidx, align 1, !dbg !67
  %7 = load i8*, i8** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !68
  store i8 %6, i8* %arrayidx5, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %10), !dbg !78
  %11 = load i8*, i8** %data, align 8, !dbg !79
  call void @free(i8* %11) #7, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_bad(), !dbg !101
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
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  %0 = load i32, i32* @staticFalse, align 4, !dbg !108
  %tobool = icmp ne i32 %0, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end2, !dbg !113

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %1, null, !dbg !119
  br i1 %cmp, label %if.then1, label %if.end, !dbg !120

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !130
  %call3 = call i64 @strlen(i8* %arraydecay) #9, !dbg !131
  store i64 %call3, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !136
  %4 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %4, 1, !dbg !139
  %cmp4 = icmp ult i64 %3, %add, !dbg !140
  br i1 %cmp4, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !144
  %6 = load i8, i8* %arrayidx, align 1, !dbg !144
  %7 = load i8*, i8** %data, align 8, !dbg !145
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !145
  store i8 %6, i8* %arrayidx5, align 1, !dbg !147
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !162
  %tobool = icmp ne i32 %0, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end2, !dbg !164

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !165
  store i8* %call, i8** %data, align 8, !dbg !167
  %1 = load i8*, i8** %data, align 8, !dbg !168
  %cmp = icmp eq i8* %1, null, !dbg !170
  br i1 %cmp, label %if.then1, label %if.end, !dbg !171

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !174

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !175, metadata !DIExpression()), !dbg !177
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !180, metadata !DIExpression()), !dbg !181
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !182
  %call3 = call i64 @strlen(i8* %arraydecay) #9, !dbg !183
  store i64 %call3, i64* %sourceLen, align 8, !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !188
  %4 = load i64, i64* %sourceLen, align 8, !dbg !190
  %add = add i64 %4, 1, !dbg !191
  %cmp4 = icmp ult i64 %3, %add, !dbg !192
  br i1 %cmp4, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !196
  %6 = load i8, i8* %arrayidx, align 1, !dbg !196
  %7 = load i8*, i8** %data, align 8, !dbg !197
  %8 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !197
  store i8 %6, i8* %arrayidx5, align 1, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !201
  %inc = add i64 %9, 1, !dbg !201
  store i64 %inc, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !205
  call void @printLine(i8* %10), !dbg !206
  %11 = load i8*, i8** %data, align 8, !dbg !207
  call void @free(i8* %11) #7, !dbg !208
  ret void, !dbg !209
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 30, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 31, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_bad", scope: !13, file: !13, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 12, scope: !21)
!26 = !DILocation(line: 38, column: 10, scope: !21)
!27 = !DILocation(line: 39, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 39, column: 8)
!29 = !DILocation(line: 39, column: 8, scope: !21)
!30 = !DILocation(line: 42, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 14, scope: !31)
!33 = !DILocation(line: 43, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !13, line: 43, column: 13)
!35 = !DILocation(line: 43, column: 18, scope: !34)
!36 = !DILocation(line: 43, column: 13, scope: !31)
!37 = !DILocation(line: 43, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 43, column: 27)
!39 = !DILocation(line: 44, column: 5, scope: !31)
!40 = !DILocalVariable(name: "source", scope: !41, file: !13, line: 46, type: !42)
!41 = distinct !DILexicalBlock(scope: !21, file: !13, line: 45, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 46, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !13, line: 47, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 47, column: 16, scope: !41)
!51 = !DILocalVariable(name: "sourceLen", scope: !41, file: !13, line: 47, type: !47)
!52 = !DILocation(line: 47, column: 19, scope: !41)
!53 = !DILocation(line: 48, column: 28, scope: !41)
!54 = !DILocation(line: 48, column: 21, scope: !41)
!55 = !DILocation(line: 48, column: 19, scope: !41)
!56 = !DILocation(line: 51, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !13, line: 51, column: 9)
!58 = !DILocation(line: 51, column: 14, scope: !57)
!59 = !DILocation(line: 51, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 51, column: 9)
!61 = !DILocation(line: 51, column: 25, scope: !60)
!62 = !DILocation(line: 51, column: 35, scope: !60)
!63 = !DILocation(line: 51, column: 23, scope: !60)
!64 = !DILocation(line: 51, column: 9, scope: !57)
!65 = !DILocation(line: 53, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !13, line: 52, column: 9)
!67 = !DILocation(line: 53, column: 23, scope: !66)
!68 = !DILocation(line: 53, column: 13, scope: !66)
!69 = !DILocation(line: 53, column: 18, scope: !66)
!70 = !DILocation(line: 53, column: 21, scope: !66)
!71 = !DILocation(line: 54, column: 9, scope: !66)
!72 = !DILocation(line: 51, column: 41, scope: !60)
!73 = !DILocation(line: 51, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 54, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 55, column: 19, scope: !41)
!78 = !DILocation(line: 55, column: 9, scope: !41)
!79 = !DILocation(line: 56, column: 14, scope: !41)
!80 = !DILocation(line: 56, column: 9, scope: !41)
!81 = !DILocation(line: 58, column: 1, scope: !21)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_05_good", scope: !13, file: !13, line: 121, type: !22, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 123, column: 5, scope: !82)
!84 = !DILocation(line: 124, column: 5, scope: !82)
!85 = !DILocation(line: 125, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 137, type: !87, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!14, !14, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !13, line: 137, type: !14)
!91 = !DILocation(line: 137, column: 14, scope: !86)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !13, line: 137, type: !89)
!93 = !DILocation(line: 137, column: 27, scope: !86)
!94 = !DILocation(line: 140, column: 22, scope: !86)
!95 = !DILocation(line: 140, column: 12, scope: !86)
!96 = !DILocation(line: 140, column: 5, scope: !86)
!97 = !DILocation(line: 142, column: 5, scope: !86)
!98 = !DILocation(line: 143, column: 5, scope: !86)
!99 = !DILocation(line: 144, column: 5, scope: !86)
!100 = !DILocation(line: 147, column: 5, scope: !86)
!101 = !DILocation(line: 148, column: 5, scope: !86)
!102 = !DILocation(line: 149, column: 5, scope: !86)
!103 = !DILocation(line: 151, column: 5, scope: !86)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 65, type: !22, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !13, line: 67, type: !6)
!106 = !DILocation(line: 67, column: 12, scope: !104)
!107 = !DILocation(line: 68, column: 10, scope: !104)
!108 = !DILocation(line: 69, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !13, line: 69, column: 8)
!110 = !DILocation(line: 69, column: 8, scope: !104)
!111 = !DILocation(line: 72, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !13, line: 70, column: 5)
!113 = !DILocation(line: 73, column: 5, scope: !112)
!114 = !DILocation(line: 77, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !13, line: 75, column: 5)
!116 = !DILocation(line: 77, column: 14, scope: !115)
!117 = !DILocation(line: 78, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !13, line: 78, column: 13)
!119 = !DILocation(line: 78, column: 18, scope: !118)
!120 = !DILocation(line: 78, column: 13, scope: !115)
!121 = !DILocation(line: 78, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 78, column: 27)
!123 = !DILocalVariable(name: "source", scope: !124, file: !13, line: 81, type: !42)
!124 = distinct !DILexicalBlock(scope: !104, file: !13, line: 80, column: 5)
!125 = !DILocation(line: 81, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !13, line: 82, type: !47)
!127 = !DILocation(line: 82, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !13, line: 82, type: !47)
!129 = !DILocation(line: 82, column: 19, scope: !124)
!130 = !DILocation(line: 83, column: 28, scope: !124)
!131 = !DILocation(line: 83, column: 21, scope: !124)
!132 = !DILocation(line: 83, column: 19, scope: !124)
!133 = !DILocation(line: 86, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !13, line: 86, column: 9)
!135 = !DILocation(line: 86, column: 14, scope: !134)
!136 = !DILocation(line: 86, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !13, line: 86, column: 9)
!138 = !DILocation(line: 86, column: 25, scope: !137)
!139 = !DILocation(line: 86, column: 35, scope: !137)
!140 = !DILocation(line: 86, column: 23, scope: !137)
!141 = !DILocation(line: 86, column: 9, scope: !134)
!142 = !DILocation(line: 88, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !13, line: 87, column: 9)
!144 = !DILocation(line: 88, column: 23, scope: !143)
!145 = !DILocation(line: 88, column: 13, scope: !143)
!146 = !DILocation(line: 88, column: 18, scope: !143)
!147 = !DILocation(line: 88, column: 21, scope: !143)
!148 = !DILocation(line: 89, column: 9, scope: !143)
!149 = !DILocation(line: 86, column: 41, scope: !137)
!150 = !DILocation(line: 86, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !76}
!152 = !DILocation(line: 89, column: 9, scope: !134)
!153 = !DILocation(line: 90, column: 19, scope: !124)
!154 = !DILocation(line: 90, column: 9, scope: !124)
!155 = !DILocation(line: 91, column: 14, scope: !124)
!156 = !DILocation(line: 91, column: 9, scope: !124)
!157 = !DILocation(line: 93, column: 1, scope: !104)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 96, type: !22, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !13, line: 98, type: !6)
!160 = !DILocation(line: 98, column: 12, scope: !158)
!161 = !DILocation(line: 99, column: 10, scope: !158)
!162 = !DILocation(line: 100, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !13, line: 100, column: 8)
!164 = !DILocation(line: 100, column: 8, scope: !158)
!165 = !DILocation(line: 103, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !13, line: 101, column: 5)
!167 = !DILocation(line: 103, column: 14, scope: !166)
!168 = !DILocation(line: 104, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !13, line: 104, column: 13)
!170 = !DILocation(line: 104, column: 18, scope: !169)
!171 = !DILocation(line: 104, column: 13, scope: !166)
!172 = !DILocation(line: 104, column: 28, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 104, column: 27)
!174 = !DILocation(line: 105, column: 5, scope: !166)
!175 = !DILocalVariable(name: "source", scope: !176, file: !13, line: 107, type: !42)
!176 = distinct !DILexicalBlock(scope: !158, file: !13, line: 106, column: 5)
!177 = !DILocation(line: 107, column: 14, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !176, file: !13, line: 108, type: !47)
!179 = !DILocation(line: 108, column: 16, scope: !176)
!180 = !DILocalVariable(name: "sourceLen", scope: !176, file: !13, line: 108, type: !47)
!181 = !DILocation(line: 108, column: 19, scope: !176)
!182 = !DILocation(line: 109, column: 28, scope: !176)
!183 = !DILocation(line: 109, column: 21, scope: !176)
!184 = !DILocation(line: 109, column: 19, scope: !176)
!185 = !DILocation(line: 112, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !13, line: 112, column: 9)
!187 = !DILocation(line: 112, column: 14, scope: !186)
!188 = !DILocation(line: 112, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !13, line: 112, column: 9)
!190 = !DILocation(line: 112, column: 25, scope: !189)
!191 = !DILocation(line: 112, column: 35, scope: !189)
!192 = !DILocation(line: 112, column: 23, scope: !189)
!193 = !DILocation(line: 112, column: 9, scope: !186)
!194 = !DILocation(line: 114, column: 30, scope: !195)
!195 = distinct !DILexicalBlock(scope: !189, file: !13, line: 113, column: 9)
!196 = !DILocation(line: 114, column: 23, scope: !195)
!197 = !DILocation(line: 114, column: 13, scope: !195)
!198 = !DILocation(line: 114, column: 18, scope: !195)
!199 = !DILocation(line: 114, column: 21, scope: !195)
!200 = !DILocation(line: 115, column: 9, scope: !195)
!201 = !DILocation(line: 112, column: 41, scope: !189)
!202 = !DILocation(line: 112, column: 9, scope: !189)
!203 = distinct !{!203, !193, !204, !76}
!204 = !DILocation(line: 115, column: 9, scope: !186)
!205 = !DILocation(line: 116, column: 19, scope: !176)
!206 = !DILocation(line: 116, column: 9, scope: !176)
!207 = !DILocation(line: 117, column: 14, scope: !176)
!208 = !DILocation(line: 117, column: 9, scope: !176)
!209 = !DILocation(line: 119, column: 1, scope: !158)
