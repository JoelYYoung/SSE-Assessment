; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBuffer, align 8, !dbg !24
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !28
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %4, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data, align 8, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %6, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx2, align 4, !dbg !57
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %7 = bitcast i32* %arraydecay3 to i8*, !dbg !58
  %8 = load i32*, i32** %data, align 8, !dbg !59
  %9 = bitcast i32* %8 to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 400, i1 false), !dbg !58
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx4, align 4, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay5), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 400, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBuffer, align 8, !dbg !94
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !98
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  store i32 0, i32* %h, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !104
  %cmp = icmp slt i32 %4, 1, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %5, i32** %data, align 8, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !112
  %inc = add nsw i32 %6, 1, !dbg !112
  store i32 %inc, i32* %h, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx2, align 4, !dbg !122
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %7 = bitcast i32* %arraydecay3 to i8*, !dbg !123
  %8 = load i32*, i32** %data, align 8, !dbg !124
  %9 = bitcast i32* %8 to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 4 %9, i64 400, i1 false), !dbg !123
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx4, align 4, !dbg !126
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay5), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 25, type: !7)
!20 = !DILocation(line: 25, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 15, scope: !15)
!25 = !DILocation(line: 27, column: 39, scope: !15)
!26 = !DILocation(line: 27, column: 28, scope: !15)
!27 = !DILocation(line: 28, column: 13, scope: !15)
!28 = !DILocation(line: 28, column: 5, scope: !15)
!29 = !DILocation(line: 29, column: 5, scope: !15)
!30 = !DILocation(line: 29, column: 23, scope: !15)
!31 = !DILocation(line: 30, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!33 = !DILocation(line: 30, column: 9, scope: !32)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !16, line: 30, column: 5)
!36 = !DILocation(line: 30, column: 18, scope: !35)
!37 = !DILocation(line: 30, column: 5, scope: !32)
!38 = !DILocation(line: 33, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 31, column: 5)
!40 = !DILocation(line: 33, column: 27, scope: !39)
!41 = !DILocation(line: 33, column: 14, scope: !39)
!42 = !DILocation(line: 34, column: 5, scope: !39)
!43 = !DILocation(line: 30, column: 24, scope: !35)
!44 = !DILocation(line: 30, column: 5, scope: !35)
!45 = distinct !{!45, !37, !46, !47}
!46 = !DILocation(line: 34, column: 5, scope: !32)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "dest", scope: !49, file: !16, line: 36, type: !50)
!49 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 36, column: 17, scope: !49)
!54 = !DILocation(line: 37, column: 17, scope: !49)
!55 = !DILocation(line: 37, column: 9, scope: !49)
!56 = !DILocation(line: 38, column: 9, scope: !49)
!57 = !DILocation(line: 38, column: 21, scope: !49)
!58 = !DILocation(line: 40, column: 9, scope: !49)
!59 = !DILocation(line: 40, column: 22, scope: !49)
!60 = !DILocation(line: 42, column: 9, scope: !49)
!61 = !DILocation(line: 42, column: 21, scope: !49)
!62 = !DILocation(line: 43, column: 20, scope: !49)
!63 = !DILocation(line: 43, column: 9, scope: !49)
!64 = !DILocation(line: 45, column: 1, scope: !15)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_memcpy_17_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 78, column: 5, scope: !65)
!67 = !DILocation(line: 79, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 91, type: !69, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 91, type: !7)
!75 = !DILocation(line: 91, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 91, type: !71)
!77 = !DILocation(line: 91, column: 27, scope: !68)
!78 = !DILocation(line: 94, column: 22, scope: !68)
!79 = !DILocation(line: 94, column: 12, scope: !68)
!80 = !DILocation(line: 94, column: 5, scope: !68)
!81 = !DILocation(line: 96, column: 5, scope: !68)
!82 = !DILocation(line: 97, column: 5, scope: !68)
!83 = !DILocation(line: 98, column: 5, scope: !68)
!84 = !DILocation(line: 101, column: 5, scope: !68)
!85 = !DILocation(line: 102, column: 5, scope: !68)
!86 = !DILocation(line: 103, column: 5, scope: !68)
!87 = !DILocation(line: 105, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "h", scope: !88, file: !16, line: 54, type: !7)
!90 = !DILocation(line: 54, column: 9, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 55, type: !4)
!92 = !DILocation(line: 55, column: 15, scope: !88)
!93 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !16, line: 56, type: !4)
!94 = !DILocation(line: 56, column: 15, scope: !88)
!95 = !DILocation(line: 56, column: 39, scope: !88)
!96 = !DILocation(line: 56, column: 28, scope: !88)
!97 = !DILocation(line: 57, column: 13, scope: !88)
!98 = !DILocation(line: 57, column: 5, scope: !88)
!99 = !DILocation(line: 58, column: 5, scope: !88)
!100 = !DILocation(line: 58, column: 23, scope: !88)
!101 = !DILocation(line: 59, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !88, file: !16, line: 59, column: 5)
!103 = !DILocation(line: 59, column: 9, scope: !102)
!104 = !DILocation(line: 59, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !16, line: 59, column: 5)
!106 = !DILocation(line: 59, column: 18, scope: !105)
!107 = !DILocation(line: 59, column: 5, scope: !102)
!108 = !DILocation(line: 62, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !16, line: 60, column: 5)
!110 = !DILocation(line: 62, column: 14, scope: !109)
!111 = !DILocation(line: 63, column: 5, scope: !109)
!112 = !DILocation(line: 59, column: 24, scope: !105)
!113 = !DILocation(line: 59, column: 5, scope: !105)
!114 = distinct !{!114, !107, !115, !47}
!115 = !DILocation(line: 63, column: 5, scope: !102)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !16, line: 65, type: !50)
!117 = distinct !DILexicalBlock(scope: !88, file: !16, line: 64, column: 5)
!118 = !DILocation(line: 65, column: 17, scope: !117)
!119 = !DILocation(line: 66, column: 17, scope: !117)
!120 = !DILocation(line: 66, column: 9, scope: !117)
!121 = !DILocation(line: 67, column: 9, scope: !117)
!122 = !DILocation(line: 67, column: 21, scope: !117)
!123 = !DILocation(line: 69, column: 9, scope: !117)
!124 = !DILocation(line: 69, column: 22, scope: !117)
!125 = !DILocation(line: 71, column: 9, scope: !117)
!126 = !DILocation(line: 71, column: 21, scope: !117)
!127 = !DILocation(line: 72, column: 20, scope: !117)
!128 = !DILocation(line: 72, column: 9, scope: !117)
!129 = !DILocation(line: 74, column: 1, scope: !88)
