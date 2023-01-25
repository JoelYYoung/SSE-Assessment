; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !23, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !37
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !38
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !41
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !41
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !41
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  call void @printWLine(i32* %arraydecay3), !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07_good() #0 !dbg !46 {
entry:
  call void @good1(), !dbg !47
  call void @good2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !70 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !71
  %cmp = icmp ne i32 %0, 5, !dbg !73
  br i1 %cmp, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  br label %if.end, !dbg !77

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !78, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !85
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !88
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !88
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !88
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx3, align 4, !dbg !90
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay4), !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !94 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !95
  %cmp = icmp eq i32 %0, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !99, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !106
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !109
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !109
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !109
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx3, align 4, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay4), !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 29, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 29, column: 8)
!21 = !DILocation(line: 29, column: 18, scope: !20)
!22 = !DILocation(line: 29, column: 8, scope: !16)
!23 = !DILocalVariable(name: "data", scope: !24, file: !8, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !8, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !20, file: !8, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 4800, elements: !29)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !28, line: 74, baseType: !9)
!28 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!29 = !{!30}
!30 = !DISubrange(count: 150)
!31 = !DILocation(line: 32, column: 21, scope: !24)
!32 = !DILocalVariable(name: "dest", scope: !24, file: !8, line: 32, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 32, column: 32, scope: !24)
!37 = !DILocation(line: 34, column: 21, scope: !24)
!38 = !DILocation(line: 34, column: 13, scope: !24)
!39 = !DILocation(line: 35, column: 13, scope: !24)
!40 = !DILocation(line: 35, column: 23, scope: !24)
!41 = !DILocation(line: 36, column: 13, scope: !24)
!42 = !DILocation(line: 38, column: 24, scope: !24)
!43 = !DILocation(line: 38, column: 13, scope: !24)
!44 = !DILocation(line: 40, column: 5, scope: !25)
!45 = !DILocation(line: 41, column: 1, scope: !16)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_07_good", scope: !8, file: !8, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 88, column: 5, scope: !46)
!48 = !DILocation(line: 89, column: 5, scope: !46)
!49 = !DILocation(line: 90, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 101, type: !51, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!9, !9, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !8, line: 101, type: !9)
!57 = !DILocation(line: 101, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !8, line: 101, type: !53)
!59 = !DILocation(line: 101, column: 27, scope: !50)
!60 = !DILocation(line: 104, column: 22, scope: !50)
!61 = !DILocation(line: 104, column: 12, scope: !50)
!62 = !DILocation(line: 104, column: 5, scope: !50)
!63 = !DILocation(line: 106, column: 5, scope: !50)
!64 = !DILocation(line: 107, column: 5, scope: !50)
!65 = !DILocation(line: 108, column: 5, scope: !50)
!66 = !DILocation(line: 111, column: 5, scope: !50)
!67 = !DILocation(line: 112, column: 5, scope: !50)
!68 = !DILocation(line: 113, column: 5, scope: !50)
!69 = !DILocation(line: 115, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 50, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !70, file: !8, line: 50, column: 8)
!73 = !DILocation(line: 50, column: 18, scope: !72)
!74 = !DILocation(line: 50, column: 8, scope: !70)
!75 = !DILocation(line: 53, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !8, line: 51, column: 5)
!77 = !DILocation(line: 54, column: 5, scope: !76)
!78 = !DILocalVariable(name: "data", scope: !79, file: !8, line: 58, type: !26)
!79 = distinct !DILexicalBlock(scope: !80, file: !8, line: 57, column: 9)
!80 = distinct !DILexicalBlock(scope: !72, file: !8, line: 56, column: 5)
!81 = !DILocation(line: 58, column: 21, scope: !79)
!82 = !DILocalVariable(name: "dest", scope: !79, file: !8, line: 58, type: !33)
!83 = !DILocation(line: 58, column: 32, scope: !79)
!84 = !DILocation(line: 60, column: 21, scope: !79)
!85 = !DILocation(line: 60, column: 13, scope: !79)
!86 = !DILocation(line: 61, column: 13, scope: !79)
!87 = !DILocation(line: 61, column: 23, scope: !79)
!88 = !DILocation(line: 62, column: 13, scope: !79)
!89 = !DILocation(line: 63, column: 13, scope: !79)
!90 = !DILocation(line: 63, column: 22, scope: !79)
!91 = !DILocation(line: 64, column: 24, scope: !79)
!92 = !DILocation(line: 64, column: 13, scope: !79)
!93 = !DILocation(line: 67, column: 1, scope: !70)
!94 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 70, type: !17, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 72, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !8, line: 72, column: 8)
!97 = !DILocation(line: 72, column: 18, scope: !96)
!98 = !DILocation(line: 72, column: 8, scope: !94)
!99 = !DILocalVariable(name: "data", scope: !100, file: !8, line: 75, type: !26)
!100 = distinct !DILexicalBlock(scope: !101, file: !8, line: 74, column: 9)
!101 = distinct !DILexicalBlock(scope: !96, file: !8, line: 73, column: 5)
!102 = !DILocation(line: 75, column: 21, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !100, file: !8, line: 75, type: !33)
!104 = !DILocation(line: 75, column: 32, scope: !100)
!105 = !DILocation(line: 77, column: 21, scope: !100)
!106 = !DILocation(line: 77, column: 13, scope: !100)
!107 = !DILocation(line: 78, column: 13, scope: !100)
!108 = !DILocation(line: 78, column: 23, scope: !100)
!109 = !DILocation(line: 79, column: 13, scope: !100)
!110 = !DILocation(line: 80, column: 13, scope: !100)
!111 = !DILocation(line: 80, column: 22, scope: !100)
!112 = !DILocation(line: 81, column: 24, scope: !100)
!113 = !DILocation(line: 81, column: 13, scope: !100)
!114 = !DILocation(line: 83, column: 5, scope: !101)
!115 = !DILocation(line: 84, column: 1, scope: !94)
