; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__malloc_wchar_t_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %dataBuffer, align 8, !dbg !30
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !40
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  store i32* %5, i32** @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_badData, align 8, !dbg !47
  call void @badSink(), !dbg !48
  ret void, !dbg !49
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32*, i32** @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_badData, align 8, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !88
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !94
  %cmp = icmp ult i64 %1, 100, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %3 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !98
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !98
  %5 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !102
  store i32 %4, i32* %arrayidx2, align 4, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %6, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx3, align 4, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay4), !dbg !113
  ret void, !dbg !114
}

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32* null, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !122
  %0 = bitcast i8* %call to i32*, !dbg !123
  store i32* %0, i32** %dataBuffer, align 8, !dbg !121
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %cmp = icmp eq i32* %1, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !131
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  store i32* %4, i32** %data, align 8, !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  store i32* %5, i32** @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_goodG2BData, align 8, !dbg !137
  call void @goodG2BSink(), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !140 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = load i32*, i32** @CWE127_Buffer_Underread__malloc_wchar_t_loop_45_goodG2BData, align 8, !dbg !143
  store i32* %0, i32** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !150
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx, align 4, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %1, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !160
  %3 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !160
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !160
  %5 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !164
  store i32 %4, i32* %arrayidx2, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %6, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx3, align 4, !dbg !172
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  call void @printWLine(i32* %arraydecay4), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_45_bad", scope: !15, file: !15, line: 47, type: !23, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 49, type: !6)
!26 = !DILocation(line: 49, column: 15, scope: !22)
!27 = !DILocation(line: 50, column: 10, scope: !22)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !15, line: 52, type: !6)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 51, column: 5)
!30 = !DILocation(line: 52, column: 19, scope: !29)
!31 = !DILocation(line: 52, column: 43, scope: !29)
!32 = !DILocation(line: 52, column: 32, scope: !29)
!33 = !DILocation(line: 53, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !15, line: 53, column: 13)
!35 = !DILocation(line: 53, column: 24, scope: !34)
!36 = !DILocation(line: 53, column: 13, scope: !29)
!37 = !DILocation(line: 53, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 53, column: 33)
!39 = !DILocation(line: 54, column: 17, scope: !29)
!40 = !DILocation(line: 54, column: 9, scope: !29)
!41 = !DILocation(line: 55, column: 9, scope: !29)
!42 = !DILocation(line: 55, column: 27, scope: !29)
!43 = !DILocation(line: 57, column: 16, scope: !29)
!44 = !DILocation(line: 57, column: 27, scope: !29)
!45 = !DILocation(line: 57, column: 14, scope: !29)
!46 = !DILocation(line: 59, column: 63, scope: !22)
!47 = !DILocation(line: 59, column: 61, scope: !22)
!48 = !DILocation(line: 60, column: 5, scope: !22)
!49 = !DILocation(line: 61, column: 1, scope: !22)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_45_good", scope: !15, file: !15, line: 105, type: !23, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 107, column: 5, scope: !50)
!52 = !DILocation(line: 108, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !54, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!9, !9, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 119, type: !9)
!60 = !DILocation(line: 119, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 119, type: !56)
!62 = !DILocation(line: 119, column: 27, scope: !53)
!63 = !DILocation(line: 122, column: 22, scope: !53)
!64 = !DILocation(line: 122, column: 12, scope: !53)
!65 = !DILocation(line: 122, column: 5, scope: !53)
!66 = !DILocation(line: 124, column: 5, scope: !53)
!67 = !DILocation(line: 125, column: 5, scope: !53)
!68 = !DILocation(line: 126, column: 5, scope: !53)
!69 = !DILocation(line: 129, column: 5, scope: !53)
!70 = !DILocation(line: 130, column: 5, scope: !53)
!71 = !DILocation(line: 131, column: 5, scope: !53)
!72 = !DILocation(line: 133, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 28, type: !6)
!75 = !DILocation(line: 28, column: 15, scope: !73)
!76 = !DILocation(line: 28, column: 22, scope: !73)
!77 = !DILocalVariable(name: "i", scope: !78, file: !15, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !73, file: !15, line: 29, column: 5)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !80)
!80 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!81 = !DILocation(line: 30, column: 16, scope: !78)
!82 = !DILocalVariable(name: "dest", scope: !78, file: !15, line: 31, type: !83)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 100)
!86 = !DILocation(line: 31, column: 17, scope: !78)
!87 = !DILocation(line: 32, column: 17, scope: !78)
!88 = !DILocation(line: 32, column: 9, scope: !78)
!89 = !DILocation(line: 33, column: 9, scope: !78)
!90 = !DILocation(line: 33, column: 21, scope: !78)
!91 = !DILocation(line: 35, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !78, file: !15, line: 35, column: 9)
!93 = !DILocation(line: 35, column: 14, scope: !92)
!94 = !DILocation(line: 35, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 35, column: 9)
!96 = !DILocation(line: 35, column: 23, scope: !95)
!97 = !DILocation(line: 35, column: 9, scope: !92)
!98 = !DILocation(line: 37, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 36, column: 9)
!100 = !DILocation(line: 37, column: 28, scope: !99)
!101 = !DILocation(line: 37, column: 18, scope: !99)
!102 = !DILocation(line: 37, column: 13, scope: !99)
!103 = !DILocation(line: 37, column: 21, scope: !99)
!104 = !DILocation(line: 38, column: 9, scope: !99)
!105 = !DILocation(line: 35, column: 31, scope: !95)
!106 = !DILocation(line: 35, column: 9, scope: !95)
!107 = distinct !{!107, !97, !108, !109}
!108 = !DILocation(line: 38, column: 9, scope: !92)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 40, column: 9, scope: !78)
!111 = !DILocation(line: 40, column: 21, scope: !78)
!112 = !DILocation(line: 41, column: 20, scope: !78)
!113 = !DILocation(line: 41, column: 9, scope: !78)
!114 = !DILocation(line: 45, column: 1, scope: !73)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 89, type: !23, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 91, type: !6)
!117 = !DILocation(line: 91, column: 15, scope: !115)
!118 = !DILocation(line: 92, column: 10, scope: !115)
!119 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !15, line: 94, type: !6)
!120 = distinct !DILexicalBlock(scope: !115, file: !15, line: 93, column: 5)
!121 = !DILocation(line: 94, column: 19, scope: !120)
!122 = !DILocation(line: 94, column: 43, scope: !120)
!123 = !DILocation(line: 94, column: 32, scope: !120)
!124 = !DILocation(line: 95, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !15, line: 95, column: 13)
!126 = !DILocation(line: 95, column: 24, scope: !125)
!127 = !DILocation(line: 95, column: 13, scope: !120)
!128 = !DILocation(line: 95, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 95, column: 33)
!130 = !DILocation(line: 96, column: 17, scope: !120)
!131 = !DILocation(line: 96, column: 9, scope: !120)
!132 = !DILocation(line: 97, column: 9, scope: !120)
!133 = !DILocation(line: 97, column: 27, scope: !120)
!134 = !DILocation(line: 99, column: 16, scope: !120)
!135 = !DILocation(line: 99, column: 14, scope: !120)
!136 = !DILocation(line: 101, column: 67, scope: !115)
!137 = !DILocation(line: 101, column: 65, scope: !115)
!138 = !DILocation(line: 102, column: 5, scope: !115)
!139 = !DILocation(line: 103, column: 1, scope: !115)
!140 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 68, type: !23, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocalVariable(name: "data", scope: !140, file: !15, line: 70, type: !6)
!142 = !DILocation(line: 70, column: 15, scope: !140)
!143 = !DILocation(line: 70, column: 22, scope: !140)
!144 = !DILocalVariable(name: "i", scope: !145, file: !15, line: 72, type: !79)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 71, column: 5)
!146 = !DILocation(line: 72, column: 16, scope: !145)
!147 = !DILocalVariable(name: "dest", scope: !145, file: !15, line: 73, type: !83)
!148 = !DILocation(line: 73, column: 17, scope: !145)
!149 = !DILocation(line: 74, column: 17, scope: !145)
!150 = !DILocation(line: 74, column: 9, scope: !145)
!151 = !DILocation(line: 75, column: 9, scope: !145)
!152 = !DILocation(line: 75, column: 21, scope: !145)
!153 = !DILocation(line: 77, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !145, file: !15, line: 77, column: 9)
!155 = !DILocation(line: 77, column: 14, scope: !154)
!156 = !DILocation(line: 77, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !15, line: 77, column: 9)
!158 = !DILocation(line: 77, column: 23, scope: !157)
!159 = !DILocation(line: 77, column: 9, scope: !154)
!160 = !DILocation(line: 79, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 78, column: 9)
!162 = !DILocation(line: 79, column: 28, scope: !161)
!163 = !DILocation(line: 79, column: 18, scope: !161)
!164 = !DILocation(line: 79, column: 13, scope: !161)
!165 = !DILocation(line: 79, column: 21, scope: !161)
!166 = !DILocation(line: 80, column: 9, scope: !161)
!167 = !DILocation(line: 77, column: 31, scope: !157)
!168 = !DILocation(line: 77, column: 9, scope: !157)
!169 = distinct !{!169, !159, !170, !109}
!170 = !DILocation(line: 80, column: 9, scope: !154)
!171 = !DILocation(line: 82, column: 9, scope: !145)
!172 = !DILocation(line: 82, column: 21, scope: !145)
!173 = !DILocation(line: 83, column: 20, scope: !145)
!174 = !DILocation(line: 83, column: 9, scope: !145)
!175 = !DILocation(line: 87, column: 1, scope: !140)
