; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %5, i32** %dataCopy, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !47
  store i32* %6, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx4, align 4, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !65
  %cmp5 = icmp ult i64 %7, 100, !dbg !67
  br i1 %cmp5, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !71
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !71
  %10 = load i32*, i32** %data2, align 8, !dbg !72
  %11 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !72
  store i32 %9, i32* %arrayidx7, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %12, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !81
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !81
  store i32 0, i32* %arrayidx8, align 4, !dbg !82
  %14 = load i32*, i32** %data2, align 8, !dbg !83
  call void @printWLine(i32* %14), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #5, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #5, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32* null, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %dataBuffer, align 8, !dbg !115
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !125
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  store i32* %4, i32** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !130, metadata !DIExpression()), !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  store i32* %5, i32** %dataCopy, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !134, metadata !DIExpression()), !dbg !135
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !136
  store i32* %6, i32** %data2, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !142
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !143
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx4, align 4, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !149
  %cmp5 = icmp ult i64 %7, 100, !dbg !151
  br i1 %cmp5, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !155
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !155
  %10 = load i32*, i32** %data2, align 8, !dbg !156
  %11 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !156
  store i32 %9, i32* %arrayidx7, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %12, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !164
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !164
  store i32 0, i32* %arrayidx8, align 4, !dbg !165
  %14 = load i32*, i32** %data2, align 8, !dbg !166
  call void @printWLine(i32* %14), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 28, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 5)
