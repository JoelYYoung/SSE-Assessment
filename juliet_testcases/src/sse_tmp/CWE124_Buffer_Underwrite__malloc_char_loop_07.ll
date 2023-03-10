; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !33
  store i8* %call, i8** %dataBuffer, align 8, !dbg !32
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !41
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !44
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !45
  store i8* %add.ptr, i8** %data, align 8, !dbg !46
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx4, align 1, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !65
  %cmp5 = icmp ult i64 %5, 100, !dbg !67
  br i1 %cmp5, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !71
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !71
  %8 = load i8*, i8** %data, align 8, !dbg !72
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !72
  store i8 %7, i8* %arrayidx7, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %10, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !81
  store i8 0, i8* %arrayidx8, align 1, !dbg !82
  %12 = load i8*, i8** %data, align 8, !dbg !83
  call void @printLine(i8* %12), !dbg !84
  ret void, !dbg !85
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_07_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #6, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #6, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_07_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_07_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end3, !dbg !118

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !123
  store i8* %call, i8** %dataBuffer, align 8, !dbg !122
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  %cmp1 = icmp eq i8* %1, null, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !127

if.then2:                                         ; preds = %if.else
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
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx4, align 1, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !147
  %cmp5 = icmp ult i64 %5, 100, !dbg !149
  br i1 %cmp5, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !153
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !153
  %8 = load i8*, i8** %data, align 8, !dbg !154
  %9 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !154
  store i8 %7, i8* %arrayidx7, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %10, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !162
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !162
  store i8 0, i8* %arrayidx8, align 1, !dbg !163
  %12 = load i8*, i8** %data, align 8, !dbg !164
  call void @printLine(i8* %12), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !168, metadata !DIExpression()), !dbg !169
  store i8* null, i8** %data, align 8, !dbg !170
  %0 = load i32, i32* @staticFive, align 4, !dbg !171
  %cmp = icmp eq i32 %0, 5, !dbg !173
  br i1 %cmp, label %if.then, label %if.end3, !dbg !174

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !175, metadata !DIExpression()), !dbg !178
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !179
  store i8* %call, i8** %dataBuffer, align 8, !dbg !178
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !180
  %cmp1 = icmp eq i8* %1, null, !dbg !182
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !183

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !184
  unreachable, !dbg !184

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !187
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !188
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !188
  store i8 0, i8* %arrayidx, align 1, !dbg !189
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !190
  store i8* %4, i8** %data, align 8, !dbg !191
  br label %if.end3, !dbg !192

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !193, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !196, metadata !DIExpression()), !dbg !197
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !198
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !199
  store i8 0, i8* %arrayidx4, align 1, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i64, i64* %i, align 8, !dbg !204
  %cmp5 = icmp ult i64 %5, 100, !dbg !206
  br i1 %cmp5, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !210
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !210
  %8 = load i8*, i8** %data, align 8, !dbg !211
  %9 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !211
  store i8 %7, i8* %arrayidx7, align 1, !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !215
  %inc = add i64 %10, 1, !dbg !215
  store i64 %inc, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !219
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !219
  store i8 0, i8* %arrayidx8, align 1, !dbg !220
  %12 = load i8*, i8** %data, align 8, !dbg !221
  call void @printLine(i8* %12), !dbg !222
  ret void, !dbg !223
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
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !19)
!29 = !DILocalVariable(name: "dataBuffer", scope: !30, file: !11, line: 36, type: !6)
!30 = distinct !DILexicalBlock(scope: !31, file: !11, line: 35, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !11, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 20, scope: !30)
!33 = !DILocation(line: 36, column: 41, scope: !30)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 17)
!36 = !DILocation(line: 37, column: 28, scope: !35)
!37 = !DILocation(line: 37, column: 17, scope: !30)
!38 = !DILocation(line: 37, column: 38, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !11, line: 37, column: 37)
!40 = !DILocation(line: 38, column: 20, scope: !30)
!41 = !DILocation(line: 38, column: 13, scope: !30)
!42 = !DILocation(line: 39, column: 13, scope: !30)
!43 = !DILocation(line: 39, column: 31, scope: !30)
!44 = !DILocation(line: 41, column: 20, scope: !30)
!45 = !DILocation(line: 41, column: 31, scope: !30)
!46 = !DILocation(line: 41, column: 18, scope: !30)
!47 = !DILocation(line: 43, column: 5, scope: !31)
!48 = !DILocalVariable(name: "i", scope: !49, file: !11, line: 45, type: !50)
!49 = distinct !DILexicalBlock(scope: !19, file: !11, line: 44, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 45, column: 16, scope: !49)
!54 = !DILocalVariable(name: "source", scope: !49, file: !11, line: 46, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 46, column: 14, scope: !49)
!59 = !DILocation(line: 47, column: 9, scope: !49)
!60 = !DILocation(line: 48, column: 9, scope: !49)
!61 = !DILocation(line: 48, column: 23, scope: !49)
!62 = !DILocation(line: 50, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !49, file: !11, line: 50, column: 9)
!64 = !DILocation(line: 50, column: 14, scope: !63)
!65 = !DILocation(line: 50, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !11, line: 50, column: 9)
!67 = !DILocation(line: 50, column: 23, scope: !66)
!68 = !DILocation(line: 50, column: 9, scope: !63)
!69 = !DILocation(line: 52, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !11, line: 51, column: 9)
!71 = !DILocation(line: 52, column: 23, scope: !70)
!72 = !DILocation(line: 52, column: 13, scope: !70)
!73 = !DILocation(line: 52, column: 18, scope: !70)
!74 = !DILocation(line: 52, column: 21, scope: !70)
!75 = !DILocation(line: 53, column: 9, scope: !70)
!76 = !DILocation(line: 50, column: 31, scope: !66)
!77 = !DILocation(line: 50, column: 9, scope: !66)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 53, column: 9, scope: !63)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 55, column: 9, scope: !49)
!82 = !DILocation(line: 55, column: 21, scope: !49)
!83 = !DILocation(line: 56, column: 19, scope: !49)
!84 = !DILocation(line: 56, column: 9, scope: !49)
!85 = !DILocation(line: 60, column: 1, scope: !19)
!86 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_07_good", scope: !11, file: !11, line: 139, type: !20, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocation(line: 141, column: 5, scope: !86)
!88 = !DILocation(line: 142, column: 5, scope: !86)
!89 = !DILocation(line: 143, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 155, type: !91, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!12, !12, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !11, line: 155, type: !12)
!95 = !DILocation(line: 155, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !11, line: 155, type: !93)
!97 = !DILocation(line: 155, column: 27, scope: !90)
!98 = !DILocation(line: 158, column: 22, scope: !90)
!99 = !DILocation(line: 158, column: 12, scope: !90)
!100 = !DILocation(line: 158, column: 5, scope: !90)
!101 = !DILocation(line: 160, column: 5, scope: !90)
!102 = !DILocation(line: 161, column: 5, scope: !90)
!103 = !DILocation(line: 162, column: 5, scope: !90)
!104 = !DILocation(line: 165, column: 5, scope: !90)
!105 = !DILocation(line: 166, column: 5, scope: !90)
!106 = !DILocation(line: 167, column: 5, scope: !90)
!107 = !DILocation(line: 169, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !11, line: 69, type: !6)
!110 = !DILocation(line: 69, column: 12, scope: !108)
!111 = !DILocation(line: 70, column: 10, scope: !108)
!112 = !DILocation(line: 71, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !11, line: 71, column: 8)
!114 = !DILocation(line: 71, column: 18, scope: !113)
!115 = !DILocation(line: 71, column: 8, scope: !108)
!116 = !DILocation(line: 74, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !11, line: 72, column: 5)
!118 = !DILocation(line: 75, column: 5, scope: !117)
!119 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !11, line: 79, type: !6)
!120 = distinct !DILexicalBlock(scope: !121, file: !11, line: 78, column: 9)
!121 = distinct !DILexicalBlock(scope: !113, file: !11, line: 77, column: 5)
!122 = !DILocation(line: 79, column: 20, scope: !120)
!123 = !DILocation(line: 79, column: 41, scope: !120)
!124 = !DILocation(line: 80, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !11, line: 80, column: 17)
!126 = !DILocation(line: 80, column: 28, scope: !125)
!127 = !DILocation(line: 80, column: 17, scope: !120)
!128 = !DILocation(line: 80, column: 38, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !11, line: 80, column: 37)
!130 = !DILocation(line: 81, column: 20, scope: !120)
!131 = !DILocation(line: 81, column: 13, scope: !120)
!132 = !DILocation(line: 82, column: 13, scope: !120)
!133 = !DILocation(line: 82, column: 31, scope: !120)
!134 = !DILocation(line: 84, column: 20, scope: !120)
!135 = !DILocation(line: 84, column: 18, scope: !120)
!136 = !DILocalVariable(name: "i", scope: !137, file: !11, line: 88, type: !50)
!137 = distinct !DILexicalBlock(scope: !108, file: !11, line: 87, column: 5)
!138 = !DILocation(line: 88, column: 16, scope: !137)
!139 = !DILocalVariable(name: "source", scope: !137, file: !11, line: 89, type: !55)
!140 = !DILocation(line: 89, column: 14, scope: !137)
!141 = !DILocation(line: 90, column: 9, scope: !137)
!142 = !DILocation(line: 91, column: 9, scope: !137)
!143 = !DILocation(line: 91, column: 23, scope: !137)
!144 = !DILocation(line: 93, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !11, line: 93, column: 9)
!146 = !DILocation(line: 93, column: 14, scope: !145)
!147 = !DILocation(line: 93, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !11, line: 93, column: 9)
!149 = !DILocation(line: 93, column: 23, scope: !148)
!150 = !DILocation(line: 93, column: 9, scope: !145)
!151 = !DILocation(line: 95, column: 30, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !11, line: 94, column: 9)
!153 = !DILocation(line: 95, column: 23, scope: !152)
!154 = !DILocation(line: 95, column: 13, scope: !152)
!155 = !DILocation(line: 95, column: 18, scope: !152)
!156 = !DILocation(line: 95, column: 21, scope: !152)
!157 = !DILocation(line: 96, column: 9, scope: !152)
!158 = !DILocation(line: 93, column: 31, scope: !148)
!159 = !DILocation(line: 93, column: 9, scope: !148)
!160 = distinct !{!160, !150, !161, !80}
!161 = !DILocation(line: 96, column: 9, scope: !145)
!162 = !DILocation(line: 98, column: 9, scope: !137)
!163 = !DILocation(line: 98, column: 21, scope: !137)
!164 = !DILocation(line: 99, column: 19, scope: !137)
!165 = !DILocation(line: 99, column: 9, scope: !137)
!166 = !DILocation(line: 103, column: 1, scope: !108)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 106, type: !20, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DILocalVariable(name: "data", scope: !167, file: !11, line: 108, type: !6)
!169 = !DILocation(line: 108, column: 12, scope: !167)
!170 = !DILocation(line: 109, column: 10, scope: !167)
!171 = !DILocation(line: 110, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !11, line: 110, column: 8)
!173 = !DILocation(line: 110, column: 18, scope: !172)
!174 = !DILocation(line: 110, column: 8, scope: !167)
!175 = !DILocalVariable(name: "dataBuffer", scope: !176, file: !11, line: 113, type: !6)
!176 = distinct !DILexicalBlock(scope: !177, file: !11, line: 112, column: 9)
!177 = distinct !DILexicalBlock(scope: !172, file: !11, line: 111, column: 5)
!178 = !DILocation(line: 113, column: 20, scope: !176)
!179 = !DILocation(line: 113, column: 41, scope: !176)
!180 = !DILocation(line: 114, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !11, line: 114, column: 17)
!182 = !DILocation(line: 114, column: 28, scope: !181)
!183 = !DILocation(line: 114, column: 17, scope: !176)
!184 = !DILocation(line: 114, column: 38, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !11, line: 114, column: 37)
!186 = !DILocation(line: 115, column: 20, scope: !176)
!187 = !DILocation(line: 115, column: 13, scope: !176)
!188 = !DILocation(line: 116, column: 13, scope: !176)
!189 = !DILocation(line: 116, column: 31, scope: !176)
!190 = !DILocation(line: 118, column: 20, scope: !176)
!191 = !DILocation(line: 118, column: 18, scope: !176)
!192 = !DILocation(line: 120, column: 5, scope: !177)
!193 = !DILocalVariable(name: "i", scope: !194, file: !11, line: 122, type: !50)
!194 = distinct !DILexicalBlock(scope: !167, file: !11, line: 121, column: 5)
!195 = !DILocation(line: 122, column: 16, scope: !194)
!196 = !DILocalVariable(name: "source", scope: !194, file: !11, line: 123, type: !55)
!197 = !DILocation(line: 123, column: 14, scope: !194)
!198 = !DILocation(line: 124, column: 9, scope: !194)
!199 = !DILocation(line: 125, column: 9, scope: !194)
!200 = !DILocation(line: 125, column: 23, scope: !194)
!201 = !DILocation(line: 127, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !194, file: !11, line: 127, column: 9)
!203 = !DILocation(line: 127, column: 14, scope: !202)
!204 = !DILocation(line: 127, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !11, line: 127, column: 9)
!206 = !DILocation(line: 127, column: 23, scope: !205)
!207 = !DILocation(line: 127, column: 9, scope: !202)
!208 = !DILocation(line: 129, column: 30, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !11, line: 128, column: 9)
!210 = !DILocation(line: 129, column: 23, scope: !209)
!211 = !DILocation(line: 129, column: 13, scope: !209)
!212 = !DILocation(line: 129, column: 18, scope: !209)
!213 = !DILocation(line: 129, column: 21, scope: !209)
!214 = !DILocation(line: 130, column: 9, scope: !209)
!215 = !DILocation(line: 127, column: 31, scope: !205)
!216 = !DILocation(line: 127, column: 9, scope: !205)
!217 = distinct !{!217, !207, !218, !80}
!218 = !DILocation(line: 130, column: 9, scope: !202)
!219 = !DILocation(line: 132, column: 9, scope: !194)
!220 = !DILocation(line: 132, column: 21, scope: !194)
!221 = !DILocation(line: 133, column: 19, scope: !194)
!222 = !DILocation(line: 133, column: 9, scope: !194)
!223 = !DILocation(line: 137, column: 1, scope: !167)
