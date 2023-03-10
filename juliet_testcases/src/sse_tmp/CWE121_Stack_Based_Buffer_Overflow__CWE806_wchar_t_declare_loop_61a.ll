; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61b_badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = load i32*, i32** %data, align 8, !dbg !43
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !44
  store i64 %call1, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !49
  %4 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %3, %4, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !54
  %7 = load i32, i32* %arrayidx, align 4, !dbg !54
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !58
  store i32 %7, i32* %arrayidx2, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %9, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !66
  store i32 0, i32* %arrayidx3, align 4, !dbg !67
  %10 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %10), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !100
  %0 = load i32*, i32** %data, align 8, !dbg !101
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61b_goodG2BSource(i32* %0), !dbg !102
  store i32* %call, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !109, metadata !DIExpression()), !dbg !110
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !112
  store i64 %call1, i64* %dataLen, align 8, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !117
  %4 = load i64, i64* %dataLen, align 8, !dbg !119
  %cmp = icmp ult i64 %3, %4, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %6 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !122
  %7 = load i32, i32* %arrayidx, align 4, !dbg !122
  %8 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !126
  store i32 %7, i32* %arrayidx2, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %9, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !133
  store i32 0, i32* %arrayidx3, align 4, !dbg !134
  %10 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* %10), !dbg !136
  ret void, !dbg !137
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 29, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 29, column: 13, scope: !11)
!26 = !DILocation(line: 30, column: 12, scope: !11)
!27 = !DILocation(line: 30, column: 10, scope: !11)
!28 = !DILocation(line: 31, column: 90, scope: !11)
!29 = !DILocation(line: 31, column: 12, scope: !11)
!30 = !DILocation(line: 31, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !12, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 33, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !12, line: 34, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 34, column: 16, scope: !32)
!41 = !DILocalVariable(name: "dataLen", scope: !32, file: !12, line: 34, type: !38)
!42 = !DILocation(line: 34, column: 19, scope: !32)
!43 = !DILocation(line: 35, column: 26, scope: !32)
!44 = !DILocation(line: 35, column: 19, scope: !32)
!45 = !DILocation(line: 35, column: 17, scope: !32)
!46 = !DILocation(line: 37, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !32, file: !12, line: 37, column: 9)
!48 = !DILocation(line: 37, column: 14, scope: !47)
!49 = !DILocation(line: 37, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 37, column: 9)
!51 = !DILocation(line: 37, column: 25, scope: !50)
!52 = !DILocation(line: 37, column: 23, scope: !50)
!53 = !DILocation(line: 37, column: 9, scope: !47)
!54 = !DILocation(line: 39, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !12, line: 38, column: 9)
!56 = !DILocation(line: 39, column: 28, scope: !55)
!57 = !DILocation(line: 39, column: 18, scope: !55)
!58 = !DILocation(line: 39, column: 13, scope: !55)
!59 = !DILocation(line: 39, column: 21, scope: !55)
!60 = !DILocation(line: 40, column: 9, scope: !55)
!61 = !DILocation(line: 37, column: 35, scope: !50)
!62 = !DILocation(line: 37, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 40, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 41, column: 9, scope: !32)
!67 = !DILocation(line: 41, column: 20, scope: !32)
!68 = !DILocation(line: 42, column: 20, scope: !32)
!69 = !DILocation(line: 42, column: 9, scope: !32)
!70 = !DILocation(line: 44, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_61_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 75, column: 5, scope: !71)
!73 = !DILocation(line: 76, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !75, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 88, type: !19)
!81 = !DILocation(line: 88, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 88, type: !77)
!83 = !DILocation(line: 88, column: 27, scope: !74)
!84 = !DILocation(line: 91, column: 22, scope: !74)
!85 = !DILocation(line: 91, column: 12, scope: !74)
!86 = !DILocation(line: 91, column: 5, scope: !74)
!87 = !DILocation(line: 93, column: 5, scope: !74)
!88 = !DILocation(line: 94, column: 5, scope: !74)
!89 = !DILocation(line: 95, column: 5, scope: !74)
!90 = !DILocation(line: 98, column: 5, scope: !74)
!91 = !DILocation(line: 99, column: 5, scope: !74)
!92 = !DILocation(line: 100, column: 5, scope: !74)
!93 = !DILocation(line: 102, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 55, type: !16)
!96 = !DILocation(line: 55, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !12, line: 56, type: !22)
!98 = !DILocation(line: 56, column: 13, scope: !94)
!99 = !DILocation(line: 57, column: 12, scope: !94)
!100 = !DILocation(line: 57, column: 10, scope: !94)
!101 = !DILocation(line: 58, column: 94, scope: !94)
!102 = !DILocation(line: 58, column: 12, scope: !94)
!103 = !DILocation(line: 58, column: 10, scope: !94)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !12, line: 60, type: !33)
!105 = distinct !DILexicalBlock(scope: !94, file: !12, line: 59, column: 5)
!106 = !DILocation(line: 60, column: 17, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !12, line: 61, type: !38)
!108 = !DILocation(line: 61, column: 16, scope: !105)
!109 = !DILocalVariable(name: "dataLen", scope: !105, file: !12, line: 61, type: !38)
!110 = !DILocation(line: 61, column: 19, scope: !105)
!111 = !DILocation(line: 62, column: 26, scope: !105)
!112 = !DILocation(line: 62, column: 19, scope: !105)
!113 = !DILocation(line: 62, column: 17, scope: !105)
!114 = !DILocation(line: 64, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !12, line: 64, column: 9)
!116 = !DILocation(line: 64, column: 14, scope: !115)
!117 = !DILocation(line: 64, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 64, column: 9)
!119 = !DILocation(line: 64, column: 25, scope: !118)
!120 = !DILocation(line: 64, column: 23, scope: !118)
!121 = !DILocation(line: 64, column: 9, scope: !115)
!122 = !DILocation(line: 66, column: 23, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !12, line: 65, column: 9)
!124 = !DILocation(line: 66, column: 28, scope: !123)
!125 = !DILocation(line: 66, column: 18, scope: !123)
!126 = !DILocation(line: 66, column: 13, scope: !123)
!127 = !DILocation(line: 66, column: 21, scope: !123)
!128 = !DILocation(line: 67, column: 9, scope: !123)
!129 = !DILocation(line: 64, column: 35, scope: !118)
!130 = !DILocation(line: 64, column: 9, scope: !118)
!131 = distinct !{!131, !121, !132, !65}
!132 = !DILocation(line: 67, column: 9, scope: !115)
!133 = !DILocation(line: 68, column: 9, scope: !105)
!134 = !DILocation(line: 68, column: 20, scope: !105)
!135 = !DILocation(line: 69, column: 20, scope: !105)
!136 = !DILocation(line: 69, column: 9, scope: !105)
!137 = !DILocation(line: 71, column: 1, scope: !94)