!25 = !DILocation(line: 28, column: 19, scope: !24)
!26 = !DILocation(line: 28, column: 43, scope: !24)
!27 = !DILocation(line: 28, column: 32, scope: !24)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 24, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !24)
!32 = !DILocation(line: 29, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 33)
!34 = !DILocation(line: 30, column: 17, scope: !24)
!35 = !DILocation(line: 30, column: 9, scope: !24)
!36 = !DILocation(line: 31, column: 9, scope: !24)
!37 = !DILocation(line: 31, column: 27, scope: !24)
!38 = !DILocation(line: 33, column: 16, scope: !24)
!39 = !DILocation(line: 33, column: 27, scope: !24)
!40 = !DILocation(line: 33, column: 14, scope: !24)
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !17, line: 36, type: !4)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DILocation(line: 36, column: 19, scope: !42)
!44 = !DILocation(line: 36, column: 30, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !17, line: 37, type: !4)
!46 = !DILocation(line: 37, column: 19, scope: !42)
!47 = !DILocation(line: 37, column: 26, scope: !42)
!48 = !DILocalVariable(name: "i", scope: !49, file: !17, line: 39, type: !50)
!49 = distinct !DILexicalBlock(scope: !42, file: !17, line: 38, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 39, column: 20, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 40, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 40, column: 21, scope: !49)
!58 = !DILocation(line: 41, column: 21, scope: !49)
!59 = !DILocation(line: 41, column: 13, scope: !49)
!60 = !DILocation(line: 42, column: 13, scope: !49)
!61 = !DILocation(line: 42, column: 27, scope: !49)
!62 = !DILocation(line: 44, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !49, file: !17, line: 44, column: 13)
!64 = !DILocation(line: 44, column: 18, scope: !63)
!65 = !DILocation(line: 44, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !17, line: 44, column: 13)
!67 = !DILocation(line: 44, column: 27, scope: !66)
!68 = !DILocation(line: 44, column: 13, scope: !63)
!69 = !DILocation(line: 46, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !17, line: 45, column: 13)
!71 = !DILocation(line: 46, column: 27, scope: !70)
!72 = !DILocation(line: 46, column: 17, scope: !70)
!73 = !DILocation(line: 46, column: 22, scope: !70)
!74 = !DILocation(line: 46, column: 25, scope: !70)
!75 = !DILocation(line: 47, column: 13, scope: !70)
!76 = !DILocation(line: 44, column: 35, scope: !66)
!77 = !DILocation(line: 44, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 47, column: 13, scope: !63)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 49, column: 13, scope: !49)
!82 = !DILocation(line: 49, column: 25, scope: !49)
!83 = !DILocation(line: 50, column: 24, scope: !49)
!84 = !DILocation(line: 50, column: 13, scope: !49)
!85 = !DILocation(line: 55, column: 1, scope: !16)
!86 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_31_good", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 98, column: 5, scope: !86)
!88 = !DILocation(line: 99, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 110, type: !90, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !17, line: 110, type: !7)
!96 = !DILocation(line: 110, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !17, line: 110, type: !92)
!98 = !DILocation(line: 110, column: 27, scope: !89)
!99 = !DILocation(line: 113, column: 22, scope: !89)
!100 = !DILocation(line: 113, column: 12, scope: !89)
!101 = !DILocation(line: 113, column: 5, scope: !89)
!102 = !DILocation(line: 115, column: 5, scope: !89)
!103 = !DILocation(line: 116, column: 5, scope: !89)
!104 = !DILocation(line: 117, column: 5, scope: !89)
!105 = !DILocation(line: 120, column: 5, scope: !89)
!106 = !DILocation(line: 121, column: 5, scope: !89)
!107 = !DILocation(line: 122, column: 5, scope: !89)
!108 = !DILocation(line: 124, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !17, line: 64, type: !4)
!111 = !DILocation(line: 64, column: 15, scope: !109)
!112 = !DILocation(line: 65, column: 10, scope: !109)
!113 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !17, line: 67, type: !4)
!114 = distinct !DILexicalBlock(scope: !109, file: !17, line: 66, column: 5)
!115 = !DILocation(line: 67, column: 19, scope: !114)
!116 = !DILocation(line: 67, column: 43, scope: !114)
!117 = !DILocation(line: 67, column: 32, scope: !114)
!118 = !DILocation(line: 68, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !17, line: 68, column: 13)
!120 = !DILocation(line: 68, column: 24, scope: !119)
!121 = !DILocation(line: 68, column: 13, scope: !114)
!122 = !DILocation(line: 68, column: 34, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 68, column: 33)
!124 = !DILocation(line: 69, column: 17, scope: !114)
!125 = !DILocation(line: 69, column: 9, scope: !114)
!126 = !DILocation(line: 70, column: 9, scope: !114)
!127 = !DILocation(line: 70, column: 27, scope: !114)
!128 = !DILocation(line: 72, column: 16, scope: !114)
!129 = !DILocation(line: 72, column: 14, scope: !114)
!130 = !DILocalVariable(name: "dataCopy", scope: !131, file: !17, line: 75, type: !4)
!131 = distinct !DILexicalBlock(scope: !109, file: !17, line: 74, column: 5)
!132 = !DILocation(line: 75, column: 19, scope: !131)
!133 = !DILocation(line: 75, column: 30, scope: !131)
!134 = !DILocalVariable(name: "data", scope: !131, file: !17, line: 76, type: !4)
!135 = !DILocation(line: 76, column: 19, scope: !131)
!136 = !DILocation(line: 76, column: 26, scope: !131)
!137 = !DILocalVariable(name: "i", scope: !138, file: !17, line: 78, type: !50)
!138 = distinct !DILexicalBlock(scope: !131, file: !17, line: 77, column: 9)
!139 = !DILocation(line: 78, column: 20, scope: !138)
!140 = !DILocalVariable(name: "source", scope: !138, file: !17, line: 79, type: !54)
!141 = !DILocation(line: 79, column: 21, scope: !138)
!142 = !DILocation(line: 80, column: 21, scope: !138)
!143 = !DILocation(line: 80, column: 13, scope: !138)
!144 = !DILocation(line: 81, column: 13, scope: !138)
!145 = !DILocation(line: 81, column: 27, scope: !138)
!146 = !DILocation(line: 83, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !138, file: !17, line: 83, column: 13)
!148 = !DILocation(line: 83, column: 18, scope: !147)
!149 = !DILocation(line: 83, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !17, line: 83, column: 13)
!151 = !DILocation(line: 83, column: 27, scope: !150)
!152 = !DILocation(line: 83, column: 13, scope: !147)
!153 = !DILocation(line: 85, column: 34, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !17, line: 84, column: 13)
!155 = !DILocation(line: 85, column: 27, scope: !154)
!156 = !DILocation(line: 85, column: 17, scope: !154)
!157 = !DILocation(line: 85, column: 22, scope: !154)
!158 = !DILocation(line: 85, column: 25, scope: !154)
!159 = !DILocation(line: 86, column: 13, scope: !154)
!160 = !DILocation(line: 83, column: 35, scope: !150)
!161 = !DILocation(line: 83, column: 13, scope: !150)
!162 = distinct !{!162, !152, !163, !80}
!163 = !DILocation(line: 86, column: 13, scope: !147)
!164 = !DILocation(line: 88, column: 13, scope: !138)
!165 = !DILocation(line: 88, column: 25, scope: !138)
!166 = !DILocation(line: 89, column: 24, scope: !138)
!167 = !DILocation(line: 89, column: 13, scope: !138)
!168 = !DILocation(line: 94, column: 1, scope: !109)
