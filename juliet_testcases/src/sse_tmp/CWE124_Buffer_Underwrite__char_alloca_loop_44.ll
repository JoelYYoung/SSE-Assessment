; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %0, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !63
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !63
  %3 = load i8*, i8** %data.addr, align 8, !dbg !64
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !64
  store i8 %2, i8* %arrayidx2, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %5, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !73
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !73
  store i8 0, i8* %arrayidx3, align 1, !dbg !74
  %7 = load i8*, i8** %data.addr, align 8, !dbg !75
  call void @printLine(i8* %7), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_44_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_44_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_44_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !103, metadata !DIExpression()), !dbg !104
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %0, i8** %dataBuffer, align 8, !dbg !106
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !109
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %3, i8** %data, align 8, !dbg !113
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !114
  %5 = load i8*, i8** %data, align 8, !dbg !115
  call void %4(i8* %5), !dbg !114
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !117 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %0, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !137
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !137
  %3 = load i8*, i8** %data.addr, align 8, !dbg !138
  %4 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !138
  store i8 %2, i8* %arrayidx2, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %5, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !146
  store i8 0, i8* %arrayidx3, align 1, !dbg !147
  %7 = load i8*, i8** %data.addr, align 8, !dbg !148
  call void @printLine(i8* %7), !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_44_bad", scope: !14, file: !14, line: 41, type: !15, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 43, type: !4)
