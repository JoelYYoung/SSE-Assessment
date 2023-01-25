; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !35
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !39
  store i64 %call2, i64* %destLen, align 8, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !44
  %1 = load i64, i64* %destLen, align 8, !dbg !46
  %cmp = icmp ult i64 %0, %1, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !49
  %3 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !49
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !49
  %5 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !53
  store i32 %4, i32* %arrayidx4, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %6, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx5, align 4, !dbg !62
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay6), !dbg !64
  %7 = load i32*, i32** %data.addr, align 8, !dbg !65
  %8 = bitcast i32* %7 to i8*, !dbg !65
  call void @free(i8* %8) #6, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_bad() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !75
  store i32* %0, i32** %data, align 8, !dbg !76
  %1 = load i32*, i32** %data, align 8, !dbg !77
  %cmp = icmp eq i32* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_badSink(i32* %4), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_goodG2BSink(i32* %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !100
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !101
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !105
  store i64 %call2, i64* %destLen, align 8, !dbg !106
  store i64 0, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !110
  %1 = load i64, i64* %destLen, align 8, !dbg !112
  %cmp = icmp ult i64 %0, %1, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !115
  %3 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !115
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !119
  store i32 %4, i32* %arrayidx4, align 4, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %6, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx5, align 4, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* %arraydecay6), !dbg !129
  %7 = load i32*, i32** %data.addr, align 8, !dbg !130
  %8 = bitcast i32* %7 to i8*, !dbg !130
  call void @free(i8* %8) #6, !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_good() #0 !dbg !133 {
