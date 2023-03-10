; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %4, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !50
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !50
  %8 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !54
  store i8 %7, i8* %arrayidx3, align 1, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %9, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx4, align 1, !dbg !63
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @printLine(i8* %arraydecay5), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_01_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__char_alloca_loop_01_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__char_alloca_loop_01_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 100, align 16, !dbg !94
  store i8* %0, i8** %dataBuffer, align 8, !dbg !93
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !96
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !99
  store i8* %3, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx1, align 1, !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !112
  %cmp = icmp ult i64 %4, 100, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !116
  %6 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !116
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !116
  %8 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !120
  store i8 %7, i8* %arrayidx3, align 1, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %9, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx4, align 1, !dbg !128
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @printLine(i8* %arraydecay5), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 30, column: 12, scope: !13)
!27 = !DILocation(line: 30, column: 23, scope: !13)
!28 = !DILocation(line: 30, column: 10, scope: !13)
!29 = !DILocalVariable(name: "i", scope: !30, file: !14, line: 32, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 32, column: 16, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !30, file: !14, line: 33, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 33, column: 14, scope: !30)
!40 = !DILocation(line: 34, column: 9, scope: !30)
!41 = !DILocation(line: 35, column: 9, scope: !30)
!42 = !DILocation(line: 35, column: 21, scope: !30)
!43 = !DILocation(line: 37, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !30, file: !14, line: 37, column: 9)
!45 = !DILocation(line: 37, column: 14, scope: !44)
!46 = !DILocation(line: 37, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 37, column: 9)
!48 = !DILocation(line: 37, column: 23, scope: !47)
!49 = !DILocation(line: 37, column: 9, scope: !44)
!50 = !DILocation(line: 39, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !14, line: 38, column: 9)
!52 = !DILocation(line: 39, column: 28, scope: !51)
!53 = !DILocation(line: 39, column: 18, scope: !51)
!54 = !DILocation(line: 39, column: 13, scope: !51)
!55 = !DILocation(line: 39, column: 21, scope: !51)
!56 = !DILocation(line: 40, column: 9, scope: !51)
!57 = !DILocation(line: 37, column: 31, scope: !47)
!58 = !DILocation(line: 37, column: 9, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 40, column: 9, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 42, column: 9, scope: !30)
!63 = !DILocation(line: 42, column: 21, scope: !30)
!64 = !DILocation(line: 43, column: 19, scope: !30)
!65 = !DILocation(line: 43, column: 9, scope: !30)
!66 = !DILocation(line: 45, column: 1, scope: !13)
!67 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_01_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 78, column: 5, scope: !67)
!69 = !DILocation(line: 79, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !71, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !74}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !14, line: 91, type: !73)
!76 = !DILocation(line: 91, column: 14, scope: !70)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !14, line: 91, type: !74)
!78 = !DILocation(line: 91, column: 27, scope: !70)
!79 = !DILocation(line: 94, column: 22, scope: !70)
!80 = !DILocation(line: 94, column: 12, scope: !70)
!81 = !DILocation(line: 94, column: 5, scope: !70)
!82 = !DILocation(line: 96, column: 5, scope: !70)
!83 = !DILocation(line: 97, column: 5, scope: !70)
!84 = !DILocation(line: 98, column: 5, scope: !70)
!85 = !DILocation(line: 101, column: 5, scope: !70)
!86 = !DILocation(line: 102, column: 5, scope: !70)
!87 = !DILocation(line: 103, column: 5, scope: !70)
!88 = !DILocation(line: 105, column: 5, scope: !70)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 54, type: !4)
!91 = !DILocation(line: 54, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !14, line: 55, type: !4)
!93 = !DILocation(line: 55, column: 12, scope: !89)
!94 = !DILocation(line: 55, column: 33, scope: !89)
!95 = !DILocation(line: 56, column: 12, scope: !89)
!96 = !DILocation(line: 56, column: 5, scope: !89)
!97 = !DILocation(line: 57, column: 5, scope: !89)
!98 = !DILocation(line: 57, column: 23, scope: !89)
!99 = !DILocation(line: 59, column: 12, scope: !89)
!100 = !DILocation(line: 59, column: 10, scope: !89)
!101 = !DILocalVariable(name: "i", scope: !102, file: !14, line: 61, type: !31)
!102 = distinct !DILexicalBlock(scope: !89, file: !14, line: 60, column: 5)
!103 = !DILocation(line: 61, column: 16, scope: !102)
!104 = !DILocalVariable(name: "dest", scope: !102, file: !14, line: 62, type: !36)
!105 = !DILocation(line: 62, column: 14, scope: !102)
!106 = !DILocation(line: 63, column: 9, scope: !102)
!107 = !DILocation(line: 64, column: 9, scope: !102)
!108 = !DILocation(line: 64, column: 21, scope: !102)
!109 = !DILocation(line: 66, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !14, line: 66, column: 9)
!111 = !DILocation(line: 66, column: 14, scope: !110)
!112 = !DILocation(line: 66, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 66, column: 9)
!114 = !DILocation(line: 66, column: 23, scope: !113)
!115 = !DILocation(line: 66, column: 9, scope: !110)
!116 = !DILocation(line: 68, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !14, line: 67, column: 9)
!118 = !DILocation(line: 68, column: 28, scope: !117)
!119 = !DILocation(line: 68, column: 18, scope: !117)
!120 = !DILocation(line: 68, column: 13, scope: !117)
!121 = !DILocation(line: 68, column: 21, scope: !117)
!122 = !DILocation(line: 69, column: 9, scope: !117)
!123 = !DILocation(line: 66, column: 31, scope: !113)
!124 = !DILocation(line: 66, column: 9, scope: !113)
!125 = distinct !{!125, !115, !126, !61}
!126 = !DILocation(line: 69, column: 9, scope: !110)
!127 = !DILocation(line: 71, column: 9, scope: !102)
!128 = !DILocation(line: 71, column: 21, scope: !102)
!129 = !DILocation(line: 72, column: 19, scope: !102)
!130 = !DILocation(line: 72, column: 9, scope: !102)
!131 = !DILocation(line: 74, column: 1, scope: !89)
