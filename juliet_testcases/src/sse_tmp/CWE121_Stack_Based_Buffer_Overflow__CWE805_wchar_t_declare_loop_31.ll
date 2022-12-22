; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %1, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %2, i32** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %3, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !62
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !62
  %6 = load i32*, i32** %data1, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !63
  store i32 %5, i32* %arrayidx5, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !72
  store i32 0, i32* %arrayidx6, align 4, !dbg !73
  %10 = load i32*, i32** %data1, align 8, !dbg !74
  call void @printWLine(i32* %10), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #4, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #4, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  store i32* %1, i32** %dataCopy, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !117
  store i32* %2, i32** %data1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx3, align 4, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %3, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !136
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !136
  %6 = load i32*, i32** %data1, align 8, !dbg !137
  %7 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !137
  store i32 %5, i32* %arrayidx5, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %8, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !145
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !145
  store i32 0, i32* %arrayidx6, align 4, !dbg !146
  %10 = load i32*, i32** %data1, align 8, !dbg !147
  call void @printWLine(i32* %10), !dbg !148
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 30, column: 12, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 33, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!37 = !DILocation(line: 33, column: 19, scope: !36)
!38 = !DILocation(line: 33, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 34, type: !16)
!40 = !DILocation(line: 34, column: 19, scope: !36)
!41 = !DILocation(line: 34, column: 26, scope: !36)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 36, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 20, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 37, type: !27)
!48 = !DILocation(line: 37, column: 21, scope: !43)
!49 = !DILocation(line: 38, column: 21, scope: !43)
!50 = !DILocation(line: 38, column: 13, scope: !43)
!51 = !DILocation(line: 39, column: 13, scope: !43)
!52 = !DILocation(line: 39, column: 27, scope: !43)
!53 = !DILocation(line: 41, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !43, file: !12, line: 41, column: 13)
!55 = !DILocation(line: 41, column: 18, scope: !54)
!56 = !DILocation(line: 41, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 41, column: 13)
!58 = !DILocation(line: 41, column: 27, scope: !57)
!59 = !DILocation(line: 41, column: 13, scope: !54)
!60 = !DILocation(line: 43, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !12, line: 42, column: 13)
!62 = !DILocation(line: 43, column: 27, scope: !61)
!63 = !DILocation(line: 43, column: 17, scope: !61)
!64 = !DILocation(line: 43, column: 22, scope: !61)
!65 = !DILocation(line: 43, column: 25, scope: !61)
!66 = !DILocation(line: 44, column: 13, scope: !61)
!67 = !DILocation(line: 41, column: 35, scope: !57)
!68 = !DILocation(line: 41, column: 13, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 44, column: 13, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 45, column: 13, scope: !43)
!73 = !DILocation(line: 45, column: 25, scope: !43)
!74 = !DILocation(line: 46, column: 24, scope: !43)
!75 = !DILocation(line: 46, column: 13, scope: !43)
!76 = !DILocation(line: 49, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_31_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 85, column: 5, scope: !77)
!79 = !DILocation(line: 86, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !81, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!19, !19, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 97, type: !19)
!87 = !DILocation(line: 97, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 97, type: !83)
!89 = !DILocation(line: 97, column: 27, scope: !80)
!90 = !DILocation(line: 100, column: 22, scope: !80)
!91 = !DILocation(line: 100, column: 12, scope: !80)
!92 = !DILocation(line: 100, column: 5, scope: !80)
!93 = !DILocation(line: 102, column: 5, scope: !80)
!94 = !DILocation(line: 103, column: 5, scope: !80)
!95 = !DILocation(line: 104, column: 5, scope: !80)
!96 = !DILocation(line: 107, column: 5, scope: !80)
!97 = !DILocation(line: 108, column: 5, scope: !80)
!98 = !DILocation(line: 109, column: 5, scope: !80)
!99 = !DILocation(line: 111, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 58, type: !16)
!102 = !DILocation(line: 58, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 59, type: !22)
!104 = !DILocation(line: 59, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 60, type: !27)
!106 = !DILocation(line: 60, column: 13, scope: !100)
!107 = !DILocation(line: 62, column: 12, scope: !100)
!108 = !DILocation(line: 62, column: 10, scope: !100)
!109 = !DILocation(line: 63, column: 5, scope: !100)
!110 = !DILocation(line: 63, column: 13, scope: !100)
!111 = !DILocalVariable(name: "dataCopy", scope: !112, file: !12, line: 65, type: !16)
!112 = distinct !DILexicalBlock(scope: !100, file: !12, line: 64, column: 5)
!113 = !DILocation(line: 65, column: 19, scope: !112)
!114 = !DILocation(line: 65, column: 30, scope: !112)
!115 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 66, type: !16)
!116 = !DILocation(line: 66, column: 19, scope: !112)
!117 = !DILocation(line: 66, column: 26, scope: !112)
!118 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 68, type: !44)
!119 = distinct !DILexicalBlock(scope: !112, file: !12, line: 67, column: 9)
!120 = !DILocation(line: 68, column: 20, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 69, type: !27)
!122 = !DILocation(line: 69, column: 21, scope: !119)
!123 = !DILocation(line: 70, column: 21, scope: !119)
!124 = !DILocation(line: 70, column: 13, scope: !119)
!125 = !DILocation(line: 71, column: 13, scope: !119)
!126 = !DILocation(line: 71, column: 27, scope: !119)
!127 = !DILocation(line: 73, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !119, file: !12, line: 73, column: 13)
!129 = !DILocation(line: 73, column: 18, scope: !128)
!130 = !DILocation(line: 73, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 73, column: 13)
!132 = !DILocation(line: 73, column: 27, scope: !131)
!133 = !DILocation(line: 73, column: 13, scope: !128)
!134 = !DILocation(line: 75, column: 34, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 74, column: 13)
!136 = !DILocation(line: 75, column: 27, scope: !135)
!137 = !DILocation(line: 75, column: 17, scope: !135)
!138 = !DILocation(line: 75, column: 22, scope: !135)
!139 = !DILocation(line: 75, column: 25, scope: !135)
!140 = !DILocation(line: 76, column: 13, scope: !135)
!141 = !DILocation(line: 73, column: 35, scope: !131)
!142 = !DILocation(line: 73, column: 13, scope: !131)
!143 = distinct !{!143, !133, !144, !71}
!144 = !DILocation(line: 76, column: 13, scope: !128)
!145 = !DILocation(line: 77, column: 13, scope: !119)
!146 = !DILocation(line: 77, column: 25, scope: !119)
!147 = !DILocation(line: 78, column: 24, scope: !119)
!148 = !DILocation(line: 78, column: 13, scope: !119)
!149 = !DILocation(line: 81, column: 1, scope: !100)
