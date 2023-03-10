; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_08_good() #0 !dbg !81 {
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
  call void @CWE127_Buffer_Underread__malloc_char_loop_08_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE127_Buffer_Underread__malloc_char_loop_08_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !104 {
entry:
  ret i32 1, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  %call = call i32 @staticReturnsFalse(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end3, !dbg !117

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !121
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !122
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !121
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !123
  %cmp = icmp eq i8* %0, null, !dbg !125
  br i1 %cmp, label %if.then2, label %if.end, !dbg !126

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !130
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !133
  store i8* %3, i8** %data, align 8, !dbg !134
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !146
  %cmp5 = icmp ult i64 %4, 100, !dbg !148
  br i1 %cmp5, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !150
  %6 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !150
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !150
  %8 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !154
  store i8 %7, i8* %arrayidx7, align 1, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %9, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx8, align 1, !dbg !162
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !163
  call void @printLine(i8* %arraydecay9), !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !166 {
entry:
  ret i32 0, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !168 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i8* null, i8** %data, align 8, !dbg !171
  %call = call i32 @staticReturnsTrue(), !dbg !172
  %tobool = icmp ne i32 %call, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end3, !dbg !174

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !175, metadata !DIExpression()), !dbg !178
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !179
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !178
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !180
  %cmp = icmp eq i8* %0, null, !dbg !182
  br i1 %cmp, label %if.then2, label %if.end, !dbg !183

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !184
  unreachable, !dbg !184

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !187
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !188
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !188
  store i8 0, i8* %arrayidx, align 1, !dbg !189
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !190
  store i8* %3, i8** %data, align 8, !dbg !191
  br label %if.end3, !dbg !192

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !193, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !196, metadata !DIExpression()), !dbg !197
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !198
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !199
  store i8 0, i8* %arrayidx4, align 1, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !204
  %cmp5 = icmp ult i64 %4, 100, !dbg !206
  br i1 %cmp5, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !208
  %6 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !208
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !208
  %8 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !212
  store i8 %7, i8* %arrayidx7, align 1, !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !215
  %inc = add i64 %9, 1, !dbg !215
  store i64 %inc, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !219
  store i8 0, i8* %arrayidx8, align 1, !dbg !220
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !221
  call void @printLine(i8* %arraydecay9), !dbg !222
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 44, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 43, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!27 = !DILocation(line: 44, column: 20, scope: !25)
!28 = !DILocation(line: 44, column: 41, scope: !25)
!29 = !DILocation(line: 45, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 17)
!31 = !DILocation(line: 45, column: 28, scope: !30)
!32 = !DILocation(line: 45, column: 17, scope: !25)
!33 = !DILocation(line: 45, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 45, column: 37)
!35 = !DILocation(line: 46, column: 20, scope: !25)
!36 = !DILocation(line: 46, column: 13, scope: !25)
!37 = !DILocation(line: 47, column: 13, scope: !25)
!38 = !DILocation(line: 47, column: 31, scope: !25)
!39 = !DILocation(line: 49, column: 20, scope: !25)
!40 = !DILocation(line: 49, column: 31, scope: !25)
!41 = !DILocation(line: 49, column: 18, scope: !25)
!42 = !DILocation(line: 51, column: 5, scope: !26)
!43 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 53, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 52, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 53, column: 16, scope: !44)
!49 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 54, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 54, column: 14, scope: !44)
!54 = !DILocation(line: 55, column: 9, scope: !44)
!55 = !DILocation(line: 56, column: 9, scope: !44)
!56 = !DILocation(line: 56, column: 21, scope: !44)
!57 = !DILocation(line: 58, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !15, line: 58, column: 9)
!59 = !DILocation(line: 58, column: 14, scope: !58)
!60 = !DILocation(line: 58, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 58, column: 9)
!62 = !DILocation(line: 58, column: 23, scope: !61)
!63 = !DILocation(line: 58, column: 9, scope: !58)
!64 = !DILocation(line: 60, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 59, column: 9)
!66 = !DILocation(line: 60, column: 28, scope: !65)
!67 = !DILocation(line: 60, column: 18, scope: !65)
!68 = !DILocation(line: 60, column: 13, scope: !65)
!69 = !DILocation(line: 60, column: 21, scope: !65)
!70 = !DILocation(line: 61, column: 9, scope: !65)
!71 = !DILocation(line: 58, column: 31, scope: !61)
!72 = !DILocation(line: 58, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 61, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 63, column: 9, scope: !44)
!77 = !DILocation(line: 63, column: 21, scope: !44)
!78 = !DILocation(line: 64, column: 19, scope: !44)
!79 = !DILocation(line: 64, column: 9, scope: !44)
!80 = !DILocation(line: 68, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_08_good", scope: !15, file: !15, line: 147, type: !16, scopeLine: 148, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 149, column: 5, scope: !81)
!83 = !DILocation(line: 150, column: 5, scope: !81)
!84 = !DILocation(line: 151, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 163, type: !86, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 163, type: !88)
!91 = !DILocation(line: 163, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 163, type: !89)
!93 = !DILocation(line: 163, column: 27, scope: !85)
!94 = !DILocation(line: 166, column: 22, scope: !85)
!95 = !DILocation(line: 166, column: 12, scope: !85)
!96 = !DILocation(line: 166, column: 5, scope: !85)
!97 = !DILocation(line: 168, column: 5, scope: !85)
!98 = !DILocation(line: 169, column: 5, scope: !85)
!99 = !DILocation(line: 170, column: 5, scope: !85)
!100 = !DILocation(line: 173, column: 5, scope: !85)
!101 = !DILocation(line: 174, column: 5, scope: !85)
!102 = !DILocation(line: 175, column: 5, scope: !85)
!103 = !DILocation(line: 177, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !105, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!88}
!107 = !DILocation(line: 27, column: 5, scope: !104)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 75, type: !16, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 77, type: !4)
!110 = !DILocation(line: 77, column: 12, scope: !108)
!111 = !DILocation(line: 78, column: 10, scope: !108)
!112 = !DILocation(line: 79, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 79, column: 8)
!114 = !DILocation(line: 79, column: 8, scope: !108)
!115 = !DILocation(line: 82, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !15, line: 80, column: 5)
!117 = !DILocation(line: 83, column: 5, scope: !116)
!118 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !15, line: 87, type: !4)
!119 = distinct !DILexicalBlock(scope: !120, file: !15, line: 86, column: 9)
!120 = distinct !DILexicalBlock(scope: !113, file: !15, line: 85, column: 5)
!121 = !DILocation(line: 87, column: 20, scope: !119)
!122 = !DILocation(line: 87, column: 41, scope: !119)
!123 = !DILocation(line: 88, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 88, column: 17)
!125 = !DILocation(line: 88, column: 28, scope: !124)
!126 = !DILocation(line: 88, column: 17, scope: !119)
!127 = !DILocation(line: 88, column: 38, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 88, column: 37)
!129 = !DILocation(line: 89, column: 20, scope: !119)
!130 = !DILocation(line: 89, column: 13, scope: !119)
!131 = !DILocation(line: 90, column: 13, scope: !119)
!132 = !DILocation(line: 90, column: 31, scope: !119)
!133 = !DILocation(line: 92, column: 20, scope: !119)
!134 = !DILocation(line: 92, column: 18, scope: !119)
!135 = !DILocalVariable(name: "i", scope: !136, file: !15, line: 96, type: !45)
!136 = distinct !DILexicalBlock(scope: !108, file: !15, line: 95, column: 5)
!137 = !DILocation(line: 96, column: 16, scope: !136)
!138 = !DILocalVariable(name: "dest", scope: !136, file: !15, line: 97, type: !50)
!139 = !DILocation(line: 97, column: 14, scope: !136)
!140 = !DILocation(line: 98, column: 9, scope: !136)
!141 = !DILocation(line: 99, column: 9, scope: !136)
!142 = !DILocation(line: 99, column: 21, scope: !136)
!143 = !DILocation(line: 101, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !136, file: !15, line: 101, column: 9)
!145 = !DILocation(line: 101, column: 14, scope: !144)
!146 = !DILocation(line: 101, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 101, column: 9)
!148 = !DILocation(line: 101, column: 23, scope: !147)
!149 = !DILocation(line: 101, column: 9, scope: !144)
!150 = !DILocation(line: 103, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 102, column: 9)
!152 = !DILocation(line: 103, column: 28, scope: !151)
!153 = !DILocation(line: 103, column: 18, scope: !151)
!154 = !DILocation(line: 103, column: 13, scope: !151)
!155 = !DILocation(line: 103, column: 21, scope: !151)
!156 = !DILocation(line: 104, column: 9, scope: !151)
!157 = !DILocation(line: 101, column: 31, scope: !147)
!158 = !DILocation(line: 101, column: 9, scope: !147)
!159 = distinct !{!159, !149, !160, !75}
!160 = !DILocation(line: 104, column: 9, scope: !144)
!161 = !DILocation(line: 106, column: 9, scope: !136)
!162 = !DILocation(line: 106, column: 21, scope: !136)
!163 = !DILocation(line: 107, column: 19, scope: !136)
!164 = !DILocation(line: 107, column: 9, scope: !136)
!165 = !DILocation(line: 111, column: 1, scope: !108)
!166 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !105, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!167 = !DILocation(line: 32, column: 5, scope: !166)
!168 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!169 = !DILocalVariable(name: "data", scope: !168, file: !15, line: 116, type: !4)
!170 = !DILocation(line: 116, column: 12, scope: !168)
!171 = !DILocation(line: 117, column: 10, scope: !168)
!172 = !DILocation(line: 118, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !15, line: 118, column: 8)
!174 = !DILocation(line: 118, column: 8, scope: !168)
!175 = !DILocalVariable(name: "dataBuffer", scope: !176, file: !15, line: 121, type: !4)
!176 = distinct !DILexicalBlock(scope: !177, file: !15, line: 120, column: 9)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 119, column: 5)
!178 = !DILocation(line: 121, column: 20, scope: !176)
!179 = !DILocation(line: 121, column: 41, scope: !176)
!180 = !DILocation(line: 122, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !15, line: 122, column: 17)
!182 = !DILocation(line: 122, column: 28, scope: !181)
!183 = !DILocation(line: 122, column: 17, scope: !176)
!184 = !DILocation(line: 122, column: 38, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !15, line: 122, column: 37)
!186 = !DILocation(line: 123, column: 20, scope: !176)
!187 = !DILocation(line: 123, column: 13, scope: !176)
!188 = !DILocation(line: 124, column: 13, scope: !176)
!189 = !DILocation(line: 124, column: 31, scope: !176)
!190 = !DILocation(line: 126, column: 20, scope: !176)
!191 = !DILocation(line: 126, column: 18, scope: !176)
!192 = !DILocation(line: 128, column: 5, scope: !177)
!193 = !DILocalVariable(name: "i", scope: !194, file: !15, line: 130, type: !45)
!194 = distinct !DILexicalBlock(scope: !168, file: !15, line: 129, column: 5)
!195 = !DILocation(line: 130, column: 16, scope: !194)
!196 = !DILocalVariable(name: "dest", scope: !194, file: !15, line: 131, type: !50)
!197 = !DILocation(line: 131, column: 14, scope: !194)
!198 = !DILocation(line: 132, column: 9, scope: !194)
!199 = !DILocation(line: 133, column: 9, scope: !194)
!200 = !DILocation(line: 133, column: 21, scope: !194)
!201 = !DILocation(line: 135, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !194, file: !15, line: 135, column: 9)
!203 = !DILocation(line: 135, column: 14, scope: !202)
!204 = !DILocation(line: 135, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !15, line: 135, column: 9)
!206 = !DILocation(line: 135, column: 23, scope: !205)
!207 = !DILocation(line: 135, column: 9, scope: !202)
!208 = !DILocation(line: 137, column: 23, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !15, line: 136, column: 9)
!210 = !DILocation(line: 137, column: 28, scope: !209)
!211 = !DILocation(line: 137, column: 18, scope: !209)
!212 = !DILocation(line: 137, column: 13, scope: !209)
!213 = !DILocation(line: 137, column: 21, scope: !209)
!214 = !DILocation(line: 138, column: 9, scope: !209)
!215 = !DILocation(line: 135, column: 31, scope: !205)
!216 = !DILocation(line: 135, column: 9, scope: !205)
!217 = distinct !{!217, !207, !218, !75}
!218 = !DILocation(line: 138, column: 9, scope: !202)
!219 = !DILocation(line: 140, column: 9, scope: !194)
!220 = !DILocation(line: 140, column: 21, scope: !194)
!221 = !DILocation(line: 141, column: 19, scope: !194)
!222 = !DILocation(line: 141, column: 9, scope: !194)
!223 = !DILocation(line: 145, column: 1, scope: !168)
