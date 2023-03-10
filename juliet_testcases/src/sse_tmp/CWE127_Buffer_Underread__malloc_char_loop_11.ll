; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !28
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx4, align 1, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !60
  %cmp5 = icmp ult i64 %4, 100, !dbg !62
  br i1 %cmp5, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !64
  %6 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !64
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !68
  store i8 %7, i8* %arrayidx7, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %9, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx8, align 1, !dbg !77
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* %arraydecay9), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_11_good() #0 !dbg !81 {
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
  %call = call i64 @time(i64* null) #6, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #6, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE127_Buffer_Underread__malloc_char_loop_11_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE127_Buffer_Underread__malloc_char_loop_11_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  %call = call i32 (...) @globalReturnsFalse(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end3, !dbg !113

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !117
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !118
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !117
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  %cmp = icmp eq i8* %0, null, !dbg !121
  br i1 %cmp, label %if.then2, label %if.end, !dbg !122

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !126
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !129
  store i8* %3, i8** %data, align 8, !dbg !130
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx4, align 1, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !142
  %cmp5 = icmp ult i64 %4, 100, !dbg !144
  br i1 %cmp5, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !146
  %6 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !146
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !146
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !150
  store i8 %7, i8* %arrayidx7, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %9, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx8, align 1, !dbg !158
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  call void @printLine(i8* %arraydecay9), !dbg !160
  ret void, !dbg !161
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !163, metadata !DIExpression()), !dbg !164
  store i8* null, i8** %data, align 8, !dbg !165
  %call = call i32 (...) @globalReturnsTrue(), !dbg !166
  %tobool = icmp ne i32 %call, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.end3, !dbg !168

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !169, metadata !DIExpression()), !dbg !172
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !173
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !172
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !174
  %cmp = icmp eq i8* %0, null, !dbg !176
  br i1 %cmp, label %if.then2, label %if.end, !dbg !177

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !178
  unreachable, !dbg !178

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !181
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !182
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !182
  store i8 0, i8* %arrayidx, align 1, !dbg !183
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !184
  store i8* %3, i8** %data, align 8, !dbg !185
  br label %if.end3, !dbg !186

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !187, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !190, metadata !DIExpression()), !dbg !191
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !192
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !192
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !193
  store i8 0, i8* %arrayidx4, align 1, !dbg !194
  store i64 0, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !198
  %cmp5 = icmp ult i64 %4, 100, !dbg !200
  br i1 %cmp5, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !202
  %6 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !202
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !202
  %8 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !206
  store i8 %7, i8* %arrayidx7, align 1, !dbg !207
  br label %for.inc, !dbg !208

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !209
  %inc = add i64 %9, 1, !dbg !209
  store i64 %inc, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !210, !llvm.loop !211

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !213
  store i8 0, i8* %arrayidx8, align 1, !dbg !214
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !215
  call void @printLine(i8* %arraydecay9), !dbg !216
  ret void, !dbg !217
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_11_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 17)
!31 = !DILocation(line: 31, column: 28, scope: !30)
!32 = !DILocation(line: 31, column: 17, scope: !25)
!33 = !DILocation(line: 31, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 37)
!35 = !DILocation(line: 32, column: 20, scope: !25)
!36 = !DILocation(line: 32, column: 13, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 31, scope: !25)
!39 = !DILocation(line: 35, column: 20, scope: !25)
!40 = !DILocation(line: 35, column: 31, scope: !25)
!41 = !DILocation(line: 35, column: 18, scope: !25)
!42 = !DILocation(line: 37, column: 5, scope: !26)
!43 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 39, column: 16, scope: !44)
!49 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 40, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 40, column: 14, scope: !44)
!54 = !DILocation(line: 41, column: 9, scope: !44)
!55 = !DILocation(line: 42, column: 9, scope: !44)
!56 = !DILocation(line: 42, column: 21, scope: !44)
!57 = !DILocation(line: 44, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !15, line: 44, column: 9)
!59 = !DILocation(line: 44, column: 14, scope: !58)
!60 = !DILocation(line: 44, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 44, column: 9)
!62 = !DILocation(line: 44, column: 23, scope: !61)
!63 = !DILocation(line: 44, column: 9, scope: !58)
!64 = !DILocation(line: 46, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 45, column: 9)
!66 = !DILocation(line: 46, column: 28, scope: !65)
!67 = !DILocation(line: 46, column: 18, scope: !65)
!68 = !DILocation(line: 46, column: 13, scope: !65)
!69 = !DILocation(line: 46, column: 21, scope: !65)
!70 = !DILocation(line: 47, column: 9, scope: !65)
!71 = !DILocation(line: 44, column: 31, scope: !61)
!72 = !DILocation(line: 44, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 47, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 49, column: 9, scope: !44)
!77 = !DILocation(line: 49, column: 21, scope: !44)
!78 = !DILocation(line: 50, column: 19, scope: !44)
!79 = !DILocation(line: 50, column: 9, scope: !44)
!80 = !DILocation(line: 54, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_11_good", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 135, column: 5, scope: !81)
!83 = !DILocation(line: 136, column: 5, scope: !81)
!84 = !DILocation(line: 137, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 149, type: !86, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 149, type: !88)
!91 = !DILocation(line: 149, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 149, type: !89)
!93 = !DILocation(line: 149, column: 27, scope: !85)
!94 = !DILocation(line: 152, column: 22, scope: !85)
!95 = !DILocation(line: 152, column: 12, scope: !85)
!96 = !DILocation(line: 152, column: 5, scope: !85)
!97 = !DILocation(line: 154, column: 5, scope: !85)
!98 = !DILocation(line: 155, column: 5, scope: !85)
!99 = !DILocation(line: 156, column: 5, scope: !85)
!100 = !DILocation(line: 159, column: 5, scope: !85)
!101 = !DILocation(line: 160, column: 5, scope: !85)
!102 = !DILocation(line: 161, column: 5, scope: !85)
!103 = !DILocation(line: 163, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 63, type: !4)
!106 = !DILocation(line: 63, column: 12, scope: !104)
!107 = !DILocation(line: 64, column: 10, scope: !104)
!108 = !DILocation(line: 65, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !15, line: 65, column: 8)
!110 = !DILocation(line: 65, column: 8, scope: !104)
!111 = !DILocation(line: 68, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !15, line: 66, column: 5)
!113 = !DILocation(line: 69, column: 5, scope: !112)
!114 = !DILocalVariable(name: "dataBuffer", scope: !115, file: !15, line: 73, type: !4)
!115 = distinct !DILexicalBlock(scope: !116, file: !15, line: 72, column: 9)
!116 = distinct !DILexicalBlock(scope: !109, file: !15, line: 71, column: 5)
!117 = !DILocation(line: 73, column: 20, scope: !115)
!118 = !DILocation(line: 73, column: 41, scope: !115)
!119 = !DILocation(line: 74, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !15, line: 74, column: 17)
!121 = !DILocation(line: 74, column: 28, scope: !120)
!122 = !DILocation(line: 74, column: 17, scope: !115)
!123 = !DILocation(line: 74, column: 38, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 74, column: 37)
!125 = !DILocation(line: 75, column: 20, scope: !115)
!126 = !DILocation(line: 75, column: 13, scope: !115)
!127 = !DILocation(line: 76, column: 13, scope: !115)
!128 = !DILocation(line: 76, column: 31, scope: !115)
!129 = !DILocation(line: 78, column: 20, scope: !115)
!130 = !DILocation(line: 78, column: 18, scope: !115)
!131 = !DILocalVariable(name: "i", scope: !132, file: !15, line: 82, type: !45)
!132 = distinct !DILexicalBlock(scope: !104, file: !15, line: 81, column: 5)
!133 = !DILocation(line: 82, column: 16, scope: !132)
!134 = !DILocalVariable(name: "dest", scope: !132, file: !15, line: 83, type: !50)
!135 = !DILocation(line: 83, column: 14, scope: !132)
!136 = !DILocation(line: 84, column: 9, scope: !132)
!137 = !DILocation(line: 85, column: 9, scope: !132)
!138 = !DILocation(line: 85, column: 21, scope: !132)
!139 = !DILocation(line: 87, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !15, line: 87, column: 9)
!141 = !DILocation(line: 87, column: 14, scope: !140)
!142 = !DILocation(line: 87, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !15, line: 87, column: 9)
!144 = !DILocation(line: 87, column: 23, scope: !143)
!145 = !DILocation(line: 87, column: 9, scope: !140)
!146 = !DILocation(line: 89, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 88, column: 9)
!148 = !DILocation(line: 89, column: 28, scope: !147)
!149 = !DILocation(line: 89, column: 18, scope: !147)
!150 = !DILocation(line: 89, column: 13, scope: !147)
!151 = !DILocation(line: 89, column: 21, scope: !147)
!152 = !DILocation(line: 90, column: 9, scope: !147)
!153 = !DILocation(line: 87, column: 31, scope: !143)
!154 = !DILocation(line: 87, column: 9, scope: !143)
!155 = distinct !{!155, !145, !156, !75}
!156 = !DILocation(line: 90, column: 9, scope: !140)
!157 = !DILocation(line: 92, column: 9, scope: !132)
!158 = !DILocation(line: 92, column: 21, scope: !132)
!159 = !DILocation(line: 93, column: 19, scope: !132)
!160 = !DILocation(line: 93, column: 9, scope: !132)
!161 = !DILocation(line: 97, column: 1, scope: !104)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!163 = !DILocalVariable(name: "data", scope: !162, file: !15, line: 102, type: !4)
!164 = !DILocation(line: 102, column: 12, scope: !162)
!165 = !DILocation(line: 103, column: 10, scope: !162)
!166 = !DILocation(line: 104, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !15, line: 104, column: 8)
!168 = !DILocation(line: 104, column: 8, scope: !162)
!169 = !DILocalVariable(name: "dataBuffer", scope: !170, file: !15, line: 107, type: !4)
!170 = distinct !DILexicalBlock(scope: !171, file: !15, line: 106, column: 9)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 105, column: 5)
!172 = !DILocation(line: 107, column: 20, scope: !170)
!173 = !DILocation(line: 107, column: 41, scope: !170)
!174 = !DILocation(line: 108, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !15, line: 108, column: 17)
!176 = !DILocation(line: 108, column: 28, scope: !175)
!177 = !DILocation(line: 108, column: 17, scope: !170)
!178 = !DILocation(line: 108, column: 38, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 108, column: 37)
!180 = !DILocation(line: 109, column: 20, scope: !170)
!181 = !DILocation(line: 109, column: 13, scope: !170)
!182 = !DILocation(line: 110, column: 13, scope: !170)
!183 = !DILocation(line: 110, column: 31, scope: !170)
!184 = !DILocation(line: 112, column: 20, scope: !170)
!185 = !DILocation(line: 112, column: 18, scope: !170)
!186 = !DILocation(line: 114, column: 5, scope: !171)
!187 = !DILocalVariable(name: "i", scope: !188, file: !15, line: 116, type: !45)
!188 = distinct !DILexicalBlock(scope: !162, file: !15, line: 115, column: 5)
!189 = !DILocation(line: 116, column: 16, scope: !188)
!190 = !DILocalVariable(name: "dest", scope: !188, file: !15, line: 117, type: !50)
!191 = !DILocation(line: 117, column: 14, scope: !188)
!192 = !DILocation(line: 118, column: 9, scope: !188)
!193 = !DILocation(line: 119, column: 9, scope: !188)
!194 = !DILocation(line: 119, column: 21, scope: !188)
!195 = !DILocation(line: 121, column: 16, scope: !196)
!196 = distinct !DILexicalBlock(scope: !188, file: !15, line: 121, column: 9)
!197 = !DILocation(line: 121, column: 14, scope: !196)
!198 = !DILocation(line: 121, column: 21, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !15, line: 121, column: 9)
!200 = !DILocation(line: 121, column: 23, scope: !199)
!201 = !DILocation(line: 121, column: 9, scope: !196)
!202 = !DILocation(line: 123, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !15, line: 122, column: 9)
!204 = !DILocation(line: 123, column: 28, scope: !203)
!205 = !DILocation(line: 123, column: 18, scope: !203)
!206 = !DILocation(line: 123, column: 13, scope: !203)
!207 = !DILocation(line: 123, column: 21, scope: !203)
!208 = !DILocation(line: 124, column: 9, scope: !203)
!209 = !DILocation(line: 121, column: 31, scope: !199)
!210 = !DILocation(line: 121, column: 9, scope: !199)
!211 = distinct !{!211, !201, !212, !75}
!212 = !DILocation(line: 124, column: 9, scope: !196)
!213 = !DILocation(line: 126, column: 9, scope: !188)
!214 = !DILocation(line: 126, column: 21, scope: !188)
!215 = !DILocation(line: 127, column: 19, scope: !188)
!216 = !DILocation(line: 127, column: 9, scope: !188)
!217 = !DILocation(line: 131, column: 1, scope: !162)
