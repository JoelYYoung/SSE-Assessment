; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !34
  store i8* %call, i8** %dataBuffer, align 8, !dbg !33
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i8* %2, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !42
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 -8, !dbg !46
  store i8* %add.ptr, i8** %data1, align 8, !dbg !47
  %6 = load i8*, i8** %data1, align 8, !dbg !48
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !49
  store i8* %6, i8** %7, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !54
  %9 = load i8*, i8** %8, align 8, !dbg !55
  store i8* %9, i8** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !62, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !67
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !68
  store i8 0, i8* %arrayidx3, align 1, !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !73
  %cmp4 = icmp ult i64 %10, 100, !dbg !75
  br i1 %cmp4, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %11, !dbg !79
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !79
  %13 = load i8*, i8** %data2, align 8, !dbg !80
  %14 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !80
  store i8 %12, i8* %arrayidx6, align 1, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %15, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !89
  %arrayidx7 = getelementptr inbounds i8, i8* %16, i64 99, !dbg !89
  store i8 0, i8* %arrayidx7, align 1, !dbg !90
  %17 = load i8*, i8** %data2, align 8, !dbg !91
  call void @printLine(i8* %17), !dbg !92
  ret void, !dbg !93
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_32_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #6, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #6, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_32_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_32_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !120, metadata !DIExpression()), !dbg !121
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !121
  store i8* null, i8** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !126
  %1 = load i8*, i8** %0, align 8, !dbg !127
  store i8* %1, i8** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !128, metadata !DIExpression()), !dbg !130
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !131
  store i8* %call, i8** %dataBuffer, align 8, !dbg !130
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  %cmp = icmp eq i8* %2, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !139
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  store i8* %5, i8** %data1, align 8, !dbg !143
  %6 = load i8*, i8** %data1, align 8, !dbg !144
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !145
  store i8* %6, i8** %7, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !147, metadata !DIExpression()), !dbg !149
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !150
  %9 = load i8*, i8** %8, align 8, !dbg !151
  store i8* %9, i8** %data2, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !157
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx3, align 1, !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !163
  %cmp4 = icmp ult i64 %10, 100, !dbg !165
  br i1 %cmp4, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %11, !dbg !169
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !169
  %13 = load i8*, i8** %data2, align 8, !dbg !170
  %14 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !170
  store i8 %12, i8* %arrayidx6, align 1, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %15, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !178
  %arrayidx7 = getelementptr inbounds i8, i8* %16, i64 99, !dbg !178
  store i8 0, i8* %arrayidx7, align 1, !dbg !179
  %17 = load i8*, i8** %data2, align 8, !dbg !180
  call void @printLine(i8* %17), !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !15, line: 32, type: !4)