entry:
  call void @goodG2B(), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !136 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !142, metadata !DIExpression()), !dbg !143
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !144, metadata !DIExpression()), !dbg !145
  %call = call i64 @time(i64* null) #6, !dbg !146
  %conv = trunc i64 %call to i32, !dbg !147
  call void @srand(i32 %conv) #6, !dbg !148
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !149
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_good(), !dbg !150
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !151
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !152
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_bad(), !dbg !153
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !154
  ret i32 0, !dbg !155
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  store i32* null, i32** %data, align 8, !dbg !159
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !160
  %0 = bitcast i8* %call to i32*, !dbg !161
  store i32* %0, i32** %data, align 8, !dbg !162
  %1 = load i32*, i32** %data, align 8, !dbg !163
  %cmp = icmp eq i32* %1, null, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !169
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !170
  %3 = load i32*, i32** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  %4 = load i32*, i32** %data, align 8, !dbg !173
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_goodG2BSink(i32* %4), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 71, scope: !16)
!22 = !DILocalVariable(name: "i", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !25)
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 26, column: 16, scope: !23)
!27 = !DILocalVariable(name: "destLen", scope: !23, file: !17, line: 26, type: !24)
!28 = !DILocation(line: 26, column: 19, scope: !23)
!29 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 17, scope: !23)
!34 = !DILocation(line: 28, column: 17, scope: !23)
!35 = !DILocation(line: 28, column: 9, scope: !23)
!36 = !DILocation(line: 29, column: 9, scope: !23)
!37 = !DILocation(line: 29, column: 21, scope: !23)
!38 = !DILocation(line: 30, column: 26, scope: !23)
!39 = !DILocation(line: 30, column: 19, scope: !23)
!40 = !DILocation(line: 30, column: 17, scope: !23)
!41 = !DILocation(line: 33, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !23, file: !17, line: 33, column: 9)
!43 = !DILocation(line: 33, column: 14, scope: !42)
!44 = !DILocation(line: 33, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !17, line: 33, column: 9)
!46 = !DILocation(line: 33, column: 25, scope: !45)
!47 = !DILocation(line: 33, column: 23, scope: !45)
!48 = !DILocation(line: 33, column: 9, scope: !42)
!49 = !DILocation(line: 35, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !17, line: 34, column: 9)
!51 = !DILocation(line: 35, column: 28, scope: !50)
!52 = !DILocation(line: 35, column: 18, scope: !50)
!53 = !DILocation(line: 35, column: 13, scope: !50)
!54 = !DILocation(line: 35, column: 21, scope: !50)
!55 = !DILocation(line: 36, column: 9, scope: !50)
!56 = !DILocation(line: 33, column: 35, scope: !45)
!57 = !DILocation(line: 33, column: 9, scope: !45)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 36, column: 9, scope: !42)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 37, column: 9, scope: !23)
!62 = !DILocation(line: 37, column: 21, scope: !23)
!63 = !DILocation(line: 38, column: 20, scope: !23)
!64 = !DILocation(line: 38, column: 9, scope: !23)
!65 = !DILocation(line: 39, column: 14, scope: !23)
!66 = !DILocation(line: 39, column: 9, scope: !23)
!67 = !DILocation(line: 41, column: 1, scope: !16)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_bad", scope: !17, file: !17, line: 43, type: !69, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{null}
!71 = !DILocalVariable(name: "data", scope: !68, file: !17, line: 45, type: !4)
!72 = !DILocation(line: 45, column: 15, scope: !68)
!73 = !DILocation(line: 46, column: 10, scope: !68)
!74 = !DILocation(line: 48, column: 23, scope: !68)
!75 = !DILocation(line: 48, column: 12, scope: !68)
!76 = !DILocation(line: 48, column: 10, scope: !68)
!77 = !DILocation(line: 49, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !68, file: !17, line: 49, column: 9)
!79 = !DILocation(line: 49, column: 14, scope: !78)
!80 = !DILocation(line: 49, column: 9, scope: !68)
!81 = !DILocation(line: 49, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !17, line: 49, column: 23)
!83 = !DILocation(line: 50, column: 13, scope: !68)
!84 = !DILocation(line: 50, column: 5, scope: !68)
!85 = !DILocation(line: 51, column: 5, scope: !68)
!86 = !DILocation(line: 51, column: 16, scope: !68)
!87 = !DILocation(line: 52, column: 60, scope: !68)
!88 = !DILocation(line: 52, column: 5, scope: !68)
!89 = !DILocation(line: 53, column: 1, scope: !68)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_goodG2BSink", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !17, line: 59, type: !4)
!92 = !DILocation(line: 59, column: 75, scope: !90)
!93 = !DILocalVariable(name: "i", scope: !94, file: !17, line: 62, type: !24)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 61, column: 5)
!95 = !DILocation(line: 62, column: 16, scope: !94)
!96 = !DILocalVariable(name: "destLen", scope: !94, file: !17, line: 62, type: !24)
!97 = !DILocation(line: 62, column: 19, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !94, file: !17, line: 63, type: !30)
!99 = !DILocation(line: 63, column: 17, scope: !94)
!100 = !DILocation(line: 64, column: 17, scope: !94)
!101 = !DILocation(line: 64, column: 9, scope: !94)
!102 = !DILocation(line: 65, column: 9, scope: !94)
!103 = !DILocation(line: 65, column: 21, scope: !94)
!104 = !DILocation(line: 66, column: 26, scope: !94)
!105 = !DILocation(line: 66, column: 19, scope: !94)
!106 = !DILocation(line: 66, column: 17, scope: !94)
!107 = !DILocation(line: 69, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !94, file: !17, line: 69, column: 9)
!109 = !DILocation(line: 69, column: 14, scope: !108)
!110 = !DILocation(line: 69, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !17, line: 69, column: 9)
!112 = !DILocation(line: 69, column: 25, scope: !111)
!113 = !DILocation(line: 69, column: 23, scope: !111)
!114 = !DILocation(line: 69, column: 9, scope: !108)
!115 = !DILocation(line: 71, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !17, line: 70, column: 9)
!117 = !DILocation(line: 71, column: 28, scope: !116)
!118 = !DILocation(line: 71, column: 18, scope: !116)
!119 = !DILocation(line: 71, column: 13, scope: !116)
!120 = !DILocation(line: 71, column: 21, scope: !116)
!121 = !DILocation(line: 72, column: 9, scope: !116)
!122 = !DILocation(line: 69, column: 35, scope: !111)
!123 = !DILocation(line: 69, column: 9, scope: !111)
!124 = distinct !{!124, !114, !125, !60}
!125 = !DILocation(line: 72, column: 9, scope: !108)
!126 = !DILocation(line: 73, column: 9, scope: !94)
!127 = !DILocation(line: 73, column: 21, scope: !94)
!128 = !DILocation(line: 74, column: 20, scope: !94)
!129 = !DILocation(line: 74, column: 9, scope: !94)
!130 = !DILocation(line: 75, column: 14, scope: !94)
!131 = !DILocation(line: 75, column: 9, scope: !94)
!132 = !DILocation(line: 77, column: 1, scope: !90)
!133 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_good", scope: !17, file: !17, line: 92, type: !69, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocation(line: 94, column: 5, scope: !133)
!135 = !DILocation(line: 95, column: 1, scope: !133)
!136 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 107, type: !137, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DISubroutineType(types: !138)
!138 = !{!7, !7, !139}
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!142 = !DILocalVariable(name: "argc", arg: 1, scope: !136, file: !17, line: 107, type: !7)
!143 = !DILocation(line: 107, column: 14, scope: !136)
!144 = !DILocalVariable(name: "argv", arg: 2, scope: !136, file: !17, line: 107, type: !139)
!145 = !DILocation(line: 107, column: 27, scope: !136)
!146 = !DILocation(line: 110, column: 22, scope: !136)
!147 = !DILocation(line: 110, column: 12, scope: !136)
!148 = !DILocation(line: 110, column: 5, scope: !136)
!149 = !DILocation(line: 112, column: 5, scope: !136)
!150 = !DILocation(line: 113, column: 5, scope: !136)
!151 = !DILocation(line: 114, column: 5, scope: !136)
!152 = !DILocation(line: 117, column: 5, scope: !136)
!153 = !DILocation(line: 118, column: 5, scope: !136)
!154 = !DILocation(line: 119, column: 5, scope: !136)
!155 = !DILocation(line: 121, column: 5, scope: !136)
!156 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 80, type: !69, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !17, line: 82, type: !4)
!158 = !DILocation(line: 82, column: 15, scope: !156)
!159 = !DILocation(line: 83, column: 10, scope: !156)
!160 = !DILocation(line: 85, column: 23, scope: !156)
!161 = !DILocation(line: 85, column: 12, scope: !156)
!162 = !DILocation(line: 85, column: 10, scope: !156)
!163 = !DILocation(line: 86, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !17, line: 86, column: 9)
!165 = !DILocation(line: 86, column: 14, scope: !164)
!166 = !DILocation(line: 86, column: 9, scope: !156)
!167 = !DILocation(line: 86, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !17, line: 86, column: 23)
!169 = !DILocation(line: 87, column: 13, scope: !156)
!170 = !DILocation(line: 87, column: 5, scope: !156)
!171 = !DILocation(line: 88, column: 5, scope: !156)
!172 = !DILocation(line: 88, column: 17, scope: !156)
!173 = !DILocation(line: 89, column: 64, scope: !156)
!174 = !DILocation(line: 89, column: 5, scope: !156)
!175 = !DILocation(line: 90, column: 1, scope: !156)
