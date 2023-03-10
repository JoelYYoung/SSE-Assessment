; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_loop_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %1, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !44
  %3 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !44
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !48
  store i8 %4, i8* %arrayidx2, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %6, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @printLine(i8* %arraydecay4), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_loop_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_61_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__malloc_char_loop_61_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__malloc_char_loop_61_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_loop_61b_goodG2BSource(i8* %0), !dbg !88
  store i8* %call, i8** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !101
  %cmp = icmp ult i64 %1, 100, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %3 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !105
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !105
  %5 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !109
  store i8 %4, i8* %arrayidx2, align 1, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !112
  %inc = add i64 %6, 1, !dbg !112
  store i64 %inc, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx3, align 1, !dbg !117
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  call void @printLine(i8* %arraydecay4), !dbg !119
  ret void, !dbg !120
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_loop_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocation(line: 29, column: 10, scope: !11)
!20 = !DILocation(line: 30, column: 68, scope: !11)
!21 = !DILocation(line: 30, column: 12, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !26, line: 46, baseType: !27)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 32, column: 16, scope: !24)
!29 = !DILocalVariable(name: "dest", scope: !24, file: !12, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 14, scope: !24)
!34 = !DILocation(line: 34, column: 9, scope: !24)
!35 = !DILocation(line: 35, column: 9, scope: !24)
!36 = !DILocation(line: 35, column: 21, scope: !24)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !12, line: 37, column: 9)
!39 = !DILocation(line: 37, column: 14, scope: !38)
!40 = !DILocation(line: 37, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 37, column: 9)
!42 = !DILocation(line: 37, column: 23, scope: !41)
!43 = !DILocation(line: 37, column: 9, scope: !38)
!44 = !DILocation(line: 39, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 38, column: 9)
!46 = !DILocation(line: 39, column: 28, scope: !45)
!47 = !DILocation(line: 39, column: 18, scope: !45)
!48 = !DILocation(line: 39, column: 13, scope: !45)
!49 = !DILocation(line: 39, column: 21, scope: !45)
!50 = !DILocation(line: 40, column: 9, scope: !45)
!51 = !DILocation(line: 37, column: 31, scope: !41)
!52 = !DILocation(line: 37, column: 9, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 40, column: 9, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 42, column: 9, scope: !24)
!57 = !DILocation(line: 42, column: 21, scope: !24)
!58 = !DILocation(line: 43, column: 19, scope: !24)
!59 = !DILocation(line: 43, column: 9, scope: !24)
!60 = !DILocation(line: 47, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_61_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 81, column: 5, scope: !61)
!63 = !DILocation(line: 82, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !65, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 94, type: !67)
!70 = !DILocation(line: 94, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 94, type: !68)
!72 = !DILocation(line: 94, column: 27, scope: !64)
!73 = !DILocation(line: 97, column: 22, scope: !64)
!74 = !DILocation(line: 97, column: 12, scope: !64)
!75 = !DILocation(line: 97, column: 5, scope: !64)
!76 = !DILocation(line: 99, column: 5, scope: !64)
!77 = !DILocation(line: 100, column: 5, scope: !64)
!78 = !DILocation(line: 101, column: 5, scope: !64)
!79 = !DILocation(line: 104, column: 5, scope: !64)
!80 = !DILocation(line: 105, column: 5, scope: !64)
!81 = !DILocation(line: 106, column: 5, scope: !64)
!82 = !DILocation(line: 108, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 58, type: !16)
!85 = !DILocation(line: 58, column: 12, scope: !83)
!86 = !DILocation(line: 59, column: 10, scope: !83)
!87 = !DILocation(line: 60, column: 72, scope: !83)
!88 = !DILocation(line: 60, column: 12, scope: !83)
!89 = !DILocation(line: 60, column: 10, scope: !83)
!90 = !DILocalVariable(name: "i", scope: !91, file: !12, line: 62, type: !25)
!91 = distinct !DILexicalBlock(scope: !83, file: !12, line: 61, column: 5)
!92 = !DILocation(line: 62, column: 16, scope: !91)
!93 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 63, type: !30)
!94 = !DILocation(line: 63, column: 14, scope: !91)
!95 = !DILocation(line: 64, column: 9, scope: !91)
!96 = !DILocation(line: 65, column: 9, scope: !91)
!97 = !DILocation(line: 65, column: 21, scope: !91)
!98 = !DILocation(line: 67, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !12, line: 67, column: 9)
!100 = !DILocation(line: 67, column: 14, scope: !99)
!101 = !DILocation(line: 67, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 67, column: 9)
!103 = !DILocation(line: 67, column: 23, scope: !102)
!104 = !DILocation(line: 67, column: 9, scope: !99)
!105 = !DILocation(line: 69, column: 23, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 68, column: 9)
!107 = !DILocation(line: 69, column: 28, scope: !106)
!108 = !DILocation(line: 69, column: 18, scope: !106)
!109 = !DILocation(line: 69, column: 13, scope: !106)
!110 = !DILocation(line: 69, column: 21, scope: !106)
!111 = !DILocation(line: 70, column: 9, scope: !106)
!112 = !DILocation(line: 67, column: 31, scope: !102)
!113 = !DILocation(line: 67, column: 9, scope: !102)
!114 = distinct !{!114, !104, !115, !55}
!115 = !DILocation(line: 70, column: 9, scope: !99)
!116 = !DILocation(line: 72, column: 9, scope: !91)
!117 = !DILocation(line: 72, column: 21, scope: !91)
!118 = !DILocation(line: 73, column: 19, scope: !91)
!119 = !DILocation(line: 73, column: 9, scope: !91)
!120 = !DILocation(line: 77, column: 1, scope: !83)
