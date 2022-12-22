; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !43
  %5 = load i32*, i32** %data1, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %6 = load i32*, i32** %data1, align 8, !dbg !46
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !47
  store i32* %6, i32** %7, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !49, metadata !DIExpression()), !dbg !51
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !52
  %9 = load i32*, i32** %8, align 8, !dbg !53
  store i32* %9, i32** %data3, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !61, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !67
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx5, align 4, !dbg !69
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !71
  store i64 %call7, i64* %destLen, align 8, !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !76
  %11 = load i64, i64* %destLen, align 8, !dbg !78
  %cmp8 = icmp ult i64 %10, %11, !dbg !79
  br i1 %cmp8, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data3, align 8, !dbg !81
  %13 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx9 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !81
  %14 = load i32, i32* %arrayidx9, align 4, !dbg !81
  %15 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !85
  store i32 %14, i32* %arrayidx10, align 4, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %16, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx11, align 4, !dbg !94
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  call void @printWLine(i32* %arraydecay12), !dbg !96
  %17 = load i32*, i32** %data3, align 8, !dbg !97
  %18 = bitcast i32* %17 to i8*, !dbg !97
  call void @free(i8* %18) #6, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_32_good() #0 !dbg !100 {
entry:
  call void @goodG2B(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i64 @time(i64* null) #6, !dbg !113
  %conv = trunc i64 %call to i32, !dbg !114
  call void @srand(i32 %conv) #6, !dbg !115
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_32_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_32_bad(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !126, metadata !DIExpression()), !dbg !127
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !128, metadata !DIExpression()), !dbg !129
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !129
  store i32* null, i32** %data, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !134
  %1 = load i32*, i32** %0, align 8, !dbg !135
  store i32* %1, i32** %data1, align 8, !dbg !133
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !136
  %2 = bitcast i8* %call to i32*, !dbg !137
  store i32* %2, i32** %data1, align 8, !dbg !138
  %3 = load i32*, i32** %data1, align 8, !dbg !139
  %cmp = icmp eq i32* %3, null, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !145
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !146
  %5 = load i32*, i32** %data1, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  %6 = load i32*, i32** %data1, align 8, !dbg !149
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !150
  store i32* %6, i32** %7, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !152, metadata !DIExpression()), !dbg !154
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !155
  %9 = load i32*, i32** %8, align 8, !dbg !156
  store i32* %9, i32** %data3, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !165
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx5, align 4, !dbg !167
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !169
  store i64 %call7, i64* %destLen, align 8, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !174
  %11 = load i64, i64* %destLen, align 8, !dbg !176
  %cmp8 = icmp ult i64 %10, %11, !dbg !177
  br i1 %cmp8, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data3, align 8, !dbg !179
  %13 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx9 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !179
  %14 = load i32, i32* %arrayidx9, align 4, !dbg !179
  %15 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !183
  store i32 %14, i32* %arrayidx10, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %16, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !190
  store i32 0, i32* %arrayidx11, align 4, !dbg !191
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !192
  call void @printWLine(i32* %arraydecay12), !dbg !193
  %17 = load i32*, i32** %data3, align 8, !dbg !194
  %18 = bitcast i32* %17 to i8*, !dbg !194
  call void @free(i8* %18) #6, !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_32.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocation(line: 32, column: 27, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 14, scope: !29)
