; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_wchar_t_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__malloc_wchar_t_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  store i32* %4, i32** @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_badData, align 8, !dbg !42
  call void @badSink(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i32*, i32** @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_badData, align 8, !dbg !71
  store i32* %0, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !72, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !79, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %call2 = call i64 @wcslen(i32* %arraydecay1) #8, !dbg !89
  store i64 %call2, i64* %destLen, align 8, !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !94
  %2 = load i64, i64* %destLen, align 8, !dbg !96
  %cmp = icmp ult i64 %1, %2, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %4 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !99
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !99
  %6 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !103
  store i32 %5, i32* %arrayidx4, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %7, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay6), !dbg !114
  %8 = load i32*, i32** %data, align 8, !dbg !115
  %9 = bitcast i32* %8 to i8*, !dbg !115
  call void @free(i8* %9) #6, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32* null, i32** %data, align 8, !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !122
  %0 = bitcast i8* %call to i32*, !dbg !123
  store i32* %0, i32** %data, align 8, !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %cmp = icmp eq i32* %1, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  %4 = load i32*, i32** %data, align 8, !dbg !135
  store i32* %4, i32** @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_goodG2BData, align 8, !dbg !136
  call void @goodG2BSink(), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = load i32*, i32** @CWE126_Buffer_Overread__malloc_wchar_t_loop_45_goodG2BData, align 8, !dbg !142
  store i32* %0, i32** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !151
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !154
  %call2 = call i64 @wcslen(i32* %arraydecay1) #8, !dbg !155
  store i64 %call2, i64* %destLen, align 8, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !160
  %2 = load i64, i64* %destLen, align 8, !dbg !162
  %cmp = icmp ult i64 %1, %2, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !165
  %4 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !165
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !165
  %6 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !169
  store i32 %5, i32* %arrayidx4, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %7, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx5, align 4, !dbg !177
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !178
  call void @printWLine(i32* %arraydecay6), !dbg !179
  %8 = load i32*, i32** %data, align 8, !dbg !180
  %9 = bitcast i32* %8 to i8*, !dbg !180
  call void @free(i8* %9) #6, !dbg !181
  ret void, !dbg !182
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_45_bad", scope: !15, file: !15, line: 47, type: !23, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 49, type: !6)
!26 = !DILocation(line: 49, column: 15, scope: !22)
!27 = !DILocation(line: 50, column: 10, scope: !22)
!28 = !DILocation(line: 52, column: 23, scope: !22)
!29 = !DILocation(line: 52, column: 12, scope: !22)
!30 = !DILocation(line: 52, column: 10, scope: !22)
!31 = !DILocation(line: 53, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 53, column: 9)
!33 = !DILocation(line: 53, column: 14, scope: !32)
!34 = !DILocation(line: 53, column: 9, scope: !22)
!35 = !DILocation(line: 53, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 53, column: 23)
!37 = !DILocation(line: 54, column: 13, scope: !22)
!38 = !DILocation(line: 54, column: 5, scope: !22)
!39 = !DILocation(line: 55, column: 5, scope: !22)
!40 = !DILocation(line: 55, column: 16, scope: !22)
!41 = !DILocation(line: 56, column: 62, scope: !22)
!42 = !DILocation(line: 56, column: 60, scope: !22)
!43 = !DILocation(line: 57, column: 5, scope: !22)
!44 = !DILocation(line: 58, column: 1, scope: !22)
!45 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_45_good", scope: !15, file: !15, line: 99, type: !23, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DILocation(line: 101, column: 5, scope: !45)
!47 = !DILocation(line: 102, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !49, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!9, !9, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !15, line: 113, type: !9)
!55 = !DILocation(line: 113, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !15, line: 113, type: !51)
!57 = !DILocation(line: 113, column: 27, scope: !48)
!58 = !DILocation(line: 116, column: 22, scope: !48)
!59 = !DILocation(line: 116, column: 12, scope: !48)
!60 = !DILocation(line: 116, column: 5, scope: !48)
!61 = !DILocation(line: 118, column: 5, scope: !48)
!62 = !DILocation(line: 119, column: 5, scope: !48)
!63 = !DILocation(line: 120, column: 5, scope: !48)
!64 = !DILocation(line: 123, column: 5, scope: !48)
!65 = !DILocation(line: 124, column: 5, scope: !48)
!66 = !DILocation(line: 125, column: 5, scope: !48)
!67 = !DILocation(line: 127, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !15, line: 28, type: !6)
!70 = !DILocation(line: 28, column: 15, scope: !68)
!71 = !DILocation(line: 28, column: 22, scope: !68)
!72 = !DILocalVariable(name: "i", scope: !73, file: !15, line: 30, type: !74)
!73 = distinct !DILexicalBlock(scope: !68, file: !15, line: 29, column: 5)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !75)
!75 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!76 = !DILocation(line: 30, column: 16, scope: !73)
!77 = !DILocalVariable(name: "destLen", scope: !73, file: !15, line: 30, type: !74)
!78 = !DILocation(line: 30, column: 19, scope: !73)
!79 = !DILocalVariable(name: "dest", scope: !73, file: !15, line: 31, type: !80)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 100)
!83 = !DILocation(line: 31, column: 17, scope: !73)
!84 = !DILocation(line: 32, column: 17, scope: !73)
!85 = !DILocation(line: 32, column: 9, scope: !73)
!86 = !DILocation(line: 33, column: 9, scope: !73)
!87 = !DILocation(line: 33, column: 21, scope: !73)
!88 = !DILocation(line: 34, column: 26, scope: !73)
!89 = !DILocation(line: 34, column: 19, scope: !73)
!90 = !DILocation(line: 34, column: 17, scope: !73)
!91 = !DILocation(line: 37, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !73, file: !15, line: 37, column: 9)
!93 = !DILocation(line: 37, column: 14, scope: !92)
!94 = !DILocation(line: 37, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 37, column: 9)
!96 = !DILocation(line: 37, column: 25, scope: !95)
!97 = !DILocation(line: 37, column: 23, scope: !95)
!98 = !DILocation(line: 37, column: 9, scope: !92)
!99 = !DILocation(line: 39, column: 23, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !15, line: 38, column: 9)
!101 = !DILocation(line: 39, column: 28, scope: !100)
!102 = !DILocation(line: 39, column: 18, scope: !100)
!103 = !DILocation(line: 39, column: 13, scope: !100)
!104 = !DILocation(line: 39, column: 21, scope: !100)
!105 = !DILocation(line: 40, column: 9, scope: !100)
!106 = !DILocation(line: 37, column: 35, scope: !95)
!107 = !DILocation(line: 37, column: 9, scope: !95)
!108 = distinct !{!108, !98, !109, !110}
!109 = !DILocation(line: 40, column: 9, scope: !92)
!110 = !{!"llvm.loop.mustprogress"}
!111 = !DILocation(line: 41, column: 9, scope: !73)
!112 = !DILocation(line: 41, column: 21, scope: !73)
!113 = !DILocation(line: 42, column: 20, scope: !73)
!114 = !DILocation(line: 42, column: 9, scope: !73)
!115 = !DILocation(line: 43, column: 14, scope: !73)
!116 = !DILocation(line: 43, column: 9, scope: !73)
!117 = !DILocation(line: 45, column: 1, scope: !68)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 86, type: !23, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 88, type: !6)
!120 = !DILocation(line: 88, column: 15, scope: !118)
!121 = !DILocation(line: 89, column: 10, scope: !118)
!122 = !DILocation(line: 91, column: 23, scope: !118)
!123 = !DILocation(line: 91, column: 12, scope: !118)
!124 = !DILocation(line: 91, column: 10, scope: !118)
!125 = !DILocation(line: 92, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !118, file: !15, line: 92, column: 9)
!127 = !DILocation(line: 92, column: 14, scope: !126)
!128 = !DILocation(line: 92, column: 9, scope: !118)
!129 = !DILocation(line: 92, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 92, column: 23)
!131 = !DILocation(line: 93, column: 13, scope: !118)
!132 = !DILocation(line: 93, column: 5, scope: !118)
!133 = !DILocation(line: 94, column: 5, scope: !118)
!134 = !DILocation(line: 94, column: 17, scope: !118)
!135 = !DILocation(line: 95, column: 66, scope: !118)
!136 = !DILocation(line: 95, column: 64, scope: !118)
!137 = !DILocation(line: 96, column: 5, scope: !118)
!138 = !DILocation(line: 97, column: 1, scope: !118)
!139 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 65, type: !23, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !15, line: 67, type: !6)
!141 = !DILocation(line: 67, column: 15, scope: !139)
!142 = !DILocation(line: 67, column: 22, scope: !139)
!143 = !DILocalVariable(name: "i", scope: !144, file: !15, line: 69, type: !74)
!144 = distinct !DILexicalBlock(scope: !139, file: !15, line: 68, column: 5)
!145 = !DILocation(line: 69, column: 16, scope: !144)
!146 = !DILocalVariable(name: "destLen", scope: !144, file: !15, line: 69, type: !74)
!147 = !DILocation(line: 69, column: 19, scope: !144)
!148 = !DILocalVariable(name: "dest", scope: !144, file: !15, line: 70, type: !80)
!149 = !DILocation(line: 70, column: 17, scope: !144)
!150 = !DILocation(line: 71, column: 17, scope: !144)
!151 = !DILocation(line: 71, column: 9, scope: !144)
!152 = !DILocation(line: 72, column: 9, scope: !144)
!153 = !DILocation(line: 72, column: 21, scope: !144)
!154 = !DILocation(line: 73, column: 26, scope: !144)
!155 = !DILocation(line: 73, column: 19, scope: !144)
!156 = !DILocation(line: 73, column: 17, scope: !144)
!157 = !DILocation(line: 76, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !144, file: !15, line: 76, column: 9)
!159 = !DILocation(line: 76, column: 14, scope: !158)
!160 = !DILocation(line: 76, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 76, column: 9)
!162 = !DILocation(line: 76, column: 25, scope: !161)
!163 = !DILocation(line: 76, column: 23, scope: !161)
!164 = !DILocation(line: 76, column: 9, scope: !158)
!165 = !DILocation(line: 78, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !15, line: 77, column: 9)
!167 = !DILocation(line: 78, column: 28, scope: !166)
!168 = !DILocation(line: 78, column: 18, scope: !166)
!169 = !DILocation(line: 78, column: 13, scope: !166)
!170 = !DILocation(line: 78, column: 21, scope: !166)
!171 = !DILocation(line: 79, column: 9, scope: !166)
!172 = !DILocation(line: 76, column: 35, scope: !161)
!173 = !DILocation(line: 76, column: 9, scope: !161)
!174 = distinct !{!174, !164, !175, !110}
!175 = !DILocation(line: 79, column: 9, scope: !158)
!176 = !DILocation(line: 80, column: 9, scope: !144)
!177 = !DILocation(line: 80, column: 21, scope: !144)
!178 = !DILocation(line: 81, column: 20, scope: !144)
!179 = !DILocation(line: 81, column: 9, scope: !144)
!180 = !DILocation(line: 82, column: 14, scope: !144)
!181 = !DILocation(line: 82, column: 9, scope: !144)
!182 = !DILocation(line: 84, column: 1, scope: !139)
