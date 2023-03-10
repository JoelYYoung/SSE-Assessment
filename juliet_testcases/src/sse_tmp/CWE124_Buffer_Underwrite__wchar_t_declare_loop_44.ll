; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %1 = load i32*, i32** %data, align 8, !dbg !39
  call void %0(i32* %1), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %0, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !64
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !64
  %3 = load i32*, i32** %data.addr, align 8, !dbg !65
  %4 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !65
  store i32 %2, i32* %arrayidx2, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %5, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !74
  store i32 0, i32* %arrayidx3, align 4, !dbg !75
  %7 = load i32*, i32** %data.addr, align 8, !dbg !76
  call void @printWLine(i32* %7), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_44_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #4, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #4, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_44_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_44_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !109
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !110
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay1, i32** %data, align 8, !dbg !114
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  call void %0(i32* %1), !dbg !115
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !118 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !127
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %0, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !139
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !139
  %3 = load i32*, i32** %data.addr, align 8, !dbg !140
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !140
  store i32 %2, i32* %arrayidx2, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %5, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !148
  store i32 0, i32* %arrayidx3, align 4, !dbg !149
  %7 = load i32*, i32** %data.addr, align 8, !dbg !150
  call void @printWLine(i32* %7), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_44_bad", scope: !12, file: !12, line: 41, type: !13, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 43, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 43, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 45, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 45, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 46, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 46, column: 13, scope: !11)
!31 = !DILocation(line: 47, column: 13, scope: !11)
!32 = !DILocation(line: 47, column: 5, scope: !11)
!33 = !DILocation(line: 48, column: 5, scope: !11)
!34 = !DILocation(line: 48, column: 23, scope: !11)
!35 = !DILocation(line: 50, column: 12, scope: !11)
!36 = !DILocation(line: 50, column: 23, scope: !11)
!37 = !DILocation(line: 50, column: 10, scope: !11)
!38 = !DILocation(line: 52, column: 5, scope: !11)
!39 = !DILocation(line: 52, column: 13, scope: !11)
!40 = !DILocation(line: 53, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !12, line: 23, type: !16)
!43 = !DILocation(line: 23, column: 31, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 25, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 26, column: 16, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 27, type: !27)
!50 = !DILocation(line: 27, column: 17, scope: !45)
!51 = !DILocation(line: 28, column: 17, scope: !45)
!52 = !DILocation(line: 28, column: 9, scope: !45)
!53 = !DILocation(line: 29, column: 9, scope: !45)
!54 = !DILocation(line: 29, column: 23, scope: !45)
!55 = !DILocation(line: 31, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !45, file: !12, line: 31, column: 9)
!57 = !DILocation(line: 31, column: 14, scope: !56)
!58 = !DILocation(line: 31, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 31, column: 9)
!60 = !DILocation(line: 31, column: 23, scope: !59)
!61 = !DILocation(line: 31, column: 9, scope: !56)
!62 = !DILocation(line: 33, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 32, column: 9)
!64 = !DILocation(line: 33, column: 23, scope: !63)
!65 = !DILocation(line: 33, column: 13, scope: !63)
!66 = !DILocation(line: 33, column: 18, scope: !63)
!67 = !DILocation(line: 33, column: 21, scope: !63)
!68 = !DILocation(line: 34, column: 9, scope: !63)
!69 = !DILocation(line: 31, column: 31, scope: !59)
!70 = !DILocation(line: 31, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 34, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 36, column: 9, scope: !45)
!75 = !DILocation(line: 36, column: 21, scope: !45)
!76 = !DILocation(line: 37, column: 20, scope: !45)
!77 = !DILocation(line: 37, column: 9, scope: !45)
!78 = !DILocation(line: 39, column: 1, scope: !41)
!79 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_44_good", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 92, column: 5, scope: !79)
!81 = !DILocation(line: 93, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !83, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!19, !19, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 104, type: !19)
!89 = !DILocation(line: 104, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 104, type: !85)
!91 = !DILocation(line: 104, column: 27, scope: !82)
!92 = !DILocation(line: 107, column: 22, scope: !82)
!93 = !DILocation(line: 107, column: 12, scope: !82)
!94 = !DILocation(line: 107, column: 5, scope: !82)
!95 = !DILocation(line: 109, column: 5, scope: !82)
!96 = !DILocation(line: 110, column: 5, scope: !82)
!97 = !DILocation(line: 111, column: 5, scope: !82)
!98 = !DILocation(line: 114, column: 5, scope: !82)
!99 = !DILocation(line: 115, column: 5, scope: !82)
!100 = !DILocation(line: 116, column: 5, scope: !82)
!101 = !DILocation(line: 118, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 80, type: !16)
!104 = !DILocation(line: 80, column: 15, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !12, line: 81, type: !22)
!106 = !DILocation(line: 81, column: 12, scope: !102)
!107 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 82, type: !27)
!108 = !DILocation(line: 82, column: 13, scope: !102)
!109 = !DILocation(line: 83, column: 13, scope: !102)
!110 = !DILocation(line: 83, column: 5, scope: !102)
!111 = !DILocation(line: 84, column: 5, scope: !102)
!112 = !DILocation(line: 84, column: 23, scope: !102)
!113 = !DILocation(line: 86, column: 12, scope: !102)
!114 = !DILocation(line: 86, column: 10, scope: !102)
!115 = !DILocation(line: 87, column: 5, scope: !102)
!116 = !DILocation(line: 87, column: 13, scope: !102)
!117 = !DILocation(line: 88, column: 1, scope: !102)
!118 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !23, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", arg: 1, scope: !118, file: !12, line: 60, type: !16)
!120 = !DILocation(line: 60, column: 35, scope: !118)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 63, type: !46)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 62, column: 5)
!123 = !DILocation(line: 63, column: 16, scope: !122)
!124 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 64, type: !27)
!125 = !DILocation(line: 64, column: 17, scope: !122)
!126 = !DILocation(line: 65, column: 17, scope: !122)
!127 = !DILocation(line: 65, column: 9, scope: !122)
!128 = !DILocation(line: 66, column: 9, scope: !122)
!129 = !DILocation(line: 66, column: 23, scope: !122)
!130 = !DILocation(line: 68, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !122, file: !12, line: 68, column: 9)
!132 = !DILocation(line: 68, column: 14, scope: !131)
!133 = !DILocation(line: 68, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 68, column: 9)
!135 = !DILocation(line: 68, column: 23, scope: !134)
!136 = !DILocation(line: 68, column: 9, scope: !131)
!137 = !DILocation(line: 70, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 69, column: 9)
!139 = !DILocation(line: 70, column: 23, scope: !138)
!140 = !DILocation(line: 70, column: 13, scope: !138)
!141 = !DILocation(line: 70, column: 18, scope: !138)
!142 = !DILocation(line: 70, column: 21, scope: !138)
!143 = !DILocation(line: 71, column: 9, scope: !138)
!144 = !DILocation(line: 68, column: 31, scope: !134)
!145 = !DILocation(line: 68, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !73}
!147 = !DILocation(line: 71, column: 9, scope: !131)
!148 = !DILocation(line: 73, column: 9, scope: !122)
!149 = !DILocation(line: 73, column: 21, scope: !122)
!150 = !DILocation(line: 74, column: 20, scope: !122)
!151 = !DILocation(line: 74, column: 9, scope: !122)
!152 = !DILocation(line: 76, column: 1, scope: !118)