!36 = !DILocation(line: 33, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 33, column: 13)
!38 = !DILocation(line: 33, column: 18, scope: !37)
!39 = !DILocation(line: 33, column: 13, scope: !29)
!40 = !DILocation(line: 33, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 33, column: 27)
!42 = !DILocation(line: 34, column: 17, scope: !29)
!43 = !DILocation(line: 34, column: 9, scope: !29)
!44 = !DILocation(line: 35, column: 9, scope: !29)
!45 = !DILocation(line: 35, column: 20, scope: !29)
!46 = !DILocation(line: 36, column: 21, scope: !29)
!47 = !DILocation(line: 36, column: 10, scope: !29)
!48 = !DILocation(line: 36, column: 19, scope: !29)
!49 = !DILocalVariable(name: "data", scope: !50, file: !17, line: 39, type: !4)
!50 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!51 = !DILocation(line: 39, column: 19, scope: !50)
!52 = !DILocation(line: 39, column: 27, scope: !50)
!53 = !DILocation(line: 39, column: 26, scope: !50)
!54 = !DILocalVariable(name: "i", scope: !55, file: !17, line: 41, type: !56)
!55 = distinct !DILexicalBlock(scope: !50, file: !17, line: 40, column: 9)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !57)
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 41, column: 20, scope: !55)
!59 = !DILocalVariable(name: "destLen", scope: !55, file: !17, line: 41, type: !56)
!60 = !DILocation(line: 41, column: 23, scope: !55)
!61 = !DILocalVariable(name: "dest", scope: !55, file: !17, line: 42, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 100)
!65 = !DILocation(line: 42, column: 21, scope: !55)
!66 = !DILocation(line: 43, column: 21, scope: !55)
!67 = !DILocation(line: 43, column: 13, scope: !55)
!68 = !DILocation(line: 44, column: 13, scope: !55)
!69 = !DILocation(line: 44, column: 25, scope: !55)
!70 = !DILocation(line: 45, column: 30, scope: !55)
!71 = !DILocation(line: 45, column: 23, scope: !55)
!72 = !DILocation(line: 45, column: 21, scope: !55)
!73 = !DILocation(line: 48, column: 20, scope: !74)
!74 = distinct !DILexicalBlock(scope: !55, file: !17, line: 48, column: 13)
!75 = !DILocation(line: 48, column: 18, scope: !74)
!76 = !DILocation(line: 48, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !17, line: 48, column: 13)
!78 = !DILocation(line: 48, column: 29, scope: !77)
!79 = !DILocation(line: 48, column: 27, scope: !77)
!80 = !DILocation(line: 48, column: 13, scope: !74)
!81 = !DILocation(line: 50, column: 27, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !17, line: 49, column: 13)
!83 = !DILocation(line: 50, column: 32, scope: !82)
!84 = !DILocation(line: 50, column: 22, scope: !82)
!85 = !DILocation(line: 50, column: 17, scope: !82)
!86 = !DILocation(line: 50, column: 25, scope: !82)
!87 = !DILocation(line: 51, column: 13, scope: !82)
!88 = !DILocation(line: 48, column: 39, scope: !77)
!89 = !DILocation(line: 48, column: 13, scope: !77)
!90 = distinct !{!90, !80, !91, !92}
!91 = !DILocation(line: 51, column: 13, scope: !74)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 52, column: 13, scope: !55)
!94 = !DILocation(line: 52, column: 25, scope: !55)
!95 = !DILocation(line: 53, column: 24, scope: !55)
!96 = !DILocation(line: 53, column: 13, scope: !55)
!97 = !DILocation(line: 54, column: 18, scope: !55)
!98 = !DILocation(line: 54, column: 13, scope: !55)
!99 = !DILocation(line: 57, column: 1, scope: !16)
!100 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_32_good", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 102, column: 5, scope: !100)
!102 = !DILocation(line: 103, column: 1, scope: !100)
!103 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 114, type: !104, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!7, !7, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !17, line: 114, type: !7)
!110 = !DILocation(line: 114, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !17, line: 114, type: !106)
!112 = !DILocation(line: 114, column: 27, scope: !103)
!113 = !DILocation(line: 117, column: 22, scope: !103)
!114 = !DILocation(line: 117, column: 12, scope: !103)
!115 = !DILocation(line: 117, column: 5, scope: !103)
!116 = !DILocation(line: 119, column: 5, scope: !103)
!117 = !DILocation(line: 120, column: 5, scope: !103)
!118 = !DILocation(line: 121, column: 5, scope: !103)
!119 = !DILocation(line: 124, column: 5, scope: !103)
!120 = !DILocation(line: 125, column: 5, scope: !103)
!121 = !DILocation(line: 126, column: 5, scope: !103)
!122 = !DILocation(line: 128, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 66, type: !4)
!125 = !DILocation(line: 66, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataPtr1", scope: !123, file: !17, line: 67, type: !23)
!127 = !DILocation(line: 67, column: 16, scope: !123)
!128 = !DILocalVariable(name: "dataPtr2", scope: !123, file: !17, line: 68, type: !23)
!129 = !DILocation(line: 68, column: 16, scope: !123)
!130 = !DILocation(line: 69, column: 10, scope: !123)
!131 = !DILocalVariable(name: "data", scope: !132, file: !17, line: 71, type: !4)
!132 = distinct !DILexicalBlock(scope: !123, file: !17, line: 70, column: 5)
!133 = !DILocation(line: 71, column: 19, scope: !132)
!134 = !DILocation(line: 71, column: 27, scope: !132)
!135 = !DILocation(line: 71, column: 26, scope: !132)
!136 = !DILocation(line: 73, column: 27, scope: !132)
!137 = !DILocation(line: 73, column: 16, scope: !132)
!138 = !DILocation(line: 73, column: 14, scope: !132)
!139 = !DILocation(line: 74, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !17, line: 74, column: 13)
!141 = !DILocation(line: 74, column: 18, scope: !140)
!142 = !DILocation(line: 74, column: 13, scope: !132)
!143 = !DILocation(line: 74, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 74, column: 27)
!145 = !DILocation(line: 75, column: 17, scope: !132)
!146 = !DILocation(line: 75, column: 9, scope: !132)
!147 = !DILocation(line: 76, column: 9, scope: !132)
!148 = !DILocation(line: 76, column: 21, scope: !132)
!149 = !DILocation(line: 77, column: 21, scope: !132)
!150 = !DILocation(line: 77, column: 10, scope: !132)
!151 = !DILocation(line: 77, column: 19, scope: !132)
!152 = !DILocalVariable(name: "data", scope: !153, file: !17, line: 80, type: !4)
!153 = distinct !DILexicalBlock(scope: !123, file: !17, line: 79, column: 5)
!154 = !DILocation(line: 80, column: 19, scope: !153)
!155 = !DILocation(line: 80, column: 27, scope: !153)
!156 = !DILocation(line: 80, column: 26, scope: !153)
!157 = !DILocalVariable(name: "i", scope: !158, file: !17, line: 82, type: !56)
!158 = distinct !DILexicalBlock(scope: !153, file: !17, line: 81, column: 9)
!159 = !DILocation(line: 82, column: 20, scope: !158)
!160 = !DILocalVariable(name: "destLen", scope: !158, file: !17, line: 82, type: !56)
!161 = !DILocation(line: 82, column: 23, scope: !158)
!162 = !DILocalVariable(name: "dest", scope: !158, file: !17, line: 83, type: !62)
!163 = !DILocation(line: 83, column: 21, scope: !158)
!164 = !DILocation(line: 84, column: 21, scope: !158)
!165 = !DILocation(line: 84, column: 13, scope: !158)
!166 = !DILocation(line: 85, column: 13, scope: !158)
!167 = !DILocation(line: 85, column: 25, scope: !158)
!168 = !DILocation(line: 86, column: 30, scope: !158)
!169 = !DILocation(line: 86, column: 23, scope: !158)
!170 = !DILocation(line: 86, column: 21, scope: !158)
!171 = !DILocation(line: 89, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !158, file: !17, line: 89, column: 13)
!173 = !DILocation(line: 89, column: 18, scope: !172)
!174 = !DILocation(line: 89, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !17, line: 89, column: 13)
!176 = !DILocation(line: 89, column: 29, scope: !175)
!177 = !DILocation(line: 89, column: 27, scope: !175)
!178 = !DILocation(line: 89, column: 13, scope: !172)
!179 = !DILocation(line: 91, column: 27, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !17, line: 90, column: 13)
!181 = !DILocation(line: 91, column: 32, scope: !180)
!182 = !DILocation(line: 91, column: 22, scope: !180)
!183 = !DILocation(line: 91, column: 17, scope: !180)
!184 = !DILocation(line: 91, column: 25, scope: !180)
!185 = !DILocation(line: 92, column: 13, scope: !180)
!186 = !DILocation(line: 89, column: 39, scope: !175)
!187 = !DILocation(line: 89, column: 13, scope: !175)
!188 = distinct !{!188, !178, !189, !92}
!189 = !DILocation(line: 92, column: 13, scope: !172)
!190 = !DILocation(line: 93, column: 13, scope: !158)
!191 = !DILocation(line: 93, column: 25, scope: !158)
!192 = !DILocation(line: 94, column: 24, scope: !158)
!193 = !DILocation(line: 94, column: 13, scope: !158)
!194 = !DILocation(line: 95, column: 18, scope: !158)
!195 = !DILocation(line: 95, column: 13, scope: !158)
!196 = !DILocation(line: 98, column: 1, scope: !123)
