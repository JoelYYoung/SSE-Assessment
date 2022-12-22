; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_03.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx1, align 1, !dbg !50
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !52
  store i64 %call3, i64* %destLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !57
  %4 = load i64, i64* %destLen, align 8, !dbg !59
  %cmp4 = icmp ult i64 %3, %4, !dbg !60
  br i1 %cmp4, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !62
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !62
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !66
  store i8 %7, i8* %arrayidx6, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx7, align 1, !dbg !75
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  call void @printLine(i8* %arraydecay8), !dbg !77
  %10 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* %10) #7, !dbg !79
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_03_good() #0 !dbg !81 {
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
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__malloc_char_loop_03_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__malloc_char_loop_03_bad(), !dbg !101
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
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !108
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx1, align 1, !dbg !131
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !133
  store i64 %call3, i64* %destLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !138
  %4 = load i64, i64* %destLen, align 8, !dbg !140
  %cmp4 = icmp ult i64 %3, %4, !dbg !141
  br i1 %cmp4, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !143
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !143
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !147
  store i8 %7, i8* %arrayidx6, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %9, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !154
  store i8 0, i8* %arrayidx7, align 1, !dbg !155
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  call void @printLine(i8* %arraydecay8), !dbg !157
  %10 = load i8*, i8** %data, align 8, !dbg !158
  call void @free(i8* %10) #7, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i8* null, i8** %data, align 8, !dbg !164
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !165
  store i8* %call, i8** %data, align 8, !dbg !168
  %0 = load i8*, i8** %data, align 8, !dbg !169
  %cmp = icmp eq i8* %0, null, !dbg !171
  br i1 %cmp, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !176
  %2 = load i8*, i8** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !177
  store i8 0, i8* %arrayidx, align 1, !dbg !178
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !184, metadata !DIExpression()), !dbg !185
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !186
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !187
  store i8 0, i8* %arrayidx1, align 1, !dbg !188
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !189
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !190
  store i64 %call3, i64* %destLen, align 8, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !195
  %4 = load i64, i64* %destLen, align 8, !dbg !197
  %cmp4 = icmp ult i64 %3, %4, !dbg !198
  br i1 %cmp4, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !200
  %6 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !200
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !200
  %8 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !204
  store i8 %7, i8* %arrayidx6, align 1, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %9, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !211
  store i8 0, i8* %arrayidx7, align 1, !dbg !212
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !213
  call void @printLine(i8* %arraydecay8), !dbg !214
  %10 = load i8*, i8** %data, align 8, !dbg !215
  call void @free(i8* %10) #7, !dbg !216
  ret void, !dbg !217
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_03.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_03_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_03.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 30, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 28, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!24 = !DILocation(line: 30, column: 14, scope: !22)
!25 = !DILocation(line: 31, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 31, column: 13)
!27 = !DILocation(line: 31, column: 18, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !22)
!29 = !DILocation(line: 31, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 27)
!31 = !DILocation(line: 32, column: 16, scope: !22)
!32 = !DILocation(line: 32, column: 9, scope: !22)
!33 = !DILocation(line: 33, column: 9, scope: !22)
!34 = !DILocation(line: 33, column: 20, scope: !22)
!35 = !DILocalVariable(name: "i", scope: !36, file: !15, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 36, column: 16, scope: !36)
!41 = !DILocalVariable(name: "destLen", scope: !36, file: !15, line: 36, type: !37)
!42 = !DILocation(line: 36, column: 19, scope: !36)
!43 = !DILocalVariable(name: "dest", scope: !36, file: !15, line: 37, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 37, column: 14, scope: !36)
!48 = !DILocation(line: 38, column: 9, scope: !36)
!49 = !DILocation(line: 39, column: 9, scope: !36)
!50 = !DILocation(line: 39, column: 21, scope: !36)
!51 = !DILocation(line: 40, column: 26, scope: !36)
!52 = !DILocation(line: 40, column: 19, scope: !36)
!53 = !DILocation(line: 40, column: 17, scope: !36)
!54 = !DILocation(line: 43, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !36, file: !15, line: 43, column: 9)
!56 = !DILocation(line: 43, column: 14, scope: !55)
!57 = !DILocation(line: 43, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !15, line: 43, column: 9)
!59 = !DILocation(line: 43, column: 25, scope: !58)
!60 = !DILocation(line: 43, column: 23, scope: !58)
!61 = !DILocation(line: 43, column: 9, scope: !55)
!62 = !DILocation(line: 45, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !15, line: 44, column: 9)
!64 = !DILocation(line: 45, column: 28, scope: !63)
!65 = !DILocation(line: 45, column: 18, scope: !63)
!66 = !DILocation(line: 45, column: 13, scope: !63)
!67 = !DILocation(line: 45, column: 21, scope: !63)
!68 = !DILocation(line: 46, column: 9, scope: !63)
!69 = !DILocation(line: 43, column: 35, scope: !58)
!70 = !DILocation(line: 43, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 46, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 47, column: 9, scope: !36)
!75 = !DILocation(line: 47, column: 21, scope: !36)
!76 = !DILocation(line: 48, column: 19, scope: !36)
!77 = !DILocation(line: 48, column: 9, scope: !36)
!78 = !DILocation(line: 49, column: 14, scope: !36)
!79 = !DILocation(line: 49, column: 9, scope: !36)
!80 = !DILocation(line: 51, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_03_good", scope: !15, file: !15, line: 124, type: !16, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 126, column: 5, scope: !81)
!83 = !DILocation(line: 127, column: 5, scope: !81)
!84 = !DILocation(line: 128, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 140, type: !86, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 140, type: !88)
!91 = !DILocation(line: 140, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 140, type: !89)
!93 = !DILocation(line: 140, column: 27, scope: !85)
!94 = !DILocation(line: 143, column: 22, scope: !85)
!95 = !DILocation(line: 143, column: 12, scope: !85)
!96 = !DILocation(line: 143, column: 5, scope: !85)
!97 = !DILocation(line: 145, column: 5, scope: !85)
!98 = !DILocation(line: 146, column: 5, scope: !85)
!99 = !DILocation(line: 147, column: 5, scope: !85)
!100 = !DILocation(line: 150, column: 5, scope: !85)
!101 = !DILocation(line: 151, column: 5, scope: !85)
!102 = !DILocation(line: 152, column: 5, scope: !85)
!103 = !DILocation(line: 154, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 60, type: !4)
!106 = !DILocation(line: 60, column: 12, scope: !104)
!107 = !DILocation(line: 61, column: 10, scope: !104)
!108 = !DILocation(line: 70, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !15, line: 68, column: 5)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 62, column: 8)
!111 = !DILocation(line: 70, column: 14, scope: !109)
!112 = !DILocation(line: 71, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 71, column: 13)
!114 = !DILocation(line: 71, column: 18, scope: !113)
!115 = !DILocation(line: 71, column: 13, scope: !109)
!116 = !DILocation(line: 71, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 71, column: 27)
!118 = !DILocation(line: 72, column: 16, scope: !109)
!119 = !DILocation(line: 72, column: 9, scope: !109)
!120 = !DILocation(line: 73, column: 9, scope: !109)
!121 = !DILocation(line: 73, column: 21, scope: !109)
!122 = !DILocalVariable(name: "i", scope: !123, file: !15, line: 76, type: !37)
!123 = distinct !DILexicalBlock(scope: !104, file: !15, line: 75, column: 5)
!124 = !DILocation(line: 76, column: 16, scope: !123)
!125 = !DILocalVariable(name: "destLen", scope: !123, file: !15, line: 76, type: !37)
!126 = !DILocation(line: 76, column: 19, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !123, file: !15, line: 77, type: !44)
!128 = !DILocation(line: 77, column: 14, scope: !123)
!129 = !DILocation(line: 78, column: 9, scope: !123)
!130 = !DILocation(line: 79, column: 9, scope: !123)
!131 = !DILocation(line: 79, column: 21, scope: !123)
!132 = !DILocation(line: 80, column: 26, scope: !123)
!133 = !DILocation(line: 80, column: 19, scope: !123)
!134 = !DILocation(line: 80, column: 17, scope: !123)
!135 = !DILocation(line: 83, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !123, file: !15, line: 83, column: 9)
!137 = !DILocation(line: 83, column: 14, scope: !136)
!138 = !DILocation(line: 83, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 83, column: 9)
!140 = !DILocation(line: 83, column: 25, scope: !139)
!141 = !DILocation(line: 83, column: 23, scope: !139)
!142 = !DILocation(line: 83, column: 9, scope: !136)
!143 = !DILocation(line: 85, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !15, line: 84, column: 9)
!145 = !DILocation(line: 85, column: 28, scope: !144)
!146 = !DILocation(line: 85, column: 18, scope: !144)
!147 = !DILocation(line: 85, column: 13, scope: !144)
!148 = !DILocation(line: 85, column: 21, scope: !144)
!149 = !DILocation(line: 86, column: 9, scope: !144)
!150 = !DILocation(line: 83, column: 35, scope: !139)
!151 = !DILocation(line: 83, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !73}
!153 = !DILocation(line: 86, column: 9, scope: !136)
!154 = !DILocation(line: 87, column: 9, scope: !123)
!155 = !DILocation(line: 87, column: 21, scope: !123)
!156 = !DILocation(line: 88, column: 19, scope: !123)
!157 = !DILocation(line: 88, column: 9, scope: !123)
!158 = !DILocation(line: 89, column: 14, scope: !123)
!159 = !DILocation(line: 89, column: 9, scope: !123)
!160 = !DILocation(line: 91, column: 1, scope: !104)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !15, line: 96, type: !4)
!163 = !DILocation(line: 96, column: 12, scope: !161)
!164 = !DILocation(line: 97, column: 10, scope: !161)
!165 = !DILocation(line: 101, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !15, line: 99, column: 5)
!167 = distinct !DILexicalBlock(scope: !161, file: !15, line: 98, column: 8)
!168 = !DILocation(line: 101, column: 14, scope: !166)
!169 = !DILocation(line: 102, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 102, column: 13)
!171 = !DILocation(line: 102, column: 18, scope: !170)
!172 = !DILocation(line: 102, column: 13, scope: !166)
!173 = !DILocation(line: 102, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 102, column: 27)
!175 = !DILocation(line: 103, column: 16, scope: !166)
!176 = !DILocation(line: 103, column: 9, scope: !166)
!177 = !DILocation(line: 104, column: 9, scope: !166)
!178 = !DILocation(line: 104, column: 21, scope: !166)
!179 = !DILocalVariable(name: "i", scope: !180, file: !15, line: 107, type: !37)
!180 = distinct !DILexicalBlock(scope: !161, file: !15, line: 106, column: 5)
!181 = !DILocation(line: 107, column: 16, scope: !180)
!182 = !DILocalVariable(name: "destLen", scope: !180, file: !15, line: 107, type: !37)
!183 = !DILocation(line: 107, column: 19, scope: !180)
!184 = !DILocalVariable(name: "dest", scope: !180, file: !15, line: 108, type: !44)
!185 = !DILocation(line: 108, column: 14, scope: !180)
!186 = !DILocation(line: 109, column: 9, scope: !180)
!187 = !DILocation(line: 110, column: 9, scope: !180)
!188 = !DILocation(line: 110, column: 21, scope: !180)
!189 = !DILocation(line: 111, column: 26, scope: !180)
!190 = !DILocation(line: 111, column: 19, scope: !180)
!191 = !DILocation(line: 111, column: 17, scope: !180)
!192 = !DILocation(line: 114, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !180, file: !15, line: 114, column: 9)
!194 = !DILocation(line: 114, column: 14, scope: !193)
!195 = !DILocation(line: 114, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !15, line: 114, column: 9)
!197 = !DILocation(line: 114, column: 25, scope: !196)
!198 = !DILocation(line: 114, column: 23, scope: !196)
!199 = !DILocation(line: 114, column: 9, scope: !193)
!200 = !DILocation(line: 116, column: 23, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !15, line: 115, column: 9)
!202 = !DILocation(line: 116, column: 28, scope: !201)
!203 = !DILocation(line: 116, column: 18, scope: !201)
!204 = !DILocation(line: 116, column: 13, scope: !201)
!205 = !DILocation(line: 116, column: 21, scope: !201)
!206 = !DILocation(line: 117, column: 9, scope: !201)
!207 = !DILocation(line: 114, column: 35, scope: !196)
!208 = !DILocation(line: 114, column: 9, scope: !196)
!209 = distinct !{!209, !199, !210, !73}
!210 = !DILocation(line: 117, column: 9, scope: !193)
!211 = !DILocation(line: 118, column: 9, scope: !180)
!212 = !DILocation(line: 118, column: 21, scope: !180)
!213 = !DILocation(line: 119, column: 19, scope: !180)
!214 = !DILocation(line: 119, column: 9, scope: !180)
!215 = !DILocation(line: 120, column: 14, scope: !180)
!216 = !DILocation(line: 120, column: 9, scope: !180)
!217 = !DILocation(line: 122, column: 1, scope: !161)
