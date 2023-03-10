; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_41_badSink(i8* %data) #0 !dbg !13 {
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
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_41_bad() #0 !dbg !57 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = alloca i8, i64 100, align 16, !dbg !64
  store i8* %0, i8** %dataBuffer, align 8, !dbg !63
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !66
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !67
  store i8 0, i8* %arrayidx, align 1, !dbg !68
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !70
  store i8* %add.ptr, i8** %data, align 8, !dbg !71
  %4 = load i8*, i8** %data, align 8, !dbg !72
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_41_badSink(i8* %4), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_41_goodG2BSink(i8* %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %i, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !83
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !89
  %cmp = icmp ult i64 %0, 100, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !95
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !95
  %3 = load i8*, i8** %data.addr, align 8, !dbg !96
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !96
  store i8 %2, i8* %arrayidx2, align 1, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %5, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !104
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %7 = load i8*, i8** %data.addr, align 8, !dbg !106
  call void @printLine(i8* %7), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_41_good() #0 !dbg !109 {
entry:
  call void @goodG2B(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call i64 @time(i64* null) #5, !dbg !121
  %conv = trunc i64 %call to i32, !dbg !122
  call void @srand(i32 %conv) #5, !dbg !123
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !124
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_41_good(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !127
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_41_bad(), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = alloca i8, i64 100, align 16, !dbg !136
  store i8* %0, i8** %dataBuffer, align 8, !dbg !135
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !138
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !139
  store i8 0, i8* %arrayidx, align 1, !dbg !140
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  store i8* %3, i8** %data, align 8, !dbg !142
  %4 = load i8*, i8** %data, align 8, !dbg !143
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_41_goodG2BSink(i8* %4), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 67, scope: !13)
!19 = !DILocalVariable(name: "i", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 26, column: 16, scope: !20)
!25 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 14, scope: !20)
!30 = !DILocation(line: 28, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 9, scope: !20)
!32 = !DILocation(line: 29, column: 23, scope: !20)
!33 = !DILocation(line: 31, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !14, line: 31, column: 9)
!35 = !DILocation(line: 31, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 23, scope: !37)
!39 = !DILocation(line: 31, column: 9, scope: !34)
!40 = !DILocation(line: 33, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 32, column: 9)
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
!52 = !DILocation(line: 36, column: 9, scope: !20)
!53 = !DILocation(line: 36, column: 21, scope: !20)
!54 = !DILocation(line: 37, column: 19, scope: !20)
!55 = !DILocation(line: 37, column: 9, scope: !20)
!56 = !DILocation(line: 39, column: 1, scope: !13)
!57 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_41_bad", scope: !14, file: !14, line: 41, type: !58, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !14, line: 43, type: !4)
!61 = !DILocation(line: 43, column: 12, scope: !57)
!62 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !14, line: 44, type: !4)
!63 = !DILocation(line: 44, column: 12, scope: !57)
!64 = !DILocation(line: 44, column: 33, scope: !57)
!65 = !DILocation(line: 45, column: 12, scope: !57)
!66 = !DILocation(line: 45, column: 5, scope: !57)
!67 = !DILocation(line: 46, column: 5, scope: !57)
!68 = !DILocation(line: 46, column: 23, scope: !57)
!69 = !DILocation(line: 48, column: 12, scope: !57)
!70 = !DILocation(line: 48, column: 23, scope: !57)
!71 = !DILocation(line: 48, column: 10, scope: !57)
!72 = !DILocation(line: 49, column: 59, scope: !57)
!73 = !DILocation(line: 49, column: 5, scope: !57)
!74 = !DILocation(line: 50, column: 1, scope: !57)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_41_goodG2BSink", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !14, line: 56, type: !4)
!77 = !DILocation(line: 56, column: 71, scope: !75)
!78 = !DILocalVariable(name: "i", scope: !79, file: !14, line: 59, type: !21)
!79 = distinct !DILexicalBlock(scope: !75, file: !14, line: 58, column: 5)
!80 = !DILocation(line: 59, column: 16, scope: !79)
!81 = !DILocalVariable(name: "source", scope: !79, file: !14, line: 60, type: !26)
!82 = !DILocation(line: 60, column: 14, scope: !79)
!83 = !DILocation(line: 61, column: 9, scope: !79)
!84 = !DILocation(line: 62, column: 9, scope: !79)
!85 = !DILocation(line: 62, column: 23, scope: !79)
!86 = !DILocation(line: 64, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !14, line: 64, column: 9)
!88 = !DILocation(line: 64, column: 14, scope: !87)
!89 = !DILocation(line: 64, column: 21, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !14, line: 64, column: 9)
!91 = !DILocation(line: 64, column: 23, scope: !90)
!92 = !DILocation(line: 64, column: 9, scope: !87)
!93 = !DILocation(line: 66, column: 30, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !14, line: 65, column: 9)
!95 = !DILocation(line: 66, column: 23, scope: !94)
!96 = !DILocation(line: 66, column: 13, scope: !94)
!97 = !DILocation(line: 66, column: 18, scope: !94)
!98 = !DILocation(line: 66, column: 21, scope: !94)
!99 = !DILocation(line: 67, column: 9, scope: !94)
!100 = !DILocation(line: 64, column: 31, scope: !90)
!101 = !DILocation(line: 64, column: 9, scope: !90)
!102 = distinct !{!102, !92, !103, !51}
!103 = !DILocation(line: 67, column: 9, scope: !87)
!104 = !DILocation(line: 69, column: 9, scope: !79)
!105 = !DILocation(line: 69, column: 21, scope: !79)
!106 = !DILocation(line: 70, column: 19, scope: !79)
!107 = !DILocation(line: 70, column: 9, scope: !79)
!108 = !DILocation(line: 72, column: 1, scope: !75)
!109 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_41_good", scope: !14, file: !14, line: 86, type: !58, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 88, column: 5, scope: !109)
!111 = !DILocation(line: 89, column: 1, scope: !109)
!112 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !113, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!115, !115, !116}
!115 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !14, line: 101, type: !115)
!118 = !DILocation(line: 101, column: 14, scope: !112)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !14, line: 101, type: !116)
!120 = !DILocation(line: 101, column: 27, scope: !112)
!121 = !DILocation(line: 104, column: 22, scope: !112)
!122 = !DILocation(line: 104, column: 12, scope: !112)
!123 = !DILocation(line: 104, column: 5, scope: !112)
!124 = !DILocation(line: 106, column: 5, scope: !112)
!125 = !DILocation(line: 107, column: 5, scope: !112)
!126 = !DILocation(line: 108, column: 5, scope: !112)
!127 = !DILocation(line: 111, column: 5, scope: !112)
!128 = !DILocation(line: 112, column: 5, scope: !112)
!129 = !DILocation(line: 113, column: 5, scope: !112)
!130 = !DILocation(line: 115, column: 5, scope: !112)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 75, type: !58, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !14, line: 77, type: !4)
!133 = !DILocation(line: 77, column: 12, scope: !131)
!134 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !14, line: 78, type: !4)
!135 = !DILocation(line: 78, column: 12, scope: !131)
!136 = !DILocation(line: 78, column: 33, scope: !131)
!137 = !DILocation(line: 79, column: 12, scope: !131)
!138 = !DILocation(line: 79, column: 5, scope: !131)
!139 = !DILocation(line: 80, column: 5, scope: !131)
!140 = !DILocation(line: 80, column: 23, scope: !131)
!141 = !DILocation(line: 82, column: 12, scope: !131)
!142 = !DILocation(line: 82, column: 10, scope: !131)
!143 = !DILocation(line: 83, column: 63, scope: !131)
!144 = !DILocation(line: 83, column: 5, scope: !131)
!145 = !DILocation(line: 84, column: 1, scope: !131)
