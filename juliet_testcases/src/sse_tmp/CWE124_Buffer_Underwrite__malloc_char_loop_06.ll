; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_06.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx1, align 1, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !57
  %cmp2 = icmp ult i64 %4, 100, !dbg !59
  br i1 %cmp2, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !63
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !63
  %7 = load i8*, i8** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !64
  store i8 %6, i8* %arrayidx4, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %9, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !73
  store i8 0, i8* %arrayidx5, align 1, !dbg !74
  %11 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %11), !dbg !76
  ret void, !dbg !77
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_06_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_06_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_06_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i8* null, i8** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !110
  store i8* %call, i8** %dataBuffer, align 8, !dbg !109
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  %cmp = icmp eq i8* %0, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !118
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  store i8* %3, i8** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx1, align 1, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !134
  %cmp2 = icmp ult i64 %4, 100, !dbg !136
  br i1 %cmp2, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !140
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !140
  %7 = load i8*, i8** %data, align 8, !dbg !141
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !141
  store i8 %6, i8* %arrayidx4, align 1, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %9, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !149
  store i8 0, i8* %arrayidx5, align 1, !dbg !150
  %11 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %11), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i8* null, i8** %data, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !158, metadata !DIExpression()), !dbg !162
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !163
  store i8* %call, i8** %dataBuffer, align 8, !dbg !162
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !164
  %cmp = icmp eq i8* %0, null, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !168
  unreachable, !dbg !168

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !171
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !174
  store i8* %3, i8** %data, align 8, !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !179, metadata !DIExpression()), !dbg !180
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !181
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !182
  store i8 0, i8* %arrayidx1, align 1, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !187
  %cmp2 = icmp ult i64 %4, 100, !dbg !189
  br i1 %cmp2, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !193
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !193
  %7 = load i8*, i8** %data, align 8, !dbg !194
  %8 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !194
  store i8 %6, i8* %arrayidx4, align 1, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %9, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !202
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !202
  store i8 0, i8* %arrayidx5, align 1, !dbg !203
  %11 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* %11), !dbg !205
  ret void, !dbg !206
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_06_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !4)
!19 = !DILocation(line: 29, column: 12, scope: !14)
!20 = !DILocation(line: 30, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 34, type: !4)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 8)
!25 = !DILocation(line: 34, column: 20, scope: !22)
!26 = !DILocation(line: 34, column: 41, scope: !22)
!27 = !DILocation(line: 35, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 17)
!29 = !DILocation(line: 35, column: 28, scope: !28)
!30 = !DILocation(line: 35, column: 17, scope: !22)
!31 = !DILocation(line: 35, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 35, column: 37)
!33 = !DILocation(line: 36, column: 20, scope: !22)
!34 = !DILocation(line: 36, column: 13, scope: !22)
!35 = !DILocation(line: 37, column: 13, scope: !22)
!36 = !DILocation(line: 37, column: 31, scope: !22)
!37 = !DILocation(line: 39, column: 20, scope: !22)
!38 = !DILocation(line: 39, column: 31, scope: !22)
!39 = !DILocation(line: 39, column: 18, scope: !22)
!40 = !DILocalVariable(name: "i", scope: !41, file: !15, line: 43, type: !42)
!41 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 43, column: 16, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !41, file: !15, line: 44, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 44, column: 14, scope: !41)
!51 = !DILocation(line: 45, column: 9, scope: !41)
!52 = !DILocation(line: 46, column: 9, scope: !41)
!53 = !DILocation(line: 46, column: 23, scope: !41)
!54 = !DILocation(line: 48, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !41, file: !15, line: 48, column: 9)
!56 = !DILocation(line: 48, column: 14, scope: !55)
!57 = !DILocation(line: 48, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !15, line: 48, column: 9)
!59 = !DILocation(line: 48, column: 23, scope: !58)
!60 = !DILocation(line: 48, column: 9, scope: !55)
!61 = !DILocation(line: 50, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 49, column: 9)
!63 = !DILocation(line: 50, column: 23, scope: !62)
!64 = !DILocation(line: 50, column: 13, scope: !62)
!65 = !DILocation(line: 50, column: 18, scope: !62)
!66 = !DILocation(line: 50, column: 21, scope: !62)
!67 = !DILocation(line: 51, column: 9, scope: !62)
!68 = !DILocation(line: 48, column: 31, scope: !58)
!69 = !DILocation(line: 48, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 51, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 53, column: 9, scope: !41)
!74 = !DILocation(line: 53, column: 21, scope: !41)
!75 = !DILocation(line: 54, column: 19, scope: !41)
!76 = !DILocation(line: 54, column: 9, scope: !41)
!77 = !DILocation(line: 58, column: 1, scope: !14)
!78 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_06_good", scope: !15, file: !15, line: 137, type: !16, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 139, column: 5, scope: !78)
!80 = !DILocation(line: 140, column: 5, scope: !78)
!81 = !DILocation(line: 141, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 153, type: !83, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !15, line: 153, type: !85)
!88 = !DILocation(line: 153, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !15, line: 153, type: !86)
!90 = !DILocation(line: 153, column: 27, scope: !82)
!91 = !DILocation(line: 156, column: 22, scope: !82)
!92 = !DILocation(line: 156, column: 12, scope: !82)
!93 = !DILocation(line: 156, column: 5, scope: !82)
!94 = !DILocation(line: 158, column: 5, scope: !82)
!95 = !DILocation(line: 159, column: 5, scope: !82)
!96 = !DILocation(line: 160, column: 5, scope: !82)
!97 = !DILocation(line: 163, column: 5, scope: !82)
!98 = !DILocation(line: 164, column: 5, scope: !82)
!99 = !DILocation(line: 165, column: 5, scope: !82)
!100 = !DILocation(line: 167, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !15, line: 67, type: !4)
!103 = !DILocation(line: 67, column: 12, scope: !101)
!104 = !DILocation(line: 68, column: 10, scope: !101)
!105 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !15, line: 77, type: !4)
!106 = distinct !DILexicalBlock(scope: !107, file: !15, line: 76, column: 9)
!107 = distinct !DILexicalBlock(scope: !108, file: !15, line: 75, column: 5)
!108 = distinct !DILexicalBlock(scope: !101, file: !15, line: 69, column: 8)
!109 = !DILocation(line: 77, column: 20, scope: !106)
!110 = !DILocation(line: 77, column: 41, scope: !106)
!111 = !DILocation(line: 78, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !15, line: 78, column: 17)
!113 = !DILocation(line: 78, column: 28, scope: !112)
!114 = !DILocation(line: 78, column: 17, scope: !106)
!115 = !DILocation(line: 78, column: 38, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 78, column: 37)
!117 = !DILocation(line: 79, column: 20, scope: !106)
!118 = !DILocation(line: 79, column: 13, scope: !106)
!119 = !DILocation(line: 80, column: 13, scope: !106)
!120 = !DILocation(line: 80, column: 31, scope: !106)
!121 = !DILocation(line: 82, column: 20, scope: !106)
!122 = !DILocation(line: 82, column: 18, scope: !106)
!123 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 86, type: !42)
!124 = distinct !DILexicalBlock(scope: !101, file: !15, line: 85, column: 5)
!125 = !DILocation(line: 86, column: 16, scope: !124)
!126 = !DILocalVariable(name: "source", scope: !124, file: !15, line: 87, type: !47)
!127 = !DILocation(line: 87, column: 14, scope: !124)
!128 = !DILocation(line: 88, column: 9, scope: !124)
!129 = !DILocation(line: 89, column: 9, scope: !124)
!130 = !DILocation(line: 89, column: 23, scope: !124)
!131 = !DILocation(line: 91, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !15, line: 91, column: 9)
!133 = !DILocation(line: 91, column: 14, scope: !132)
!134 = !DILocation(line: 91, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 91, column: 9)
!136 = !DILocation(line: 91, column: 23, scope: !135)
!137 = !DILocation(line: 91, column: 9, scope: !132)
!138 = !DILocation(line: 93, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 92, column: 9)
!140 = !DILocation(line: 93, column: 23, scope: !139)
!141 = !DILocation(line: 93, column: 13, scope: !139)
!142 = !DILocation(line: 93, column: 18, scope: !139)
!143 = !DILocation(line: 93, column: 21, scope: !139)
!144 = !DILocation(line: 94, column: 9, scope: !139)
!145 = !DILocation(line: 91, column: 31, scope: !135)
!146 = !DILocation(line: 91, column: 9, scope: !135)
!147 = distinct !{!147, !137, !148, !72}
!148 = !DILocation(line: 94, column: 9, scope: !132)
!149 = !DILocation(line: 96, column: 9, scope: !124)
!150 = !DILocation(line: 96, column: 21, scope: !124)
!151 = !DILocation(line: 97, column: 19, scope: !124)
!152 = !DILocation(line: 97, column: 9, scope: !124)
!153 = !DILocation(line: 101, column: 1, scope: !101)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 104, type: !16, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !15, line: 106, type: !4)
!156 = !DILocation(line: 106, column: 12, scope: !154)
!157 = !DILocation(line: 107, column: 10, scope: !154)
!158 = !DILocalVariable(name: "dataBuffer", scope: !159, file: !15, line: 111, type: !4)
!159 = distinct !DILexicalBlock(scope: !160, file: !15, line: 110, column: 9)
!160 = distinct !DILexicalBlock(scope: !161, file: !15, line: 109, column: 5)
!161 = distinct !DILexicalBlock(scope: !154, file: !15, line: 108, column: 8)
!162 = !DILocation(line: 111, column: 20, scope: !159)
!163 = !DILocation(line: 111, column: 41, scope: !159)
!164 = !DILocation(line: 112, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !159, file: !15, line: 112, column: 17)
!166 = !DILocation(line: 112, column: 28, scope: !165)
!167 = !DILocation(line: 112, column: 17, scope: !159)
!168 = !DILocation(line: 112, column: 38, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 112, column: 37)
!170 = !DILocation(line: 113, column: 20, scope: !159)
!171 = !DILocation(line: 113, column: 13, scope: !159)
!172 = !DILocation(line: 114, column: 13, scope: !159)
!173 = !DILocation(line: 114, column: 31, scope: !159)
!174 = !DILocation(line: 116, column: 20, scope: !159)
!175 = !DILocation(line: 116, column: 18, scope: !159)
!176 = !DILocalVariable(name: "i", scope: !177, file: !15, line: 120, type: !42)
!177 = distinct !DILexicalBlock(scope: !154, file: !15, line: 119, column: 5)
!178 = !DILocation(line: 120, column: 16, scope: !177)
!179 = !DILocalVariable(name: "source", scope: !177, file: !15, line: 121, type: !47)
!180 = !DILocation(line: 121, column: 14, scope: !177)
!181 = !DILocation(line: 122, column: 9, scope: !177)
!182 = !DILocation(line: 123, column: 9, scope: !177)
!183 = !DILocation(line: 123, column: 23, scope: !177)
!184 = !DILocation(line: 125, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !177, file: !15, line: 125, column: 9)
!186 = !DILocation(line: 125, column: 14, scope: !185)
!187 = !DILocation(line: 125, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !15, line: 125, column: 9)
!189 = !DILocation(line: 125, column: 23, scope: !188)
!190 = !DILocation(line: 125, column: 9, scope: !185)
!191 = !DILocation(line: 127, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !15, line: 126, column: 9)
!193 = !DILocation(line: 127, column: 23, scope: !192)
!194 = !DILocation(line: 127, column: 13, scope: !192)
!195 = !DILocation(line: 127, column: 18, scope: !192)
!196 = !DILocation(line: 127, column: 21, scope: !192)
!197 = !DILocation(line: 128, column: 9, scope: !192)
!198 = !DILocation(line: 125, column: 31, scope: !188)
!199 = !DILocation(line: 125, column: 9, scope: !188)
!200 = distinct !{!200, !190, !201, !72}
!201 = !DILocation(line: 128, column: 9, scope: !185)
!202 = !DILocation(line: 130, column: 9, scope: !177)
!203 = !DILocation(line: 130, column: 21, scope: !177)
!204 = !DILocation(line: 131, column: 19, scope: !177)
!205 = !DILocation(line: 131, column: 9, scope: !177)
!206 = !DILocation(line: 135, column: 1, scope: !154)
