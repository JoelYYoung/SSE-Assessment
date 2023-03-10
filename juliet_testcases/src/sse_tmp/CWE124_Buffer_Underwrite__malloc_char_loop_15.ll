; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx1, align 1, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !55
  %cmp2 = icmp ult i64 %4, 100, !dbg !57
  br i1 %cmp2, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !61
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !61
  %7 = load i8*, i8** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !62
  store i8 %6, i8* %arrayidx4, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %9, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !71
  store i8 0, i8* %arrayidx5, align 1, !dbg !72
  %11 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* %11), !dbg !74
  ret void, !dbg !75
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_15_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_15_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_15_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !106
  store i8* %call, i8** %dataBuffer, align 8, !dbg !105
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  %cmp = icmp eq i8* %0, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !114
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  store i8* %3, i8** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx1, align 1, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !130
  %cmp2 = icmp ult i64 %4, 100, !dbg !132
  br i1 %cmp2, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !136
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !136
  %7 = load i8*, i8** %data, align 8, !dbg !137
  %8 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !137
  store i8 %6, i8* %arrayidx4, align 1, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %9, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !145
  store i8 0, i8* %arrayidx5, align 1, !dbg !146
  %11 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %11), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i8* null, i8** %data, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !156
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !157
  store i8* %call, i8** %dataBuffer, align 8, !dbg !156
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !158
  %cmp = icmp eq i8* %0, null, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !165
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !166
  store i8 0, i8* %arrayidx, align 1, !dbg !167
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !168
  store i8* %3, i8** %data, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !175
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !176
  store i8 0, i8* %arrayidx1, align 1, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !181
  %cmp2 = icmp ult i64 %4, 100, !dbg !183
  br i1 %cmp2, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !187
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !187
  %7 = load i8*, i8** %data, align 8, !dbg !188
  %8 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !188
  store i8 %6, i8* %arrayidx4, align 1, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %9, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !196
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !196
  store i8 0, i8* %arrayidx5, align 1, !dbg !197
  %11 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %11), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 31, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!23 = !DILocation(line: 31, column: 16, scope: !22)
