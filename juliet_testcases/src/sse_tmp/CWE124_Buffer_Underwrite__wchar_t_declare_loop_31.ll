; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %0, i32** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !37, metadata !DIExpression()), !dbg !38
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !39
  store i32* %1, i32** %data2, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !48
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx5, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !60
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !60
  %5 = load i32*, i32** %data2, align 8, !dbg !61
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !61
  store i32 %4, i32* %arrayidx7, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %7, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data2, align 8, !dbg !70
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !70
  store i32 0, i32* %arrayidx8, align 4, !dbg !71
  %9 = load i32*, i32** %data2, align 8, !dbg !72
  call void @printWLine(i32* %9), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_31_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #4, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #4, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_31_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_31_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !104
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay1, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !109, metadata !DIExpression()), !dbg !111
  %0 = load i32*, i32** %data, align 8, !dbg !112
  store i32* %0, i32** %dataCopy, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !115
  store i32* %1, i32** %data2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !122
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx5, align 4, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !128
  %cmp = icmp ult i64 %2, 100, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !134
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !134
  %5 = load i32*, i32** %data2, align 8, !dbg !135
  %6 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !135
  store i32 %4, i32* %arrayidx7, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %7, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data2, align 8, !dbg !143
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !143
  store i32 0, i32* %arrayidx8, align 4, !dbg !144
  %9 = load i32*, i32** %data2, align 8, !dbg !145
  call void @printWLine(i32* %9), !dbg !146
  ret void, !dbg !147
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 30, column: 12, scope: !11)
!31 = !DILocation(line: 30, column: 23, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !12, line: 32, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!35 = !DILocation(line: 32, column: 19, scope: !34)
!36 = !DILocation(line: 32, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 33, type: !16)
!38 = !DILocation(line: 33, column: 19, scope: !34)
!39 = !DILocation(line: 33, column: 26, scope: !34)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 35, column: 20, scope: !41)
!45 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 36, type: !22)
!46 = !DILocation(line: 36, column: 21, scope: !41)
!47 = !DILocation(line: 37, column: 21, scope: !41)
!48 = !DILocation(line: 37, column: 13, scope: !41)
!49 = !DILocation(line: 38, column: 13, scope: !41)
!50 = !DILocation(line: 38, column: 27, scope: !41)
!51 = !DILocation(line: 40, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !12, line: 40, column: 13)
!53 = !DILocation(line: 40, column: 18, scope: !52)
!54 = !DILocation(line: 40, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 40, column: 13)
!56 = !DILocation(line: 40, column: 27, scope: !55)
!57 = !DILocation(line: 40, column: 13, scope: !52)
!58 = !DILocation(line: 42, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 41, column: 13)
!60 = !DILocation(line: 42, column: 27, scope: !59)
!61 = !DILocation(line: 42, column: 17, scope: !59)
!62 = !DILocation(line: 42, column: 22, scope: !59)
!63 = !DILocation(line: 42, column: 25, scope: !59)
!64 = !DILocation(line: 43, column: 13, scope: !59)
!65 = !DILocation(line: 40, column: 35, scope: !55)
!66 = !DILocation(line: 40, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 43, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 13, scope: !41)
!71 = !DILocation(line: 45, column: 25, scope: !41)
!72 = !DILocation(line: 46, column: 24, scope: !41)
!73 = !DILocation(line: 46, column: 13, scope: !41)
!74 = !DILocation(line: 49, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_31_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 86, column: 5, scope: !75)
!77 = !DILocation(line: 87, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !79, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!19, !19, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 98, type: !19)
!85 = !DILocation(line: 98, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 98, type: !81)
!87 = !DILocation(line: 98, column: 27, scope: !78)
!88 = !DILocation(line: 101, column: 22, scope: !78)
!89 = !DILocation(line: 101, column: 12, scope: !78)
!90 = !DILocation(line: 101, column: 5, scope: !78)
!91 = !DILocation(line: 103, column: 5, scope: !78)
!92 = !DILocation(line: 104, column: 5, scope: !78)
!93 = !DILocation(line: 105, column: 5, scope: !78)
!94 = !DILocation(line: 108, column: 5, scope: !78)
!95 = !DILocation(line: 109, column: 5, scope: !78)
!96 = !DILocation(line: 110, column: 5, scope: !78)
!97 = !DILocation(line: 112, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 58, type: !16)
!100 = !DILocation(line: 58, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 59, type: !22)
!102 = !DILocation(line: 59, column: 13, scope: !98)
!103 = !DILocation(line: 60, column: 13, scope: !98)
!104 = !DILocation(line: 60, column: 5, scope: !98)
!105 = !DILocation(line: 61, column: 5, scope: !98)
!106 = !DILocation(line: 61, column: 23, scope: !98)
!107 = !DILocation(line: 63, column: 12, scope: !98)
!108 = !DILocation(line: 63, column: 10, scope: !98)
!109 = !DILocalVariable(name: "dataCopy", scope: !110, file: !12, line: 65, type: !16)
!110 = distinct !DILexicalBlock(scope: !98, file: !12, line: 64, column: 5)
!111 = !DILocation(line: 65, column: 19, scope: !110)
!112 = !DILocation(line: 65, column: 30, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 66, type: !16)
!114 = !DILocation(line: 66, column: 19, scope: !110)
!115 = !DILocation(line: 66, column: 26, scope: !110)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 68, type: !42)
!117 = distinct !DILexicalBlock(scope: !110, file: !12, line: 67, column: 9)
!118 = !DILocation(line: 68, column: 20, scope: !117)
!119 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 69, type: !22)
!120 = !DILocation(line: 69, column: 21, scope: !117)
!121 = !DILocation(line: 70, column: 21, scope: !117)
!122 = !DILocation(line: 70, column: 13, scope: !117)
!123 = !DILocation(line: 71, column: 13, scope: !117)
!124 = !DILocation(line: 71, column: 27, scope: !117)
!125 = !DILocation(line: 73, column: 20, scope: !126)
!126 = distinct !DILexicalBlock(scope: !117, file: !12, line: 73, column: 13)
!127 = !DILocation(line: 73, column: 18, scope: !126)
!128 = !DILocation(line: 73, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 73, column: 13)
!130 = !DILocation(line: 73, column: 27, scope: !129)
!131 = !DILocation(line: 73, column: 13, scope: !126)
!132 = !DILocation(line: 75, column: 34, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 74, column: 13)
!134 = !DILocation(line: 75, column: 27, scope: !133)
!135 = !DILocation(line: 75, column: 17, scope: !133)
!136 = !DILocation(line: 75, column: 22, scope: !133)
!137 = !DILocation(line: 75, column: 25, scope: !133)
!138 = !DILocation(line: 76, column: 13, scope: !133)
!139 = !DILocation(line: 73, column: 35, scope: !129)
!140 = !DILocation(line: 73, column: 13, scope: !129)
!141 = distinct !{!141, !131, !142, !69}
!142 = !DILocation(line: 76, column: 13, scope: !126)
!143 = !DILocation(line: 78, column: 13, scope: !117)
!144 = !DILocation(line: 78, column: 25, scope: !117)
!145 = !DILocation(line: 79, column: 24, scope: !117)
!146 = !DILocation(line: 79, column: 13, scope: !117)
!147 = !DILocation(line: 82, column: 1, scope: !98)
