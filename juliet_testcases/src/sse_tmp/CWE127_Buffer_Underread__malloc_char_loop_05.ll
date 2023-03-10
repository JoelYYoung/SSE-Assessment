; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !34
  store i8* %call, i8** %dataBuffer, align 8, !dbg !33
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i8* %1, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !42
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !46
  store i8* %add.ptr, i8** %data, align 8, !dbg !47
  br label %if.end2, !dbg !48

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx3, align 1, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end2
  %5 = load i64, i64* %i, align 8, !dbg !66
  %cmp4 = icmp ult i64 %5, 100, !dbg !68
  br i1 %cmp4, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !70
  %7 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !70
  %8 = load i8, i8* %arrayidx5, align 1, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !74
  store i8 %8, i8* %arrayidx6, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %10, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx7, align 1, !dbg !83
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* %arraydecay8), !dbg !85
  ret void, !dbg !86
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
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_05_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #6, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #6, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE127_Buffer_Underread__malloc_char_loop_05_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE127_Buffer_Underread__malloc_char_loop_05_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* null, i8** %data, align 8, !dbg !112
  %0 = load i32, i32* @staticFalse, align 4, !dbg !113
  %tobool = icmp ne i32 %0, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end2, !dbg !118

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !123
  store i8* %call, i8** %dataBuffer, align 8, !dbg !122
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  %cmp = icmp eq i8* %1, null, !dbg !126
  br i1 %cmp, label %if.then1, label %if.end, !dbg !127

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !131
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !134
  store i8* %4, i8** %data, align 8, !dbg !135
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end2
  %5 = load i64, i64* %i, align 8, !dbg !147
  %cmp4 = icmp ult i64 %5, 100, !dbg !149
  br i1 %cmp4, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !151
  %7 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !151
  %8 = load i8, i8* %arrayidx5, align 1, !dbg !151
  %9 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !155
  store i8 %8, i8* %arrayidx6, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %10, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx7, align 1, !dbg !163
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  call void @printLine(i8* %arraydecay8), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !168, metadata !DIExpression()), !dbg !169
  store i8* null, i8** %data, align 8, !dbg !170
  %0 = load i32, i32* @staticTrue, align 4, !dbg !171
  %tobool = icmp ne i32 %0, 0, !dbg !171
  br i1 %tobool, label %if.then, label %if.end2, !dbg !173

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !174, metadata !DIExpression()), !dbg !177
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !178
  store i8* %call, i8** %dataBuffer, align 8, !dbg !177
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !179
  %cmp = icmp eq i8* %1, null, !dbg !181
  br i1 %cmp, label %if.then1, label %if.end, !dbg !182

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !183
  unreachable, !dbg !183

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !186
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !187
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !187
  store i8 0, i8* %arrayidx, align 1, !dbg !188
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !189
  store i8* %4, i8** %data, align 8, !dbg !190
  br label %if.end2, !dbg !191

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !192, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !195, metadata !DIExpression()), !dbg !196
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !197
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !198
  store i8 0, i8* %arrayidx3, align 1, !dbg !199
  store i64 0, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.inc, %if.end2
  %5 = load i64, i64* %i, align 8, !dbg !203
  %cmp4 = icmp ult i64 %5, 100, !dbg !205
  br i1 %cmp4, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !207
  %7 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !207
  %8 = load i8, i8* %arrayidx5, align 1, !dbg !207
  %9 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !211
  store i8 %8, i8* %arrayidx6, align 1, !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !214
  %inc = add i64 %10, 1, !dbg !214
  store i64 %inc, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !218
  store i8 0, i8* %arrayidx7, align 1, !dbg !219
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !220
  call void @printLine(i8* %arraydecay8), !dbg !221
  ret void, !dbg !222
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 37, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 36, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 20, scope: !31)
!34 = !DILocation(line: 37, column: 41, scope: !31)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 17)
!37 = !DILocation(line: 38, column: 28, scope: !36)
!38 = !DILocation(line: 38, column: 17, scope: !31)
!39 = !DILocation(line: 38, column: 38, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 38, column: 37)
!41 = !DILocation(line: 39, column: 20, scope: !31)
!42 = !DILocation(line: 39, column: 13, scope: !31)
!43 = !DILocation(line: 40, column: 13, scope: !31)
!44 = !DILocation(line: 40, column: 31, scope: !31)
!45 = !DILocation(line: 42, column: 20, scope: !31)
!46 = !DILocation(line: 42, column: 31, scope: !31)
!47 = !DILocation(line: 42, column: 18, scope: !31)
!48 = !DILocation(line: 44, column: 5, scope: !32)
!49 = !DILocalVariable(name: "i", scope: !50, file: !13, line: 46, type: !51)
!50 = distinct !DILexicalBlock(scope: !21, file: !13, line: 45, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 46, column: 16, scope: !50)
!55 = !DILocalVariable(name: "dest", scope: !50, file: !13, line: 47, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 47, column: 14, scope: !50)
!60 = !DILocation(line: 48, column: 9, scope: !50)
!61 = !DILocation(line: 49, column: 9, scope: !50)
!62 = !DILocation(line: 49, column: 21, scope: !50)
!63 = !DILocation(line: 51, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !13, line: 51, column: 9)
!65 = !DILocation(line: 51, column: 14, scope: !64)
!66 = !DILocation(line: 51, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !13, line: 51, column: 9)
!68 = !DILocation(line: 51, column: 23, scope: !67)
!69 = !DILocation(line: 51, column: 9, scope: !64)
!70 = !DILocation(line: 53, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !13, line: 52, column: 9)
!72 = !DILocation(line: 53, column: 28, scope: !71)
!73 = !DILocation(line: 53, column: 18, scope: !71)
!74 = !DILocation(line: 53, column: 13, scope: !71)
!75 = !DILocation(line: 53, column: 21, scope: !71)
!76 = !DILocation(line: 54, column: 9, scope: !71)
!77 = !DILocation(line: 51, column: 31, scope: !67)
!78 = !DILocation(line: 51, column: 9, scope: !67)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 54, column: 9, scope: !64)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 56, column: 9, scope: !50)
!83 = !DILocation(line: 56, column: 21, scope: !50)
!84 = !DILocation(line: 57, column: 19, scope: !50)
!85 = !DILocation(line: 57, column: 9, scope: !50)
!86 = !DILocation(line: 61, column: 1, scope: !21)
!87 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_05_good", scope: !13, file: !13, line: 140, type: !22, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 142, column: 5, scope: !87)
!89 = !DILocation(line: 143, column: 5, scope: !87)
!90 = !DILocation(line: 144, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 156, type: !92, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DISubroutineType(types: !93)
!93 = !{!14, !14, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !13, line: 156, type: !14)
!96 = !DILocation(line: 156, column: 14, scope: !91)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !13, line: 156, type: !94)
!98 = !DILocation(line: 156, column: 27, scope: !91)
!99 = !DILocation(line: 159, column: 22, scope: !91)
!100 = !DILocation(line: 159, column: 12, scope: !91)
!101 = !DILocation(line: 159, column: 5, scope: !91)
!102 = !DILocation(line: 161, column: 5, scope: !91)
!103 = !DILocation(line: 162, column: 5, scope: !91)
!104 = !DILocation(line: 163, column: 5, scope: !91)
!105 = !DILocation(line: 166, column: 5, scope: !91)
!106 = !DILocation(line: 167, column: 5, scope: !91)
!107 = !DILocation(line: 168, column: 5, scope: !91)
!108 = !DILocation(line: 170, column: 5, scope: !91)
!109 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 68, type: !22, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !13, line: 70, type: !6)
!111 = !DILocation(line: 70, column: 12, scope: !109)
!112 = !DILocation(line: 71, column: 10, scope: !109)
!113 = !DILocation(line: 72, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !13, line: 72, column: 8)
!115 = !DILocation(line: 72, column: 8, scope: !109)
!116 = !DILocation(line: 75, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !13, line: 73, column: 5)
!118 = !DILocation(line: 76, column: 5, scope: !117)
!119 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !13, line: 80, type: !6)
!120 = distinct !DILexicalBlock(scope: !121, file: !13, line: 79, column: 9)
!121 = distinct !DILexicalBlock(scope: !114, file: !13, line: 78, column: 5)
!122 = !DILocation(line: 80, column: 20, scope: !120)
!123 = !DILocation(line: 80, column: 41, scope: !120)
!124 = !DILocation(line: 81, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !13, line: 81, column: 17)
!126 = !DILocation(line: 81, column: 28, scope: !125)
!127 = !DILocation(line: 81, column: 17, scope: !120)
!128 = !DILocation(line: 81, column: 38, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 81, column: 37)
!130 = !DILocation(line: 82, column: 20, scope: !120)
!131 = !DILocation(line: 82, column: 13, scope: !120)
!132 = !DILocation(line: 83, column: 13, scope: !120)
!133 = !DILocation(line: 83, column: 31, scope: !120)
!134 = !DILocation(line: 85, column: 20, scope: !120)
!135 = !DILocation(line: 85, column: 18, scope: !120)
!136 = !DILocalVariable(name: "i", scope: !137, file: !13, line: 89, type: !51)
!137 = distinct !DILexicalBlock(scope: !109, file: !13, line: 88, column: 5)
!138 = !DILocation(line: 89, column: 16, scope: !137)
!139 = !DILocalVariable(name: "dest", scope: !137, file: !13, line: 90, type: !56)
!140 = !DILocation(line: 90, column: 14, scope: !137)
!141 = !DILocation(line: 91, column: 9, scope: !137)
!142 = !DILocation(line: 92, column: 9, scope: !137)
!143 = !DILocation(line: 92, column: 21, scope: !137)
!144 = !DILocation(line: 94, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !13, line: 94, column: 9)
!146 = !DILocation(line: 94, column: 14, scope: !145)
!147 = !DILocation(line: 94, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !13, line: 94, column: 9)
!149 = !DILocation(line: 94, column: 23, scope: !148)
!150 = !DILocation(line: 94, column: 9, scope: !145)
!151 = !DILocation(line: 96, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 95, column: 9)
!153 = !DILocation(line: 96, column: 28, scope: !152)
!154 = !DILocation(line: 96, column: 18, scope: !152)
!155 = !DILocation(line: 96, column: 13, scope: !152)
!156 = !DILocation(line: 96, column: 21, scope: !152)
!157 = !DILocation(line: 97, column: 9, scope: !152)
!158 = !DILocation(line: 94, column: 31, scope: !148)
!159 = !DILocation(line: 94, column: 9, scope: !148)
!160 = distinct !{!160, !150, !161, !81}
!161 = !DILocation(line: 97, column: 9, scope: !145)
!162 = !DILocation(line: 99, column: 9, scope: !137)
!163 = !DILocation(line: 99, column: 21, scope: !137)
!164 = !DILocation(line: 100, column: 19, scope: !137)
!165 = !DILocation(line: 100, column: 9, scope: !137)
!166 = !DILocation(line: 104, column: 1, scope: !109)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DILocalVariable(name: "data", scope: !167, file: !13, line: 109, type: !6)
!169 = !DILocation(line: 109, column: 12, scope: !167)
!170 = !DILocation(line: 110, column: 10, scope: !167)
!171 = !DILocation(line: 111, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !13, line: 111, column: 8)
!173 = !DILocation(line: 111, column: 8, scope: !167)
!174 = !DILocalVariable(name: "dataBuffer", scope: !175, file: !13, line: 114, type: !6)
!175 = distinct !DILexicalBlock(scope: !176, file: !13, line: 113, column: 9)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 112, column: 5)
!177 = !DILocation(line: 114, column: 20, scope: !175)
!178 = !DILocation(line: 114, column: 41, scope: !175)
!179 = !DILocation(line: 115, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !13, line: 115, column: 17)
!181 = !DILocation(line: 115, column: 28, scope: !180)
!182 = !DILocation(line: 115, column: 17, scope: !175)
!183 = !DILocation(line: 115, column: 38, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !13, line: 115, column: 37)
!185 = !DILocation(line: 116, column: 20, scope: !175)
!186 = !DILocation(line: 116, column: 13, scope: !175)
!187 = !DILocation(line: 117, column: 13, scope: !175)
!188 = !DILocation(line: 117, column: 31, scope: !175)
!189 = !DILocation(line: 119, column: 20, scope: !175)
!190 = !DILocation(line: 119, column: 18, scope: !175)
!191 = !DILocation(line: 121, column: 5, scope: !176)
!192 = !DILocalVariable(name: "i", scope: !193, file: !13, line: 123, type: !51)
!193 = distinct !DILexicalBlock(scope: !167, file: !13, line: 122, column: 5)
!194 = !DILocation(line: 123, column: 16, scope: !193)
!195 = !DILocalVariable(name: "dest", scope: !193, file: !13, line: 124, type: !56)
!196 = !DILocation(line: 124, column: 14, scope: !193)
!197 = !DILocation(line: 125, column: 9, scope: !193)
!198 = !DILocation(line: 126, column: 9, scope: !193)
!199 = !DILocation(line: 126, column: 21, scope: !193)
!200 = !DILocation(line: 128, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !193, file: !13, line: 128, column: 9)
!202 = !DILocation(line: 128, column: 14, scope: !201)
!203 = !DILocation(line: 128, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !13, line: 128, column: 9)
!205 = !DILocation(line: 128, column: 23, scope: !204)
!206 = !DILocation(line: 128, column: 9, scope: !201)
!207 = !DILocation(line: 130, column: 23, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !13, line: 129, column: 9)
!209 = !DILocation(line: 130, column: 28, scope: !208)
!210 = !DILocation(line: 130, column: 18, scope: !208)
!211 = !DILocation(line: 130, column: 13, scope: !208)
!212 = !DILocation(line: 130, column: 21, scope: !208)
!213 = !DILocation(line: 131, column: 9, scope: !208)
!214 = !DILocation(line: 128, column: 31, scope: !204)
!215 = !DILocation(line: 128, column: 9, scope: !204)
!216 = distinct !{!216, !206, !217, !81}
!217 = !DILocation(line: 131, column: 9, scope: !201)
!218 = !DILocation(line: 133, column: 9, scope: !193)
!219 = !DILocation(line: 133, column: 21, scope: !193)
!220 = !DILocation(line: 134, column: 19, scope: !193)
!221 = !DILocation(line: 134, column: 9, scope: !193)
!222 = !DILocation(line: 138, column: 1, scope: !167)