!24 = !DILocation(line: 31, column: 37, scope: !22)
!25 = !DILocation(line: 32, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 32, column: 13)
!27 = !DILocation(line: 32, column: 24, scope: !26)
!28 = !DILocation(line: 32, column: 13, scope: !22)
!29 = !DILocation(line: 32, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 32, column: 33)
!31 = !DILocation(line: 33, column: 16, scope: !22)
!32 = !DILocation(line: 33, column: 9, scope: !22)
!33 = !DILocation(line: 34, column: 9, scope: !22)
!34 = !DILocation(line: 34, column: 27, scope: !22)
!35 = !DILocation(line: 36, column: 16, scope: !22)
!36 = !DILocation(line: 36, column: 27, scope: !22)
!37 = !DILocation(line: 36, column: 14, scope: !22)
!38 = !DILocalVariable(name: "i", scope: !39, file: !15, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 45, column: 16, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 46, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 46, column: 14, scope: !39)
!49 = !DILocation(line: 47, column: 9, scope: !39)
!50 = !DILocation(line: 48, column: 9, scope: !39)
!51 = !DILocation(line: 48, column: 23, scope: !39)
!52 = !DILocation(line: 50, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !15, line: 50, column: 9)
!54 = !DILocation(line: 50, column: 14, scope: !53)
!55 = !DILocation(line: 50, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !15, line: 50, column: 9)
!57 = !DILocation(line: 50, column: 23, scope: !56)
!58 = !DILocation(line: 50, column: 9, scope: !53)
!59 = !DILocation(line: 52, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 51, column: 9)
!61 = !DILocation(line: 52, column: 23, scope: !60)
!62 = !DILocation(line: 52, column: 13, scope: !60)
!63 = !DILocation(line: 52, column: 18, scope: !60)
!64 = !DILocation(line: 52, column: 21, scope: !60)
!65 = !DILocation(line: 53, column: 9, scope: !60)
!66 = !DILocation(line: 50, column: 31, scope: !56)
!67 = !DILocation(line: 50, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 53, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 55, column: 9, scope: !39)
!72 = !DILocation(line: 55, column: 21, scope: !39)
!73 = !DILocation(line: 56, column: 19, scope: !39)
!74 = !DILocation(line: 56, column: 9, scope: !39)
!75 = !DILocation(line: 60, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_15_good", scope: !15, file: !15, line: 146, type: !16, scopeLine: 147, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 148, column: 5, scope: !76)
!78 = !DILocation(line: 149, column: 5, scope: !76)
!79 = !DILocation(line: 150, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 162, type: !81, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 162, type: !83)
!86 = !DILocation(line: 162, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 162, type: !84)
!88 = !DILocation(line: 162, column: 27, scope: !80)
!89 = !DILocation(line: 165, column: 22, scope: !80)
!90 = !DILocation(line: 165, column: 12, scope: !80)
!91 = !DILocation(line: 165, column: 5, scope: !80)
!92 = !DILocation(line: 167, column: 5, scope: !80)
!93 = !DILocation(line: 168, column: 5, scope: !80)
!94 = !DILocation(line: 169, column: 5, scope: !80)
!95 = !DILocation(line: 172, column: 5, scope: !80)
!96 = !DILocation(line: 173, column: 5, scope: !80)
!97 = !DILocation(line: 174, column: 5, scope: !80)
!98 = !DILocation(line: 176, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 69, type: !4)
!101 = !DILocation(line: 69, column: 12, scope: !99)
!102 = !DILocation(line: 70, column: 10, scope: !99)
!103 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !15, line: 79, type: !4)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 78, column: 5)
!105 = !DILocation(line: 79, column: 16, scope: !104)
!106 = !DILocation(line: 79, column: 37, scope: !104)
!107 = !DILocation(line: 80, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 80, column: 13)
!109 = !DILocation(line: 80, column: 24, scope: !108)
!110 = !DILocation(line: 80, column: 13, scope: !104)
!111 = !DILocation(line: 80, column: 34, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 80, column: 33)
!113 = !DILocation(line: 81, column: 16, scope: !104)
!114 = !DILocation(line: 81, column: 9, scope: !104)
!115 = !DILocation(line: 82, column: 9, scope: !104)
!116 = !DILocation(line: 82, column: 27, scope: !104)
!117 = !DILocation(line: 84, column: 16, scope: !104)
!118 = !DILocation(line: 84, column: 14, scope: !104)
!119 = !DILocalVariable(name: "i", scope: !120, file: !15, line: 89, type: !40)
!120 = distinct !DILexicalBlock(scope: !99, file: !15, line: 88, column: 5)
!121 = !DILocation(line: 89, column: 16, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !120, file: !15, line: 90, type: !45)
!123 = !DILocation(line: 90, column: 14, scope: !120)
!124 = !DILocation(line: 91, column: 9, scope: !120)
!125 = !DILocation(line: 92, column: 9, scope: !120)
!126 = !DILocation(line: 92, column: 23, scope: !120)
!127 = !DILocation(line: 94, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !15, line: 94, column: 9)
!129 = !DILocation(line: 94, column: 14, scope: !128)
!130 = !DILocation(line: 94, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 94, column: 9)
!132 = !DILocation(line: 94, column: 23, scope: !131)
!133 = !DILocation(line: 94, column: 9, scope: !128)
!134 = !DILocation(line: 96, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 95, column: 9)
!136 = !DILocation(line: 96, column: 23, scope: !135)
!137 = !DILocation(line: 96, column: 13, scope: !135)
!138 = !DILocation(line: 96, column: 18, scope: !135)
!139 = !DILocation(line: 96, column: 21, scope: !135)
!140 = !DILocation(line: 97, column: 9, scope: !135)
!141 = !DILocation(line: 94, column: 31, scope: !131)
!142 = !DILocation(line: 94, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !70}
!144 = !DILocation(line: 97, column: 9, scope: !128)
!145 = !DILocation(line: 99, column: 9, scope: !120)
!146 = !DILocation(line: 99, column: 21, scope: !120)
!147 = !DILocation(line: 100, column: 19, scope: !120)
!148 = !DILocation(line: 100, column: 9, scope: !120)
!149 = !DILocation(line: 104, column: 1, scope: !99)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !15, line: 109, type: !4)
!152 = !DILocation(line: 109, column: 12, scope: !150)
!153 = !DILocation(line: 110, column: 10, scope: !150)
!154 = !DILocalVariable(name: "dataBuffer", scope: !155, file: !15, line: 115, type: !4)
!155 = distinct !DILexicalBlock(scope: !150, file: !15, line: 114, column: 5)
!156 = !DILocation(line: 115, column: 16, scope: !155)
!157 = !DILocation(line: 115, column: 37, scope: !155)
!158 = !DILocation(line: 116, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 116, column: 13)
!160 = !DILocation(line: 116, column: 24, scope: !159)
!161 = !DILocation(line: 116, column: 13, scope: !155)
!162 = !DILocation(line: 116, column: 34, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 116, column: 33)
!164 = !DILocation(line: 117, column: 16, scope: !155)
!165 = !DILocation(line: 117, column: 9, scope: !155)
!166 = !DILocation(line: 118, column: 9, scope: !155)
!167 = !DILocation(line: 118, column: 27, scope: !155)
!168 = !DILocation(line: 120, column: 16, scope: !155)
!169 = !DILocation(line: 120, column: 14, scope: !155)
!170 = !DILocalVariable(name: "i", scope: !171, file: !15, line: 129, type: !40)
!171 = distinct !DILexicalBlock(scope: !150, file: !15, line: 128, column: 5)
!172 = !DILocation(line: 129, column: 16, scope: !171)
!173 = !DILocalVariable(name: "source", scope: !171, file: !15, line: 130, type: !45)
!174 = !DILocation(line: 130, column: 14, scope: !171)
!175 = !DILocation(line: 131, column: 9, scope: !171)
!176 = !DILocation(line: 132, column: 9, scope: !171)
!177 = !DILocation(line: 132, column: 23, scope: !171)
!178 = !DILocation(line: 134, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !15, line: 134, column: 9)
!180 = !DILocation(line: 134, column: 14, scope: !179)
!181 = !DILocation(line: 134, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !15, line: 134, column: 9)
!183 = !DILocation(line: 134, column: 23, scope: !182)
!184 = !DILocation(line: 134, column: 9, scope: !179)
!185 = !DILocation(line: 136, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 135, column: 9)
!187 = !DILocation(line: 136, column: 23, scope: !186)
!188 = !DILocation(line: 136, column: 13, scope: !186)
!189 = !DILocation(line: 136, column: 18, scope: !186)
!190 = !DILocation(line: 136, column: 21, scope: !186)
!191 = !DILocation(line: 137, column: 9, scope: !186)
!192 = !DILocation(line: 134, column: 31, scope: !182)
!193 = !DILocation(line: 134, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !70}
!195 = !DILocation(line: 137, column: 9, scope: !179)
!196 = !DILocation(line: 139, column: 9, scope: !171)
!197 = !DILocation(line: 139, column: 21, scope: !171)
!198 = !DILocation(line: 140, column: 19, scope: !171)
!199 = !DILocation(line: 140, column: 9, scope: !171)
!200 = !DILocation(line: 144, column: 1, scope: !150)
