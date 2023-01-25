; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !23, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @printLine(i8* %arraydecay3), !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_07_good() #0 !dbg !44 {
entry:
  call void @good1(), !dbg !45
  call void @good2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #6, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #6, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_07_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_07_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !67 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !68
  %cmp = icmp ne i32 %0, 5, !dbg !70
  br i1 %cmp, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  br label %if.end, !dbg !74

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !81
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !84
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx3, align 1, !dbg !86
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  call void @printLine(i8* %arraydecay4), !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !90 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp eq i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !95, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !101
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !104
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx3, align 1, !dbg !106
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay4), !dbg !108
  br label %if.end, !dbg !109

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 29, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 29, column: 8)
!21 = !DILocation(line: 29, column: 18, scope: !20)
!22 = !DILocation(line: 29, column: 8, scope: !16)
!23 = !DILocalVariable(name: "data", scope: !24, file: !8, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !8, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !20, file: !8, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 1200, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 150)
!30 = !DILocation(line: 32, column: 18, scope: !24)
!31 = !DILocalVariable(name: "dest", scope: !24, file: !8, line: 32, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 32, column: 29, scope: !24)
!36 = !DILocation(line: 34, column: 13, scope: !24)
!37 = !DILocation(line: 35, column: 13, scope: !24)
!38 = !DILocation(line: 35, column: 23, scope: !24)
!39 = !DILocation(line: 36, column: 13, scope: !24)
!40 = !DILocation(line: 38, column: 23, scope: !24)
!41 = !DILocation(line: 38, column: 13, scope: !24)
!42 = !DILocation(line: 40, column: 5, scope: !25)
!43 = !DILocation(line: 41, column: 1, scope: !16)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_07_good", scope: !8, file: !8, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 88, column: 5, scope: !44)
!46 = !DILocation(line: 89, column: 5, scope: !44)
!47 = !DILocation(line: 90, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 101, type: !49, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!9, !9, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !8, line: 101, type: !9)
!54 = !DILocation(line: 101, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !8, line: 101, type: !51)
!56 = !DILocation(line: 101, column: 27, scope: !48)
!57 = !DILocation(line: 104, column: 22, scope: !48)
!58 = !DILocation(line: 104, column: 12, scope: !48)
!59 = !DILocation(line: 104, column: 5, scope: !48)
!60 = !DILocation(line: 106, column: 5, scope: !48)
!61 = !DILocation(line: 107, column: 5, scope: !48)
!62 = !DILocation(line: 108, column: 5, scope: !48)
!63 = !DILocation(line: 111, column: 5, scope: !48)
!64 = !DILocation(line: 112, column: 5, scope: !48)
!65 = !DILocation(line: 113, column: 5, scope: !48)
!66 = !DILocation(line: 115, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 50, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !67, file: !8, line: 50, column: 8)
!70 = !DILocation(line: 50, column: 18, scope: !69)
!71 = !DILocation(line: 50, column: 8, scope: !67)
!72 = !DILocation(line: 53, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !8, line: 51, column: 5)
!74 = !DILocation(line: 54, column: 5, scope: !73)
!75 = !DILocalVariable(name: "data", scope: !76, file: !8, line: 58, type: !26)
!76 = distinct !DILexicalBlock(scope: !77, file: !8, line: 57, column: 9)
!77 = distinct !DILexicalBlock(scope: !69, file: !8, line: 56, column: 5)
!78 = !DILocation(line: 58, column: 18, scope: !76)
!79 = !DILocalVariable(name: "dest", scope: !76, file: !8, line: 58, type: !32)
!80 = !DILocation(line: 58, column: 29, scope: !76)
!81 = !DILocation(line: 60, column: 13, scope: !76)
!82 = !DILocation(line: 61, column: 13, scope: !76)
!83 = !DILocation(line: 61, column: 23, scope: !76)
!84 = !DILocation(line: 62, column: 13, scope: !76)
!85 = !DILocation(line: 63, column: 13, scope: !76)
!86 = !DILocation(line: 63, column: 22, scope: !76)
!87 = !DILocation(line: 64, column: 23, scope: !76)
!88 = !DILocation(line: 64, column: 13, scope: !76)
!89 = !DILocation(line: 67, column: 1, scope: !67)
!90 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 70, type: !17, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 72, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !8, line: 72, column: 8)
!93 = !DILocation(line: 72, column: 18, scope: !92)
!94 = !DILocation(line: 72, column: 8, scope: !90)
!95 = !DILocalVariable(name: "data", scope: !96, file: !8, line: 75, type: !26)
!96 = distinct !DILexicalBlock(scope: !97, file: !8, line: 74, column: 9)
!97 = distinct !DILexicalBlock(scope: !92, file: !8, line: 73, column: 5)
!98 = !DILocation(line: 75, column: 18, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !96, file: !8, line: 75, type: !32)
!100 = !DILocation(line: 75, column: 29, scope: !96)
!101 = !DILocation(line: 77, column: 13, scope: !96)
!102 = !DILocation(line: 78, column: 13, scope: !96)
!103 = !DILocation(line: 78, column: 23, scope: !96)
!104 = !DILocation(line: 79, column: 13, scope: !96)
!105 = !DILocation(line: 80, column: 13, scope: !96)
!106 = !DILocation(line: 80, column: 22, scope: !96)
!107 = !DILocation(line: 81, column: 23, scope: !96)
!108 = !DILocation(line: 81, column: 13, scope: !96)
!109 = !DILocation(line: 83, column: 5, scope: !97)
!110 = !DILocation(line: 84, column: 1, scope: !90)
