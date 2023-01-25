; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !42
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !42
  %3 = load i8*, i8** %data.addr, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !43
  store i8 %2, i8* %arrayidx2, align 1, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %5, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !52
  store i8 0, i8* %arrayidx3, align 1, !dbg !53
  %7 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @printLine(i8* %7), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_bad() #0 !dbg !57 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !69
  store i8* %arraydecay, i8** %data, align 8, !dbg !70
  %0 = load i8*, i8** %data, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %1 = load i8*, i8** %data, align 8, !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_badSink(i8* %1), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_goodG2BSink(i8* %data) #0 !dbg !76 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !84
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !90
  %cmp = icmp ult i64 %0, 100, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !96
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !96
  %3 = load i8*, i8** %data.addr, align 8, !dbg !97
  %4 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !97
  store i8 %2, i8* %arrayidx2, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %5, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !105
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !105
  store i8 0, i8* %arrayidx3, align 1, !dbg !106
  %7 = load i8*, i8** %data.addr, align 8, !dbg !107
  call void @printLine(i8* %7), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_good() #0 !dbg !110 {
entry:
  call void @goodG2B(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* null) #5, !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 %conv) #5, !dbg !124
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_good(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !128
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_bad(), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !132 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !139
  store i8* %arraydecay, i8** %data, align 8, !dbg !140
  %0 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %1 = load i8*, i8** %data, align 8, !dbg !143
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_goodG2BSink(i8* %1), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 85, scope: !11)
!19 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 26, column: 16, scope: !20)
!25 = !DILocalVariable(name: "source", scope: !20, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 14, scope: !20)
!30 = !DILocation(line: 28, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 9, scope: !20)
!32 = !DILocation(line: 29, column: 23, scope: !20)
!33 = !DILocation(line: 31, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !12, line: 31, column: 9)
!35 = !DILocation(line: 31, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 23, scope: !37)
!39 = !DILocation(line: 31, column: 9, scope: !34)
!40 = !DILocation(line: 33, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 32, column: 9)
!42 = !DILocation(line: 33, column: 23, scope: !41)
!43 = !DILocation(line: 33, column: 13, scope: !41)
!44 = !DILocation(line: 33, column: 18, scope: !41)
!45 = !DILocation(line: 33, column: 21, scope: !41)
!46 = !DILocation(line: 34, column: 9, scope: !41)
!47 = !DILocation(line: 31, column: 31, scope: !37)
!48 = !DILocation(line: 31, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 34, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 35, column: 9, scope: !20)
!53 = !DILocation(line: 35, column: 21, scope: !20)
!54 = !DILocation(line: 36, column: 19, scope: !20)
!55 = !DILocation(line: 36, column: 9, scope: !20)
!56 = !DILocation(line: 38, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_bad", scope: !12, file: !12, line: 40, type: !58, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !12, line: 42, type: !15)
!61 = !DILocation(line: 42, column: 12, scope: !57)
!62 = !DILocalVariable(name: "dataBadBuffer", scope: !57, file: !12, line: 43, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 50)
!66 = !DILocation(line: 43, column: 10, scope: !57)
!67 = !DILocalVariable(name: "dataGoodBuffer", scope: !57, file: !12, line: 44, type: !26)
!68 = !DILocation(line: 44, column: 10, scope: !57)
!69 = !DILocation(line: 47, column: 12, scope: !57)
!70 = !DILocation(line: 47, column: 10, scope: !57)
!71 = !DILocation(line: 48, column: 5, scope: !57)
!72 = !DILocation(line: 48, column: 13, scope: !57)
!73 = !DILocation(line: 49, column: 77, scope: !57)
!74 = !DILocation(line: 49, column: 5, scope: !57)
!75 = !DILocation(line: 50, column: 1, scope: !57)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !12, line: 56, type: !15)
!78 = !DILocation(line: 56, column: 89, scope: !76)
!79 = !DILocalVariable(name: "i", scope: !80, file: !12, line: 59, type: !21)
!80 = distinct !DILexicalBlock(scope: !76, file: !12, line: 58, column: 5)
!81 = !DILocation(line: 59, column: 16, scope: !80)
!82 = !DILocalVariable(name: "source", scope: !80, file: !12, line: 60, type: !26)
!83 = !DILocation(line: 60, column: 14, scope: !80)
!84 = !DILocation(line: 61, column: 9, scope: !80)
!85 = !DILocation(line: 62, column: 9, scope: !80)
!86 = !DILocation(line: 62, column: 23, scope: !80)
!87 = !DILocation(line: 64, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !12, line: 64, column: 9)
!89 = !DILocation(line: 64, column: 14, scope: !88)
!90 = !DILocation(line: 64, column: 21, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 64, column: 9)
!92 = !DILocation(line: 64, column: 23, scope: !91)
!93 = !DILocation(line: 64, column: 9, scope: !88)
!94 = !DILocation(line: 66, column: 30, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 65, column: 9)
!96 = !DILocation(line: 66, column: 23, scope: !95)
!97 = !DILocation(line: 66, column: 13, scope: !95)
!98 = !DILocation(line: 66, column: 18, scope: !95)
!99 = !DILocation(line: 66, column: 21, scope: !95)
!100 = !DILocation(line: 67, column: 9, scope: !95)
!101 = !DILocation(line: 64, column: 31, scope: !91)
!102 = !DILocation(line: 64, column: 9, scope: !91)
!103 = distinct !{!103, !93, !104, !51}
!104 = !DILocation(line: 67, column: 9, scope: !88)
!105 = !DILocation(line: 68, column: 9, scope: !80)
!106 = !DILocation(line: 68, column: 21, scope: !80)
!107 = !DILocation(line: 69, column: 19, scope: !80)
!108 = !DILocation(line: 69, column: 9, scope: !80)
!109 = !DILocation(line: 71, column: 1, scope: !76)
!110 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_good", scope: !12, file: !12, line: 85, type: !58, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 87, column: 5, scope: !110)
!112 = !DILocation(line: 88, column: 1, scope: !110)
!113 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !114, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!116, !116, !117}
!116 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !12, line: 100, type: !116)
!119 = !DILocation(line: 100, column: 14, scope: !113)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !12, line: 100, type: !117)
!121 = !DILocation(line: 100, column: 27, scope: !113)
!122 = !DILocation(line: 103, column: 22, scope: !113)
!123 = !DILocation(line: 103, column: 12, scope: !113)
!124 = !DILocation(line: 103, column: 5, scope: !113)
!125 = !DILocation(line: 105, column: 5, scope: !113)
!126 = !DILocation(line: 106, column: 5, scope: !113)
!127 = !DILocation(line: 107, column: 5, scope: !113)
!128 = !DILocation(line: 110, column: 5, scope: !113)
!129 = !DILocation(line: 111, column: 5, scope: !113)
!130 = !DILocation(line: 112, column: 5, scope: !113)
!131 = !DILocation(line: 114, column: 5, scope: !113)
!132 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 74, type: !58, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !12, line: 76, type: !15)
!134 = !DILocation(line: 76, column: 12, scope: !132)
!135 = !DILocalVariable(name: "dataBadBuffer", scope: !132, file: !12, line: 77, type: !63)
!136 = !DILocation(line: 77, column: 10, scope: !132)
!137 = !DILocalVariable(name: "dataGoodBuffer", scope: !132, file: !12, line: 78, type: !26)
!138 = !DILocation(line: 78, column: 10, scope: !132)
!139 = !DILocation(line: 80, column: 12, scope: !132)
!140 = !DILocation(line: 80, column: 10, scope: !132)
!141 = !DILocation(line: 81, column: 5, scope: !132)
!142 = !DILocation(line: 81, column: 13, scope: !132)
!143 = !DILocation(line: 82, column: 81, scope: !132)
!144 = !DILocation(line: 82, column: 5, scope: !132)
!145 = !DILocation(line: 83, column: 1, scope: !132)
