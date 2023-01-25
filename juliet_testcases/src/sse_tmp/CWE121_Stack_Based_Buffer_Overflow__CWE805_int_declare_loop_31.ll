; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %0, i32** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !37
  store i32* %1, i32** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %3, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !56
  %5 = load i32, i32* %arrayidx, align 4, !dbg !56
  %6 = load i32*, i32** %data1, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !57
  store i32 %5, i32* %arrayidx2, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %8, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !66
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !66
  call void @printIntLine(i32 %10), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = load i32*, i32** %data, align 8, !dbg !104
  store i32* %0, i32** %dataCopy, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !105, metadata !DIExpression()), !dbg !106
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !107
  store i32* %1, i32** %data1, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %3, 100, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !123
  %5 = load i32, i32* %arrayidx, align 4, !dbg !123
  %6 = load i32*, i32** %data1, align 8, !dbg !124
  %7 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !124
  store i32 %5, i32* %arrayidx2, align 4, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %8, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !132
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !132
  call void @printIntLine(i32 %10), !dbg !133
  ret void, !dbg !134
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 28, column: 12, scope: !11)
!30 = !DILocation(line: 28, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !12, line: 30, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 30, column: 15, scope: !32)
!34 = !DILocation(line: 30, column: 26, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 31, type: !16)
!36 = !DILocation(line: 31, column: 15, scope: !32)
!37 = !DILocation(line: 31, column: 22, scope: !32)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 33, type: !25)
!39 = distinct !DILexicalBlock(scope: !32, file: !12, line: 32, column: 9)
!40 = !DILocation(line: 33, column: 17, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 34, column: 13)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 35, column: 24, scope: !42)
!47 = !DILocation(line: 37, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !12, line: 37, column: 17)
!49 = !DILocation(line: 37, column: 22, scope: !48)
!50 = !DILocation(line: 37, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 37, column: 17)
!52 = !DILocation(line: 37, column: 31, scope: !51)
!53 = !DILocation(line: 37, column: 17, scope: !48)
!54 = !DILocation(line: 39, column: 38, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 38, column: 17)
!56 = !DILocation(line: 39, column: 31, scope: !55)
!57 = !DILocation(line: 39, column: 21, scope: !55)
!58 = !DILocation(line: 39, column: 26, scope: !55)
!59 = !DILocation(line: 39, column: 29, scope: !55)
!60 = !DILocation(line: 40, column: 17, scope: !55)
!61 = !DILocation(line: 37, column: 39, scope: !51)
!62 = !DILocation(line: 37, column: 17, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 40, column: 17, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 41, column: 30, scope: !42)
!67 = !DILocation(line: 41, column: 17, scope: !42)
!68 = !DILocation(line: 45, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 79, column: 5, scope: !69)
!71 = !DILocation(line: 80, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !73, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!17, !17, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 91, type: !17)
!79 = !DILocation(line: 91, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 91, type: !75)
!81 = !DILocation(line: 91, column: 27, scope: !72)
!82 = !DILocation(line: 94, column: 22, scope: !72)
!83 = !DILocation(line: 94, column: 12, scope: !72)
!84 = !DILocation(line: 94, column: 5, scope: !72)
!85 = !DILocation(line: 96, column: 5, scope: !72)
!86 = !DILocation(line: 97, column: 5, scope: !72)
!87 = !DILocation(line: 98, column: 5, scope: !72)
!88 = !DILocation(line: 101, column: 5, scope: !72)
!89 = !DILocation(line: 102, column: 5, scope: !72)
!90 = !DILocation(line: 103, column: 5, scope: !72)
!91 = !DILocation(line: 105, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 54, type: !16)
!94 = !DILocation(line: 54, column: 11, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 55, type: !20)
!96 = !DILocation(line: 55, column: 9, scope: !92)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 56, type: !25)
!98 = !DILocation(line: 56, column: 9, scope: !92)
!99 = !DILocation(line: 58, column: 12, scope: !92)
!100 = !DILocation(line: 58, column: 10, scope: !92)
!101 = !DILocalVariable(name: "dataCopy", scope: !102, file: !12, line: 60, type: !16)
!102 = distinct !DILexicalBlock(scope: !92, file: !12, line: 59, column: 5)
!103 = !DILocation(line: 60, column: 15, scope: !102)
!104 = !DILocation(line: 60, column: 26, scope: !102)
!105 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 61, type: !16)
!106 = !DILocation(line: 61, column: 15, scope: !102)
!107 = !DILocation(line: 61, column: 22, scope: !102)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 63, type: !25)
!109 = distinct !DILexicalBlock(scope: !102, file: !12, line: 62, column: 9)
!110 = !DILocation(line: 63, column: 17, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 65, type: !43)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 64, column: 13)
!113 = !DILocation(line: 65, column: 24, scope: !112)
!114 = !DILocation(line: 67, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 67, column: 17)
!116 = !DILocation(line: 67, column: 22, scope: !115)
!117 = !DILocation(line: 67, column: 29, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 67, column: 17)
!119 = !DILocation(line: 67, column: 31, scope: !118)
!120 = !DILocation(line: 67, column: 17, scope: !115)
!121 = !DILocation(line: 69, column: 38, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 68, column: 17)
!123 = !DILocation(line: 69, column: 31, scope: !122)
!124 = !DILocation(line: 69, column: 21, scope: !122)
!125 = !DILocation(line: 69, column: 26, scope: !122)
!126 = !DILocation(line: 69, column: 29, scope: !122)
!127 = !DILocation(line: 70, column: 17, scope: !122)
!128 = !DILocation(line: 67, column: 39, scope: !118)
!129 = !DILocation(line: 67, column: 17, scope: !118)
!130 = distinct !{!130, !120, !131, !65}
!131 = !DILocation(line: 70, column: 17, scope: !115)
!132 = !DILocation(line: 71, column: 30, scope: !112)
!133 = !DILocation(line: 71, column: 17, scope: !112)
!134 = !DILocation(line: 75, column: 1, scope: !92)
