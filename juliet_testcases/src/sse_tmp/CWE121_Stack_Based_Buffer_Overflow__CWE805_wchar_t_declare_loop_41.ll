; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %0, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !44
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !44
  %3 = load i32*, i32** %data.addr, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !45
  store i32 %2, i32* %arrayidx2, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  %7 = load i32*, i32** %data.addr, align 8, !dbg !56
  call void @printWLine(i32* %7), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_bad() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !71
  store i32* %arraydecay, i32** %data, align 8, !dbg !72
  %0 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %1 = load i32*, i32** %data, align 8, !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_badSink(i32* %1), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_goodG2BSink(i32* %data) #0 !dbg !78 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !86
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !87
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !93
  %cmp = icmp ult i64 %0, 100, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !99
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !99
  %3 = load i32*, i32** %data.addr, align 8, !dbg !100
  %4 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !100
  store i32 %2, i32* %arrayidx2, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %5, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %7 = load i32*, i32** %data.addr, align 8, !dbg !110
  call void @printWLine(i32* %7), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_good() #0 !dbg !113 {
entry:
  call void @goodG2B(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !122, metadata !DIExpression()), !dbg !123
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %call = call i64 @time(i64* null) #4, !dbg !126
  %conv = trunc i64 %call to i32, !dbg !127
  call void @srand(i32 %conv) #4, !dbg !128
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !129
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_good(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_bad(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !143
  store i32* %arraydecay, i32** %data, align 8, !dbg !144
  %0 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  %1 = load i32*, i32** %data, align 8, !dbg !147
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_goodG2BSink(i32* %1), !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 91, scope: !11)
!21 = !DILocalVariable(name: "i", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 46, baseType: !24)
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !22)
!26 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 17, scope: !22)
!31 = !DILocation(line: 28, column: 17, scope: !22)
!32 = !DILocation(line: 28, column: 9, scope: !22)
!33 = !DILocation(line: 29, column: 9, scope: !22)
!34 = !DILocation(line: 29, column: 23, scope: !22)
!35 = !DILocation(line: 31, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !12, line: 31, column: 9)
!37 = !DILocation(line: 31, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 31, column: 9)
!40 = !DILocation(line: 31, column: 23, scope: !39)
!41 = !DILocation(line: 31, column: 9, scope: !36)
!42 = !DILocation(line: 33, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 32, column: 9)
!44 = !DILocation(line: 33, column: 23, scope: !43)
!45 = !DILocation(line: 33, column: 13, scope: !43)
!46 = !DILocation(line: 33, column: 18, scope: !43)
!47 = !DILocation(line: 33, column: 21, scope: !43)
!48 = !DILocation(line: 34, column: 9, scope: !43)
!49 = !DILocation(line: 31, column: 31, scope: !39)
!50 = !DILocation(line: 31, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 34, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 35, column: 9, scope: !22)
!55 = !DILocation(line: 35, column: 21, scope: !22)
!56 = !DILocation(line: 36, column: 20, scope: !22)
!57 = !DILocation(line: 36, column: 9, scope: !22)
!58 = !DILocation(line: 38, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_bad", scope: !12, file: !12, line: 40, type: !60, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 42, type: !15)
!63 = !DILocation(line: 42, column: 15, scope: !59)
!64 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !12, line: 43, type: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 50)
!68 = !DILocation(line: 43, column: 13, scope: !59)
!69 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !12, line: 44, type: !27)
!70 = !DILocation(line: 44, column: 13, scope: !59)
!71 = !DILocation(line: 47, column: 12, scope: !59)
!72 = !DILocation(line: 47, column: 10, scope: !59)
!73 = !DILocation(line: 48, column: 5, scope: !59)
!74 = !DILocation(line: 48, column: 13, scope: !59)
!75 = !DILocation(line: 49, column: 80, scope: !59)
!76 = !DILocation(line: 49, column: 5, scope: !59)
!77 = !DILocation(line: 50, column: 1, scope: !59)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", arg: 1, scope: !78, file: !12, line: 56, type: !15)
!80 = !DILocation(line: 56, column: 95, scope: !78)
!81 = !DILocalVariable(name: "i", scope: !82, file: !12, line: 59, type: !23)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 58, column: 5)
!83 = !DILocation(line: 59, column: 16, scope: !82)
!84 = !DILocalVariable(name: "source", scope: !82, file: !12, line: 60, type: !27)
!85 = !DILocation(line: 60, column: 17, scope: !82)
!86 = !DILocation(line: 61, column: 17, scope: !82)
!87 = !DILocation(line: 61, column: 9, scope: !82)
!88 = !DILocation(line: 62, column: 9, scope: !82)
!89 = !DILocation(line: 62, column: 23, scope: !82)
!90 = !DILocation(line: 64, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !82, file: !12, line: 64, column: 9)
!92 = !DILocation(line: 64, column: 14, scope: !91)
!93 = !DILocation(line: 64, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !12, line: 64, column: 9)
!95 = !DILocation(line: 64, column: 23, scope: !94)
!96 = !DILocation(line: 64, column: 9, scope: !91)
!97 = !DILocation(line: 66, column: 30, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 65, column: 9)
!99 = !DILocation(line: 66, column: 23, scope: !98)
!100 = !DILocation(line: 66, column: 13, scope: !98)
!101 = !DILocation(line: 66, column: 18, scope: !98)
!102 = !DILocation(line: 66, column: 21, scope: !98)
!103 = !DILocation(line: 67, column: 9, scope: !98)
!104 = !DILocation(line: 64, column: 31, scope: !94)
!105 = !DILocation(line: 64, column: 9, scope: !94)
!106 = distinct !{!106, !96, !107, !53}
!107 = !DILocation(line: 67, column: 9, scope: !91)
!108 = !DILocation(line: 68, column: 9, scope: !82)
!109 = !DILocation(line: 68, column: 21, scope: !82)
!110 = !DILocation(line: 69, column: 20, scope: !82)
!111 = !DILocation(line: 69, column: 9, scope: !82)
!112 = !DILocation(line: 71, column: 1, scope: !78)
!113 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_41_good", scope: !12, file: !12, line: 85, type: !60, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 87, column: 5, scope: !113)
!115 = !DILocation(line: 88, column: 1, scope: !113)
!116 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !117, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!18, !18, !119}
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!122 = !DILocalVariable(name: "argc", arg: 1, scope: !116, file: !12, line: 100, type: !18)
!123 = !DILocation(line: 100, column: 14, scope: !116)
!124 = !DILocalVariable(name: "argv", arg: 2, scope: !116, file: !12, line: 100, type: !119)
!125 = !DILocation(line: 100, column: 27, scope: !116)
!126 = !DILocation(line: 103, column: 22, scope: !116)
!127 = !DILocation(line: 103, column: 12, scope: !116)
!128 = !DILocation(line: 103, column: 5, scope: !116)
!129 = !DILocation(line: 105, column: 5, scope: !116)
!130 = !DILocation(line: 106, column: 5, scope: !116)
!131 = !DILocation(line: 107, column: 5, scope: !116)
!132 = !DILocation(line: 110, column: 5, scope: !116)
!133 = !DILocation(line: 111, column: 5, scope: !116)
!134 = !DILocation(line: 112, column: 5, scope: !116)
!135 = !DILocation(line: 114, column: 5, scope: !116)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 74, type: !60, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 76, type: !15)
!138 = !DILocation(line: 76, column: 15, scope: !136)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !136, file: !12, line: 77, type: !65)
!140 = !DILocation(line: 77, column: 13, scope: !136)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !136, file: !12, line: 78, type: !27)
!142 = !DILocation(line: 78, column: 13, scope: !136)
!143 = !DILocation(line: 80, column: 12, scope: !136)
!144 = !DILocation(line: 80, column: 10, scope: !136)
!145 = !DILocation(line: 81, column: 5, scope: !136)
!146 = !DILocation(line: 81, column: 13, scope: !136)
!147 = !DILocation(line: 82, column: 84, scope: !136)
!148 = !DILocation(line: 82, column: 5, scope: !136)
!149 = !DILocation(line: 83, column: 1, scope: !136)
