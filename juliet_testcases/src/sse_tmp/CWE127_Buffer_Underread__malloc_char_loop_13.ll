; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_13.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !29
  store i8* %call, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %cmp1 = icmp eq i8* %1, null, !dbg !32
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !37
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !41
  store i8* %add.ptr, i8** %data, align 8, !dbg !42
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx4, align 1, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !61
  %cmp5 = icmp ult i64 %5, 100, !dbg !63
  br i1 %cmp5, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !65
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !65
  %8 = load i8, i8* %arrayidx6, align 1, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !69
  store i8 %8, i8* %arrayidx7, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %10, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx8, align 1, !dbg !78
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  call void @printLine(i8* %arraydecay9), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_13_good() #0 !dbg !82 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE127_Buffer_Underread__malloc_char_loop_13_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__malloc_char_loop_13_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i8* null, i8** %data, align 8, !dbg !108
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !109
  %cmp = icmp ne i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end3, !dbg !115

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !120
  store i8* %call, i8** %dataBuffer, align 8, !dbg !119
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  %cmp1 = icmp eq i8* %1, null, !dbg !123
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !124

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !128
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !131
  store i8* %4, i8** %data, align 8, !dbg !132
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !138
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx4, align 1, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !144
  %cmp5 = icmp ult i64 %5, 100, !dbg !146
  br i1 %cmp5, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !148
  %7 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !148
  %8 = load i8, i8* %arrayidx6, align 1, !dbg !148
  %9 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !152
  store i8 %8, i8* %arrayidx7, align 1, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %10, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx8, align 1, !dbg !160
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  call void @printLine(i8* %arraydecay9), !dbg !162
  ret void, !dbg !163
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !164 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !165, metadata !DIExpression()), !dbg !166
  store i8* null, i8** %data, align 8, !dbg !167
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !168
  %cmp = icmp eq i32 %0, 5, !dbg !170
  br i1 %cmp, label %if.then, label %if.end3, !dbg !171

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !172, metadata !DIExpression()), !dbg !175
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !176
  store i8* %call, i8** %dataBuffer, align 8, !dbg !175
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !177
  %cmp1 = icmp eq i8* %1, null, !dbg !179
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !180

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !181
  unreachable, !dbg !181

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !184
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !185
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !185
  store i8 0, i8* %arrayidx, align 1, !dbg !186
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !187
  store i8* %4, i8** %data, align 8, !dbg !188
  br label %if.end3, !dbg !189

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !190, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !193, metadata !DIExpression()), !dbg !194
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !195
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !195
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !196
  store i8 0, i8* %arrayidx4, align 1, !dbg !197
  store i64 0, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !201
  %cmp5 = icmp ult i64 %5, 100, !dbg !203
  br i1 %cmp5, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !205
  %7 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !205
  %8 = load i8, i8* %arrayidx6, align 1, !dbg !205
  %9 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !209
  store i8 %8, i8* %arrayidx7, align 1, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !212
  %inc = add i64 %10, 1, !dbg !212
  store i64 %inc, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !216
  store i8 0, i8* %arrayidx8, align 1, !dbg !217
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !218
  call void @printLine(i8* %arraydecay9), !dbg !219
  ret void, !dbg !220
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_13_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 25, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !15, line: 30, type: !4)
!26 = distinct !DILexicalBlock(scope: !27, file: !15, line: 29, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 41, scope: !26)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 17)
!32 = !DILocation(line: 31, column: 28, scope: !31)
!33 = !DILocation(line: 31, column: 17, scope: !26)
!34 = !DILocation(line: 31, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 31, column: 37)
!36 = !DILocation(line: 32, column: 20, scope: !26)
!37 = !DILocation(line: 32, column: 13, scope: !26)
!38 = !DILocation(line: 33, column: 13, scope: !26)
!39 = !DILocation(line: 33, column: 31, scope: !26)
!40 = !DILocation(line: 35, column: 20, scope: !26)
!41 = !DILocation(line: 35, column: 31, scope: !26)
!42 = !DILocation(line: 35, column: 18, scope: !26)
!43 = !DILocation(line: 37, column: 5, scope: !27)
!44 = !DILocalVariable(name: "i", scope: !45, file: !15, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 39, column: 16, scope: !45)
!50 = !DILocalVariable(name: "dest", scope: !45, file: !15, line: 40, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 40, column: 14, scope: !45)
!55 = !DILocation(line: 41, column: 9, scope: !45)
!56 = !DILocation(line: 42, column: 9, scope: !45)
!57 = !DILocation(line: 42, column: 21, scope: !45)
!58 = !DILocation(line: 44, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !45, file: !15, line: 44, column: 9)
!60 = !DILocation(line: 44, column: 14, scope: !59)
!61 = !DILocation(line: 44, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 44, column: 9)
!63 = !DILocation(line: 44, column: 23, scope: !62)
!64 = !DILocation(line: 44, column: 9, scope: !59)
!65 = !DILocation(line: 46, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 45, column: 9)
!67 = !DILocation(line: 46, column: 28, scope: !66)
!68 = !DILocation(line: 46, column: 18, scope: !66)
!69 = !DILocation(line: 46, column: 13, scope: !66)
!70 = !DILocation(line: 46, column: 21, scope: !66)
!71 = !DILocation(line: 47, column: 9, scope: !66)
!72 = !DILocation(line: 44, column: 31, scope: !62)
!73 = !DILocation(line: 44, column: 9, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 47, column: 9, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 49, column: 9, scope: !45)
!78 = !DILocation(line: 49, column: 21, scope: !45)
!79 = !DILocation(line: 50, column: 19, scope: !45)
!80 = !DILocation(line: 50, column: 9, scope: !45)
!81 = !DILocation(line: 54, column: 1, scope: !14)
!82 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_13_good", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 135, column: 5, scope: !82)
!84 = !DILocation(line: 136, column: 5, scope: !82)
!85 = !DILocation(line: 137, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 149, type: !87, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !15, line: 149, type: !89)
!92 = !DILocation(line: 149, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !15, line: 149, type: !90)
!94 = !DILocation(line: 149, column: 27, scope: !86)
!95 = !DILocation(line: 152, column: 22, scope: !86)
!96 = !DILocation(line: 152, column: 12, scope: !86)
!97 = !DILocation(line: 152, column: 5, scope: !86)
!98 = !DILocation(line: 154, column: 5, scope: !86)
!99 = !DILocation(line: 155, column: 5, scope: !86)
!100 = !DILocation(line: 156, column: 5, scope: !86)
!101 = !DILocation(line: 159, column: 5, scope: !86)
!102 = !DILocation(line: 160, column: 5, scope: !86)
!103 = !DILocation(line: 161, column: 5, scope: !86)
!104 = !DILocation(line: 163, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 63, type: !4)
!107 = !DILocation(line: 63, column: 12, scope: !105)
!108 = !DILocation(line: 64, column: 10, scope: !105)
!109 = !DILocation(line: 65, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !15, line: 65, column: 8)
!111 = !DILocation(line: 65, column: 25, scope: !110)
!112 = !DILocation(line: 65, column: 8, scope: !105)
!113 = !DILocation(line: 68, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 66, column: 5)
!115 = !DILocation(line: 69, column: 5, scope: !114)
!116 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !15, line: 73, type: !4)
!117 = distinct !DILexicalBlock(scope: !118, file: !15, line: 72, column: 9)
!118 = distinct !DILexicalBlock(scope: !110, file: !15, line: 71, column: 5)
!119 = !DILocation(line: 73, column: 20, scope: !117)
!120 = !DILocation(line: 73, column: 41, scope: !117)
!121 = !DILocation(line: 74, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !15, line: 74, column: 17)
!123 = !DILocation(line: 74, column: 28, scope: !122)
!124 = !DILocation(line: 74, column: 17, scope: !117)
!125 = !DILocation(line: 74, column: 38, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 74, column: 37)
!127 = !DILocation(line: 75, column: 20, scope: !117)
!128 = !DILocation(line: 75, column: 13, scope: !117)
!129 = !DILocation(line: 76, column: 13, scope: !117)
!130 = !DILocation(line: 76, column: 31, scope: !117)
!131 = !DILocation(line: 78, column: 20, scope: !117)
!132 = !DILocation(line: 78, column: 18, scope: !117)
!133 = !DILocalVariable(name: "i", scope: !134, file: !15, line: 82, type: !46)
!134 = distinct !DILexicalBlock(scope: !105, file: !15, line: 81, column: 5)
!135 = !DILocation(line: 82, column: 16, scope: !134)
!136 = !DILocalVariable(name: "dest", scope: !134, file: !15, line: 83, type: !51)
!137 = !DILocation(line: 83, column: 14, scope: !134)
!138 = !DILocation(line: 84, column: 9, scope: !134)
!139 = !DILocation(line: 85, column: 9, scope: !134)
!140 = !DILocation(line: 85, column: 21, scope: !134)
!141 = !DILocation(line: 87, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !134, file: !15, line: 87, column: 9)
!143 = !DILocation(line: 87, column: 14, scope: !142)
!144 = !DILocation(line: 87, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !15, line: 87, column: 9)
!146 = !DILocation(line: 87, column: 23, scope: !145)
!147 = !DILocation(line: 87, column: 9, scope: !142)
!148 = !DILocation(line: 89, column: 23, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 88, column: 9)
!150 = !DILocation(line: 89, column: 28, scope: !149)
!151 = !DILocation(line: 89, column: 18, scope: !149)
!152 = !DILocation(line: 89, column: 13, scope: !149)
!153 = !DILocation(line: 89, column: 21, scope: !149)
!154 = !DILocation(line: 90, column: 9, scope: !149)
!155 = !DILocation(line: 87, column: 31, scope: !145)
!156 = !DILocation(line: 87, column: 9, scope: !145)
!157 = distinct !{!157, !147, !158, !76}
!158 = !DILocation(line: 90, column: 9, scope: !142)
!159 = !DILocation(line: 92, column: 9, scope: !134)
!160 = !DILocation(line: 92, column: 21, scope: !134)
!161 = !DILocation(line: 93, column: 19, scope: !134)
!162 = !DILocation(line: 93, column: 9, scope: !134)
!163 = !DILocation(line: 97, column: 1, scope: !105)
!164 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!165 = !DILocalVariable(name: "data", scope: !164, file: !15, line: 102, type: !4)
!166 = !DILocation(line: 102, column: 12, scope: !164)
!167 = !DILocation(line: 103, column: 10, scope: !164)
!168 = !DILocation(line: 104, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !15, line: 104, column: 8)
!170 = !DILocation(line: 104, column: 25, scope: !169)
!171 = !DILocation(line: 104, column: 8, scope: !164)
!172 = !DILocalVariable(name: "dataBuffer", scope: !173, file: !15, line: 107, type: !4)
!173 = distinct !DILexicalBlock(scope: !174, file: !15, line: 106, column: 9)
!174 = distinct !DILexicalBlock(scope: !169, file: !15, line: 105, column: 5)
!175 = !DILocation(line: 107, column: 20, scope: !173)
!176 = !DILocation(line: 107, column: 41, scope: !173)
!177 = !DILocation(line: 108, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !15, line: 108, column: 17)
!179 = !DILocation(line: 108, column: 28, scope: !178)
!180 = !DILocation(line: 108, column: 17, scope: !173)
!181 = !DILocation(line: 108, column: 38, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 108, column: 37)
!183 = !DILocation(line: 109, column: 20, scope: !173)
!184 = !DILocation(line: 109, column: 13, scope: !173)
!185 = !DILocation(line: 110, column: 13, scope: !173)
!186 = !DILocation(line: 110, column: 31, scope: !173)
!187 = !DILocation(line: 112, column: 20, scope: !173)
!188 = !DILocation(line: 112, column: 18, scope: !173)
!189 = !DILocation(line: 114, column: 5, scope: !174)
!190 = !DILocalVariable(name: "i", scope: !191, file: !15, line: 116, type: !46)
!191 = distinct !DILexicalBlock(scope: !164, file: !15, line: 115, column: 5)
!192 = !DILocation(line: 116, column: 16, scope: !191)
!193 = !DILocalVariable(name: "dest", scope: !191, file: !15, line: 117, type: !51)
!194 = !DILocation(line: 117, column: 14, scope: !191)
!195 = !DILocation(line: 118, column: 9, scope: !191)
!196 = !DILocation(line: 119, column: 9, scope: !191)
!197 = !DILocation(line: 119, column: 21, scope: !191)
!198 = !DILocation(line: 121, column: 16, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !15, line: 121, column: 9)
!200 = !DILocation(line: 121, column: 14, scope: !199)
!201 = !DILocation(line: 121, column: 21, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !15, line: 121, column: 9)
!203 = !DILocation(line: 121, column: 23, scope: !202)
!204 = !DILocation(line: 121, column: 9, scope: !199)
!205 = !DILocation(line: 123, column: 23, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !15, line: 122, column: 9)
!207 = !DILocation(line: 123, column: 28, scope: !206)
!208 = !DILocation(line: 123, column: 18, scope: !206)
!209 = !DILocation(line: 123, column: 13, scope: !206)
!210 = !DILocation(line: 123, column: 21, scope: !206)
!211 = !DILocation(line: 124, column: 9, scope: !206)
!212 = !DILocation(line: 121, column: 31, scope: !202)
!213 = !DILocation(line: 121, column: 9, scope: !202)
!214 = distinct !{!214, !204, !215, !76}
!215 = !DILocation(line: 124, column: 9, scope: !199)
!216 = !DILocation(line: 126, column: 9, scope: !191)
!217 = !DILocation(line: 126, column: 21, scope: !191)
!218 = !DILocation(line: 127, column: 19, scope: !191)
!219 = !DILocation(line: 127, column: 9, scope: !191)
!220 = !DILocation(line: 131, column: 1, scope: !164)