!18 = !DILocation(line: 43, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 45, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 45, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 46, type: !4)
!25 = !DILocation(line: 46, column: 12, scope: !13)
!26 = !DILocation(line: 46, column: 33, scope: !13)
!27 = !DILocation(line: 47, column: 12, scope: !13)
!28 = !DILocation(line: 47, column: 5, scope: !13)
!29 = !DILocation(line: 48, column: 5, scope: !13)
!30 = !DILocation(line: 48, column: 23, scope: !13)
!31 = !DILocation(line: 50, column: 12, scope: !13)
!32 = !DILocation(line: 50, column: 23, scope: !13)
!33 = !DILocation(line: 50, column: 10, scope: !13)
!34 = !DILocation(line: 52, column: 5, scope: !13)
!35 = !DILocation(line: 52, column: 13, scope: !13)
!36 = !DILocation(line: 53, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 23, type: !4)
!39 = !DILocation(line: 23, column: 28, scope: !37)
!40 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 26, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 25, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 26, column: 16, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !41, file: !14, line: 27, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 27, column: 14, scope: !41)
!51 = !DILocation(line: 28, column: 9, scope: !41)
!52 = !DILocation(line: 29, column: 9, scope: !41)
!53 = !DILocation(line: 29, column: 23, scope: !41)
!54 = !DILocation(line: 31, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !41, file: !14, line: 31, column: 9)
!56 = !DILocation(line: 31, column: 14, scope: !55)
!57 = !DILocation(line: 31, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !14, line: 31, column: 9)
!59 = !DILocation(line: 31, column: 23, scope: !58)
!60 = !DILocation(line: 31, column: 9, scope: !55)
!61 = !DILocation(line: 33, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !14, line: 32, column: 9)
!63 = !DILocation(line: 33, column: 23, scope: !62)
!64 = !DILocation(line: 33, column: 13, scope: !62)
!65 = !DILocation(line: 33, column: 18, scope: !62)
!66 = !DILocation(line: 33, column: 21, scope: !62)
!67 = !DILocation(line: 34, column: 9, scope: !62)
!68 = !DILocation(line: 31, column: 31, scope: !58)
!69 = !DILocation(line: 31, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 34, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 36, column: 9, scope: !41)
!74 = !DILocation(line: 36, column: 21, scope: !41)
!75 = !DILocation(line: 37, column: 19, scope: !41)
!76 = !DILocation(line: 37, column: 9, scope: !41)
!77 = !DILocation(line: 39, column: 1, scope: !37)
!78 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_44_good", scope: !14, file: !14, line: 90, type: !15, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 92, column: 5, scope: !78)
!80 = !DILocation(line: 93, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 104, type: !82, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !14, line: 104, type: !84)
!87 = !DILocation(line: 104, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !14, line: 104, type: !85)
!89 = !DILocation(line: 104, column: 27, scope: !81)
!90 = !DILocation(line: 107, column: 22, scope: !81)
!91 = !DILocation(line: 107, column: 12, scope: !81)
!92 = !DILocation(line: 107, column: 5, scope: !81)
!93 = !DILocation(line: 109, column: 5, scope: !81)
!94 = !DILocation(line: 110, column: 5, scope: !81)
!95 = !DILocation(line: 111, column: 5, scope: !81)
!96 = !DILocation(line: 114, column: 5, scope: !81)
!97 = !DILocation(line: 115, column: 5, scope: !81)
!98 = !DILocation(line: 116, column: 5, scope: !81)
!99 = !DILocation(line: 118, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !14, line: 80, type: !4)
!102 = !DILocation(line: 80, column: 12, scope: !100)
!103 = !DILocalVariable(name: "funcPtr", scope: !100, file: !14, line: 81, type: !20)
!104 = !DILocation(line: 81, column: 12, scope: !100)
!105 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !14, line: 82, type: !4)
!106 = !DILocation(line: 82, column: 12, scope: !100)
!107 = !DILocation(line: 82, column: 33, scope: !100)
!108 = !DILocation(line: 83, column: 12, scope: !100)
!109 = !DILocation(line: 83, column: 5, scope: !100)
!110 = !DILocation(line: 84, column: 5, scope: !100)
!111 = !DILocation(line: 84, column: 23, scope: !100)
!112 = !DILocation(line: 86, column: 12, scope: !100)
!113 = !DILocation(line: 86, column: 10, scope: !100)
!114 = !DILocation(line: 87, column: 5, scope: !100)
!115 = !DILocation(line: 87, column: 13, scope: !100)
!116 = !DILocation(line: 88, column: 1, scope: !100)
!117 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 60, type: !21, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", arg: 1, scope: !117, file: !14, line: 60, type: !4)
!119 = !DILocation(line: 60, column: 32, scope: !117)
!120 = !DILocalVariable(name: "i", scope: !121, file: !14, line: 63, type: !42)
!121 = distinct !DILexicalBlock(scope: !117, file: !14, line: 62, column: 5)
!122 = !DILocation(line: 63, column: 16, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !121, file: !14, line: 64, type: !47)
!124 = !DILocation(line: 64, column: 14, scope: !121)
!125 = !DILocation(line: 65, column: 9, scope: !121)
!126 = !DILocation(line: 66, column: 9, scope: !121)
!127 = !DILocation(line: 66, column: 23, scope: !121)
!128 = !DILocation(line: 68, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !14, line: 68, column: 9)
!130 = !DILocation(line: 68, column: 14, scope: !129)
!131 = !DILocation(line: 68, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !14, line: 68, column: 9)
!133 = !DILocation(line: 68, column: 23, scope: !132)
!134 = !DILocation(line: 68, column: 9, scope: !129)
!135 = !DILocation(line: 70, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !14, line: 69, column: 9)
!137 = !DILocation(line: 70, column: 23, scope: !136)
!138 = !DILocation(line: 70, column: 13, scope: !136)
!139 = !DILocation(line: 70, column: 18, scope: !136)
!140 = !DILocation(line: 70, column: 21, scope: !136)
!141 = !DILocation(line: 71, column: 9, scope: !136)
!142 = !DILocation(line: 68, column: 31, scope: !132)
!143 = !DILocation(line: 68, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !72}
!145 = !DILocation(line: 71, column: 9, scope: !129)
!146 = !DILocation(line: 73, column: 9, scope: !121)
!147 = !DILocation(line: 73, column: 21, scope: !121)
!148 = !DILocation(line: 74, column: 19, scope: !121)
!149 = !DILocation(line: 74, column: 9, scope: !121)
!150 = !DILocation(line: 76, column: 1, scope: !117)
