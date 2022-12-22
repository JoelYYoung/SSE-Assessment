; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !50
  store i64 %call3, i64* %destLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !55
  %4 = load i64, i64* %destLen, align 8, !dbg !57
  %cmp4 = icmp ult i64 %3, %4, !dbg !58
  br i1 %cmp4, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !60
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !60
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !64
  store i8 %7, i8* %arrayidx6, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %9, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx7, align 1, !dbg !73
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !74
  call void @printLine(i8* %arraydecay8), !dbg !75
  %10 = load i8*, i8** %data, align 8, !dbg !76
  call void @free(i8* %10) #7, !dbg !77
  ret void, !dbg !78
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_15_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE126_Buffer_Overread__malloc_char_loop_15_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__malloc_char_loop_15_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i8* null, i8** %data, align 8, !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx1, align 1, !dbg !127
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !129
  store i64 %call3, i64* %destLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !134
  %4 = load i64, i64* %destLen, align 8, !dbg !136
  %cmp4 = icmp ult i64 %3, %4, !dbg !137
  br i1 %cmp4, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !139
  %6 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !139
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !139
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !143
  store i8 %7, i8* %arrayidx6, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %9, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !150
  store i8 0, i8* %arrayidx7, align 1, !dbg !151
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  call void @printLine(i8* %arraydecay8), !dbg !153
  %10 = load i8*, i8** %data, align 8, !dbg !154
  call void @free(i8* %10) #7, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !158, metadata !DIExpression()), !dbg !159
  store i8* null, i8** %data, align 8, !dbg !160
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !161
  store i8* %call, i8** %data, align 8, !dbg !162
  %0 = load i8*, i8** %data, align 8, !dbg !163
  %cmp = icmp eq i8* %0, null, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !170
  %2 = load i8*, i8** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !180
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx1, align 1, !dbg !182
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !183
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !184
  store i64 %call3, i64* %destLen, align 8, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !189
  %4 = load i64, i64* %destLen, align 8, !dbg !191
  %cmp4 = icmp ult i64 %3, %4, !dbg !192
  br i1 %cmp4, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !194
  %6 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !194
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !194
  %8 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !198
  store i8 %7, i8* %arrayidx6, align 1, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !201
  %inc = add i64 %9, 1, !dbg !201
  store i64 %inc, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !205
  store i8 0, i8* %arrayidx7, align 1, !dbg !206
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !207
  call void @printLine(i8* %arraydecay8), !dbg !208
  %10 = load i8*, i8** %data, align 8, !dbg !209
  call void @free(i8* %10) #7, !dbg !210
  ret void, !dbg !211
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_15.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 24, scope: !14)
!22 = !DILocation(line: 31, column: 14, scope: !14)
!23 = !DILocation(line: 32, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 13, scope: !14)
!27 = !DILocation(line: 32, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 27)
!29 = !DILocation(line: 33, column: 16, scope: !14)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 34, column: 9, scope: !14)
!32 = !DILocation(line: 34, column: 20, scope: !14)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 42, column: 16, scope: !34)
!39 = !DILocalVariable(name: "destLen", scope: !34, file: !15, line: 42, type: !35)
!40 = !DILocation(line: 42, column: 19, scope: !34)
!41 = !DILocalVariable(name: "dest", scope: !34, file: !15, line: 43, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 43, column: 14, scope: !34)
!46 = !DILocation(line: 44, column: 9, scope: !34)
!47 = !DILocation(line: 45, column: 9, scope: !34)
!48 = !DILocation(line: 45, column: 21, scope: !34)
!49 = !DILocation(line: 46, column: 26, scope: !34)
!50 = !DILocation(line: 46, column: 19, scope: !34)
!51 = !DILocation(line: 46, column: 17, scope: !34)
!52 = !DILocation(line: 49, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !34, file: !15, line: 49, column: 9)
!54 = !DILocation(line: 49, column: 14, scope: !53)
!55 = !DILocation(line: 49, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !15, line: 49, column: 9)
!57 = !DILocation(line: 49, column: 25, scope: !56)
!58 = !DILocation(line: 49, column: 23, scope: !56)
!59 = !DILocation(line: 49, column: 9, scope: !53)
!60 = !DILocation(line: 51, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !15, line: 50, column: 9)
!62 = !DILocation(line: 51, column: 28, scope: !61)
!63 = !DILocation(line: 51, column: 18, scope: !61)
!64 = !DILocation(line: 51, column: 13, scope: !61)
!65 = !DILocation(line: 51, column: 21, scope: !61)
!66 = !DILocation(line: 52, column: 9, scope: !61)
!67 = !DILocation(line: 49, column: 35, scope: !56)
!68 = !DILocation(line: 49, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 52, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 53, column: 9, scope: !34)
!73 = !DILocation(line: 53, column: 21, scope: !34)
!74 = !DILocation(line: 54, column: 19, scope: !34)
!75 = !DILocation(line: 54, column: 9, scope: !34)
!76 = !DILocation(line: 55, column: 14, scope: !34)
!77 = !DILocation(line: 55, column: 9, scope: !34)
!78 = !DILocation(line: 57, column: 1, scope: !14)
!79 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_15_good", scope: !15, file: !15, line: 137, type: !16, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 139, column: 5, scope: !79)
!81 = !DILocation(line: 140, column: 5, scope: !79)
!82 = !DILocation(line: 141, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 153, type: !84, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !15, line: 153, type: !86)
!89 = !DILocation(line: 153, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !15, line: 153, type: !87)
!91 = !DILocation(line: 153, column: 27, scope: !83)
!92 = !DILocation(line: 156, column: 22, scope: !83)
!93 = !DILocation(line: 156, column: 12, scope: !83)
!94 = !DILocation(line: 156, column: 5, scope: !83)
!95 = !DILocation(line: 158, column: 5, scope: !83)
!96 = !DILocation(line: 159, column: 5, scope: !83)
!97 = !DILocation(line: 160, column: 5, scope: !83)
!98 = !DILocation(line: 163, column: 5, scope: !83)
!99 = !DILocation(line: 164, column: 5, scope: !83)
!100 = !DILocation(line: 165, column: 5, scope: !83)
!101 = !DILocation(line: 167, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 66, type: !4)
!104 = !DILocation(line: 66, column: 12, scope: !102)
!105 = !DILocation(line: 67, column: 10, scope: !102)
!106 = !DILocation(line: 76, column: 24, scope: !102)
!107 = !DILocation(line: 76, column: 14, scope: !102)
!108 = !DILocation(line: 77, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !15, line: 77, column: 13)
!110 = !DILocation(line: 77, column: 18, scope: !109)
!111 = !DILocation(line: 77, column: 13, scope: !102)
!112 = !DILocation(line: 77, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 77, column: 27)
!114 = !DILocation(line: 78, column: 16, scope: !102)
!115 = !DILocation(line: 78, column: 9, scope: !102)
!116 = !DILocation(line: 79, column: 9, scope: !102)
!117 = !DILocation(line: 79, column: 21, scope: !102)
!118 = !DILocalVariable(name: "i", scope: !119, file: !15, line: 83, type: !35)
!119 = distinct !DILexicalBlock(scope: !102, file: !15, line: 82, column: 5)
!120 = !DILocation(line: 83, column: 16, scope: !119)
!121 = !DILocalVariable(name: "destLen", scope: !119, file: !15, line: 83, type: !35)
!122 = !DILocation(line: 83, column: 19, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !119, file: !15, line: 84, type: !42)
!124 = !DILocation(line: 84, column: 14, scope: !119)
!125 = !DILocation(line: 85, column: 9, scope: !119)
!126 = !DILocation(line: 86, column: 9, scope: !119)
!127 = !DILocation(line: 86, column: 21, scope: !119)
!128 = !DILocation(line: 87, column: 26, scope: !119)
!129 = !DILocation(line: 87, column: 19, scope: !119)
!130 = !DILocation(line: 87, column: 17, scope: !119)
!131 = !DILocation(line: 90, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !119, file: !15, line: 90, column: 9)
!133 = !DILocation(line: 90, column: 14, scope: !132)
!134 = !DILocation(line: 90, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 90, column: 9)
!136 = !DILocation(line: 90, column: 25, scope: !135)
!137 = !DILocation(line: 90, column: 23, scope: !135)
!138 = !DILocation(line: 90, column: 9, scope: !132)
!139 = !DILocation(line: 92, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 91, column: 9)
!141 = !DILocation(line: 92, column: 28, scope: !140)
!142 = !DILocation(line: 92, column: 18, scope: !140)
!143 = !DILocation(line: 92, column: 13, scope: !140)
!144 = !DILocation(line: 92, column: 21, scope: !140)
!145 = !DILocation(line: 93, column: 9, scope: !140)
!146 = !DILocation(line: 90, column: 35, scope: !135)
!147 = !DILocation(line: 90, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !71}
!149 = !DILocation(line: 93, column: 9, scope: !132)
!150 = !DILocation(line: 94, column: 9, scope: !119)
!151 = !DILocation(line: 94, column: 21, scope: !119)
!152 = !DILocation(line: 95, column: 19, scope: !119)
!153 = !DILocation(line: 95, column: 9, scope: !119)
!154 = !DILocation(line: 96, column: 14, scope: !119)
!155 = !DILocation(line: 96, column: 9, scope: !119)
!156 = !DILocation(line: 98, column: 1, scope: !102)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 101, type: !16, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !15, line: 103, type: !4)
!159 = !DILocation(line: 103, column: 12, scope: !157)
!160 = !DILocation(line: 104, column: 10, scope: !157)
!161 = !DILocation(line: 109, column: 24, scope: !157)
!162 = !DILocation(line: 109, column: 14, scope: !157)
!163 = !DILocation(line: 110, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !15, line: 110, column: 13)
!165 = !DILocation(line: 110, column: 18, scope: !164)
!166 = !DILocation(line: 110, column: 13, scope: !157)
!167 = !DILocation(line: 110, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 110, column: 27)
!169 = !DILocation(line: 111, column: 16, scope: !157)
!170 = !DILocation(line: 111, column: 9, scope: !157)
!171 = !DILocation(line: 112, column: 9, scope: !157)
!172 = !DILocation(line: 112, column: 21, scope: !157)
!173 = !DILocalVariable(name: "i", scope: !174, file: !15, line: 120, type: !35)
!174 = distinct !DILexicalBlock(scope: !157, file: !15, line: 119, column: 5)
!175 = !DILocation(line: 120, column: 16, scope: !174)
!176 = !DILocalVariable(name: "destLen", scope: !174, file: !15, line: 120, type: !35)
!177 = !DILocation(line: 120, column: 19, scope: !174)
!178 = !DILocalVariable(name: "dest", scope: !174, file: !15, line: 121, type: !42)
!179 = !DILocation(line: 121, column: 14, scope: !174)
!180 = !DILocation(line: 122, column: 9, scope: !174)
!181 = !DILocation(line: 123, column: 9, scope: !174)
!182 = !DILocation(line: 123, column: 21, scope: !174)
!183 = !DILocation(line: 124, column: 26, scope: !174)
!184 = !DILocation(line: 124, column: 19, scope: !174)
!185 = !DILocation(line: 124, column: 17, scope: !174)
!186 = !DILocation(line: 127, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !174, file: !15, line: 127, column: 9)
!188 = !DILocation(line: 127, column: 14, scope: !187)
!189 = !DILocation(line: 127, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !15, line: 127, column: 9)
!191 = !DILocation(line: 127, column: 25, scope: !190)
!192 = !DILocation(line: 127, column: 23, scope: !190)
!193 = !DILocation(line: 127, column: 9, scope: !187)
!194 = !DILocation(line: 129, column: 23, scope: !195)
!195 = distinct !DILexicalBlock(scope: !190, file: !15, line: 128, column: 9)
!196 = !DILocation(line: 129, column: 28, scope: !195)
!197 = !DILocation(line: 129, column: 18, scope: !195)
!198 = !DILocation(line: 129, column: 13, scope: !195)
!199 = !DILocation(line: 129, column: 21, scope: !195)
!200 = !DILocation(line: 130, column: 9, scope: !195)
!201 = !DILocation(line: 127, column: 35, scope: !190)
!202 = !DILocation(line: 127, column: 9, scope: !190)
!203 = distinct !{!203, !193, !204, !71}
!204 = !DILocation(line: 130, column: 9, scope: !187)
!205 = !DILocation(line: 131, column: 9, scope: !174)
!206 = !DILocation(line: 131, column: 21, scope: !174)
!207 = !DILocation(line: 132, column: 19, scope: !174)
!208 = !DILocation(line: 132, column: 9, scope: !174)
!209 = !DILocation(line: 133, column: 14, scope: !174)
!210 = !DILocation(line: 133, column: 9, scope: !174)
!211 = !DILocation(line: 135, column: 1, scope: !157)
