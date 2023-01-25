; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08_bad() #0 !dbg !14 {
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call1, 0, !dbg !28
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !30

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !51
  store i64 %call4, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !56
  %6 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp5 = icmp ult i64 %5, %6, !dbg !59
  br i1 %cmp5, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !61
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !61
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !65
  store i8 %9, i8* %arrayidx7, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %11, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !73
  store i8 0, i8* %arrayidx8, align 1, !dbg !74
  %12 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %12), !dbg !76
  %13 = load i8*, i8** %data, align 8, !dbg !77
  call void @free(i8* %13) #7, !dbg !78
  ret void, !dbg !79
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !103 {
entry:
  ret i32 1, !dbg !106
}

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
  %call1 = call i32 @staticReturnsFalse(), !dbg !118
  %tobool = icmp ne i32 %call1, 0, !dbg !118
  br i1 %tobool, label %if.then2, label %if.else, !dbg !120

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end3, !dbg !123

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !135
  %4 = load i8*, i8** %data, align 8, !dbg !136
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !137
  store i64 %call4, i64* %dataLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !142
  %6 = load i64, i64* %dataLen, align 8, !dbg !144
  %cmp5 = icmp ult i64 %5, %6, !dbg !145
  br i1 %cmp5, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !147
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !147
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !147
  %10 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !151
  store i8 %9, i8* %arrayidx7, align 1, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %11, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !158
  store i8 0, i8* %arrayidx8, align 1, !dbg !159
  %12 = load i8*, i8** %data, align 8, !dbg !160
  call void @printLine(i8* %12), !dbg !161
  %13 = load i8*, i8** %data, align 8, !dbg !162
  call void @free(i8* %13) #7, !dbg !163
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !165 {
entry:
  ret i32 0, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !168, metadata !DIExpression()), !dbg !169
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !170
  store i8* %call, i8** %data, align 8, !dbg !171
  %0 = load i8*, i8** %data, align 8, !dbg !172
  %cmp = icmp eq i8* %0, null, !dbg !174
  br i1 %cmp, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !176
  unreachable, !dbg !176

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !178
  %tobool = icmp ne i32 %call1, 0, !dbg !178
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !180

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !183
  %2 = load i8*, i8** %data, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !184
  store i8 0, i8* %arrayidx, align 1, !dbg !185
  br label %if.end3, !dbg !186

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !187, metadata !DIExpression()), !dbg !189
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !189
  call void @llvm.dbg.declare(metadata i64* %i, metadata !190, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !192, metadata !DIExpression()), !dbg !193
  %4 = load i8*, i8** %data, align 8, !dbg !194
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !195
  store i64 %call4, i64* %dataLen, align 8, !dbg !196
  store i64 0, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !199

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !200
  %6 = load i64, i64* %dataLen, align 8, !dbg !202
  %cmp5 = icmp ult i64 %5, %6, !dbg !203
  br i1 %cmp5, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !205
  %8 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !205
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !205
  %10 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !209
  store i8 %9, i8* %arrayidx7, align 1, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !212
  %inc = add i64 %11, 1, !dbg !212
  store i64 %inc, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !216
  store i8 0, i8* %arrayidx8, align 1, !dbg !217
  %12 = load i8*, i8** %data, align 8, !dbg !218
  call void @printLine(i8* %12), !dbg !219
  %13 = load i8*, i8** %data, align 8, !dbg !220
  call void @free(i8* %13) #7, !dbg !221
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 20, scope: !14)
!21 = !DILocation(line: 40, column: 10, scope: !14)
!22 = !DILocation(line: 41, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!24 = !DILocation(line: 41, column: 14, scope: !23)
!25 = !DILocation(line: 41, column: 9, scope: !14)
!26 = !DILocation(line: 41, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 41, column: 23)
!28 = !DILocation(line: 42, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!30 = !DILocation(line: 42, column: 8, scope: !14)
!31 = !DILocation(line: 45, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 43, column: 5)
!33 = !DILocation(line: 45, column: 9, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !32)
!35 = !DILocation(line: 46, column: 21, scope: !32)
!36 = !DILocation(line: 47, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 14, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !15, line: 50, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 50, column: 16, scope: !38)
!48 = !DILocalVariable(name: "dataLen", scope: !38, file: !15, line: 50, type: !44)
!49 = !DILocation(line: 50, column: 19, scope: !38)
!50 = !DILocation(line: 51, column: 26, scope: !38)
!51 = !DILocation(line: 51, column: 19, scope: !38)
!52 = !DILocation(line: 51, column: 17, scope: !38)
!53 = !DILocation(line: 53, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !38, file: !15, line: 53, column: 9)
!55 = !DILocation(line: 53, column: 14, scope: !54)
!56 = !DILocation(line: 53, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !15, line: 53, column: 9)
!58 = !DILocation(line: 53, column: 25, scope: !57)
!59 = !DILocation(line: 53, column: 23, scope: !57)
!60 = !DILocation(line: 53, column: 9, scope: !54)
!61 = !DILocation(line: 55, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !15, line: 54, column: 9)
!63 = !DILocation(line: 55, column: 28, scope: !62)
!64 = !DILocation(line: 55, column: 18, scope: !62)
!65 = !DILocation(line: 55, column: 13, scope: !62)
!66 = !DILocation(line: 55, column: 21, scope: !62)
!67 = !DILocation(line: 56, column: 9, scope: !62)
!68 = !DILocation(line: 53, column: 35, scope: !57)
!69 = !DILocation(line: 53, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 56, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 57, column: 9, scope: !38)
!74 = !DILocation(line: 57, column: 20, scope: !38)
!75 = !DILocation(line: 58, column: 19, scope: !38)
!76 = !DILocation(line: 58, column: 9, scope: !38)
!77 = !DILocation(line: 59, column: 14, scope: !38)
!78 = !DILocation(line: 59, column: 9, scope: !38)
!79 = !DILocation(line: 61, column: 1, scope: !14)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_08_good", scope: !15, file: !15, line: 126, type: !16, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 128, column: 5, scope: !80)
!82 = !DILocation(line: 129, column: 5, scope: !80)
!83 = !DILocation(line: 130, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 142, type: !85, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 142, type: !87)
!90 = !DILocation(line: 142, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 142, type: !88)
!92 = !DILocation(line: 142, column: 27, scope: !84)
!93 = !DILocation(line: 145, column: 22, scope: !84)
!94 = !DILocation(line: 145, column: 12, scope: !84)
!95 = !DILocation(line: 145, column: 5, scope: !84)
!96 = !DILocation(line: 147, column: 5, scope: !84)
!97 = !DILocation(line: 148, column: 5, scope: !84)
!98 = !DILocation(line: 149, column: 5, scope: !84)
!99 = !DILocation(line: 152, column: 5, scope: !84)
!100 = !DILocation(line: 153, column: 5, scope: !84)
!101 = !DILocation(line: 154, column: 5, scope: !84)
!102 = !DILocation(line: 156, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !104, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!87}
!106 = !DILocation(line: 27, column: 5, scope: !103)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 70, type: !4)
!109 = !DILocation(line: 70, column: 12, scope: !107)
!110 = !DILocation(line: 71, column: 20, scope: !107)
!111 = !DILocation(line: 71, column: 10, scope: !107)
!112 = !DILocation(line: 72, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !15, line: 72, column: 9)
!114 = !DILocation(line: 72, column: 14, scope: !113)
!115 = !DILocation(line: 72, column: 9, scope: !107)
!116 = !DILocation(line: 72, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 72, column: 23)
!118 = !DILocation(line: 73, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !15, line: 73, column: 8)
!120 = !DILocation(line: 73, column: 8, scope: !107)
!121 = !DILocation(line: 76, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !15, line: 74, column: 5)
!123 = !DILocation(line: 77, column: 5, scope: !122)
!124 = !DILocation(line: 81, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !15, line: 79, column: 5)
!126 = !DILocation(line: 81, column: 9, scope: !125)
!127 = !DILocation(line: 82, column: 9, scope: !125)
!128 = !DILocation(line: 82, column: 20, scope: !125)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !15, line: 85, type: !39)
!130 = distinct !DILexicalBlock(scope: !107, file: !15, line: 84, column: 5)
!131 = !DILocation(line: 85, column: 14, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !130, file: !15, line: 86, type: !44)
!133 = !DILocation(line: 86, column: 16, scope: !130)
!134 = !DILocalVariable(name: "dataLen", scope: !130, file: !15, line: 86, type: !44)
!135 = !DILocation(line: 86, column: 19, scope: !130)
!136 = !DILocation(line: 87, column: 26, scope: !130)
!137 = !DILocation(line: 87, column: 19, scope: !130)
!138 = !DILocation(line: 87, column: 17, scope: !130)
!139 = !DILocation(line: 89, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !15, line: 89, column: 9)
!141 = !DILocation(line: 89, column: 14, scope: !140)
!142 = !DILocation(line: 89, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !15, line: 89, column: 9)
!144 = !DILocation(line: 89, column: 25, scope: !143)
!145 = !DILocation(line: 89, column: 23, scope: !143)
!146 = !DILocation(line: 89, column: 9, scope: !140)
!147 = !DILocation(line: 91, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !15, line: 90, column: 9)
!149 = !DILocation(line: 91, column: 28, scope: !148)
!150 = !DILocation(line: 91, column: 18, scope: !148)
!151 = !DILocation(line: 91, column: 13, scope: !148)
!152 = !DILocation(line: 91, column: 21, scope: !148)
!153 = !DILocation(line: 92, column: 9, scope: !148)
!154 = !DILocation(line: 89, column: 35, scope: !143)
!155 = !DILocation(line: 89, column: 9, scope: !143)
!156 = distinct !{!156, !146, !157, !72}
!157 = !DILocation(line: 92, column: 9, scope: !140)
!158 = !DILocation(line: 93, column: 9, scope: !130)
!159 = !DILocation(line: 93, column: 20, scope: !130)
!160 = !DILocation(line: 94, column: 19, scope: !130)
!161 = !DILocation(line: 94, column: 9, scope: !130)
!162 = !DILocation(line: 95, column: 14, scope: !130)
!163 = !DILocation(line: 95, column: 9, scope: !130)
!164 = !DILocation(line: 97, column: 1, scope: !107)
!165 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !104, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DILocation(line: 32, column: 5, scope: !165)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!168 = !DILocalVariable(name: "data", scope: !167, file: !15, line: 102, type: !4)
!169 = !DILocation(line: 102, column: 12, scope: !167)
!170 = !DILocation(line: 103, column: 20, scope: !167)
!171 = !DILocation(line: 103, column: 10, scope: !167)
!172 = !DILocation(line: 104, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !15, line: 104, column: 9)
!174 = !DILocation(line: 104, column: 14, scope: !173)
!175 = !DILocation(line: 104, column: 9, scope: !167)
!176 = !DILocation(line: 104, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 104, column: 23)
!178 = !DILocation(line: 105, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !167, file: !15, line: 105, column: 8)
!180 = !DILocation(line: 105, column: 8, scope: !167)
!181 = !DILocation(line: 108, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !15, line: 106, column: 5)
!183 = !DILocation(line: 108, column: 9, scope: !182)
!184 = !DILocation(line: 109, column: 9, scope: !182)
!185 = !DILocation(line: 109, column: 20, scope: !182)
!186 = !DILocation(line: 110, column: 5, scope: !182)
!187 = !DILocalVariable(name: "dest", scope: !188, file: !15, line: 112, type: !39)
!188 = distinct !DILexicalBlock(scope: !167, file: !15, line: 111, column: 5)
!189 = !DILocation(line: 112, column: 14, scope: !188)
!190 = !DILocalVariable(name: "i", scope: !188, file: !15, line: 113, type: !44)
!191 = !DILocation(line: 113, column: 16, scope: !188)
!192 = !DILocalVariable(name: "dataLen", scope: !188, file: !15, line: 113, type: !44)
!193 = !DILocation(line: 113, column: 19, scope: !188)
!194 = !DILocation(line: 114, column: 26, scope: !188)
!195 = !DILocation(line: 114, column: 19, scope: !188)
!196 = !DILocation(line: 114, column: 17, scope: !188)
!197 = !DILocation(line: 116, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !188, file: !15, line: 116, column: 9)
!199 = !DILocation(line: 116, column: 14, scope: !198)
!200 = !DILocation(line: 116, column: 21, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !15, line: 116, column: 9)
!202 = !DILocation(line: 116, column: 25, scope: !201)
!203 = !DILocation(line: 116, column: 23, scope: !201)
!204 = !DILocation(line: 116, column: 9, scope: !198)
!205 = !DILocation(line: 118, column: 23, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !15, line: 117, column: 9)
!207 = !DILocation(line: 118, column: 28, scope: !206)
!208 = !DILocation(line: 118, column: 18, scope: !206)
!209 = !DILocation(line: 118, column: 13, scope: !206)
!210 = !DILocation(line: 118, column: 21, scope: !206)
!211 = !DILocation(line: 119, column: 9, scope: !206)
!212 = !DILocation(line: 116, column: 35, scope: !201)
!213 = !DILocation(line: 116, column: 9, scope: !201)
!214 = distinct !{!214, !204, !215, !72}
!215 = !DILocation(line: 119, column: 9, scope: !198)
!216 = !DILocation(line: 120, column: 9, scope: !188)
!217 = !DILocation(line: 120, column: 20, scope: !188)
!218 = !DILocation(line: 121, column: 19, scope: !188)
!219 = !DILocation(line: 121, column: 9, scope: !188)
!220 = !DILocation(line: 122, column: 14, scope: !188)
!221 = !DILocation(line: 122, column: 9, scope: !188)
!222 = !DILocation(line: 124, column: 1, scope: !167)