!32 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 9)
!33 = !DILocation(line: 32, column: 20, scope: !32)
!34 = !DILocation(line: 32, column: 41, scope: !32)
!35 = !DILocation(line: 33, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 33, column: 17)
!37 = !DILocation(line: 33, column: 28, scope: !36)
!38 = !DILocation(line: 33, column: 17, scope: !32)
!39 = !DILocation(line: 33, column: 38, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 33, column: 37)
!41 = !DILocation(line: 34, column: 20, scope: !32)
!42 = !DILocation(line: 34, column: 13, scope: !32)
!43 = !DILocation(line: 35, column: 13, scope: !32)
!44 = !DILocation(line: 35, column: 31, scope: !32)
!45 = !DILocation(line: 37, column: 20, scope: !32)
!46 = !DILocation(line: 37, column: 31, scope: !32)
!47 = !DILocation(line: 37, column: 18, scope: !32)
!48 = !DILocation(line: 39, column: 21, scope: !27)
!49 = !DILocation(line: 39, column: 10, scope: !27)
!50 = !DILocation(line: 39, column: 19, scope: !27)
!51 = !DILocalVariable(name: "data", scope: !52, file: !15, line: 42, type: !4)
!52 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 16, scope: !52)
!54 = !DILocation(line: 42, column: 24, scope: !52)
!55 = !DILocation(line: 42, column: 23, scope: !52)
!56 = !DILocalVariable(name: "i", scope: !57, file: !15, line: 44, type: !58)
!57 = distinct !DILexicalBlock(scope: !52, file: !15, line: 43, column: 9)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 46, baseType: !60)
!59 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 44, column: 20, scope: !57)
!62 = !DILocalVariable(name: "source", scope: !57, file: !15, line: 45, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 100)
!66 = !DILocation(line: 45, column: 18, scope: !57)
!67 = !DILocation(line: 46, column: 13, scope: !57)
!68 = !DILocation(line: 47, column: 13, scope: !57)
!69 = !DILocation(line: 47, column: 27, scope: !57)
!70 = !DILocation(line: 49, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !57, file: !15, line: 49, column: 13)
!72 = !DILocation(line: 49, column: 18, scope: !71)
!73 = !DILocation(line: 49, column: 25, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 49, column: 13)
!75 = !DILocation(line: 49, column: 27, scope: !74)
!76 = !DILocation(line: 49, column: 13, scope: !71)
!77 = !DILocation(line: 51, column: 34, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 50, column: 13)
!79 = !DILocation(line: 51, column: 27, scope: !78)
!80 = !DILocation(line: 51, column: 17, scope: !78)
!81 = !DILocation(line: 51, column: 22, scope: !78)
!82 = !DILocation(line: 51, column: 25, scope: !78)
!83 = !DILocation(line: 52, column: 13, scope: !78)
!84 = !DILocation(line: 49, column: 35, scope: !74)
!85 = !DILocation(line: 49, column: 13, scope: !74)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 52, column: 13, scope: !71)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 54, column: 13, scope: !57)
!90 = !DILocation(line: 54, column: 25, scope: !57)
!91 = !DILocation(line: 55, column: 23, scope: !57)
!92 = !DILocation(line: 55, column: 13, scope: !57)
!93 = !DILocation(line: 60, column: 1, scope: !14)
!94 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_32_good", scope: !15, file: !15, line: 106, type: !16, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 108, column: 5, scope: !94)
!96 = !DILocation(line: 109, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 120, type: !98, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!100, !100, !21}
!100 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !15, line: 120, type: !100)
!102 = !DILocation(line: 120, column: 14, scope: !97)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !15, line: 120, type: !21)
!104 = !DILocation(line: 120, column: 27, scope: !97)
!105 = !DILocation(line: 123, column: 22, scope: !97)
!106 = !DILocation(line: 123, column: 12, scope: !97)
!107 = !DILocation(line: 123, column: 5, scope: !97)
!108 = !DILocation(line: 125, column: 5, scope: !97)
!109 = !DILocation(line: 126, column: 5, scope: !97)
!110 = !DILocation(line: 127, column: 5, scope: !97)
!111 = !DILocation(line: 130, column: 5, scope: !97)
!112 = !DILocation(line: 131, column: 5, scope: !97)
!113 = !DILocation(line: 132, column: 5, scope: !97)
!114 = !DILocation(line: 134, column: 5, scope: !97)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 69, type: !4)
!117 = !DILocation(line: 69, column: 12, scope: !115)
!118 = !DILocalVariable(name: "dataPtr1", scope: !115, file: !15, line: 70, type: !21)
!119 = !DILocation(line: 70, column: 13, scope: !115)
!120 = !DILocalVariable(name: "dataPtr2", scope: !115, file: !15, line: 71, type: !21)
!121 = !DILocation(line: 71, column: 13, scope: !115)
!122 = !DILocation(line: 72, column: 10, scope: !115)
!123 = !DILocalVariable(name: "data", scope: !124, file: !15, line: 74, type: !4)
!124 = distinct !DILexicalBlock(scope: !115, file: !15, line: 73, column: 5)
!125 = !DILocation(line: 74, column: 16, scope: !124)
!126 = !DILocation(line: 74, column: 24, scope: !124)
!127 = !DILocation(line: 74, column: 23, scope: !124)
!128 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !15, line: 76, type: !4)
!129 = distinct !DILexicalBlock(scope: !124, file: !15, line: 75, column: 9)
!130 = !DILocation(line: 76, column: 20, scope: !129)
!131 = !DILocation(line: 76, column: 41, scope: !129)
!132 = !DILocation(line: 77, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 77, column: 17)
!134 = !DILocation(line: 77, column: 28, scope: !133)
!135 = !DILocation(line: 77, column: 17, scope: !129)
!136 = !DILocation(line: 77, column: 38, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 77, column: 37)
!138 = !DILocation(line: 78, column: 20, scope: !129)
!139 = !DILocation(line: 78, column: 13, scope: !129)
!140 = !DILocation(line: 79, column: 13, scope: !129)
!141 = !DILocation(line: 79, column: 31, scope: !129)
!142 = !DILocation(line: 81, column: 20, scope: !129)
!143 = !DILocation(line: 81, column: 18, scope: !129)
!144 = !DILocation(line: 83, column: 21, scope: !124)
!145 = !DILocation(line: 83, column: 10, scope: !124)
!146 = !DILocation(line: 83, column: 19, scope: !124)
!147 = !DILocalVariable(name: "data", scope: !148, file: !15, line: 86, type: !4)
!148 = distinct !DILexicalBlock(scope: !115, file: !15, line: 85, column: 5)
!149 = !DILocation(line: 86, column: 16, scope: !148)
!150 = !DILocation(line: 86, column: 24, scope: !148)
!151 = !DILocation(line: 86, column: 23, scope: !148)
!152 = !DILocalVariable(name: "i", scope: !153, file: !15, line: 88, type: !58)
!153 = distinct !DILexicalBlock(scope: !148, file: !15, line: 87, column: 9)
!154 = !DILocation(line: 88, column: 20, scope: !153)
!155 = !DILocalVariable(name: "source", scope: !153, file: !15, line: 89, type: !63)
!156 = !DILocation(line: 89, column: 18, scope: !153)
!157 = !DILocation(line: 90, column: 13, scope: !153)
!158 = !DILocation(line: 91, column: 13, scope: !153)
!159 = !DILocation(line: 91, column: 27, scope: !153)
!160 = !DILocation(line: 93, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !153, file: !15, line: 93, column: 13)
!162 = !DILocation(line: 93, column: 18, scope: !161)
!163 = !DILocation(line: 93, column: 25, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 93, column: 13)
!165 = !DILocation(line: 93, column: 27, scope: !164)
!166 = !DILocation(line: 93, column: 13, scope: !161)
!167 = !DILocation(line: 95, column: 34, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 94, column: 13)
!169 = !DILocation(line: 95, column: 27, scope: !168)
!170 = !DILocation(line: 95, column: 17, scope: !168)
!171 = !DILocation(line: 95, column: 22, scope: !168)
!172 = !DILocation(line: 95, column: 25, scope: !168)
!173 = !DILocation(line: 96, column: 13, scope: !168)
!174 = !DILocation(line: 93, column: 35, scope: !164)
!175 = !DILocation(line: 93, column: 13, scope: !164)
!176 = distinct !{!176, !166, !177, !88}
!177 = !DILocation(line: 96, column: 13, scope: !161)
!178 = !DILocation(line: 98, column: 13, scope: !153)
!179 = !DILocation(line: 98, column: 25, scope: !153)
!180 = !DILocation(line: 99, column: 23, scope: !153)
!181 = !DILocation(line: 99, column: 13, scope: !153)
!182 = !DILocation(line: 104, column: 1, scope: !115)
